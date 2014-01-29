package org.ngbw.restclient; 

import java.util.Properties;
import java.io.InputStream;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Application
{
	private static final Log log = LogFactory.getLog(Application.class.getName());

	private static Application SINGLETON;
	private Properties properties;

	public static synchronized Application getInstance() 
	{
		if (SINGLETON == null)
		{
			SINGLETON = new Application();
		}
		return SINGLETON;
	}

	private Application() 
	{
		InputStream is = null;
		try
		{
			is = Application.class.getResourceAsStream("/application.properties");
			//Resource.class.getClassLoader().getResource("application.properties");
			if (is == null)
			{
				throw new Exception("application.properties resource not found");
			}
			properties = new Properties();
			properties.load(is);
			is.close();
			log.debug("base url='" + this.getProperty("server_url") + "'");
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new RuntimeException("2 error loading application.properties: " + e.toString());
		}
	}

	public String getProperty(String name)
	{
		return properties.getProperty(name);
	}
}
