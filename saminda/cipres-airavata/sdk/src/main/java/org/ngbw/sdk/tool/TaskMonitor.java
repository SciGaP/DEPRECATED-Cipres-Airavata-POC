/*
 * TaskMonitor.java
 */
package org.ngbw.sdk.tool;

import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.database.Task;


public interface TaskMonitor 
{
	public void checkJobs(String submitter) throws Exception;
	
	public void cancelJob(Task task) throws Exception;

	public boolean getResults(RunningTask rt, String localPath); 
	
	public  void notifyJobComplete(Task t, String msg);

}
