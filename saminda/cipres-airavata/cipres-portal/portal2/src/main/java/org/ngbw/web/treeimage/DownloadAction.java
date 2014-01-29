package org.ngbw.web.treeimage;
import org.ngbw.web.actions.NgbwSupport;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Set;


import java.io.InputStream;
import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DownloadAction extends NgbwSupport 
{
	public final static Logger log = Logger.getLogger(DownloadAction.class);
	private String contentType;
	InputStream is;

	protected String inputPath;
	public String getInputPath() { return inputPath; }
	public void setInputPath(String value) {inputPath = value; }
	protected String location;
	public String getLocation() { return location; }
	public void setLocation(String   value) {location = value; }

	public InputStream getInputStream() 
	{
		return is;
	}

	//method for downloading file
	// expects two request parameters "location" and "inputPath" that are
	// used to locate the file or data that will be streamed back.
	public String execute() throws Exception
	{
		File file = null;
		if (location != null && location.equals("tmptree"))
		{
			File sessionTmpDir = DrawAction.getSessionTreeDir(); 
			file = new File(sessionTmpDir, inputPath);
			contentType = "image/png"; 
		} else
		{
			file = new File(inputPath);
			contentType = "application/x-unknown";
		}
		log.debug("Opening " + file.getAbsolutePath());
		is = new FileInputStream(file);
		return "success";
	}

	public String getContentDisposition()
	{
		String retval = "filename=\"" + inputPath + "\"";
		return retval;
	}

	public String getContentType()
	{
		return contentType;
	}
}
