/*

*/
package org.ngbw.cipresrest.webresource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.sdk.Workbench;


public class Application 
{
	private static final Log log = LogFactory.getLog(Application.class.getName());
	private static Application instance;

	public static synchronized Application getInstance()
	{
		if (instance == null)
		{
			instance = new Application();
		}
		return instance;
	}

	private Application()
	{
		log.debug("STARTING APPLICATION INIT");
		// initialize the sdk by reading tool registry and other xml init files.
		Workbench.getInstance();
		log.debug("FINISHED APPLICATION INIT");
	}
}
