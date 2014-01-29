/*
 * TaskMonitor.java
 */
package org.ngbw.sdk.tool;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.io.File;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.NDC;
import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.core.shared.TaskRunStage;
import org.ngbw.sdk.core.types.DataFormat;
import org.ngbw.sdk.core.types.DataType;
import org.ngbw.sdk.core.types.EntityType;
import org.ngbw.sdk.database.ConnectionManager;
import org.ngbw.sdk.database.DriverConnectionSource;
import org.ngbw.sdk.database.StaleRowException;
import org.ngbw.sdk.database.StatisticsEvent;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.TaskLogMessage;
import org.ngbw.sdk.database.TaskOutputSourceDocument;

import org.ngbw.sdk.database.RunningTask;
import java.lang.reflect.Constructor;
import org.ngbw.sdk.api.tool.ToolRegistry;
import org.ngbw.sdk.api.tool.ToolResource;
import org.ngbw.sdk.tool.Tool;
import org.ngbw.sdk.tool.TaskUpdater;
import org.ngbw.sdk.tool.WorkQueue;


public abstract class TaskMonitor 
{
	private static final Log log = LogFactory.getLog(TaskMonitor.class.getName());
	protected static ToolRegistry toolRegistry = Workbench.getInstance().getServiceFactory().getToolRegistry();
	private static int maxAttempts;
	private static int maxCheckJobsDays;

	static 
	{
		String tmp = Workbench.getInstance().getProperties().getProperty("loadResults.retries");
		maxAttempts = Integer.parseInt(tmp);

		tmp = Workbench.getInstance().getProperties().getProperty("checkjobs.maxDays");
		maxCheckJobsDays = Integer.parseInt(tmp);
	}

	public static BaseProcessWorker getProcessWorker(RunningTask rt) throws Exception
	{
		Tool tool = new Tool(rt.getToolId(), rt.getResource(), toolRegistry);
		return tool.getToolResource().getProcessWorker(rt);
	}
	
	public static void checkJobs(String submitter) throws Exception
	{
		List<RunningTask> allRunningTasks = RunningTask.findRunningTaskBySubmitterAndStatus(
			submitter,
			RunningTask.STATUS_SUBMITTED);
		if (allRunningTasks.size() > 0)
		{
			log.debug("Found " + allRunningTasks.size() + " SUBMITTED jobs for '" + submitter + "'");
		}

		purgeOldJobs(allRunningTasks);

		// Build a map of resource_name <-> list of tasks on that resource in the variable "resources".
		HashMap<String, List<RunningTask>> resources = new HashMap<String, List<RunningTask>>();
		String resource = null;
		List<RunningTask> subList = null;
		for (RunningTask rt : allRunningTasks)
		{
			resource = rt.getResource();
			subList = resources.get(resource);
			if (subList == null)
			{
				subList = new ArrayList<RunningTask>();
				resources.put(resource, subList);
				log.debug("Adding resource " + resource + " to resources to check.");
			} 
			subList.add(rt);
			log.debug("Adding running_task " + rt.rtToString() + " to jobs to check.");
		}

		// Loop over the resource_name <-> list of tasks on resource map.  entry.value() is the 
		// list of tasks on the resource.
		List<RunningTask> finished_tasks = null;
		for (Map.Entry<String, List<RunningTask>> entry : resources.entrySet())
		{
			log.debug("CheckResults for resource " + entry.getKey());
			ToolResource tr = toolRegistry.getToolResource(entry.getKey());
			if (tr == null)
			{
				log.warn("Resource " + entry.getKey() + " is no longer in registry.  Skipping it.");
				continue;
			} else
			{
				log.debug("Resource " + entry.getKey() + " found in registry.");
			}
			RunningTask firstTaskInList = entry.getValue().get(0);

			// Instantiate a process worker of the type appropriate for the resource, using
			// the info from the first running_task entry (an arbitrary choice).  
			BaseProcessWorker pw = null;
			try
			{
				pw = getProcessWorker(firstTaskInList);
			}
			catch(Exception e)
			{
				// handle case where the db has old records for obsolete process workers
				log.info("Error instantiating process worker. " + e.toString());
				continue;
			}
			log.debug("Instantiated a process worker.");
			try
			{
				finished_tasks = pw.checkJobsOnResource(entry.getValue());
				WorkQueue.markDone(finished_tasks);
			}
			catch(Exception e)
			{
				// If the resource is down or unreachable we may get an exception here.
				log.error("Error running checkJobsOnResource. ", e );
			}
		}
	}

	private static void purgeOldJobs(List<RunningTask> runningTasks) throws Exception
	{
		Iterator<RunningTask> it = runningTasks.iterator();
		while (it.hasNext())
		{
			RunningTask rt = it.next();
			Date dateSubmitted = rt.getDateEntered();
			Date now = new Date();
			int diffInDays = (int)( (now.getTime() - dateSubmitted.getTime()) / (1000 * 60 * 60 * 24) );
			if (diffInDays > maxCheckJobsDays) 
			{
				log.info("Purging old job: " + rt.rtToString());

				String msg = "Unable to verify that job " + rt.getJobhandle() + " has finished after " + maxCheckJobsDays +
					" days. "; 
				log.error(msg);
				WorkQueue.fail(rt, TaskRunStage.SUBMITTED, msg + 
						"Please submit a bug report or contact mmiller@sdsc.edu");
				it.remove();
			}
		}
	}

	public static void cancelJob(Task task) throws Exception
	{
		try
		{
			log.debug("cancelJob called on task " + task.getTaskId() + ", jh=" + task.getJobHandle());
			RunningTask rt = RunningTask.findRunningTaskByTask(task.getTaskId());
			if (rt == null)
			{
				//log.debug("No running task table entry found for task " + task.getTaskId());
				return;
			}
			String status = rt.getStatus();

			/*
				Todo: this isn't bulletproof. If we try to cancel during the window of time where job
				has been submitted to remote, but it hasn't returned, so we don't have a remote jobid yet,
				we can't cancel it on remote.  I guess we could make checkJobs ensure that the task still
				exists and have it issue a cancel if not.
			*/
			// Don't bother cancelling if job is already DONE.
			if (status.equals(RunningTask.STATUS_NEW) || 
				status.equals(RunningTask.STATUS_SUBMITTED))
			{
				if (rt.getRemoteJobId() == null)
				{
					log.warn("Can't cancel " + task.getTaskId() + ".  Remote job id isn't set.");
				} else
				{
					// This can throw if we can't talk to the db.
					WorkQueue.noteCancellationAttempt(rt.getJobhandle(), task.getStage().toString());

					// This can throw if we can't talk to remote host. 
					//log.debug("Creating process worker for " + task.getTaskId());
					BaseProcessWorker pw = getProcessWorker(rt);
					pw.cancelJob();
				}
			} else
			{
				//log.debug("No need to cancel, status is " + status);
			}
		}
		catch (Exception e)
		{
			log.error("", e);
			throw e;
		}
	}

	public static boolean getResults(RunningTask rt, String localPath) 
	{
		BaseProcessWorker pw = null;
		Task task = null;
		
		try
		{
			if ((task = rt.getTask()) == null)
			{
				throw new FatalTaskException("Task has been deleted.");
			}
			if (!WorkQueue.tryAgain(rt, RunningTask.STATUS_TERMINATED, maxAttempts))
			{
				throw new FatalTaskException("Failed to load results because the limit of " 
						+ maxAttempts + " retries has been exceeded.");
			}

			String msg = "Trying to transfer results.";
			TaskUpdater.logProgress(task, TaskRunStage.LOAD_RESULTS, msg);

			pw = getProcessWorker(rt);
			pw.getResults(localPath);

			WorkQueue.finish(rt); 

			pw.archiveTaskDirectory(); 
			notifyJobComplete(task, null);
			return true;
		}
		catch (FatalTaskException fte)
		{
			handleFatalException(fte, rt, pw);
			return false;
		}
		catch(Exception e)
		{
			handleException(e, rt, pw);
			return false;
		}
	}


	private static  void handleFatalException(FatalTaskException fte, RunningTask rt, BaseProcessWorker pw)
	{
		try
		{
			if (pw != null)
			{
				pw.moveToFailedDirectory();
			}
			if (rt.getTask() != null)
			{
				log.error("", fte);
				WorkQueue.fail(rt, TaskRunStage.LOAD_RESULTS, fte.getMessage());
				notifyJobComplete(rt.getTask(), "Error retrieving results: " + fte.getMessage());
			} else
			{
				log.debug("Task has been deleted.");
				WorkQueue.fail(rt, TaskRunStage.LOAD_RESULTS, fte.getMessage());
			}
		}
		catch(Exception e)
		{
			log.error("", e);
		}
	}

	private static void handleException(Exception e, RunningTask rt, BaseProcessWorker pw)
	{
		try
		{
			String msg;
			msg = "Error retrieving results for " + rt.getJobhandle() + 
					". Cipres retries " + maxAttempts + " times."; 
			log.error(msg);
			TaskUpdater.logError(rt.getTask(), null, msg); 

			StatisticsEvent se = new StatisticsEvent(rt.getJobhandle());
			se.setEventName("GET_RESULTS_ERROR");
			se.setEventValue(e.toString());
			se.save();

		}
		catch(Exception ee)
		{
			log.error("", ee);
		}
	}




	public  static void notifyJobComplete(Task t, String msg)
    {
		String email = null;
		try
        {
            if (t != null) 
            {
            	User user = t.getUser();
                email = user.getEmail();
                String username = user.getUsername();
				if (!email.equals(""))
				{
					JobCompleteEvent e = new JobCompleteEvent(username, email, t.getLabel(), msg);
					e.notifyComplete();
				}
            }
        }
        catch(Exception e)
        {
            log.info("Error sending job completion email to email address:" + email);
        }
    }


}
