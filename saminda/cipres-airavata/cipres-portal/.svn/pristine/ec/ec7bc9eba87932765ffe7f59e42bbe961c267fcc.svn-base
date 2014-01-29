package org.ngbw.cipresrest.webresource;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriBuilder;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.WebApplicationException;
import javax.activation.MimetypesFileTypeMap;
import javax.annotation.security.RolesAllowed;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;

import java.net.URI;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.io.File;
import java.io.InputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.NDC;

import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.NotExistException;
import org.ngbw.sdk.jobs.Job;
import org.ngbw.sdk.jobs.JobFile;
import org.ngbw.sdk.jobs.JobOutput;
import org.ngbw.sdk.jobs.JobStatus;
import org.ngbw.sdk.jobs.JobMetadata;
import org.ngbw.sdk.jobs.FileNotFoundException;
import org.ngbw.sdk.jobs.JobWorkingDir;
import org.ngbw.sdk.database.NotExistException;
import org.ngbw.sdk.jobs.UserMismatchException;
import org.ngbw.sdk.core.shared.UserRole;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.FileData;
import org.ngbw.restdatatypes.StatusData;


/*
	Note that jersey resource classes like CipresJob are instantiated per request.
*/

/*
*/


// This doesn't seem to work, so calling isUserInRole() manually instead.
//@RolesAllowed("STANDARD")
@Path("/v1/job/{user}")
public class CipresJob 
{
	private static final Log log = LogFactory.getLog(CipresJob.class.getName());
	@Context UriInfo uriInfo;

	// The logged in user, or end user specified by request headers 
	@Context SecurityContext securityContext;

	// The username in the url
	@PathParam("user") String username;

	// The user this request is running on behalf of.  Normally the same as the logged
	// in user, but if logged in user is an admin he can masquerade as any other user.
	User user;

	void initialize() throws Exception
	{
		/*
			Throws Authorization exception if logged in user doesn't meet the rules: must
			be an admin user, or if not, then his username must match the username in the url.
			We let admin user masquerade as any other user.
		*/
		securityContext.isUserInRole(UserRole.STANDARD.toString());
		if (user == null)
		{
			user = User.findUserByUsername(username); 
			if (user == null)
			{
				throw new UserMismatchException("User " +  username +  "not found.");
			}
		}
	}


	@GET
	//@Produces(MediaType.APPLICATION_XML)
	@Produces( {MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON} )
	public Collection<LinkData> getSubmittedJobs() throws Exception
	{
			initialize();

			List<LinkData> list  = new ArrayList<LinkData>();

			List<String> jobs = Job.getSubmittedJobList(user);
			for (String jh : jobs)
			{
				LinkData link = getJobUri(jh);
				list.add(link);
			}
			return list;

	}


	@GET
	@Path("{id}")
	@Produces(MediaType.APPLICATION_XML)
	public StatusData getJobStatus(@PathParam("id") String jobHandle) throws Exception
	{
		initialize();

		JStatus js = new JStatus(this, (String)jobHandle);

		StatusData sd = js.toStatusData();

		return sd;

		//return (new JStatus(this, (String)jobHandle)).toStatusData();
	}

	@GET
	@Path("{id}/output")
	@Produces(MediaType.APPLICATION_XML)
	public Collection<FileData> getJobResultList(@PathParam("id") String jobHandle) throws Exception
	{
		initialize();
		List<FileData> list = new ArrayList<FileData>();

		JobOutput output = Job.getOutput(jobHandle, user);
		List<JobFile> jobfiles = output.listDocuments();
		for (JobFile details : jobfiles)
		{
			FileData fd = (new JFile(this, jobHandle, details)).toFileData();
			list.add(fd);
		}
		return list;
	}


	/*
		Todo:
		- check memory consumption on huge downloads
		- can set content-length header from jf.getLength()
		- should we try to set mimetype?
	*/
	@GET
	@Path("{id}/output/{documentId}")
	//@Produces(MediaType.APPLICATION_OCTET_STREAM)
	public Response getResultDocument(	@PathParam("id") String jobHandle, 
											@PathParam("documentId") long documentId ) throws Exception
	{
		initialize();
		InputStream is = null;
		try
		{
		 	JobOutput output = Job.getOutput(jobHandle, user);
			JobFile jf = output.getDocumentInfo(documentId);
			is = output.getDocument(jf);
			String mimeType = getMimeType(jf.getFilename());

			return Response.ok(is).
				header("Content-Disposition", "attachment; filename=" + jf.getFilename()).
				type(mimeType).
				build();
		}
		catch (NotExistException nee)
		{
			if (is != null) { try { is.close(); } catch (Exception ee) {} }
			throw new WebApplicationException( "Document Not Found Error: " + nee.getMessage(), Status.NOT_FOUND);
		}
		catch(Exception e)
		{
			if (is != null) { try { is.close(); } catch (Exception ee) {} }
			throw e;
		}
	}

	@GET
	@Path("{id}/workingdir")
	@Produces(MediaType.APPLICATION_XML)
	public Collection<FileData> getWorkingDirList(@PathParam("id") String jobHandle) throws Exception
	{
		initialize();
		List<FileData> list = new ArrayList<FileData>();
		List<JobFile> jobfiles = null;

		try
		{
			JobWorkingDir wd = Job.getWorkingDir(jobHandle, user);
			jobfiles = wd.listFiles();
		}
		// working directory not found.
		catch (FileNotFoundException e)
		{
			throw new WebApplicationException( e.getMessage(), Status.NOT_FOUND);
		}

		for (JobFile details : jobfiles)
		{
			FileData fd = (new JFile(this, jobHandle, details)).toFileData();
			list.add(fd);
		}
		return list;
	}

	@GET
	@Path("{id}/workingdir/{filename}")
	//@Produces(MediaType.APPLICATION_OCTET_STREAM)
	public Response getWorkingDirFile(	@PathParam("id") String jobHandle, 
											@PathParam("filename") String filename ) throws Exception
	{
		initialize();
		InputStream is = null;
		try
		{
			JobWorkingDir wd = Job.getWorkingDir(jobHandle, user);
			JobFile jf = wd.getFileInfo(filename);
			is = wd.getFile(jf);
	
			return Response.ok(is).
				header("Content-Disposition", "attachment; filename=" + filename).
				type(getMimeType(filename)).
				build();
		}
		catch (FileNotFoundException fnfe)
		{
			if (is != null) { try { is.close(); } catch (Exception ee) {} }
			throw new WebApplicationException(fnfe.getMessage(), Status.NOT_FOUND);
		}
		catch (Exception e)
		{
			if (is != null) { try { is.close(); } catch (Exception ee) {} }
			throw e;
		}
	}


	/*
		Post to cipresrest/v1/job/validate/<user> just validates the posted job submission.  
		Does not actually submit the job.  Throws Exception on error. JobValidationException
		is expected, other exceptions are not.
		Without the validate path segment (submitJob method) it does submit the job.
	*/
	@POST
	@Produces(MediaType.APPLICATION_XML)
	@Path("/validate")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public StatusData validateJob(FormDataMultiPart formData) throws Exception
	{
		return submit(formData, true);
	}

	@POST
	@Produces(MediaType.APPLICATION_XML)
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public StatusData submitJob(FormDataMultiPart formData) throws Exception
	{
		return submit(formData, false);
	}

	private StatusData submit(FormDataMultiPart formData, boolean validateOnly) throws Exception
	{
		initialize();
		JobFormParser jfp = new JobFormParser();
		jfp.parse(formData);

		String tool = jfp.getToolId();
		Map<String, String> metadata  = jfp.getMetadata(); 
		Map<String, List<String>> visibleParameters  = jfp.getVisibleParameters();
		Map<String, File> inputFiles = jfp.getInputFiles(); 

		try
		{
			String jobHandleOrCommandline = Job.submit(user,
								JobMetadata.fromMap(metadata),
								tool,
								visibleParameters,
								inputFiles,
								validateOnly);
			if (validateOnly)
			{
				// In this case, Job.submit returned the commandline, not a jobhandle.
				return new StatusData(jobHandleOrCommandline);
			}
			return (new JStatus(this, jobHandleOrCommandline)).toStatusData();
		}
		finally
		{
			deleteUploadedFiles(new ArrayList<File>(inputFiles.values()));	
		}
	}

	private void deleteUploadedFiles(List<File> filelist)
	{
		for (File f : filelist)
		{
			f.delete();
		}
	}

	@DELETE
	@Path("{id}")
	public void deleteJob(@PathParam("id") String jobHandle) throws Exception
	{
		initialize();
		Job.cancel(jobHandle, user);
	}

	@DELETE
	public void deleteJob() throws Exception
	{
		initialize();
		Job.cancelAll(user);
	}

	/* 
		Get username and User object, based on the "user" part of the url.

	/* 
		Get username and User object, based on the "user" part of the url.
	String getUserName() throws Exception
	{
		return username;
	}

	User getUser() throws Exception
	{
		return User.findUserByUsername(getUserName());
	}
	*/



	/* package methods */
	LinkData getJobUri(String jobHandle) throws Exception
	{
		UriBuilder ub = uriInfo.getBaseUriBuilder();
		URI uri = ub.path(CipresJob.class).path(jobHandle).build(username);
		return new LinkData(uri.toString(), "StatusData", jobHandle);
	}

	LinkData getResultsUri(String jobHandle, String documentId) throws Exception
	{
		UriBuilder ub = uriInfo.getBaseUriBuilder();
		ub = ub.path(CipresJob.class).path(jobHandle).path("output");
		if (documentId != null)
		{
			ub = ub.path(documentId);
		}
		URI uri = ub.build(username);
		return new LinkData(uri.toString(), "FileData", documentId);
	}

	LinkData getWorkingDirUri(String jobHandle, String filename) throws Exception
	{
		UriBuilder ub = uriInfo.getBaseUriBuilder();
		ub = ub.path(CipresJob.class).path(jobHandle).path("workingdir");
		if (filename!= null)
		{
			ub = ub.path(filename);
		}
		URI uri = ub.build(username);
		return new LinkData(uri.toString(), "FileData", filename);
	}

	/* 
		Authentication and authorization filters have already made sure that the
		credentials sent in the header are valid for the username in the url.  So
		there will probably never be any reason to call these methods to find
		out which user credentials were used.  Its more likely that we'll just
		need to know which username is in the url.
	*/
	private String getAuthUserName() 
	{
		return securityContext.getUserPrincipal().getName();
	}

	private User getAuthUser() throws Exception
	{
		return User.findUserByUsername(getAuthUserName());
	}

	private static MimetypesFileTypeMap mimeTypesMap = new MimetypesFileTypeMap();

	/*
		Todo: add types like .aln, .dnd, .fasta, .nex, etc as text/plain.
		Is there a way to say the default is text/plain?
	*/
	private String getMimeType(String filename)
	{

		// This is always returning application/octet-stream, at least on my mac.  I guess
		// I would need to create a map in one of the locations the documentation indicates.
		//String mimeType = mimeTypesMap.getContentType(filename);

		String mimeType = "text/plain";
		return mimeType;
	}
}


