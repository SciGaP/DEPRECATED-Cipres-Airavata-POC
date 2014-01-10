package org.ngbw.cipresrest.webresource;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.core.UriInfo;
//import javax.xml.bind.annotation.XmlRootElement;
//import javax.xml.bind.annotation.XmlElement;
//import javax.xml.bind.annotation.XmlAccessorType;
//import javax.xml.bind.annotation.XmlAccessType;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;

import org.glassfish.jersey.media.multipart.FormDataParam;

import org.glassfish.jersey.media.multipart.FormDataMultiPart;


import java.net.URI;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import org.ngbw.sdk.jobs.JobFile;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.FileData;
import org.ngbw.restdatatypes.StatusData;


/*
	Todo: should probably make 2 classes, one for working dir files and one for
	result docs.  In the meantime, though, for 
		- working dir files, documentId is 0, and we use the filename in the uri
		- results, documentId is non-zero and we use it in the uri
*/
public class JFile 
{
	CipresJob cipresJob;
	JobFile jobFile;
	String jobHandle;

	public void JFile() {;} 

	public JFile(CipresJob cipresJob, String jobHandle, JobFile jobFile)
	{
		this.cipresJob = cipresJob;
		this.jobFile = jobFile;
		this.jobHandle = jobHandle;
	}

	public FileData toFileData() throws Exception
	{
		FileData fd = new FileData();
		fd.fileUri = getFileUri(); 
		fd.jobHandle = jobFile.getJobHandle(); 
		fd.pathname = jobFile.getPathname(); 
		fd.filename = jobFile.getFilename(); 
		fd.length = jobFile.getLength(); 
		fd.dateCreated = jobFile.getDateCreated(); 
		fd.dateModified = jobFile.getDateModified(); 
		fd.parameterName = jobFile.getParameterName(); 
		fd.outputDocumentId = jobFile.getOutputDocumentId(); 
		return fd;
	}

	private LinkData getFileUri() throws Exception
	{
		if (jobFile.getOutputDocumentId() == 0)
		{
			return cipresJob.getWorkingDirUri(jobHandle, jobFile.getFilename());
		}
		return cipresJob.getResultsUri(jobHandle, String.valueOf(jobFile.getOutputDocumentId()));
	}

}
