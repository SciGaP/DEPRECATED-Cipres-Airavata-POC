/*
 * JobStatus.java
 */
package org.ngbw.sdk.jobs;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.core.shared.TaskRunStage;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.TaskLogMessage;

import java.util.Date;
import java.util.Collection;



/**
 * @author Terri Liebowitz Schwartz
 *
 */
/*
	This class is the info that's returned to a caller about a job he submitted.
	Jobs that user deleted or that the system expired won't have a retrievable jobStatus.
	In the future we may want to change things so that we keep all relevant info about 
	deleted tasks for an accounting api.

	The rest api will add urls for files_url, results_url, status_url to this.

*/
public class JobStatus
{
	private static final Log log = LogFactory.getLog(JobStatus.class.getName());
	
	private String jobHandle;
	private boolean terminalStage;
	private boolean ok;

	private JobMetadata clientMetadata;
	private TaskRunStage jobStage;
	private Date dateSubmitted;
	private User user;
	private Task task;
	private Collection<TaskLogMessage> messages;


	public JobStatus() {;}


	public JobStatus(String jobHandle, User user) throws Exception
	{
		this.jobHandle = jobHandle;
		this.user = user;
		task = Task.findTaskByJobHandle(jobHandle);
		initializeFromTask(task);
		if (user != null && !user.getUsername().equals(this.user.getUsername()))
		{
			throw new UserMismatchException("User " + user.getUsername() + " doesn't own job " +
				jobHandle);
		}
	}


	/*
		Todo: double check task.getStage() and task.error() against
		RunningTask, for example if task.getStage() == SUBMITTED or PROCESSING
		and task.isOk() but there's no running task we should update at least
		log an error message in the task.
	*/
	private void initializeFromTask(Task task) throws Exception
	{
		if (task == null)
		{
			throw new JobNotFoundException(jobHandle);
		}
		this.jobHandle = task.getJobHandle();
		this.user = new User(task.getUserId());


		setClientMetadata(JobMetadata.fromMap(task.properties()));

		// values are from sdk.core.shared.TaskRunStage enum
		setJobStage(task.getStage());

		/* Todo:
			- clean this up so that user can ask isSubmitted, isFinished, isFailed and can
			get all task log messages.
		*/
		if (!task.isRunning())
		{
			setTerminalStage(true);
		} else
		{
			setTerminalStage(false);
		}
		setOk(task.isOk());
		setDateSubmitted(task.getCreationDate());
		setMessages(task.logMessages());
	}


	public String getJobHandle() {
		return jobHandle;
	}

	public void setJobHandle(String jobHandle) {
		this.jobHandle = jobHandle;
	}

	public JobMetadata getClientMetadata() {
		return clientMetadata;
	}

	public void setClientMetadata(JobMetadata clientMetadata) {
		this.clientMetadata = clientMetadata;
	}

	public String getJobStage() {
		return jobStage.toString();
	}

	public void setJobStage(String jobStage) {
		this.jobStage = TaskRunStage.valueOf(jobStage);
	}

	public void setJobStage(TaskRunStage jobStage) {
		this.jobStage = jobStage;
	}

	public boolean isTerminalStage() {
		return terminalStage;
	}
	public void setTerminalStage(boolean terminalStage) {
		this.terminalStage = terminalStage;
	}

	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}


	public Date getDateSubmitted() {
		return dateSubmitted;
	}

	public void setDateSubmitted(Date dateSubmitted) {
		this.dateSubmitted = dateSubmitted;
	}

	public Collection<TaskLogMessage> getMessages()
	{
		return this.messages;
	}

	public void setMessages(Collection<TaskLogMessage> messages)
	{
		this.messages = messages;
	}

	protected Task getTask()
	{
		return this.task;
	}

}
