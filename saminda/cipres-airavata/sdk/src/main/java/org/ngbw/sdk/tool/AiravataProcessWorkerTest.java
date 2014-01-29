package org.ngbw.sdk.tool;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.database.RunningTask;
//
public class AiravataProcessWorkerTest extends BaseProcessWorker {
	
	public AiravataProcessWorkerTest(RunningTask rt) throws Exception {
		super(rt);
	}

	
	protected String submitImpl() throws Exception {
		System.out.println("Submitting the job");
		System.out.println("working dir : "+m_workingDir);
		System.out.println("job handle : "+m_jobHandle);
		System.out.println("running task id : "+m_running_task_id);
		System.out.println("task id : "+m_taskId);
		System.out.println("tool id: "+m_toolID);
		return UUID.randomUUID().toString();
	}

	/**
	 * Receives a list of jobs that were submitted on this host, finds out which
	 * ones are done, and returns that list.
	 */
	public List<RunningTask> checkJobsOnResource(List<RunningTask> running_tasks) throws Exception {
		System.out.println("chking jobs");
		running_tasks.clear();
		return running_tasks;
	}

	protected FileHandler getFileHandler() throws Exception {
		System.out.println("getting file handler");
		return toolRegistry.getToolResource(m_rt.getResource()).getFileHandler();
	}


	protected InputStream readStdErr(FileHandler handler) throws Exception {
		return null;
	}

	protected InputStream readStdOut(FileHandler handler) throws Exception {
		return null;
	}

	public void cancelJob() throws Exception {
		//TODO
	}
}
