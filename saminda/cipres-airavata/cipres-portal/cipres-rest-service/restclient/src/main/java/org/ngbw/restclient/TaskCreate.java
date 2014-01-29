package org.ngbw.restclient; 

import java.util.Map;
import java.io.File;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.dispatcher.SessionMap;
import com.opensymphony.xwork2.ActionSupport;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.client.Entity;
import org.glassfish.jersey.client.filter.HttpBasicAuthFilter; 
import org.glassfish.jersey.client.ClientConfig; 
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.glassfish.jersey.media.multipart.internal.MultiPartWriter;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.ErrorData;
import org.ngbw.restdatatypes.StatusData;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class TaskCreate extends BaseAction 
{
	private static final Log log = LogFactory.getLog(TaskCreate.class.getName());
	private File file;
	private String contentType;
	private String filename;

	private String toolId;
	private String metadata;
	private String toolParameters;
	private String inputFileParameterName;

	public void setPrimaryInput(File file)
	{
		log.debug("In setPrimaryInput");
		this.file = file;
	}
	public File getPrimaryInput() { return this.file; }

	public void setPrimaryInputContentType(String contentType)
	{
		this.contentType = contentType;
	}
	public String getPrimaryInputContentType() { return this.contentType; }

	public void setPrimaryInputFileName(String filename)
	{
		this.filename = filename;
	}
	public String getPrimaryInputFileName() { return this.filename; }

	public void setToolId(String toolId) { this.toolId = toolId; } 
	public String getToolId() { return this.toolId; }

	public void setMetadata(String s) { this.metadata = s; } 
	public String getMetadata() { return this.metadata; }

	public void setToolParameters(String s) { this.toolParameters = s; } 
	public String getToolParameters() { return this.toolParameters; }

	public void setInputFileParameterName(String s) { this.inputFileParameterName = s; } 
	public String getInputFileParameterName() { return this.inputFileParameterName; }


	public void validate() 
	{
		log.debug("In taskCreate.validate()");
		if (file == null)
		{
			addFieldError("primaryInput", "Required field.");
			log.debug("primary input file is missing");

		}
		if (toolId == null || toolId.length() == 0)
		{
			addFieldError("toolId", "Required field.");
			log.debug("tool id is missing.");
		}
	}

	public String execute() throws Exception
	{
		log.debug("TaskCreate.create() called");
		log.debug("File is: " + file.getAbsolutePath());
		log.debug("Tool Id is: " + toolId);
		log.debug("Metadata is: '" + metadata + "'");
		log.debug("Parameters are: '" + toolParameters + "'");

		try
		{
			//MutlivaluedMap<String, String> fd = new MultivaluedMap<String, String>();
			FormDataMultiPart mp = new FormDataMultiPart();

			mp = mp.field("tool", toolId);

			// Parameter name needs to be prefixed with "input" so that rest service knows
			// what kind of parameter it is.  TODO: gui needs to let user enter the parameter
			// name (that's "infile_" in this case) to go with the file.
			mp = (FormDataMultiPart)mp.bodyPart(new FileDataBodyPart("input.infile_", file));
			String[] tmp1 = metadata.split("[\r\n]+");
			for (String s : tmp1)
			{
				String[] tmp2 = s.split("=");
				String n;
				String v;
				if (tmp2.length > 0)
				{
					n = tmp2[0].trim();
					if (tmp2.length > 1)
					{
						v = tmp2[1].trim();
					} else
					{
						v = "";
					}
					if (n.length() > 0)
					{
						mp = mp.field("metadata." + n, v);
						log.debug("Added field: metadata." + n + "=" + v);
					}
				}
			}	
			tmp1 =toolParameters.split("[\r\n]+");
			for (String s : tmp1)
			{
				String[] tmp2 = s.split("=");
				String n;
				String v;
				if (tmp2.length > 0)
				{
					n = tmp2[0].trim();
					if (tmp2.length > 1)
					{
						v = tmp2[1].trim();
					} else
					{
						v = "";
					}
					if (n.length() > 0)
					{
						mp = mp.field("vparam." + n, v);
						log.debug("Added field: vparam." + n + "=" + v);
					}
				}
			}	
			String url = baseUrl + getCipresUser();
			log.debug("Posting to: " + url);

			StatusData statusData = postToUrl(url, mp, StatusData.class);
			if (statusData != null)
			{
				addActionMessage("Submitted new job " + statusData.jobHandle);
			}
		}		
		catch(Exception e)
		{
			e.printStackTrace();
			addActionError("An exception occurred:" +  e.getMessage());
		}
		return "success";
	}
}

