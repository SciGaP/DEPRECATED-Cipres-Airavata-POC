package org.ngbw.cipresrest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;
import javax.ws.rs.core.Context;

@Path("world")
public class HelloWorld 
{
	@GET
	@Produces(MediaType.TEXT_HTML)
	public String sayHtmlHello() 
	{
		return "Hello, hello! ";
	}

	/*
	@Path("/name")
	@GET
	@Produces(MediaType.TEXT_HTML)
	public Response sayHtmlHello( @Context HttpHeaders headers) 
	{
		System.out.println("Service: GET /world/name " + getUser());
		return Response.ok("That's ok.").type(MediaType.TEXT_HTML).build();
	}
	*/

	/*
	@Context SecurityContext context;
	private String getUser()
	{
		String username = context.getUserPrincipal().getName();
		return username;
		
	}
	*/
}
