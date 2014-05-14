package org.apache.airavata.cipres.integration;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.airavata.api.Airavata;
import org.apache.airavata.api.Airavata.Client;
import org.apache.airavata.api.client.AiravataClientFactory;
import org.apache.airavata.client.api.AiravataAPI;
import org.apache.airavata.common.exception.ApplicationSettingsException;
import org.apache.airavata.model.util.ExperimentModelUtil;
import org.apache.airavata.model.workspace.experiment.AdvancedOutputDataHandling;
import org.apache.airavata.model.workspace.experiment.ComputationalResourceScheduling;
import org.apache.airavata.model.workspace.experiment.DataObjectType;
import org.apache.airavata.model.workspace.experiment.Experiment;
import org.apache.airavata.model.workspace.experiment.JobState;
import org.apache.airavata.model.workspace.experiment.JobStatus;
import org.apache.airavata.model.workspace.experiment.UserConfigurationData;
import org.ngbw.sdk.api.tool.FileHandler;
import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.tool.BaseProcessWorker;

public class AiravataLocalProcessWorker extends BaseProcessWorker {
	private AiravataAPI api;
	private FileHandler fileHandler;
	protected Airavata.Client getClient() throws ApplicationSettingsException {
        String THRIFT_SERVER_HOST = getParameter("thrift.server.host");
        int THRIFT_SERVER_PORT = Integer.parseInt(getParameter("thrift.server.port"));
        return AiravataClientFactory.createAiravataClient(THRIFT_SERVER_HOST, THRIFT_SERVER_PORT);

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
		Client client = getClient();
		File workingDir = new File(new File(getParameter("baseWorkingDir")),m_jobHandle);
		String staticDirKey = m_jobHandle+"/staticDir";
		Map<String, String> parameters = runningTask.parameters();
        List<DataObjectType> exInputs = new ArrayList<DataObjectType>();
		for (String parameterName : parameters.keySet()) {
			DataObjectType input = new DataObjectType();
	        input.setKey(parameterName);
	        input.setValue(parameters.get(parameterName));
	        exInputs.add(input);
		}
		Experiment experiment = ExperimentModelUtil.createSimpleExperiment("default", "admin", runningTask.getTask().getLabel(), runningTask.getTask().getLabel(), runningTask.getToolId(), exInputs);
		//TODO setup tool inputFile location to the correct WorkflowInput parameter
		List<DataObjectType> exOut = new ArrayList<DataObjectType>();
        DataObjectType output = new DataObjectType();
        output.setKey("echo_output");
        output.setValue("");
        exOut.add(output);
        experiment.setExperimentOutputs(exOut);
        ComputationalResourceScheduling scheduling = ExperimentModelUtil.createComputationResourceScheduling("localhost", 1, 1, 1, "normal", 0, 0, 1, "sds128");
        scheduling.setResourceHostId("localhost");
        UserConfigurationData userConfigurationData = new UserConfigurationData();
        userConfigurationData.setAiravataAutoSchedule(false);
        userConfigurationData.setOverrideManualScheduledParams(false);
        userConfigurationData.setComputationalResourceScheduling(scheduling);
        AdvancedOutputDataHandling advanceOutputDataHandling = new AdvancedOutputDataHandling();
        advanceOutputDataHandling.setOutputDataDir(workingDir.toString());
		userConfigurationData.setAdvanceOutputDataHandling(advanceOutputDataHandling);
        experiment.setUserConfigurationData(userConfigurationData);
        String experimentId = client.createExperiment(experiment);
        client.launchExperiment(experimentId, "tmpToken");
        runningTask.setRemoteJobId(experimentId);
		return experimentId;
	}

	/**
	 * Receives a list of jobs that were submitted on this host, finds out which
	 * ones are done, and returns that list.
	 */
	public List<RunningTask> checkJobsOnResource(List<RunningTask> running_tasks) throws Exception {
		Client client = getClient();
		List<RunningTask> completedTasks=new ArrayList<RunningTask>();
		for (RunningTask runningTask : running_tasks) {
			Map<String, JobStatus> jobStatuses = client.getJobStatuses(runningTask.getRemoteJobId());
            for (String key : jobStatuses.keySet()) {
                JobStatus jobStatus = jobStatuses.get(key);
                if (jobStatus != null) {
                    if (JobState.COMPLETE==jobStatus.getJobState() || JobState.FAILED==jobStatus.getJobState()) {
                    	completedTasks.add(runningTask);
                    	break;
                    }
                }
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
