/*
*/
package  org.ngbw.cipresrest.auth;


import javax.ws.rs.ext.Provider;
import javax.ws.rs.container.PreMatching;


import org.glassfish.jersey.internal.util.Base64;

import org.glassfish.jersey.server.ContainerRequest;

import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ContainerRequestContext;

import java.security.Principal;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.HttpHeaders;
import javax.annotation.Priority;
import javax.ws.rs.Priorities;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.Application;
import org.ngbw.sdk.database.Application;
import org.ngbw.sdk.database.NotExistException;
import org.ngbw.sdk.common.util.StringUtils;
import org.ngbw.sdk.jobs.UserMismatchException;
import org.ngbw.sdk.core.shared.UserRole;

import java.io.IOException;


@Provider
@Priority(Priorities.AUTHENTICATION)
public class SecurityFilter implements ContainerRequestFilter 
{
	private static final Log log = LogFactory.getLog(SecurityFilter.class.getName());

    @Context
    UriInfo uriInfo;
    static final String REALM = "Cipres Authentication";

	@Override
    public void  filter(ContainerRequestContext filterContext) throws IOException
	{
		/*
			Relative uri will look like: "/v1/job/appname/username".  I suppose if we wanted to skip basic auth for certain urls, 
			we could look at the uri to do so.  As in the example code below to allow access to "/world"
			log.debug("uri is " + filterContext.getUriInfo().getPath());
		*/
		String tmp = filterContext.getUriInfo().getPath();
		if (tmp.startsWith("/world"))
		{
			return;
		}

		// Do http basic auth, making sure user specified in auth headers matches a user in cipres db.
        SecurityUser su = authenticate(filterContext.getRequest());

		// Make sure user id ADMIN or the required cipres-* headers are present and valid.
		// May change user in SecurityContext to end user as specified by cipres-eu header.
		su = validateApplication(su, filterContext.getRequest());

		filterContext.setSecurityContext(new Authorizer(su));
    }

	private String getHeaderString(Request request, String key)
	{
		String value = ((ContainerRequest)request).getHeaderString(key);
		if (value != null)
		{
			value = value.trim();
			if (value.length() == 0)
			{
				value = null;
			}
		}
		return value;
	}

	private Application getApplicationRecord(String appkey)
	{
		if (appkey == null) 
		{
			throw new AuthenticationException("Custom cipres request headers are required.\n", REALM);
		}
		log.debug("cipres-appkey is '" + appkey + "'");


		// Todo: don't use db generated appkey, use a uuid so that it's harder to guess and if compromised
		// we just change uuid in Application record and tell the app admin what the new one is.
		Application application = null;
		try
		{
			application = new Application(Long.valueOf(appkey));
		}
		catch(NotExistException nee)
		{
			throw new AuthenticationException("Application key not found.\n", REALM);
		}
		catch(NumberFormatException nfe)
		{
			log.error("Error parsing '" + appkey + "' as a long." );
			throw new AuthenticationException("Application key not found.\n", REALM);
		}
		catch(Exception e)
		{
			log.error("", e);
			throw new WebApplicationException(e.toString());
		}
		return application;
	}

	private SecurityUser validateApplication(SecurityUser su, Request request)  
	{
		log.debug("validateApplication");
		if (su.role.equals(UserRole.ADMIN))
		{
			// application headers aren't expected when user is logged in as an administrator.
			return su;
		}

		// todo: don't hardcode the keys
        String cipres_appkey = getHeaderString(request, "cipres-appkey");
        String cipres_eu = getHeaderString(request, "cipres-eu");
        String cipres_eu_email  = getHeaderString(request, "cipres-eu-email");
        String cipres_eu_institution  = getHeaderString(request, "cipres-eu-institution");
		String appname;

		Application application = getApplicationRecord(cipres_appkey);
		appname = application.getName();

		// Desktop apps and single user apps/scripts may use DIRECT.  It means the security user is the end user.
		if (application.getAuthType().equals(Application.DIRECT))
		{
			return su;
		}
		if (!application.getAuthType().equals( Application.UMBRELLA))
		{
			throw new AuthenticationException("Application registered with unsupported auth type.\n", REALM);
		}
		/*
			With umbrella accounts, there's a single security user for the application,
			but the end user is specified in the custom cipres headers.  Here we make sure
			the security user is the correct one for the application.
		*/
		if (application.getAuthUserId() != su.user.getUserId())
		{
			throw new AuthenticationException("Wrong basic auth credentials for specified application.\n", REALM);
		}

		/*
			Here we make sure the "end user" headers are present.  We look up the end user
			and if not found, create an account for him.  We return a new SecurityUser 
			that represents the end user.
		*/
		if (cipres_eu == null || cipres_eu_email == null || cipres_eu_institution == null)
		{
			throw new AuthenticationException("Custom cipres request headers are required.\n", REALM);
		}
		try
		{
			log.debug("Looking for user:'" + appname + "', '" + cipres_eu + "'");
			User user = User.findUserByUsername(appname + "."  + cipres_eu);
			if (user == null)
			{
				user = new User(appname, cipres_eu, cipres_eu_email, cipres_eu_institution);
				user.save();
				log.debug("Created account for user: '" + user.getUsername() + "'");
			}
			// Substitute end user, don't care about basic auth user anymore.
			// Todo: is that true?  Should we use basic auth user in url or end user?
			su.user = user;
			return su;
		}
		catch(Exception e)
		{
			//###
			log.error("", e);
			throw new WebApplicationException(e.toString());
		}
	}

	/*
		Ensures that request uses basic auth and that supplied username and password
		represents a valid user in the cipres database.
	*/
    private SecurityUser authenticate(Request request) 
	{
        // Extract authentication credentials
		// If we don't use @PreMatching then this header string is null!
        String authentication = ((ContainerRequest)request).getHeaderString(HttpHeaders.AUTHORIZATION);


        if (authentication == null) 
		{
			throw new AuthenticationException("Authentication credentials are required.\n", REALM);
        }
        if (!authentication.startsWith("Basic ")) 
		{
			throw new AuthenticationException("Only HTTP Basic authentication is supported.\n", REALM);
        }
        authentication = authentication.substring("Basic ".length());
        String[] values = Base64.decodeAsString(authentication).split(":");
        if (values.length < 2) 
		{
			throw new AuthenticationException("Invalid syntax for username and password.\n", REALM);
        }
        String username = values[0];
        String password = values[1];

		// Todo: remove this for security reasons, don't want passwords in log!
		//log.debug("username=" + username + ", password=" + password);
		log.debug("username=" + username);

        if ((username == null) || (password == null)) 
		{
			throw new AuthenticationException("Missing username or password.\n", REALM);
        }

        // Validate the extracted credentials
        SecurityUser su = null;
		User user = null;
		if ((user = validateCipresUser(username, password)) != null)
		{
			// We are setting the SecurityUser.role from our User record in the db.
			// Values are in sdk.core.shared.UserRole: ADMIN, TEACHER, ...  Most users are STANDARD or GUEST. 
            su = new SecurityUser(user, user.getRole());
            log.debug("Logged in user:'" + username + "', role: '" + user.getRole().toString() + "'");
		} else 
		{
            throw new AuthenticationException("Invalid username or password.\n", REALM);
        }
		return su;
    }


	/*
		Todo: exceptions like those that this method can throw should be response code 
		500 = internal server error.  How should we be doing that?  Seems like it should
		be our default.
	*/
	private User validateCipresUser(String username, String password) 
	{
		User user = null;
		try
		{
			user = User.findUserByUsername(username);
			if (user == null || !user.getUsername().equals(username))
			{
				//log.debug("Username '" + username + "' not found.");
				return null;
			}
			String hash = StringUtils.getMD5HexString(password);
			if (!user.getPassword().equals(hash))
			{
				log.debug("Invalid password received for username '" + username + "'.");
				return null;
			}
			return user;
		}
		catch(Exception e)
		{
			log.error("validateCipresUser caught unexpected exception:", e);
			throw new WebApplicationException(e.toString());
		}
	}

	public class Authorizer implements SecurityContext 
	{
		private SecurityUser su;
		private Principal principal;

		public Authorizer(final SecurityUser su) 
		{
			this.su = su;

			// Principal.getName() will return the user ID as a string.
			this.principal = new Principal() 
			{
				public String getName() 
				{
					return String.valueOf(su.user.getUserId());
				}
			};
		}

		public Principal getUserPrincipal() 
		{
			return this.principal;
		}


		/*
			Todo: someday we'll probably expand the service to have some urls
			that don't include a username.  How will we handle that?

			It seems weird to throw an exception instead of returning false but if we
			return false we don't seem to have control over the response and some html
			formatted FORBIDDEN response is returned by default. 

			Parameter 'role' is the role specified with @RolesAllowed for the resource
			being referenced.  Our job here is to see whether the user who sent his 
			credentials in the request headers is in this role.  I think normally 
			you'd get the user's roles from the db and would have stored them in
			the SecurityUser object.   What we're doing instead is ignoring any
			"roles" the user may have been assigned in the db, and making sure
			the user matches the username in the url being requested.
		*/
		public boolean isUserInRole(String role) 
		{
			//log.debug("checking isUserInRole");
			//String appnameInUrl= uriInfo.getPathParameters().getFirst("app");
			String usernameInUrl= uriInfo.getPathParameters().getFirst("user");
			/*
			log.debug("logged in user='" + 
				principal.getName() + 
				"', username in url='" + 
				usernameInUrl + 
				"', required role='" + 
				role +
				"'.");
			*/
			return credentialsValidForUrl(usernameInUrl, role);
		}

		boolean credentialsValidForUrl(String usernameInUrl, String role)
		{
			// the authenticated user.
			User aUser = this.su.user;
			String aUserRole = this.su.role.toString();

			// admin role is required for this resource.  
			if (role.equals(UserRole.ADMIN.toString()))
			{
				//log.debug("ADMIN role required: '" + UserRole.ADMIN.toString() + "'.  This user's role '" + aUserRole + "'");
				if (aUserRole.equals(UserRole.ADMIN.toString()))
				{
					return true;
				}
				throw new AuthorizationException("Access forbidden for " + aUser.getUsername()  + ".\n", SecurityFilter.REALM);
			}
			//log.debug("ADMIN role is not required.  Specified role is '" + role + "'.  Admin role is '" + UserRole.ADMIN.toString() + "'.");

			// Otherwise we're dealing with the STANDARD role.  There are two cases: user is an 
			// ADMIN and can access all urls, or user is not an ADMIN.
			if (aUserRole.equals(UserRole.ADMIN.toString()))
			{
				//log.debug("User is ADMIN so he can access any url, returning true.");
				return true;
			}

			// User is not an ADMIN so he can only access his own urls.  Here we make sure 
			// username part of url matches our authenticated user.
			if ((usernameInUrl != null) && aUser.getUsername().equals(usernameInUrl)) 
			{
				//log.debug("Logged in username matches username in url, returning true.");
				return true;
			}
			//log.debug("User not authorized, throwing exception.");
			throw new AuthorizationException("Access forbidden for " + aUser.getUsername() + ".\n", SecurityFilter.REALM);
		}

		public boolean isSecure() 
		{
			return "https".equals(uriInfo.getRequestUri().getScheme());
		}

		public String getAuthenticationScheme() 
		{
			return SecurityContext.BASIC_AUTH;
		}
	}	

	public class SecurityUser 
	{
		public User user;
		public UserRole role;

		public SecurityUser(User user, UserRole role) 
		{
			this.user = user;
			this.role = role;
		}
	}

}
