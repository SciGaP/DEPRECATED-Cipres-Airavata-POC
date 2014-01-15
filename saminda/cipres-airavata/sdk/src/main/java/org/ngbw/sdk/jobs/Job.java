/*
 * Job.java
 */
package org.ngbw.sdk.jobs;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.File;
import org.ngbw.sdk.database.Folder;
import org.ngbw.sdk.database.TaskInputSourceDocument;
import org.ngbw.sdk.database.TaskOutputSourceDocument;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.tool.TaskMonitor;
import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.core.shared.TaskRunStage;


/**
 * @author Terri Liebowitz Schwartz
 *
 */
public class Job 
{
	/*
		Notes to self:

		- purpose of this class is to a) submit a job, b) check the status of a job, c) list a
		job's intermediate dir and return contents of intermediate dir files, d) list a job's result
		files and return their contents.  

		- All methods have a User parameter.  
			- Submit creates the job in a hardcoded folder, owned by the user.  Folder will
			be created if it doesn't already exists.
			- All methods that pertain to a specific job, verify that the job is owned by the User 
			and throw a UserMismatchException if not.

		TODO: 
		- see questions below about FileInputStream cleanup on exception.  Test this out.
		- extend this to return all info that's stored in the task.
	*/
	private static final String DEFAULT_FOLDER = "restJobs";
	private static final Log log = LogFactory.getLog(Job.class.getName());

	/*
		Submits the job and returns a jobHandle that uniquely identifies the job.

		visibleParameterMap has name/value pairs for parameters that can be set by an end user.

		inputFileMap maps parameter_name to File object.  There must be an entry for each InFile element
		in the pisexml file.  (Todo - check on optional/mandatory InFile elements).   This method
		checks the encoding of text files and may modify the contents.  In the case of the REST
		API, the files were uploaded as part of the submission request and are in a tmp location.

	*/
	public static String submit(	
					User user,
					JobMetadata clientMetadata,
					String toolId,
					Map<String, String> visibleParameterMap,
					Map<String, File> inputFileMap) throws Exception
	{
		Folder enclosingFolder = defaultFolder(user);
		Task task = new Task(enclosingFolder);
		long taskId = 0;
		/*
			task.input() requires a hashmap where instead of the File we received in inputFileMap,
			we have a List of TaskInputSourceDocuments.  We create the TaskInputSourceDocuments by
			opening a FileInputStream on the File, then wrap the document in a list.  The list 
			will always have just the single entry.
		*/
		HashMap<String, List<TaskInputSourceDocument>> inputMap = 
			new HashMap<String, List<TaskInputSourceDocument>>();

		for (String k: inputFileMap.keySet())
		{
			File file = inputFileMap.get(k);

			// TODO: Maybe we should leave this out until someone tells us they need it?
			// I'm not sure I understand the usecase: someone uploading data that is in an encoding that needs
			// to be translated to ascii?
			// Workbench.convertEncoding(file);

			// TaskInputSourceDocument ctor closes the stream, but if the ctor fails we need to close the stream. 
			FileInputStream is = new FileInputStream(file);
			TaskInputSourceDocument doc = null;
			try
			{
				doc = new TaskInputSourceDocument(k, is);
			}
			catch (Exception e)
			{
				is.close();
				throw e;
			}

			ArrayList<TaskInputSourceDocument> list = new ArrayList<TaskInputSourceDocument>();
			list.add(doc);
			inputMap.put(k, list); 
		}
		task.input().putAll(inputMap);
		task.toolParameters().putAll(visibleParameterMap);
		task.setToolId(toolId);
		task.setLabel("REST v1"); 
		task.setStage(TaskRunStage.READY);
		task.properties().putAll(clientMetadata.toMap());
		task.save();

		Workbench.getInstance().submitTask(task);
		return task.getJobHandle();
	}

	private static Folder defaultFolder(User user) throws Exception
	{
		String folderLabel = DEFAULT_FOLDER;
		Folder folder;
		folder = findFolderByLabel(user.findFolders(), folderLabel);
		if (folder == null)
		{
			folder = new Folder(user);
			folder.setLabel(folderLabel);
			folder.save();
		}
		return folder;
	}

	private static Folder findFolderByLabel(List<Folder> folders, String label)
	{
		for (Iterator<Folder> elements = folders.iterator() ; elements.hasNext() ; )
		{
			Folder folder = elements.next();
			if (folder.getLabel().equals(label))
			{
				return folder;
			}
		}
		return null;
	}

	public static JobStatus getStatus(String jobHandle, User user) throws Exception
	{
		return new JobStatus(jobHandle, user);
	}

	public static JobOutput getOutput(String jobHandle, User user) throws Exception
	{
		return new JobOutput(jobHandle, user);
	}


	public static JobWorkingDir getWorkingDir(String jobHandle, User user) throws Exception
	{
		return new JobWorkingDir(jobHandle, user);
	}

	/*
		This can take a long time to run!  Be careful about how you expose it
		in an application.
	*/
	public static void cancelAll(User user) throws Exception
	{
		List<Task> tasks = user.findTasks();
		for (Task task : tasks)
		{
			try
			{
				cancel(task.getJobHandle(), user);
			}
			// Don't let a problem deleting one prevent us from trying to do the rest.
			catch(Exception e)
			{
				log.error("", e);
			}
		}
	}

	public static void cancel(String jobHandle, User user) throws Exception
	{
		JobStatus status = new JobStatus(jobHandle, user);
		Task task = status.getTask();

		// This sends "qdel" or similar command to remote host where job is queued or running.
		TaskMonitor.cancelJob(task);

		// This removes the task from our db and prevents loadResults from trying to transfer 
		// any files back from the working directory.
		task.delete();
	}

	public static List<String> getJobList(User user) throws Exception
	{
		ArrayList<String> retval = new ArrayList<String>();
		List<Task> list = user.findTasks();
		for (Task t : list)
		{
			retval.add(t.getJobHandle());
		}
		return retval;
	}

	public static List<String> getSubmittedJobList(User user) throws Exception
	{
		ArrayList<String> retval = new ArrayList<String>();
		List<Task> list = user.findTasks();
		for (Task t : list)
		{
			if (!t.getStage().equals(TaskRunStage.NEW) && !t.getStage().equals(TaskRunStage.READY))
			{
				retval.add(t.getJobHandle());
			}
		}
		return retval;
	}

}
