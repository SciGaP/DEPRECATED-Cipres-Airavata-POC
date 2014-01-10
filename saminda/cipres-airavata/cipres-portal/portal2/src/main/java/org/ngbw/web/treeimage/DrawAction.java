/**
	Todo: 1) treedraw.jsp errors don't show up in red (they're black).
	2) Have a ServletContext startup listener that deletes all files in treedraw.tmpdir
	incase some are left from a prior crash.
	3) Get rid of folder list and tabs in popup window (treedraw.jsp).
*/
package org.ngbw.web.treeimage;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.ngbw.sdk.database.UserDataItem;
import org.ngbw.web.actions.DataManager;


public class DrawAction extends DataManager 
{
	private static final Logger LOGGER = Logger.getLogger(DrawAction.class);
    private static final long serialVersionUID = 3110390488454119901L;
	private static final int DEFAULT_IMAGE_WIDTH = 500;
	private static final int DEFAULT_IMAGE_HEIGHT = -10; // autocalc

	private static String phy_fi_path;
	private static String python_exe;
	private static String tmpDir;
	private static boolean configurationChecked, isConfigured;

	static String getInitParameterOrNull(String p)
	{
		String v = getInitParameter(p);
		if (v != null && v.trim().length() == 0)
		{
			 v = null;
		}
		return v;
	}

	synchronized public static boolean init() 
	{
		if (configurationChecked)
		{
			return isConfigured;
		}
		configurationChecked = true;
		isConfigured = true;
		try
		{
			tmpDir = getInitParameterOrNull("treedraw.tmpdir");
			python_exe = getInitParameterOrNull("treedraw.python.exe");
			phy_fi_path = getInitParameterOrNull("treedraw.phy.fi");
			if (phy_fi_path == null ||  python_exe == null ||  tmpDir == null)
			{
				isConfigured = false;
				LOGGER.warn("TreeDraw component isn't configured.");
			} else 
			{
				File f = new File(tmpDir);
				if (!f.isDirectory() || !f.canWrite())
				{
					isConfigured = false;
					LOGGER.error("TreeDraw component is configured with a bad tmpdir '" +
						f.getAbsolutePath() + "'.");
				}
			}
			if (isConfigured == true)
			{
				LOGGER.debug("Phy.fi TreeDraw configured with tmpdir='" + tmpDir + "'.");
				LOGGER.debug("Phy.fi TreeDraw configured with python.exe='" + python_exe + "'.");
				LOGGER.debug("Phy.fi TreeDraw configured with phy.fi='" + phy_fi_path + "'.");
			} 
		}
		catch(Throwable t)
		{
			isConfigured = false;
			t.printStackTrace();
		}
		return isConfigured;
	}

	// Request parameters
	private String collapse;
	private String outgroups;
	private String height = "";
	private String width = "";

	File sessionTmpDir;
	File treeFile;

	ImageMaker im;
	public ImageMaker getImageMaker() { return im; }

	public void setCollapse(String s) {this.collapse = s; }

	public void setOutgroups(String s) {this.outgroups = s; }

	public void setHeight(String s) 
	{ 
		this.height = s;
	}

	public void setWidth(String s) 
	{ 
		this.width = s;
	}

	public String getCollapse() { return this.collapse; }
	public String getOutgroups() { return this.outgroups; }
	public String getHeight() { return height; }
	public String getWidth() { return width; }


	private void writeFile(File f, String contents) throws Exception
	{
		BufferedWriter bw = null;
		try
		{
			bw = new BufferedWriter(new FileWriter(f));
			bw.write(contents);
		}
		finally
		{
			if (bw != null) bw.close();
		}
	}


	public String execute() throws Exception
    {
		if (!init())
		{
			LOGGER.error("TreeDraw component isn't configured");
			reportUserError("Internal error, the tree drawing component isn't configured.");
			return INPUT;
		}
		int h = 0, w = 0;
		if (height.trim().length() > 0)
		{
			try
			{
				h = Integer.parseInt(height);
			}
			catch(NumberFormatException e)
			{
				reportUserError("Height must be an integer.");
				return INPUT;
			}
		}
		if (width.trim().length() > 0)
		{
			try
			{
				w = Integer.parseInt(width);
			}
			catch(NumberFormatException e)
			{
				reportUserError("Width must be an integer.");
				return INPUT;
			}
		}
		int imageHeight = (h == 0) ? DEFAULT_IMAGE_HEIGHT: h; 
		int imageWidth = (w == 0) ? DEFAULT_IMAGE_WIDTH: w; 

		UserDataItem dataItem = getRequestData(ID);
		if (dataItem == null)
			dataItem = getCurrentData();
		if (dataItem == null) {
			reportUserError("You must select a valid tree to display.");
			return INPUT;
		}
		String contents  = new String(dataItem.getData());

		sessionTmpDir = getSessionTreeDir();
		sessionTmpDir.mkdir();
		treeFile = File.createTempFile(dataItem.getUserDataId() + "_", ".tre", sessionTmpDir);

		writeFile(treeFile, contents);
		LOGGER.debug("Created file " + treeFile.getAbsolutePath());

		im = new ImageMaker(treeFile, collapse, python_exe, phy_fi_path, outgroups);
		boolean result = false;
		try
		{
			result = im.makeImage(imageWidth, imageHeight);
		}
		catch (Exception e)
		{
			reportUserError(e.getMessage());
			return INPUT;
		}
		if (result == false)
		{
			reportUserError("None of the outgroup taxa are valid.");
			return INPUT;
		}
		return SUCCESS;
	}

	public static File getSessionTreeDir() 
	{
		return init() ? new File(tmpDir, getHTTPSessionId()) : null;
	}

	/**
		Apparently we can get a SessionExpired notification (received by interceptors.SessionListener)
		which will call cleanupSession(), before the ServletContext has been initialized so we
		check for that here and just bail if that's the case.
	*/
	public static void cleanupSession() 
	{
		LOGGER.debug("In cleanupSession");

		// make sure we aren't being called before servetcontext has been created.
		try
		{
			if  (ServletActionContext.getServletContext() == null)
			{
				LOGGER.warn("Unable to cleanup " + getHTTPSessionId() + 
					" because servlet context hasn't been initialized yet.");
				return;	
			}
		}
		catch(Exception e)
		{
			LOGGER.warn(e.toString());
		}


		File dir = getSessionTreeDir();
		if (dir == null)
		{
			return;
		}
		// List will be null if dir isn't a directory or doesn't exist.
		File[] list = dir.listFiles(); 
		if (list == null)
		{
			LOGGER.warn("Session tmp tree directory '" +
				dir.getAbsolutePath() + "' doesn't exist or isn't a directory.");
			return;
		}
		for (File f: dir.listFiles())
		{
			if (!f.delete())
			{
				LOGGER.warn("Failed to delete " + f.getAbsolutePath());
			}
		}
		if (!dir.delete())
		{
			LOGGER.warn("Failed to delete " + dir.getAbsolutePath());
		}
	}
}

