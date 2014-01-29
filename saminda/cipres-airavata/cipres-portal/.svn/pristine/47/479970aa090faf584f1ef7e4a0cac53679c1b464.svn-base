package org.ngbw.cipresrest.webresource;

//import javax.xml.bind.annotation.XmlRootElement;
//import javax.xml.bind.annotation.XmlElement;
//import javax.xml.bind.annotation.XmlAccessorType;
//import javax.xml.bind.annotation.XmlAccessType;

import java.util.Date;
import java.util.Map;
import java.util.ArrayList;

import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.TaskLogMessage;
import org.ngbw.sdk.jobs.JobStatus;
import org.ngbw.sdk.jobs.JobMetadata;
import org.ngbw.sdk.jobs.JobNotFoundException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.sdk.database.User;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.FileData;
import org.ngbw.restdatatypes.StatusData;
import org.ngbw.restdatatypes.JobMessage;


public class JStatus 
{
	private static final Log log = LogFactory.getLog(JStatus.class.getName());
	private JobStatus jobStatus;
	private CipresJob cipresJob;

	public JStatus(CipresJob cipresJob, String jobHandle) throws Exception
	{
		this.cipresJob = cipresJob;
		jobStatus = new JobStatus(jobHandle, cipresJob.user);
	}

	public StatusData toStatusData() throws Exception
	{
		StatusData sd = new StatusData();
		sd.statusUri = getStatusUri();
		sd.resultsUri = getResultsUri();
		sd.workingDirUri = getWorkingDirUri();

		sd.jobHandle = getJobHandle();

		sd.clientMetadata = getClientMetadata();

		sd.jobStage = getJobStage();

		sd.terminalStage = isTerminalStage();
		sd.failed = !jobStatus.isOk();

		sd.dateSubmitted = getDateSubmitted();

		ArrayList<JobMessage> messageList = new ArrayList<JobMessage>();
		for (TaskLogMessage message : jobStatus.getMessages())
		{
			JobMessage jm = new JobMessage();
			jm.message = message.getMessage();
			jm.stage = message.getStage().toString();
			jm.timestamp = message.getCreationDate();
			messageList.add(jm);
		}
		sd.messages = messageList;

		return sd;
	}



	private LinkData getStatusUri() throws Exception
	{
		LinkData link = cipresJob.getJobUri(getJobHandle());
		return link; 
	}


	private LinkData getResultsUri() throws Exception
	{
		LinkData link = cipresJob.getResultsUri(getJobHandle(), null);
		return link; 
	}

	private LinkData getWorkingDirUri() throws Exception
	{
		LinkData link = cipresJob.getWorkingDirUri(getJobHandle(), null);
		return link; 
	}


	public String getJobHandle() {
		return jobStatus.getJobHandle();
	}

	public void setJobHandle(String jobHandle) {
		jobStatus.setJobHandle(jobHandle);
	}

	public Map<String, String> getClientMetadata() throws Exception{
		JobMetadata m = jobStatus.getClientMetadata();
		return m.toMap();
	}

	public void setClientMetadata(Map<String, String> properties) throws Exception{
		JobMetadata m = JobMetadata.fromMap(properties);
		jobStatus.setClientMetadata(m);
	}

	public String getJobStage() {
		return jobStatus.getJobStage();
	}

	public void setJobStage(String jobStage) {
		jobStatus.setJobStage(jobStage);
	}

	public boolean isTerminalStage() {
		return jobStatus.isTerminalStage();
	}

	public void setTerminalStage(boolean terminalStage) {
		jobStatus.setTerminalStage(terminalStage);
	}

	public boolean isOk() {
		return jobStatus.isOk();
	}

	public void setOk(boolean ok) {
		jobStatus.setOk(ok);
	}


	public Date getDateSubmitted() {
		return jobStatus.getDateSubmitted();
	}

	public void setDateSubmitted(Date dateSubmitted) {
		jobStatus.setDateSubmitted(dateSubmitted);
	}

}
