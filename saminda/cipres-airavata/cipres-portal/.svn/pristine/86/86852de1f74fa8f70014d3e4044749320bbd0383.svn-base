/*
	This is run on application startup.  We use it to initialize our Application singleton.
	At the moment, the Application just initializes the Workbench singleton.
*/
package org.ngbw.cipresrest.webresource;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;


public class Startup implements ServletContextListener 
{
	private static final Log log = LogFactory.getLog(Startup.class.getName());

	public void contextInitialized(ServletContextEvent arg0)
	{
		log.debug("Application Startup.");
		Application.getInstance();
	}

	public void contextDestroyed(ServletContextEvent arg0)
	{
		log.debug("Application Destroyed.");
	}
}
