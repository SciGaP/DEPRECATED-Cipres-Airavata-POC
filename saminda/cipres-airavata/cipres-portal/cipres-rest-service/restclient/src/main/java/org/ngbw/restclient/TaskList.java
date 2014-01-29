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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class TaskList extends BaseAction 
{
	private static final Log log = LogFactory.getLog(TaskList.class.getName());
	public Collection<LinkData> tasks = null;

	public String execute()
	{
		tasks = getFromUrl(baseUrl + getCipresUser(), new GenericType<Collection<LinkData>>() {});
		if (tasks == null)
		{
			tasks = new ArrayList<LinkData>();
		}
		return "list";
	}
}
	

