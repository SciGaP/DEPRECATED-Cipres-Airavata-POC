/*
 * TaskInitiate.java
 */
package org.ngbw.sdk.tool;


import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.database.Task;


/**
 * 
 * @author Terri Liebowitz Schwartz
 */
public interface TaskInitiate {

	/*
		Web application calls this after saving Task in the db.  Application should 
		not modify the task ever again, once handing it off to queueTask. 
		However application can call Job.cancel which will delete the task.  
	*/
	public String queueTask(Task task, boolean loggedInViaIPlant) 
		throws DisabledResourceException, Exception;

	/*
		submitJobD calls this.
		We don't have to worry about user not existing because we never delete user accounts, 
			just mark them inactive.
		RunningTask.status = NEW when this is called.   

		If submitJobD crashes after incrementing attempts, it will process the same job again when it's 
		restarted up to maxAttempts (see cipres-*.properties, submitJob.retries).
		If we haven't staged the working dir yet, it can process the job.  Once the working dir exists, we won't try
		to stage/submit again.  At the moment submitJobD handles all runningtasks with attempts >=0 , we don't
		have a recoverSubmitJobD.

		TODO: split submitJob and loadResults into separate process for each remote resource so one messed up
		resource can't hurt the others?

		TODO: should check tool.disabled again.
	*/
	public boolean runTask(RunningTask runningTask) 
		throws DisabledResourceException, Exception;


	/*
		Returns the remote jobId if any.
	*/
	public String stageAndRun() throws Exception;

}


