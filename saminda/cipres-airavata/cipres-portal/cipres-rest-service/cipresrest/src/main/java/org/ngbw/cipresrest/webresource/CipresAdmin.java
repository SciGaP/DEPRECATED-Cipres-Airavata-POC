package org.ngbw.cipresrest.webresource;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.QueryParam;
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

import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.RunningTask;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.NotExistException;
import org.ngbw.sdk.tool.WorkQueue;
import org.ngbw.sdk.jobs.Job;
import org.ngbw.sdk.jobs.JobFile;
import org.ngbw.sdk.jobs.JobStatus;
import org.ngbw.sdk.jobs.JobMetadata;
import org.ngbw.sdk.jobs.FileNotFoundException;
import org.ngbw.sdk.database.NotExistException;
import org.ngbw.sdk.jobs.UserMismatchException;
import org.ngbw.sdk.jobs.JobNotFoundException;
import org.ngbw.sdk.core.shared.UserRole;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.FileData;
import org.ngbw.restdatatypes.StatusData;


@Path("/v1/job/admin")
public class CipresAdmin 
{
	private static final Log log = LogFactory.getLog(CipresAdmin.class.getName());
	@Context SecurityContext securityContext;
	@Context UriInfo uriInfo;

	void initialize() throws Exception
	{
		/*
			Throws Authorization exception if logged in user isn't an admin.
		*/
		securityContext.isUserInRole(UserRole.ADMIN.toString());
	}


	@GET
	@Path("updateJob")
	@Produces( MediaType.TEXT_PLAIN )
	public String updateJob( 
		//@DefaultValue("-1") @QueryParam("taskId") long taskId,
		@DefaultValue("") @QueryParam("jh") String jobhandle,
		@DefaultValue("DONE") @QueryParam("status") String status)
		throws Exception
	{
		initialize();
		if (jobhandle.trim().length() == 0)
		{
			throw new WebApplicationException("Missing jh query parameter.", Status.NOT_FOUND);
		}
		try
		{
            // todo: should use jobhandle, not task id in the url, since taskids can be recycled when
            // task deleted.
            RunningTask rt = RunningTask.find(jobhandle);
			if (rt == null)
			{
				throw new JobNotFoundException();
			}
            if (status.equals("START"))
			{
				;
			} else if (status.equals("DONE"))
            {
				log.debug("CURL marking " + jobhandle + " DONE.");
                WorkQueue.markDone(rt);
            } else
            {
                throw new Exception("Invalid job status.  Job=" + jobhandle + ". Status=" + status);
            }
            return "\njob status changed to DONE.\n";
        }
        catch(Exception e)
        {
            log.error(e);
			throw new WebApplicationException( "Error trying to change job " + jobhandle + " status to DONE.\n" + e.getMessage(),Status.NOT_FOUND);
        }
	}
}
