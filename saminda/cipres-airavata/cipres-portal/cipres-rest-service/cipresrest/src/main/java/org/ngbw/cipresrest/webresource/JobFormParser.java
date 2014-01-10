package org.ngbw.cipresrest.webresource;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.core.UriInfo;
import javax.annotation.security.RolesAllowed;
import org.glassfish.jersey.server.ContainerException;

import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;

import java.net.URI;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.File;
import java.util.Map;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.common.util.FileUtils;


/*
*/
public class JobFormParser
{
	private static final Log log = LogFactory.getLog(JobFormParser.class.getName());
	private FormDataMultiPart formData;

	// todo: need getters for these fields
	private String toolId;
	private Map<String, String> metadata;
	private Map<String, List<String>> visibleParameters;
	private Map<String, File> inputFiles; 

	/*
		Todo: note that our generated jsp pages, from 
		cipres-portal/src/main/codeGeneration/FreeMarkerTemplates/pise2JSP[Simple|Advanced].ftl
		allow 600.  Maybe we should?

		The purpose of these limits is mostly to make sure we aren't dealing with a malicious
		request or a client's coding error that could cause us to store a ridiculous amount
		of garbage.

		TODO: all I'm checking now is value_len.  Check the others.
	*/
	private static int MAX_VALUE_LEN = 100; 
	private static int MAX_NAME_LEN = 100; 
	private static int MAX_METADATA= 100; 
	private static int MAX_INPUT_FILES= 100; 
	private static int MAX_VPARAMS= 1000; 

	public String getToolId()
	{
		return this.toolId;
	}

	public Map<String, String> getMetadata()
	{
		return this.metadata;
	}

	public Map<String, List<String>> getVisibleParameters()
	{
		return this.visibleParameters;
	}

	public Map<String, File> getInputFiles()
	{
		return this.inputFiles;
	}


	/*
		Usage: call this before trying to get any of the fields.
		TODO: figure out when we can delete the tmp files we created.
	*/
	public void parse(FormDataMultiPart formData)
	{
		this.formData = formData;
	
		this.toolId = getRequiredStringField("tool");
		log.debug("Parsing submission request for a " + toolId + " job.");

		// todo - make sure tool is valid.

		this.metadata  = parseMetadata();
		this.visibleParameters  = parseVisibleParameters();
		this.inputFiles = parseInputFiles(); 
	}

	/*
		Return a map of just the fields where the beginning of the field name matches
		the specified prefix.  In the returned map, the key does not include the prefix.
		For example, if the prefix is "metadata" and we have 
		    metadata.clientID / bodypart(foo)
			input.infile_ / bodypart(afile)
		in the returned map, we'll have just
		    clientID / bodypart(foo)
		in the map we return.

		If no fields match, returns empty list. 
		Values in map will not be null and will contain at least one item.
	*/
	Map<String, List<FormDataBodyPart>> filterFields(String prefix)
	{
		Map<String, List<FormDataBodyPart>> retval = new HashMap<String, List<FormDataBodyPart>>(); 
		for(String name:  formData.getFields().keySet())
		{
			String[] nameParts = name.split("\\.");

			if (nameParts.length < 2)
			{
				continue;
			}
			if (!nameParts[0].equals(prefix))
			{
				continue;
			}
			List<FormDataBodyPart> parts = formData.getFields(name);
			if (parts == null)
			{
				continue;
			}
			retval.put(nameParts[1], parts);
		}
		//return (retval.size() == 0 ? null : retval);
		return retval;
	}

	/*
		Returns white space trimmed field values if present.  Zero length values are omitted.
		Returns null if there are no non-empty values.
		Throws SubmitFormException if value is too long or wrong type.
	*/
	List<String> getStringFields(String name)
	{
		List<String> values = new ArrayList<String>();

		for (FormDataBodyPart part : formData.getFields(name))
		{
			String value = null;
			if (part != null)
			{
				if (part.isSimple())
				{
					value = part.getValue();
					if (value == null)
					{
						value = "";
					}
				} else
				{
					throw new SubmitFormException("Field '" + name + "' must be a string type.");
				}
			} else
			{
				value = "";
			}
			if (value.length() > MAX_VALUE_LEN)
			{
				throw new SubmitFormException("Field '" + name + "' is too long, max is " + MAX_VALUE_LEN + ".");
			}
			value = value.trim();
			if (value.length() > 0)
			{
				values.add(value);
			}
		}
		return (values.size() == 0 ? null : values);
	}

	String getFirstStringField(String name)
	{
		List<String> values = getStringFields(name);
		if (values != null)
		{
			return values.get(0);
		}
		return null;
	}

	/*
		Required means the field is present and its value is not the empty string.
		I'm not sure if a FormDataBodyPart can have a null field value, but if we
		see one we'll convert it to "".
		Either returns the non empty string or throws a SubmitFormException.  
	*/
	String getRequiredStringField(String name)
	{
		String value = getFirstStringField(name);
		if (value == null)
		{
			throw new SubmitFormException("Field '" + name + "' is required.");
		}
		return value;
	}


	/*
		Returns null if no such fields, otherwise returns a map where values are non null, non empty lists
		of field values.
	*/
	Map<String, List<String>> getFilteredStringFields(String prefix)
	{
		Map<String, List<FormDataBodyPart>> fields = filterFields(prefix);        
		Map<String, List<String>> retval = new HashMap<String, List<String>>();

		for(String name:  fields.keySet())
		{
			List<String> values = getStringFields(prefix + "." + name);
			if (values != null)
			{
				retval.put(name, values);	

				// START Just debug code:
				if (values.size() == 1)
				{
					log.debug("    Adding " + name + "=" + values.get(0));
				} else
				{
					log.debug("    Adding " + name + "=" + values.get(0) + ", ...");
				}
				// END Just debug code:
			}
		}
		return (retval.size() == 0 ? null : retval);
	}

	Map<String, String> parseMetadata()
	{
		log.debug("metadata");
		Map<String, List<String>> m = getFilteredStringFields("metadata");
		Map<String, String> retval = new HashMap<String, String>();
		if (m != null)
		{
			for (String key : m.keySet())
			{
				retval.put(key, m.get(key).get(0));
			}
		}
		return (retval.size() == 0 ? null : retval);
	}

	Map<String, List<String>> parseVisibleParameters()
	{
		log.debug("visible parameters");
		return getFilteredStringFields("vparam");
	}

	Map<String, File> parseInputFiles()
	{
		Map<String, List<FormDataBodyPart>> fields = filterFields("input");        
		Map<String, File> retval = new HashMap<String, File>() ;

		log.debug("input files");
		for(String name:  fields.keySet())
		{
			log.debug("Processing input file parameter: '" + name + "'");
			File file = null;
			try
			{
				// If there are multiple field values, just use the first.
				file = handleInputStream(fields.get(name).get(0).getValueAs(InputStream.class));
			}
			catch (Exception e)
			{
				log.debug("", e);
				throw new SubmitFormException("Field '" + name + "' must be of input file type.");
			}
			retval.put(name, file);
			log.debug("Adding " + name + "=" + file.getAbsolutePath());
		}
		return (retval.size() == 0 ? null : retval);
	}

	/*
		Todo: isn't there some way to get a tmp file from Jersey?  
		If they're already writing chunks of a large upload to disk why don't
		they just give me that instead of me having to copy it again?

		Where the heck should I be writing tmp files?  The way I'm doing it now with
		File.createTempFile() running as a tomcat web app, they end up in $CATALINA_HOME/temp.
	*/

	File handleInputStream(InputStream is) throws Exception
	{
		/* 
			This is NO good. I can see the whole big file get uploaded by jersey (probaby
			by mimepull jar) in $CATALINA_HOME/temp before we get to this code.  Then this
			code truncates the file to the limit I set and throws an exception.  I want to
			stop reading at LIMIT, but that happens before we get here. 

			This was for testing setting limit.
		*/
		//long LIMIT = 2000;

		log.debug("handleInputStream");
		File tmpFile = File.createTempFile("cipresrest", "tmp");
		tmpFile.deleteOnExit();
		log.debug("tmp filename is: " + tmpFile.getAbsolutePath());

		OutputStream os = null;
		try
		{
			os = new FileOutputStream(tmpFile);
			//FileUtils.copy(is, os, LIMIT);
			FileUtils.copy(is, os);
		}
		catch (Exception e)
		{
			log.debug("", e);
			throw e;
		}
		finally
		{
			if (os != null)
			{
				os.close();
			}
			is.close();
		}
		return tmpFile;
	}

}
