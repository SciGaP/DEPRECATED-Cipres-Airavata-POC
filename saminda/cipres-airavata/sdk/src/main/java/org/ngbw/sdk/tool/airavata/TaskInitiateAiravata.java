package org.ngbw.sdk.tool.airavata;

import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.tool.DisabledResourceException;
import org.ngbw.sdk.tool.TaskInitiate;

public class TaskInitiateAiravata implements TaskInitiate {

	@Override
	public String queueTask(Task task, boolean loggedInViaIPlant)
			throws DisabledResourceException, Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean runTask(RunningTask runningTask)
			throws DisabledResourceException, Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String stageAndRun() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
