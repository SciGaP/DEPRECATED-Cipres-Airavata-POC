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


public class TaskDelete extends BaseAction 
{
	private static final Log log = LogFactory.getLog(TaskStatus.class.getName());
	public String cipresUrl = null;

	/*
		cipresUrl is a query string parameter on the link that deletes a specific task
		so if we're coming from there, setCipresUrl will have been called before execute().

		However, delete all my tasks link doesn't have a cipresUrl parameter.
	*/
	public void setCipresUrl(String url)
	{
		log.debug("got job status url: " + url);
		this.cipresUrl = url;
	}

	public String execute()
	{
		if (cipresUrl != null)
		{
			if (deleteUrl(cipresUrl) == true)
			{
				addActionMessage("Job Deleted.");
			}
		} else
		{
			if (deleteUrl(baseUrl + getCipresUser()) == true)
			{
				addActionMessage("All jobs deleted.");
			}
		}
		return "success";
	}
}
