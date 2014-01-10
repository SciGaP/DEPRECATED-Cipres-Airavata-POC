package org.ngbw.cipresrest.webresource;

import javax.ws.rs.GET;
import javax.ws.rs.ext.Provider;
import javax.ws.rs.POST;
import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.container.PreMatching;
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
import java.io.IOException;
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

import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.core.Response;

import org.ngbw.restdatatypes.LinkData;
import org.ngbw.restdatatypes.FileData;
import org.ngbw.restdatatypes.StatusData;

/* 
	I believe ContainerRequestFilters are instantiated as singletons 

	I'd like to put a unique request id in the NDC so that I can easily grep the log
	for all messages pertaining to a single request but I'm not sure I should add the 
	overhead of having to syncrhonize to increment a request_id variable.
*/
@PreMatching
@Provider
public class LogFilter implements ContainerRequestFilter, ContainerResponseFilter
{
	private static final Log log = LogFactory.getLog(LogFilter.class.getName());
	private long request_id = 0;

	@Override
    public void filter(ContainerRequestContext requestContext) 
	{
		String uri = requestContext.getUriInfo().getRequestUri().toString();
		String method = requestContext.getMethod(); 	
		NDC.push("[" + getRequestId() + ":" + method + ":" + uri +  "]");
		log.info("START");
		//log.info("START " + method + ":" + uri); 
	}
	
 
    @Override
    public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext) throws IOException 
	{
		//String uri = requestContext.getUriInfo().getRequestUri().toString();
		//String method = requestContext.getMethod(); 
		log.info("END"); 
		NDC.pop();
		NDC.remove();
    }

	private synchronized long getRequestId()
	{
		request_id += 1;
		return request_id;
	}
}	

