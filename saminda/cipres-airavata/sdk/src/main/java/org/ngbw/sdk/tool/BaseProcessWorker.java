/*
 * BaseProcessWorker.java
 */

/*
	Todo:
		Pass RunningTask object or RunningTask ID.
*/
package org.ngbw.sdk.tool;


import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.WorkbenchCIPRES;
import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.api.tool.FileHandler.FileAttributes;
import org.ngbw.sdk.api.tool.ToolRegistry;
import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.TaskOutputSourceDocument;
import org.ngbw.sdk.database.User;


public abstract class BaseProcessWorker 
{

	// 3 gig
	private static final long MAX_FILE_SIZE = 3221225472L;
	// 5 gig
	private static final long MAX_DIR_SIZE =  5368709120L;

	// Just for testing:
	//private static final long MAX_FILE_SIZE = 5000L;
	//private static final long MAX_DIR_SIZE =  20000L;

	private static final Log log = LogFactory.getLog(BaseProcessWorker.class.getName());
	protected ToolRegistry toolRegistry = WorkbenchCIPRES.getInstance().getServiceFactory().getToolRegistry();

	protected long m_taskId;
	protected long m_jobTimeout; // in minutes.
	protected String m_jobHandle;
	protected String m_commandLine;

	// todo: get these from ToolResource, not the running task
	protected String m_workingDir;
	protected String m_failedDir;
	protected String m_archiveDir;
	protected String m_manualDir;
	protected String m_chargeNumber;
	protected String m_url;
	protected String m_rc;

	/*
		Anything the pise xml file for the tool put into the parameter file "scheduler.conf" will
		show up as a property here in m_schedulerConf.
	*/
	protected Properties m_schedulerConf;

	protected Map<String, OutputDescription> m_outputDescr; 
	protected String m_toolID;
	protected long m_userID;

	protected Tool m_tool;
	protected User m_user;
	protected String m_jobInfo;
	protected String m_userInfo;
	protected String m_outputInfo;
	protected long m_running_task_id;
	protected RunningTask m_rt;
	protected boolean m_noMoveDir = false;
	protected boolean m_local = false;
	protected FileHandler fh = null;

	protected BaseProcessWorker(String jobhandle) throws Exception 
	{
		m_rt = RunningTask.find(jobhandle);
		initialize();
	}

	protected BaseProcessWorker(RunningTask rt) throws Exception 
	{
		m_rt = rt;
		initialize();
	}


	/********************************************************************************************
		START SUBMIT, CANCEL, CHECK
	********************************************************************************************/
	public String submit() throws Exception
	{
		fh = getFileHandler();
		String jobId = null;
		preamble();
		jobId = submitImpl();
		return jobId;
	}

	// OVERRIDE
	protected String submitImpl() throws Exception
	{
		throw new RuntimeException("Internal Error.  Process Worker's must override this method.");
	}

	private void preamble() throws Exception
	{
		String msg = m_jobInfo + "\n" + m_userInfo + "\n" + m_outputInfo;
		fh.writeFile(m_workingDir + "/" + "_JOBINFO.TXT", m_jobInfo + "\n" + m_userInfo + "\n" + m_outputInfo);
	}

	// OVERRIDE - called by ProcessManager
	void cancelJob() throws Exception
	{
		// Derived classes overide this if they are able to cancel a scheduled or running job.
		// This is called by ProcessManager.cancelJob()
		log.debug("cancelJob not implemented in this process worker.");
		return;
	}

	// OVERRIDE - called by ProcessManager
	List<RunningTask> checkJobsOnResource(List<RunningTask> lrt) throws Exception
	{
		throw new Exception("Derived class must override checkJobsImpl() method.");
	}

	// OVERRIDE
	// can't call this in ctor, derived class must be fully constructed.
	protected abstract FileHandler getFileHandler() throws Exception;
	

	/********************************************************************************************
		END  SUBMIT, CANCEL, CHECK 
	********************************************************************************************/


	/********************************************************************************************
		START  GET RESULTS 
	********************************************************************************************/
	//OVERRIDE
	protected InputStream readStdOut(FileHandler handler) throws Exception
	{
		throw new RuntimeException("Internal Error.  Process Worker's must override this method.");
	}
	//OVERRIDE
	protected InputStream readStdErr(FileHandler handler) throws Exception
	{
		throw new RuntimeException("Internal Error.  Process Worker's must override this method.");
	}

	public void getResults(String localPath) throws Exception
	{
		String msg = null;
		fh = getFileHandler();

		// These errors are not fatal because we may have misconfigured tool registry and can fix it for the next time this runs.
		if (toolRegistry.getToolResource(m_rt.getResource()) == null)
		{
			msg = "Failed to load results because host where job ran (" + m_rt.getResource() + ") is no longer available." +
				" Please contact mmiller@sdsc.edu for assistance in retrieving your results. "; 
			throw new Exception(msg);
		} else if (!findWorkingDir(localPath))
		{
			msg = "Failed to load results because job's working dir wasn't found." +
				" Please contact mmiller@sdsc.edu for assistance in retrieving your results. "; 
			throw new Exception(msg);
		}

		// TODO: how is this going to work with the REST API?
		if (msg == null)
		{
			if (localPath == null && resultsTooLarge(fh))
			{
				msg = "****ALERT****, one or more results files are too large for us to return through the " +
				"browser interface. Please contact mmiller@sdsc.edu for assistance in retrieving your results. " +
				"We are working hard on a better resolution to this problem.  Sincerely, the CIPRES Gateway staff.";

				archiveTaskDirectory(m_manualDir);
				throw new FatalTaskException(msg);
			}
		}
		readAndStore();
	}

	private void readAndStore() throws Exception
	{
		InputStream stderr = null;
		InputStream stdout = null;
		try
		{
			stderr = readStdErr(fh);
			stdout = readStdOut(fh);
			storeTaskResults(stdout, stderr, 0, "", fh);
		}

		finally
		{
			try
			{
				if (stderr != null) { stderr.close();}
			}
			catch(Exception e)
			{
				log.error("Eating this error on stream close:", e);
			}
			try
			{
				if (stdout != null) { stdout.close();}
			}
			catch(Exception e)
			{
				log.error("Eating this error on stream close:", e);
			}
		}
	}

	protected void storeTaskResults(String stdOut, String stdErr, int exitCode, FileHandler handler) 
		throws IOException, SQLException,  Exception
	{
		storeTaskResults(stdOut, stdErr, exitCode, null, handler);
	}


	protected void storeTaskResults(String stdOut, String stdErr, int exitCode, String msg, FileHandler handler) 
		throws IOException, SQLException, Exception
	{
		InputStream out = null;
		InputStream err = null;
		if (stdOut != null)
		{
			out = new ByteArrayInputStream(stdOut.getBytes());
		}
		if (stdErr != null)
		{
			err = new ByteArrayInputStream(stdErr.getBytes());
		}
		storeTaskResults(out, err, exitCode, msg, handler);
	}

	protected void storeTaskResults(InputStream stdOut, InputStream stdErr, int exitCode, FileHandler handler) 
		throws IOException, SQLException,  Exception
	{
		storeTaskResults(stdOut, stdErr, exitCode, null, handler);
	}


	protected void storeTaskResults(InputStream stdOut, InputStream  stdErr, int exitCode, String msg, FileHandler handler) 
		throws IOException, SQLException, Exception
	{
		Task task = null;
		task = m_rt.getTask();
		storeProcessOutput(task, stdOut, stdErr, exitCode);
		storeOutputFiles(task, handler);
		log.debug("Task results stored in database.");
	}


	/*
		Stores the exit code from the "tool" and the contents of the standard out and standard error. 
		The exit code is only stored if it's non-zero, and the contents of standard out and standard error are only stored if 
		they contain anything.

		TODO: wherever we read stdout and stderr into memory we need to limit the size.  Or we need 
		to rewrite this to use streams.
	*/
	private void storeProcessOutput(Task task, InputStream stdOut, InputStream stdErr, int exitCode) throws IOException, SQLException
	{
		List<TaskOutputSourceDocument> processOutput = new ArrayList<TaskOutputSourceDocument>();

		if (exitCode != 0) 
		{
			String message = "Process returned nonzero exit value typically indicating an error: " + String.valueOf(exitCode);
			processOutput.add(new TaskOutputSourceDocument("EXIT_VALUE", message.getBytes()));
		}

		if (stdOut != null )
		{
			processOutput.add(new TaskOutputSourceDocument("STDOUT", stdOut));
			//log.debug("Created TaskOutputSourceDocument for stdout."); 
		}
		if (stdErr != null ) 
		{
			processOutput.add(new TaskOutputSourceDocument("STDERR", stdErr));
			//log.debug("Created TaskOutputSourceDocument for stderr."); 
		}
		if (processOutput.size() > 0) 
		{
			task.output().put("PROCESS_OUTPUT", processOutput);
			task.save();
			log.debug("Stored task stdout/stderr as PROCESS_OUTPUT.");
		}
	}


	/*
		Stores the files produced by the "tool".  Only files that match a pattern from
		an <code>OutputDescription</code> object are stored; all other files are ignored.
	*/
	private void storeOutputFiles(Task task, FileHandler handler) throws IOException, SQLException,  Exception
	{
		// Each entry is map of parameter name to OutputDescription (ie.a  wildcard pattern/ datatype/ entity type/ format)
		for (Map.Entry<String, OutputDescription> entry : m_outputDescr.entrySet()) 
		{
			String parameter = entry.getKey();
			OutputDescription description = entry.getValue();
			List<String> fileNames = handler.listFiles(m_workingDir);
			List<TaskOutputSourceDocument> documents = new ArrayList<TaskOutputSourceDocument>();
			
			List<String> matchingFiles = OutputDescription.filter(fileNames, description);
			for (String filename : matchingFiles)
			{
				try
				{
					InputStream inStream = handler.getInputStream(m_workingDir + filename);
					documents.add(new TaskOutputSourceDocument(filename, description.entityType, description.dataType, 
						description.format, inStream, false));
				}
				catch (FileNotFoundException notFoundErr) 
				{
				}
			}
			if (documents.size() > 0)
			{
				task.output().put(parameter, documents);
			}
			else
			{
				log.warn("No files found for output param " + parameter);
			}
		}
		task.save();
	}


	/**
		localPath = if not null, use a local file handler and use this directory as the parent of the jobs working dir.  
		Don't move or remove workingDir when done.  Verify that workingDir exists and return true or false.
		Derived classes need to check m_local and create local file handlers regardless of what filehandler they normally use.

		Assumes layout is what we currently use where we have a root workspace, with ARCHIVE and FAILED dirs beneath it.

		Otherwise, if localPath is null, verify working dir exists, otherwise look for it under FAILED.  If found under 
		FAILED, make that the working dir and return true.  
	*/
	public boolean findWorkingDir(String localPath) throws Exception
	{ 
		// Get a file handler, either local or as specified in running task entry
		if (localPath != null)
		{
			localPath += "/";
			log.debug("Making sure job's working dir exists under: " + localPath);
			log.debug("m_archiveDir is " + m_archiveDir);
			m_local = true;

			m_workingDir  = DefaultToolResource.getWorkingDirectory(localPath, m_jobHandle);
			m_archiveDir  = DefaultToolResource.getArchiveDirectory(localPath, m_jobHandle); 
			log.debug("m_archiveDir is " + m_archiveDir);

			m_failedDir  = DefaultToolResource.getFailedDirectory(localPath, m_jobHandle); 
			log.debug("m_failedDir is " + m_failedDir);
			fh = new LocalFileHandler();
			m_noMoveDir = true;
		} else
		{
			log.debug("Making sure job's working dir " + m_workingDir + " exists.");
		}

		// Make sure workingDir exists (also look in FAILED and ARCHIVE)
		if (!fh.isDirectory(m_workingDir))
		{
			log.debug(m_workingDir + " doesn't exist, looking for " +  m_failedDir);
			if (fh.isDirectory(m_failedDir))
			{
				m_workingDir = m_failedDir;
				m_noMoveDir = true;
				log.debug("Found job dir in FAILED directory.");
			} else if (fh.isDirectory(m_archiveDir))
			{
				log.debug(m_failedDir + " doesn't exist either, but ARCHIVE does.");

				m_workingDir = m_archiveDir;
				m_noMoveDir = true;
				log.debug("Found job dir in ARCHIVE directory.");
			}
			else
			{
				log.debug(m_archiveDir + " doesn't exist either.");
				return false;
			}
		}
		return true;
	}

	public void setNoMoveDir(boolean flag) { m_noMoveDir = flag; }


	/*
		returns array where first element is cummulative size of all files and
		second element is size of largest file.
	*/
	long[] resultsSize(FileHandler fh, String directory) throws Exception
	{
		List<FileAttributes> attributeList = fh.list(directory);
		long[] retval = new long[2];

		// keep track of cummulative size of all files and single largest file
		long totalSize = 0;
		long largestSize = 0;

		for (FileAttributes attributes : attributeList)
		{
			if (attributes.isDirectory)
			{
				long subResults[] = resultsSize(fh, directory + "/" + attributes.filename);
				totalSize = totalSize + subResults[0]; 
				if (subResults[1] > largestSize)
				{
					largestSize = subResults[1];
				}
			} else
			{
				totalSize = totalSize + attributes.size;

				if (attributes.size > largestSize)
				{
					largestSize = attributes.size;
				}
			}
		}
		retval[0] = totalSize;
		retval[1] = largestSize;
		return retval;
	}

	boolean resultsTooLarge(FileHandler fh) throws Exception
	{
		long[] sizes = resultsSize(fh, m_workingDir);
		/*
		m_baseLog.debug("ResultsTooLarge found total dir size = " + sizes[0] + 
			", largest file size = " + sizes[1]);
		*/
		return (sizes[0] > MAX_DIR_SIZE) || (sizes[1] > MAX_FILE_SIZE);
	}

	public boolean archiveTaskDirectory()
	{
		return archiveTaskDirectory(m_archiveDir);
	}

	protected boolean archiveTaskDirectory(String toDir)
	{
		try
		{
			if (!m_noMoveDir)
			{
				if (fh.exists(m_workingDir))
				{
					fh.moveDirectory(m_workingDir, toDir);
					log.debug("Working directory [ " + m_workingDir + " ] moved to directory [ " + toDir + " ].");
				}
			}
			return true;
		}
		catch(Exception e)
		{
			log.error("moveDirectory " + m_workingDir + " to " + toDir + " failed.", e);
		}
		return false;
	}

	protected boolean moveToFailedDirectory()
	{
		if (fh != null )
		{
			return archiveTaskDirectory(m_failedDir);
		}
		return false;
	}







	/********************************************************************************************
		START Class Initialization Helpers 
	********************************************************************************************/
	private void initialize() throws Exception
	{
		// We get these properties from the running task, they're specific to this task.
		m_jobHandle = m_rt.getJobhandle();
		m_toolID  = m_rt.getToolId(); 
		m_userID  = m_rt.getUserId();
		m_user  = new User(m_userID);
		m_tool = new Tool(m_toolID, m_rt.getResource(), toolRegistry);
		m_taskId = m_rt.getTaskId();
		m_commandLine = m_rt.getCommandline();
		m_outputDescr = OutputDescription.parse(m_rt.getOutputDesc());
		m_outputInfo = "Output=" + m_rt.getOutputDesc();
		if (m_rt.getSprops() != null)
		{
			m_schedulerConf = SchedulerProperties.string2Properties(m_rt.getSprops());
		}
		// This is optional.
		String param;
		if ((param =  m_rt.parameters().get(Tool.CHARGENUMBER)) != null)
		{
			m_chargeNumber = param;
		}

		// These are based on the workspace directory specified in the tool registry.
		m_failedDir =  m_tool.getToolResource().getFailedDirectory(m_jobHandle);
		m_archiveDir =  m_tool.getToolResource().getArchiveDirectory(m_jobHandle);
		m_manualDir =  m_tool.getToolResource().getManualDirectory(m_jobHandle);
		m_workingDir = m_tool.getToolResource().getWorkingDirectory(m_jobHandle);

		// These are typically specified in the tool registry for the tool resource.
		if ( (param =  m_tool.getToolResource().getParameters().get(Tool.JOB_TIMEOUT)) != null)
		{
			m_jobTimeout = Long.parseLong(param);
		}
		if ((param =  m_tool.getToolResource().getParameters().get(Tool.RC)) != null)
		{
			m_rc = param;
		}
		String callbackurl;
		String pstr = WorkbenchCIPRES.getInstance().getProperties().getProperty("use.rest.callback");
		if (pstr != null && pstr.trim().equals("true"))
		{
			callbackurl =  WorkbenchCIPRES.getInstance().getProperties().getProperty("rest.callback.url"); 
		} else
		{
			callbackurl =  WorkbenchCIPRES.getInstance().getProperties().getProperty("portal.callback.url"); 
		}
		m_url = "'" + callbackurl + "?taskId=" + m_taskId + "\\&jh=" + m_jobHandle + "'"; 

		initTaskInfo();
	}

	protected void initTaskInfo() throws Exception
	{

		String m_taskLabel = "Unknown. Task Deleted";
		String m_taskCreationDate = "Unknown. Task Deleted";

		Task task = m_rt.getTask();
		if (task != null)
		{
			m_taskLabel = task.getLabel();
			m_taskCreationDate = task.getCreationDate().toString();
		}
		m_jobInfo =	"Task\\ label=" + m_taskLabel + "\n" +
				"Task\\ ID=" + m_taskId + "\n" +
				"Tool=" + m_toolID + "\n" +
				"created\\ on=" + m_taskCreationDate + "\n" +
				"JobHandle=" + m_jobHandle + "\n";
		m_jobInfo += "resource=" + m_rt.getResource();
		m_userInfo =	"User\\ ID=" + m_userID + "\n" +
					"User\\ Name=" + m_user.getUsername() + "\n" +
					"email=" + m_user.getEmail() + "\n";
		}
	}



	/********************************************************************************************
		END Class Initialization Helpers 
	********************************************************************************************/



