package org.ngbw.web.actions;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;
import java.util.Calendar;
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;
import org.ngbw.sdk.UserAuthenticationException;
import org.ngbw.sdk.WorkbenchSession;
import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.common.util.ValidationResult;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.Sso;
import org.ngbw.web.controllers.SessionController;

/**
 * Struts action class to process all session-related requests
 * in the NGBW web application.
 * 
 * @author Jeremy Carver
 */
@SuppressWarnings("serial")
public class SessionManager extends NgbwSupport
{
	/*================================================================
	 * Constants
	 *================================================================*/
	private static final Logger logger = Logger.getLogger(SessionManager.class.getName());

	// navigation constants
	public static final String TAB = "tab";
	
	// parameter attribute key constants
	public static final String USER = "user";
	public static final String CODE = "code";
	
	// default password for automatic reset
	public static final String DEFAULT_PASSWORD = "changeme";
	
	/*================================================================
	 * Properties
	 *================================================================*/
	// controller
	private SessionController controller;
	
	// registration form properties
	private String username;
	private String newPassword;
	private String confirmNewPassword;
	private String firstName;
	private String lastName;
	private String email;
	private String confirmEmail;
	private String organization;
	private String account;
	
	// login form properties
	private String currentPassword;

	/*
		There are a number of different ways that a user can be "effectively"
		logged in.  For example, by explicitly logging in, logging in via
		iplant, registering, or responding to a passord change confirmation
		email.  In all cases, this method will be called once the user's
		credentials have been validated.  In some cases (eg. registration) this
		may be called more than once - I'm not sure.
	*/
	public boolean finalizeLogin()
	{
		// Store the WorkbenchSession object in the http session.
		try
		{
			WorkbenchSession wbSession = controller.getWorkbenchSession();
			if (wbSession == null)
			{
				throw new Exception("WorkbenchSession is null.");
			}
			setWorkbenchSession(controller.getWorkbenchSession());
			refreshCurrentFolder();
			User user = controller.getAuthenticatedUser();
			user.setLastLogin(Calendar.getInstance().getTime());
			user.save();
		}
		catch (Exception e)
		{
			reportUserError(e, "Internal Error completing the login process.");
			return false;
		}
		addActionMessage("User \"" + controller.getAuthenticatedUsername() +
			"\" successfully logged in.");
		return true;
	}

	private void storeIplantHeaders()
	{
		deleteIplantHeaders();
		Properties shibHeaders = new Properties(); 
		String eppn, uid, mail, givenName, sn;

		eppn = request.getHeader("eppn");
		if (eppn == null || eppn.trim().equals(""))
		{
			return;
		}

		uid = request.getHeader("uid");
		mail = request.getHeader("mail");
		givenName = request.getHeader("givenName");
		sn = request.getHeader("sn");
		if (uid == null)
		{
			uid = "";
		}
		if (mail == null)
		{
			mail = "";
		}
		if (givenName == null || givenName.trim().equals(""))
		{
			givenName = eppn;
		}
		if (sn == null || sn.trim().equals(""))
		{
			sn = eppn;
		}
		shibHeaders.setProperty("eppn", eppn);
		shibHeaders.setProperty("uid", uid);
		shibHeaders.setProperty("mail", mail); 
		shibHeaders.setProperty("givenName", givenName); 
		shibHeaders.setProperty("sn", sn); 

		setSessionAttribute("shibHeaders", shibHeaders);
		logger.debug("Stored iplant headers eppn=" + request.getHeader("eppn") + ", uid=" + request.getHeader("uid") + ", mail=" +
			request.getHeader("mail"));
	}

	private void deleteIplantHeaders()
	{
		clearSessionAttribute("shibHeaders");
	}

	// If we've stored iplant Headers in the session, this returns them.
	private Properties getIplantHeaders()
	{
		Properties shibHeaders = (Properties)getSessionAttribute("shibHeaders");
		if (shibHeaders != null)
		{
			String eppn = shibHeaders.getProperty("eppn");
			if (eppn != null && !eppn.trim().equals(""))
			{
				return shibHeaders;
			}
		}
		return null;
	}


	/*
		Returns value of eppn header if present and not empty; null otherwise.
	*/
	public String  getIplantName()
	{
		Properties shibHeaders = getIplantHeaders();
		if (shibHeaders == null)
		{
			return null;
		}
		return shibHeaders.getProperty("eppn");
	}

	/*================================================================
	 * Action methods
	 *================================================================*/
	public String input() 
	{
		if (!iplantEnabled())
		{
			return INPUT;
		}

		// Store the needed iplant request headers, if present, for use in the next action(s).
		storeIplantHeaders();

		// Clear the attribute that indicates that we've logged a user in via iplant.  
		clearSessionAttribute(IPLANT_USER);

		// check to see if user is logged in via iplant, by checking request headers.
		String iplantName = getIplantName();

		// If not, display the login page.
		if (iplantName == null)
		{
			return INPUT;
		}

		setSessionAttribute(IPLANT_USER, "1");
		//reportUserMessage("Logged in via sso as iplant user: " + iplantName);
		User cipresUser = null;
		try
		{
			// Does iplant user already have a cipres account linked to his iplant id? 
			cipresUser = getCorrespondingCipresUser(iplantName);
			if (cipresUser != null)
			{
				String retval = iplant2CipresLogin(cipresUser);
				return retval;
			}
			logger.debug("SessionManager.input is returning " + IPLANT_REGISTER);
			return IPLANT_REGISTER;
		}
		catch (Exception e)
		{
			error("", e);
			reportUserError("Sorry, there was an internal error looking up your account information: " + 
				e.getMessage());
			logger.debug("SessionManager.input is returning " + INPUT);
			return INPUT;
		}
	}


	/*
		We get here after we've detected that the needed shibboleth headers are present and that
		the user doesn't already have a cipres account linked to his shibboleth account.  The
		iplantRegister.jsp form has him enter his cipres username and password if he has a
		cipres account.  If he leaves them blank, we create a new ciprs account for him.
	*/
	public String iplantRegister()
	{
		String username = getUsername();
		if (username == null || username.trim().equals("")) 
		{
			logger.debug("User says he doesn't have a cipres account so we're creating one now");
			try
			{
				// Create the cipres User table account, then create a sso record to link the iplant username to the ciprs account.
				User user = iplant2CipresAccount();
				if (user == null)
				{
					return INPUT;
				}
				Sso.addAccount(user, getIplantName());


				// Now log the user in.
				String retval = iplant2CipresLogin(user);
				return retval;
			}
			catch (Exception e)
			{
				error("", e);
				reportUserError("Sorry, there was an internal error linking your iplant and cipres accounts: "
					+ e.getMessage());
				logger.debug("SessionManager.iplantRegister returning " + INPUT);
				return INPUT;
			}
		}
		logger.debug("User says he DOES have a cipres account so we're logging him in.");
		// User said he does have a cipres account, so make sure we can log him in (i.e. don't let 
		// him hijack someone else's account.
		String result = login();
		if (result.equals(INPUT))
		{
			// Invalid username and/or password, redisplay iplantRegister.jsp with error messages.
			logger.debug("Login failed.");
			logger.debug("SessionManager.iplantRegister returning " + INPUT);
			return INPUT;
		}
		// OK, the user is logged in, we just need to update the db tables to link his iplant and cipres
		// user IDs.
		logger.debug("Login ok.");
		try
		{
			Sso.addAccount(getAuthenticatedUser(), getIplantName());
		}
		catch (Exception e)
		{
			error("", e);
			reportUserError("Sorry, there was an internal error linking your iplant and cipres accounts: "
				+ e.getMessage());
			logger.debug("SessionManager.iplantRegister returning " + INPUT);
			return INPUT;
		}
		return SUCCESS;
	}




	/*
		This is exactly like the Register() method, except that its to automatically
		create a cipres User account for someone who is already an iplant user.
	*/
	@SuppressWarnings("unchecked")
	public User iplant2CipresAccount() 
	{
		SessionController controller = getController();
		Properties shibHeaders = getIplantHeaders();
		if (shibHeaders == null)
		{
			reportUserError("Sorry, there was an error creating your account: iplant headers not found in session.");
			return null;
		}
		// else for first, last and organization.
		String eppn = shibHeaders.getProperty("eppn");
		ValidationResult result = controller.registerUser(
												eppn, 
												shibHeaders.getProperty("mail"), 
												shibHeaders.getProperty("givenName"),
												shibHeaders.getProperty("sn"),
												"");
		if (result == null) {
			addActionError("Sorry, there was an error creating your account.");
			return null;
		} else if (result.isValid() == false) {
			reportUserError("Sorry, there was an error creating your account:");
			for (String error : result.getErrors())
				reportUserError(error);
			return null;
		} 
		setWorkbenchSession(controller.getWorkbenchSession());
		addActionMessage("User account \"" + getUsername() + "\" successfully created.");
		User u = getAuthenticatedUser();
		return u;
	}


	public String register() {
		// validate user input - if passed, attempt to register new user
		if (validateUser()) 
		{
			SessionController controller = getController();
			ValidationResult result = controller.registerUser(getUsername(), getNewPassword(),
				getEmail(), getFirstName(), getLastName(), getOrganization());
			if (result == null) 
			{
				addActionError("Sorry, there was an error creating your account.");
				return INPUT;
			} 
			if (result.isValid() == false) 
			{
				reportUserError("Sorry, there was an error creating your account:");
				for (String error : result.getErrors())
					reportUserError(error);
				return INPUT;
			} else 
			{
				addActionMessage("User account \"" + getUsername() + "\" successfully created.");
				if (finalizeLogin() == true) 
				{
					return SUCCESS;
				}
			}
		} 
		return INPUT;
    }
	
	@SuppressWarnings("unchecked")
	public String guestLogin() 
	{
		// register guest user
		SessionController controller = getController();
		ValidationResult result = controller.registerGuestUser();
		if (result == null) 
		{
			addActionError("Sorry, there was an error logging in as a guest.");
			return INPUT;
		} 
		if (result.isValid() == false) 
		{
			reportUserError("Sorry, there was an error logging in as a guest:");
			for (String error : result.getErrors())
				reportUserError(error);
			return INPUT;
		}
		addActionMessage("Guest user \"" + controller.getAuthenticatedUsername() + "\" successfully logged in.");
		setSessionAttribute(TAB, "home");
		if (finalizeLogin() == true)
		{
			return SUCCESS;
		}
		return INPUT;
	}

	public String iplant2CipresLogin(User user) 
	{
		SessionController controller = getController();
		WorkbenchSession session = null;
		try 
		{
			session = controller.login(user.getUsername());
		} 
		catch (UserAuthenticationException error) 
		{
			reportUserError(error.getMessage());
			logger.debug("In SessionManager.iplant2CipresLogin returning " + INPUT);
			return INPUT;
		}
		if (session == null) 
		{
			reportUserError("There was an error authenticating your information.");
			logger.debug("In SessionManager.iplant2CipresLogin returning " + INPUT);
			return INPUT;
		} 

		if (finalizeLogin() == true)
		{
			return SUCCESS;
		}
		return INPUT;
	}
	
	@SuppressWarnings("unchecked")
	public String login() {

		// This just means that the user entered a username and password, not that they're valid.
		if (validateLogin()) 
		{
			String username = getUsername();
			String password = getCurrentPassword();
			SessionController controller = getController();
			WorkbenchSession session = null;
			try 
			{
				session = controller.login(username, password);
			} 
			catch (UserAuthenticationException error) 
			{
				reportUserError(error.getMessage());
				return INPUT;
			}
			if (session == null) 
			{
				reportUserError("There was an error authenticating your information.");
				return INPUT;
			}
			if (finalizeLogin() == true)
			{
				return SUCCESS;
			}
		} 
		return INPUT;
    }


	public User getCorrespondingCipresUser(String iplantName) throws Exception
	{
		return getController().getCorrespondingCipresUser(iplantName);
	}

	/*
		User clicked "Login via Iplant" on login.jsp.  Because that goes
		to "iplantLogin" action which is protected via shibboleth the
		user was redirected to iplant to login before this method was
		called.  Shibboleth headers should be present.
	*/
	public String iplantLogin() 
	{
		String retval = input();

		logger.debug("SessionManager.iplantLogin, returning " + retval);
		return retval;
	}

	/*
		We only get there when there is an error on One Time Coordination or the user
		bails out of it.
	*/
	public String getMeOutOfHere()
	{
		logger.debug("In getMeOutOfHere");
		String retval = logout();
		/*
		if (retval.equals(IPLANT_LOGOUT))
		{
			return "localLogout";
		}
		*/
		return retval;
	}
	
	public String logout() {
		getController().logout();
		String isIplantUser = (String)getSessionAttribute(IPLANT_USER);
		invalidateSession();
		if (isIplantUser != null)
		{
			logger.debug("Doing Iplant logout");
			return IPLANT_LOGOUT;
		}
		return SUCCESS;
    }
	
	public String sendPasswordReset() 
	{
		String actualUsername = null;
		String actualEmail = null;
		String encryptedPassword = null;
		String username = getUsername();
		String email = getEmail();
		if (username != null && username.equals("") == false) 
		{
			User user = getController().getUserByUsername(username);
			if (user == null) 
			{
				addActionError("No registered user was found with that username.");
				return INPUT;
			} 
			actualUsername = user.getUsername();
			actualEmail = user.getEmail();
			if (email != null && email.equals("") == false && email.equals(actualEmail) == false) 
			{
				addActionError("The email address you provided does not match the " +
					"address on file for the username you provided.");
				return INPUT;
			}
			encryptedPassword = user.getPassword();
		} else if (email != null && email.equals("") == false) 
		{
			User user = getController().getUserByEmail(email);
			if (user == null) 
			{
				addActionError("No registered user was found with that email address.");
				return INPUT;
			} 
			actualUsername = user.getUsername();
			actualEmail = user.getEmail();
			encryptedPassword = user.getPassword();
		} else 
		{
			addActionError("You must enter either your registered username or email address.");
			return INPUT;
		}
		if (sendPasswordResetEmail(actualEmail, actualUsername, encryptedPassword)) 
		{
			reportUserMessage("Password reset confirmation email successfully sent.");
			setUsername(null);
			setEmail(null);
			return SUCCESS;
		} else 
		{
			addActionError("There was an error sending the password reset confirmation email.");
			return SUCCESS;
		}
	}
	
	// I think we get here when user clicks on the link in the password
	// reset email we sent him.  If he isn't already logged in, this effectively
	// logs him in.
	public String confirmPasswordReset() 
	{
		String username = getRequestParameter(USER);
		if (username == null) 
		{
			addActionError("You must provide your username to reset your password.");
			return INPUT;
		} 
		SessionController controller = getController();
		User user = controller.getUserByUsername(username);
		if (user == null) {
			addActionError("No registered user was found with that username.");
			return INPUT;
		} 
		String encryptedPassword = getRequestParameter(CODE);
		if (encryptedPassword == null ||
			encryptedPassword.equals(user.getPassword()) == false) 
		{
			addActionError("You must provide the correct confirmation code " + "to reset your password.");
			return INPUT;
		} 
		if (controller.changePassword(username, DEFAULT_PASSWORD) == false) 
		{
				addActionError("There was an error updating your password.");
				return INPUT;
		} 

		WorkbenchSession session = null;
		try 
		{
			session = controller.getActiveSession(username, DEFAULT_PASSWORD);
		} catch (UserAuthenticationException error) 
		{
			addActionError("There was an error updating your password.");
			return INPUT;
		}
		if (session == null) 
		{
			try 
			{
				session = controller.login(username, DEFAULT_PASSWORD);
			} 
			catch (UserAuthenticationException error) 
			{
				addActionError("There was an error updating your password.");
				return INPUT;
			}
		}
		if (session == null) 
		{
			addActionError("There was an error updating your password.");
			return INPUT;
		} 
		reportUserMessage("Your password was successfully reset.");
		if (finalizeLogin() == true)
		{
			return SUCCESS;
		}
		return INPUT;
	}
	
	/*================================================================
	 * Form property accessor methods
	 *================================================================*/
	public SessionController getController() {
		if (controller ==  null) {
			WorkbenchSession session = getWorkbenchSession();
			if (session == null)
				controller = new SessionController();
			else controller = new SessionController(session);
		}
		return controller;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getCurrentPassword() {
		return currentPassword;
	}
	
	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}
	
	public String getNewPassword() {
		return newPassword;
	}
	
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}
	
	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getConfirmEmail() {
		return confirmEmail;
	}
	
	public void setConfirmEmail(String confirmEmail) {
		this.confirmEmail = confirmEmail;
	}
	
	public String getOrganization() {
		return organization;
	}
	
	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		if (account == null || account.trim().equals(""))
		{
			this.account = null;
			return;
		}
		this.account = account;
	}

	
	/*================================================================
	 * Convenience methods
	 *================================================================*/
	protected boolean validateLogin() {
		String username = getUsername();
		if (username == null || username.trim().equals("")) {
			addFieldError("username", "Username is required.");
		}
		String password = getCurrentPassword();
		if (password == null || password.trim().equals("")) {
			addFieldError("currentPassword", "Password is required.");
			logger.debug("SessionManager.validateLogin: password is null");
		}
		if (hasFieldErrors())
			return false;
		else return true;
	}
	
	protected boolean validateUser() {
		String username = getUsername();
		if (username == null || username.trim().equals("")) {
			addFieldError("username", "Username is required.");
		}
		String password = getNewPassword();
		if (password == null || password.trim().equals("")) {
			addFieldError("newPassword", "Password is required.");
		} else if (password.equals(getConfirmNewPassword()) == false) {
			addFieldError("confirmNewPassword",
				"Sorry, the passwords you entered aren't identical.  Please try again.");
		}
		String firstName = getFirstName();
		if (firstName == null || firstName.trim().equals("")) {
			addFieldError("firstName", "First Name is required.");
		}
		String lastName = getLastName();
		if (lastName == null || lastName.trim().equals("")) {
			addFieldError("lastName", "Last Name is required.");
		}
		String email = getEmail();
		if (email == null || email.trim().equals("")) {
			addFieldError("email", "Email is required.");
		} else if (email.equals(getConfirmEmail()) == false) {
			addFieldError("confirmEmail", "Sorry, the email addresses you entered " +
				"aren't identical.  Please try again.");
		}
		if (hasFieldErrors())
			return false;
		else return true;
	}
	
	private boolean sendPasswordResetEmail(String email, String username, String code) {
		if (username == null || username.equals("") ||
			email == null || email.equals("") || 
			code == null || code.equals("")) {
			logger.debug("Error sending password reset email: One or more arguments were null or empty.");
			return false;
		} else {
			String subject = "NGBW Password Reset Confirmation";
			HttpServletRequest request = ServletActionContext.getRequest(); 
			String body = "A request was recently received to reset the password for your " +
				"registered account (" + username + ") on the Next Generation Biology " +
				"Workbench web site.  To confirm that you wish to reset your password for " +
				"this account, please click on the link at the bottom of this email.  Your " +
				"password will NOT be reset unless you click the link below.\n\nBy clicking " +
				"this link, you authorize NGBW to reset your password to \"" + DEFAULT_PASSWORD +
				"\".  You will then be able to log into your account with this temporary password, " +
				"and from there you can change your password to something more secure.\n\n" +
				"http://" + request.getServerName() + ":" + request.getServerPort() + 
				"/portal2/resetPassword.action?user=" + username +
				"&code=" + code;
			return sendEmail(email, subject, body);
		}
	}
}
