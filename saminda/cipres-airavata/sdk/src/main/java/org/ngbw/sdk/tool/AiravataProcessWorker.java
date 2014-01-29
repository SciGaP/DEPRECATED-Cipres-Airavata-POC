package org.ngbw.sdk.tool;

import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.database.RunningTask;


import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import org.apache.airavata.client.AiravataAPIFactory;
//import org.apache.airavata.client.api.AiravataAPI;
//import org.apache.airavata.client.api.exception.AiravataAPIInvocationException;
//import org.apache.airavata.client.impl.PasswordCallBackImpl;
//import org.apache.airavata.registry.api.workflow.WorkflowExecutionStatus.State;
//import org.apache.airavata.workflow.model.wf.WorkflowInput;
import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.database.RunningTask;
//
public class AiravataProcessWorker extends BaseProcessWorker {

//	private AiravataAPI api;
//	
//	private AiravataAPI getAPI(){
//		if (api==null){
//			try {
//				api=AiravataAPIFactory.getAPI(new URI(getParameters().get("serverURL")),"default", "admin",new PasswordCallBackImpl("admin", "admin"));
//			} catch (AiravataAPIInvocationException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (URISyntaxException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return api;
//	}
//	
	public AiravataProcessWorker(RunningTask rt) throws Exception {
		super(rt);
	}
//	
//	private RunningTask getRunningTask(){
//		return m_rt;
//	}
//	
//	private Map<String,String> getParameters(){
//		return m_tool.getToolResource().getParameters();
//	}
//	
//	protected String submitImpl() throws Exception {
//		RunningTask runningTask = getRunningTask();
//		AiravataAPI api = getAPI();
//		String workflowName=runningTask.getToolId();
//		List<WorkflowInput> workflowInputs = api.getWorkflowManager().getWorkflowInputs(workflowName);
//		for (WorkflowInput workflowInput : workflowInputs) {
//			if (runningTask.parameters().containsKey(workflowInput.getName())){
//				workflowInput.setValue(runningTask.parameters().get(workflowInput.getName()));
//			}
//		}
//		String experimentId = api.getExecutionManager().runExperiment(workflowName, workflowInputs);
//		runningTask.setRemoteJobId(experimentId);
//		return experimentId;
//	}
//
//	/**
//	 * Receives a list of jobs that were submitted on this host, finds out which
//	 * ones are done, and returns that list.
//	 */
//	public List<RunningTask> checkJobsOnResource(List<RunningTask> running_tasks) throws Exception {
//		List<RunningTask> completedTasks=new ArrayList<RunningTask>();
//		for (RunningTask runningTask : running_tasks) {
//			State state = getAPI().getProvenanceManager().getExperimentData(runningTask.getRemoteJobId()).getState();
//			if (state == State.DONE || state == State.FINISHED || state == State.FAILED){
//				completedTasks.add(runningTask);
//			}
//		}
//		return completedTasks;
//	}

	protected FileHandler getFileHandler() throws Exception {
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
