package  org.ngbw.cipresrest.webresource;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.restdatatypes.ErrorData;

/*
	This is my catch all exception mapper.
*/
@Provider
public class JobExceptionMapper implements ExceptionMapper<Throwable> 
{
	private static final Log log = LogFactory.getLog(JobExceptionMapper.class.getName());

	public Response toResponse(Throwable t)
	{
		log.error(t.toString(), t);


		// note that this will throw an exception (I think) if entity() is passed
		// a null string, and in that case tomcat throws a 500 with some html text.
		return Response.
				status(Status.INTERNAL_SERVER_ERROR).
				type("application/xml").
				entity(new ErrorData("Server Internal Error: " + t.toString(), 20)).
				build();
	}
}
