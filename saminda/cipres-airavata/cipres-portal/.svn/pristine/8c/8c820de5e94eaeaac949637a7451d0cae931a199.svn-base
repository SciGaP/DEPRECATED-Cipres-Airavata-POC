package org.ngbw.restclient; 

import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.dispatcher.SessionMap;
import com.opensymphony.xwork2.ActionSupport;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.MultivaluedMap;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.GenericType;
import org.glassfish.jersey.client.filter.HttpBasicAuthFilter; 

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.lang.ClassLoader;
import javax.xml.bind.JAXBContext;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.ParamError;
import org.ngbw.restdatatypes.ErrorData;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import javax.ws.rs.client.Entity;



public class BaseAction extends ActionSupport implements SessionAware, ParameterAware
{
	private static final Log log = LogFactory.getLog(BaseAction.class.getName());

	// Session attribute keys:
	public static final String S_USER = "user";
	public static final String S_PASSWORD = "password";
	public static final String S_EMAIL = "email";
	public static final String S_INSTITUTION = "institution";

	public static final String baseUrl = Application.getInstance().getProperty("server_url");
	public static final String appkey = Application.getInstance().getProperty("appkey");
	public static final String appname = Application.getInstance().getProperty("appname");
	public static final String umbrella_username = Application.getInstance().getProperty("umbrella_username");
	public static final String umbrella_password = Application.getInstance().getProperty("umbrella_password");

	protected SessionMap<String, Object> session = null;
	protected Map<String, String[]> parameters = null;

	public void setSession(Map<String, Object> session)
	{
		this.session = (SessionMap)session;
	}

	public void setParameters(Map<String, String[]> p)
	{
		this.parameters = p;
	}

	public String getSessionUser()
	{
		log.debug("getSessionUser returns: " + (String)session.get(S_USER));
		return (String)session.get(S_USER);
	}

	public String getCipresUser()
	{
		return appname + "." + (String)session.get(S_USER);
	}

	public String getSessionPassword()
	{
		return (String)session.get(S_PASSWORD);
	}

	public String getSessionEmail()
	{
		return (String)session.get(S_EMAIL);
	}

	public String getSessionInstitution()
	{
		return (String)session.get(S_INSTITUTION);
	}

	/*
		Actions that make REST service calls can use this when response.getStatus() != 200,
		or whatever status is expected.

		I wrote this to make sure I knew how to get the response as a string and then 
		unmarshal and cast it.  One could do it this way all the time, if unsure of the
		type of object to expect in the response.
	*/
	public ErrorData getErrorData(Response response)
	{
		String text = "";
		ErrorData ed = null;
		try
		{
			text = response.readEntity(String.class);
			log.debug("Error Response as text:'" +  text + "'.");
			InputStream is = new ByteArrayInputStream(text.getBytes());

			ClassLoader cl = org.ngbw.restdatatypes.ErrorData.class.getClassLoader();

			JAXBContext ctx = JAXBContext.newInstance("org.ngbw.restdatatypes", cl);
			Object obj = ctx.createUnmarshaller().unmarshal(is);
			if (obj instanceof ErrorData)
			{
				ed = (ErrorData)obj;
			} else
			{
				ed = new ErrorData("Unmarshalled unexpected error response object:" + text, 0);
			}
		}
		catch(javax.xml.bind.UnmarshalException ue)
		{
			log.debug("Error unmarshalling response body.  Most likely body is not an expected xml type.", ue);
			ed = new ErrorData("Couldn't unmarshal error from server.  Raw error text is: " + text, 0);
		}
		catch (Exception e)
		{
			log.error("", e);
			ed = new ErrorData("Caught exception reading/unmarshalling error response: " + e.toString() +
				". Text received: " + text, 0);
		}
		return ed;
	}


	public boolean deleteUrl(String url)
	{
		try
		{
			Client client = ClientHelper.getClient(umbrella_username, umbrella_password);

			WebTarget target = client.target(url);
			Response response = target.request().
				header("cipres-appkey", appkey).
				header("cipres-eu", getSessionUser()).
				header("cipres-eu-email", getSessionEmail()).
				header("cipres-eu-institution", getSessionInstitution()).
				delete();

			log.debug(response.getStatus());
			if (response.getStatus() != 200 && response.getStatus() != 204)
			{
				ErrorData ed = getErrorData(response);
				if (ed != null)
				{
					addActionError("http status " + response.getStatus() + 
						", code: " + ed.code + ", message:  " + ed.message);
				}  else
				{
					addActionError("http status " + response.getStatus() + ". No message body");
				}
				log.debug("Added action error: " + ed.message);
				return false;
			} 
		}
		catch(Exception e)
		{
			e.printStackTrace();
			addActionError("An exception occurred:" +  e.getMessage());
			return false;
		}
		return true;
	}


	public <T> T getFromUrl(String url, GenericType<T> gt)
	{
		try
		{
			Client client = ClientHelper.getClient(umbrella_username, umbrella_password);

			WebTarget target = client.target(url);
			Response response = target.request("application/xml").
				header("cipres-appkey", appkey).
				header("cipres-eu", getSessionUser()).
				header("cipres-eu-email", getSessionEmail()).
				header("cipres-eu-institution", getSessionInstitution()).
				get();

			log.debug(response.getStatus());
			if (response.getStatus() != 200)
			{
				ErrorData ed = getErrorData(response);
				if (ed != null)
				{
					addActionError("http status " + response.getStatus() + 
						", code: " + ed.code + ", message:  " + ed.message);
					log.debug("Added action error: " + ed.message);
				} 
			} else
			{
				return response.readEntity(gt);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			addActionError("An exception occurred:" +  e.getMessage());
		}
		return null;
	}

	public <T> T getFromUrl(String url, Class<T> theClass)
	{
		try
		{
			Client client = ClientHelper.getClient(umbrella_username, umbrella_password);
			WebTarget target = client.target(url);
			Response response = target.request("application/xml").
				header("cipres-appkey", appkey).
				header("cipres-eu", getSessionUser()).
				header("cipres-eu-email", getSessionEmail()).
				header("cipres-eu-institution", getSessionInstitution()).
				get();

			log.debug(response.getStatus());
			if (response.getStatus() != 200)
			{
				ErrorData ed = getErrorData(response);
				if (ed != null)
				{
					addActionError("http status " + response.getStatus() + 
						", code: " + ed.code + ", message:  " + ed.message);
					log.debug("Added action error: " + ed.message);
				} 
			} else
			{
				return response.readEntity(theClass);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			addActionError("An exception occurred:" +  e.getMessage());
		}
		return null;
	}

	public <T> T postToUrl(String url, FormDataMultiPart mp, Class<T> theClass)
	{
		try
		{
			Client client = ClientHelper.getClient(umbrella_username, umbrella_password);
			WebTarget target = client.target(url);
			Response response = target.request().
				header("cipres-appkey", appkey).
				header("cipres-eu", getSessionUser()).
				header("cipres-eu-email", getSessionEmail()).
				header("cipres-eu-institution", getSessionInstitution()).
				post(Entity.entity(mp, mp.getMediaType()));

			log.debug(response.getStatus());
			if (response.getStatus() != 200)
			{
				ErrorData ed = getErrorData(response);
				if (ed != null)
				{
					addActionError("http status " + response.getStatus() + 
						", code: " + ed.code + ", message:  " + ed.message);
					log.debug("Added action error: " + ed.message);
					for (ParamError pe : ed.paramError)
					{
						addActionError("\n" + pe.param+ ": " + pe.error);
					}
				} 
			} else
			{
				return response.readEntity(theClass);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			addActionError("An exception occurred:" +  e.getMessage());
		}
		return null;
	}

	int contentLength = 0;
	String contentDisposition = null;
	String contentType = null;

	public InputStream getStreamFromUrl(String url) 
	{
		try
		{
			Client client = ClientHelper.getClient(umbrella_username, umbrella_password);
			WebTarget target = client.target(url);
			Response response = target.request("application/xml").
				header("cipres-appkey", appkey).
				header("cipres-eu", getSessionUser()).
				header("cipres-eu-email", getSessionEmail()).
				header("cipres-eu-institution", getSessionInstitution()).
				get();


			log.debug(response.getStatus());
			if (response.getStatus() != 200)
			{
				ErrorData ed = getErrorData(response);
				if (ed != null)
				{
					addActionError("http status " + response.getStatus() + 
						", code: " + ed.code + ", message:  " + ed.message);
					log.debug("Added action error: " + ed.message);
				} 
			} else
			{
				this.contentLength = response.getLength();
				log.debug("Got contentLength = " + this.contentLength);

				this.contentType = response.getMediaType().toString();
				log.debug("Got media type= " + this.contentType);

				this.contentDisposition = response.getHeaderString("content-disposition");
				log.debug("Got content disposition= " + this.contentDisposition); 

				logHeaders(response);


				// Note we call getEntity instead of readEntity to return the InputStream.
				return (InputStream)response.getEntity();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			addActionError("An exception occurred:" +  e.getMessage());
		}
		return null;
	}

	private void logHeaders(Response response)
	{
		for (String key : response.getHeaders().keySet())
		{
			log.debug(key + ":" + response.getHeaderString(key));
		}

	}


}
