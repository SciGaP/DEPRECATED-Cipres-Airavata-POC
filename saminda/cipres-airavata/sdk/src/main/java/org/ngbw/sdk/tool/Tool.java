/*
 * Tool.java
 */
package org.ngbw.sdk.tool;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Date;
import java.text.SimpleDateFormat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.api.tool.CommandRenderer;
import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.api.tool.ToolConfig;
import org.ngbw.sdk.api.tool.ToolIOMode;
import org.ngbw.sdk.api.tool.ToolRegistry;
import org.ngbw.sdk.api.tool.ToolResource;
import org.ngbw.sdk.api.tool.ToolResourceType;
import org.ngbw.sdk.common.util.StringUtils;
import org.ngbw.sdk.core.shared.SourceDocumentType;
import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.TaskInputSourceDocument;
import org.ngbw.sdk.database.User;



/**
 * @author Roland H. Niedner
 * @author Paul Hoover
 * @author Terri Schwartz
 *
 */
public class Tool {

	/**
	 *
	 */
	private static final Log log = LogFactory.getLog(Tool.class.getName());
	private final String toolId;
	private final ToolConfig toolConfig;
	private ToolResource toolResource;
	private ToolRegistry registry;
	private long userId;

	// properties we add to the command line when exec'ing the process worker
	public static final String SCHEDULER_PROPERTIES = "sProps";
	public static final String USER_NAME = "un";
	public static final String USER_EMAIL = "ue";
	public static final String USER_IP = "uip";
	public static final String TASK_ID = "taskId";
	public static final String JOB_HANDLE = "jobHandle";
	public static final String COMMAND_LINE = "command";
	public static final String WORKING_DIR = "workingDir";
	public static final String FAILED_DIR = "failedDir";
	public static final String ARCHIVE_DIR = "archiveDir";
	public static final String MANUAL_DIR = "manualDir";
	public static final String OUTPUT_DESCRIPTION = "outputDescr";
	public static final String URL = "url";
	public static final String RC = "rc";
	public static final String JOB_TIMEOUT = "timeout";
	public static final String IPLANT = "iplant";
	public static final String CHARGENUMBER = "chargeNumber";

	public static final String IPLANT_USER = "IPLANT";
	public static final String CIPRES_USER = "CIPRES";
	public static final String INDIVIDUAL_USER = "INDIVIDUAL";

	public Tool(String id, String resource, ToolRegistry registry)
	{
		this(id, registry);
		setToolResource(registry.getToolResource(resource));
	}

	public Tool(String id, ToolRegistry registry)
	{
		this.toolId = id;
		this.registry = registry;
		this.toolConfig = registry.getToolConfig(id);

		if (toolConfig == null)
			throw new NullPointerException("tool " + id + " is not registered!");

		this.toolResource = registry.getToolResource(toolConfig.getToolResourceId());
	}

	public String getToolId()
	{
		return toolId;
	}

	public RenderedCommand renderCommand(Map<String, String> parameters)
	{
		String className = toolConfig.getCommandRendererClassName();

		try {
			CommandRenderer cr = (CommandRenderer) Class.forName(className).newInstance();

			return cr.render(toolConfig.getConfigFileURL(), parameters);
		}
		catch (InstantiationException e) {
			throw new RuntimeException("No argument constructor missing for " + className, e);
		}
		catch (IllegalAccessException e) {
			throw new RuntimeException("Cannot access constructor for " + className, e);
		}
		catch (ClassNotFoundException e) {
			throw new RuntimeException("ClassNotFoundException for " + className, e);
		}
	}




	/*
		Returns null if this isn't a teragrid tool, or we're using the cipres
		community account.  Otherwise, if this a teragrid tool, and we're not
		using the community account, returns the iplant charge number or the
		individual user allocation.
	*/
	public String getTgChargeNumber(boolean loggedInViaIplant, User user) throws Exception 
	{
		String chargeNumber= null;
		String accountGroup = toolResource.getAccountGroup();
		//log.debug("accountGroup for this tool is " + accountGroup + ", and userId is " + user.getUserId());
		String iplantChargeNumber = (String)Workbench.getInstance().getProperties().get("iplant.charge.number");
		if (accountGroup != null)
		{
			if (loggedInViaIplant && accountGroup.equals("teragrid"))
			{
				chargeNumber = iplantChargeNumber;
				log.debug("returning iplantChargeNumber " + chargeNumber);
			} else
			{
				chargeNumber = (user.getAccount(accountGroup));
				log.debug("returning user chargeNumber " + chargeNumber);
			}
		}
		return chargeNumber;
	}

	/*
		This method ignores the question of whether the tool is a teragrid tool or not
		and simply returns: 
			- IPLANT_USER if user logged in via iplant
			- CIPRES_USER if user doesn't have an individual allocation
			- INDIVIDUAL_USER if user has an individual allocation
	*/
	private String getUserType(boolean loggedInViaIPlant, User user) 
	{
		if (loggedInViaIPlant)
		{
			return IPLANT_USER;
		} 
		String chargeNumber = (user.getAccount("teragrid"));
		if (chargeNumber != null)
		{
			return INDIVIDUAL_USER;
		}
		return CIPRES_USER;
	}


	public SourceDocumentType getSourceDocumentType(String parameter)
	{
		if (parameter == null)
			throw new NullPointerException("parameter must not be null!");

		SourceDocumentType type = toolConfig.getSourceDocumentType(parameter);

		if (type == null)
			type = SourceDocumentType.UNKNOWN;

		return type;
	}

	public ToolResource getToolResource()
	{
		return toolResource;
	}

	public void setToolResource(ToolResource tr)
	{
		this.toolResource = tr;
		// todo:
		// toolConfig.setToolResourceId(tr.getToolResourceId());
	}

	public String getToolResourceId()
	{
		return toolConfig.getToolResourceId();
	}

	public ToolConfig getToolConfig()
	{
		return toolConfig;
	}

	public URL getToolConfigFile()
	{
		return toolConfig.getConfigFileURL();
	}

	public ToolIOMode getInputMode(String parameter)
	{
		return toolConfig.getInputMode(parameter);
	}

	public Set<String> getInputParameters()
	{
		return toolConfig.getInputParameters().keySet();
	}

	public ToolIOMode getOutputMode(String parameter)
	{
		return toolConfig.getOutputMode(parameter);
	}

	public Set<String> getOutputParameters()
	{
		return toolConfig.getOutputParameters().keySet();
	}


	public String disabled()
	{
		// Set tools inactive flag in registry when we want to get rid of the tool for good, for all users.
		// Use a disabled resource file, when we need to temporarily prevent submissions.
		if (toolConfig.isActive() == false)
		{
			return "The specified tool, " + this.toolId + ", is not in the active tool registry.";
		}
		// See if the resource is disabled.
		String message = toolResource.disabled();
		if (message != null)
		{
			return message;
		}
		// Now see if the tool is disabled.
		return readDisabledResourceFile(this.toolId);
	}

	/*
		Find out if the tool is disabled by a particular category of user.
		userType is one of the constants IPLANT_USER, CIPRES_USER or INDIVIDUAL_USER.
		Returns null if the tool is NOT disabled, otherwise returns a string message to
		display.
	*/
	public String disabled(boolean loggedInViaIPlant, User user)
	{
		// First see if disabled for everyone
		String message = disabled();
		if (message != null)
		{
			return message;
		}

		// Now see if disabled for this type of user.
		String userType = getUserType(loggedInViaIPlant, user);
		String filename = this.toolId + "." + userType;
		return readDisabledResourceFile(this.toolId + "." + userType);

	}

	static String readDisabledResourceFile(String name)
	{
		String dpath = Workbench.getInstance().getProperties().getProperty("disabled.resources.file");
		if (dpath == null)
		{
			return null;
		}
		File f = new File(dpath, name);
		if (!f.exists())
		{
			return null;
		}
		String filename = f.getAbsolutePath();
		FileInputStream fs = null;
		try
		{
			fs = new FileInputStream(filename);
			Properties p = new Properties();
			p.load(fs);

			String start = p.getProperty("start");
			String end = p.getProperty("end");
			String message = p.getProperty("message");

			//log.debug("Loaded " + start + ", " + end + ", " + message);

			/*
				Set defaults such that if start date is missing or unparseable, disabled = true
				and if end date is missing or unparseable, disabled = true

				Dates are specified w/o times, so the effective time is the beginning
				of the day 00:00:00 = midnight.  If you expect the machine go be back
				up at 8am on 10/27/2009, you should give the end date as 10/28/2009.  

				If you check and see that the host is in fact back up at 8am you can remove
				the disabled_resource file.

				The purpose of these files is that when one of sees that a resource is going
				to be down on a certain date, we can create a disabled_resource file with a 
				start date that's a couple of days earlier than the planned outage (so user's
				won't submit jobs that will fail during the outage) and a end date that's a
				day after the outage, in case we forget to remove the file when the resource
				comes back up.
			*/
			if (start == null && end == null)
			{
				return message;
			}
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

			long now = (new Date()).getTime();
			long startDate = now, endDate = now + (1000 * 60);
			if (start != null)
			{
				startDate = dateFormat.parse(start).getTime();
			}
			if (end != null)
			{
				endDate = dateFormat.parse(end).getTime();
			}
			log.debug("now=" + now  + ",start=" + startDate + ",end=" + endDate);
			if ((now >= startDate) && (now <= endDate))
			{
				log.debug("returning " + message);
				return message;
			}
			log.debug("returning " + null);
			return null;
		}
		catch(Exception t)
		{
			log.error("", t);
			return null;
		}
		finally
		{
			try { fs.close(); } catch (Exception t) {;}
		}
	}

	/*
		Handle PSUEDO resource type.  When registry specifies a psuedo resource, we pick the real
		resource to use after the command has been rendered and the scheduler properties determined).
	*/
	public void selectResource(RenderedCommand command) throws Exception
	{
		ToolResource resource = getToolResource();
		if (resource.getType() == ToolResourceType.PSUEDO)
		{
			Map<String,String> parameters = resource.getParameters();
			String resources = parameters.get("resources");

			String[] resourceArray = resources.split(",");
			List<String> resourceList = Arrays.asList(resourceArray);
			try 
			{
				String resourceID = hardcodedSelectResource( resourceList, command.getSchedulerProperties());  
				setToolResource(registry.getToolResource(resourceID));
			}
			catch (Exception e)
			{
				log.error("Error selecting tool resource for psuedo resource " + resource.getId());
				throw e;
			}
		} 
	}

	/**
		todo: add a PsuedoResourceHandler interface.  Add a PsuedoResourceClass parameter to
		the psuedo resources in the registry.  It would take the tool, the resources, and the
		scheduler.conf file as parameters and return the resource ID string of the real resource
		to run on.  I don't know, this needs some thought to avoid hardcoded job names and resource
		names.

		todo: create a scheduler config class with enums and methods for the property names and values.

		Instead, for the short run I'm hardcoding the logic for our tools on abe and trestles
		here.

	*/
	private String hardcodedSelectResource(List<String> resourceList, Properties schedulerProperties)
		throws DisabledResourceException
	{
		log.debug("tool is '" + getToolId() + "'");
		if (getToolId().startsWith("RAXMLHPC2"))
		{
			String jobType = schedulerProperties.getProperty("jobtype", "");
			log.debug("jobtype is '" + jobType + "'");
			if (jobType.equals("mpi"))
			{
				return "trestles";	
			} 
			return "abe";
		} 
		if (getToolId().startsWith("MRBAYES"))
		{
			String tmp = schedulerProperties.getProperty("mpi_processes");
			int ppn = new Integer(tmp);
			if (ppn > 6)
			{
				return "trestles";
			}
			return "abe";
		}
		// If a tool is configured on a PSUEDO resource, and we have no logic here for
		// choosing a real resource for that tool ...
		throw new DisabledResourceException("Cipres portal configuration error.  Missing information to " + 
			"select a resource for running " + getToolId() + " jobs.");
	}
}
