package org.apache.airavata.cipres.integration;

import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import org.apache.airavata.client.AiravataAPIFactory;
import org.apache.airavata.client.api.AiravataAPI;
import org.apache.airavata.client.api.ExperimentAdvanceOptions;
import org.apache.airavata.client.api.exception.AiravataAPIInvocationException;
import org.apache.airavata.client.impl.PasswordCallBackImpl;
import org.apache.airavata.registry.api.workflow.WorkflowExecutionStatus.State;
import org.apache.airavata.workflow.model.wf.WorkflowInput;
import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.tool.BaseProcessWorker;

public class AiravataLocalProcessWorker extends BaseProcessWorker {
	private AiravataAPI api;
	private FileHandler fileHandler;
	private AiravataAPI getAPI(){
		if (api==null){
			try {
				AiravataAPIFactory.getAPI(new URI(getParameter("serverURL")),getParameter("gateway"), getParameter("username"),new PasswordCallBackImpl(getParameter("username"), getParameter("password")));
			} catch (AiravataAPIInvocationException e) {
				e.printStackTrace();
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}
		}
		return api;
	}
	
	private String getParameter(String key){
		return m_tool.getToolResource().getParameters().get(key);
	}

	protected AiravataLocalProcessWorker(RunningTask rt) throws Exception {
		super(rt);
	}
	
	private RunningTask getRunningTask(){
		return m_rt;
	}
	
	protected String submitImpl() throws Exception {
		RunningTask runningTask = getRunningTask();
		AiravataAPI api = getAPI();
		File workingDir = new File(new File(getParameter("baseWorkingDir")),m_jobHandle);
		String staticDirKey = m_jobHandle+"/staticDir";
		api.getAiravataManager().addConfiguration(staticDirKey, workingDir.toString(), null);
		String workflowName=runningTask.getToolId();
		List<WorkflowInput> workflowInputs = api.getWorkflowManager().getWorkflowInputs(workflowName);
		for (WorkflowInput workflowInput : workflowInputs) {
			if (runningTask.parameters().containsKey(workflowInput.getName())){
				if (runningTask.parameters().containsKey(workflowInput.getName())) {
					workflowInput.setValue(runningTask.parameters().get(
							workflowInput.getName()));
				}
			}
		}
		//TODO setup tool inputFile location to the correct WorkflowInput parameter
		ExperimentAdvanceOptions options = api.getExecutionManager().createExperimentAdvanceOptions();
		options.setCustomExperimentId(m_jobHandle);
		String experimentId = api.getExecutionManager().runExperiment(workflowName, workflowInputs, options);
		runningTask.setRemoteJobId(experimentId);
		return experimentId;
	}

	/**
	 * Receives a list of jobs that were submitted on this host, finds out which
	 * ones are done, and returns that list.
	 */
	public List<RunningTask> checkJobsOnResource(List<RunningTask> running_tasks) throws Exception {
		List<RunningTask> completedTasks=new ArrayList<RunningTask>();
		for (RunningTask runningTask : running_tasks) {
			State state = getAPI().getProvenanceManager().getExperimentData(runningTask.getRemoteJobId()).getState();
			if (state == State.DONE || state == State.FINISHED || state == State.FAILED){
				completedTasks.add(runningTask);
			}
		}
		return completedTasks;
	}

	protected FileHandler getFileHandler() throws Exception {
		if (fileHandler==null) {
			fileHandler = toolRegistry.getToolResource(m_rt.getResource())
					.getFileHandler();
		}
		return fileHandler;
	}


	protected InputStream readStdErr(FileHandler handler) throws Exception {
		String fileName = getFileHavingExtension(getFileHandler().listFiles(m_jobHandle), "stderr");
		if (fileName==null){
			return null;
		}else{
			return getFileHandler().readFile(m_jobHandle+"/"+fileName);
		}
	}
	
	private String getFileHavingExtension(List<String> files, String fileExtension) {
		String fileName = null;
		for (String file : files) {
			if (file.endsWith("."+fileExtension)){
				fileName=file;
				break;
			}
		}
		return fileName;
	}

	protected InputStream readStdOut(FileHandler handler) throws Exception {
		String fileName = getFileHavingExtension(getFileHandler().listFiles(m_jobHandle), "stdout");
		if (fileName==null){
			return null;
		}else{
			return getFileHandler().readFile(m_jobHandle+"/"+fileName);
		}
	}

	public void cancelJob() throws Exception {
		//TODO
	}

}
