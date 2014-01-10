package org.ngbw.restclient; 

import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.dispatcher.SessionMap;
import com.opensymphony.xwork2.ActionSupport;

import javax.ws.rs.core.GenericType;

import java.util.Collection;
import java.util.ArrayList;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.lang.ClassLoader;
import javax.xml.bind.JAXBContext;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.ErrorData;
import org.ngbw.restdatatypes.StatusData;
import org.ngbw.restdatatypes.FileData;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class TaskStatus extends BaseAction 
{
	private static final Log log = LogFactory.getLog(TaskStatus.class.getName());
	public String cipresUrl;

	// taskStatus.jsp accesses this variable directly.
	public StatusData statusData;
	public Collection<FileData> resultFiles = null;
	public Collection<FileData> workingDirFiles = null;

	/*
		"cipresUrl" is a query string parameter on taskList.jsp page link that 
		brings us to this action.  Therefore struts calls this method before
		the body of the action (which is "execute" by default).
	*/
	public void setCipresUrl(String url)
	{
		log.debug("got job status url: " + url);
		this.cipresUrl = url;
	}

	public String execute()
	{
		// Todo: Make a call to get the resultsUri or workingDir uri 
		// while we're at it so we can display a table of the files in the taskStatus page.

		statusData = getFromUrl(cipresUrl, StatusData.class);
		if (statusData.terminalStage == true)
		{
			resultFiles = getFromUrl(statusData.resultsUri.url, new GenericType<Collection<FileData>>() {});
			if (resultFiles == null)
			{
				log.debug("resultFiles is NULL");
			} else
			{
				log.debug("resultFiles has " + resultFiles.size() + " elements.");
			}
			
		} else
		{
			workingDirFiles = getFromUrl(statusData.workingDirUri.url, new GenericType<Collection<FileData>>() {});
		}
		if (resultFiles == null)
		{
			resultFiles = new ArrayList<FileData>();
		}
		if (workingDirFiles  == null)
		{
			workingDirFiles = new ArrayList<FileData>();
		}
		return "list";
	}
}
	

