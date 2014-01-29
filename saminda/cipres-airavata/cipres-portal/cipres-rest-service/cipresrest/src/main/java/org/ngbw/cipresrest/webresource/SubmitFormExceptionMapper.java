package  org.ngbw.cipresrest.webresource;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.restdatatypes.ErrorData;

/*
*/
@Provider
public class SubmitFormExceptionMapper implements ExceptionMapper<SubmitFormException> 
{
	private static final Log log = LogFactory.getLog(SubmitFormExceptionMapper.class.getName());
	public Response toResponse(SubmitFormException e)
	{
		log.error(e.toString(), e);
		return Response.
				status(Status.BAD_REQUEST).
				type("application/xml").
				entity(new ErrorData("Error in submission: " + e.toString(), 22)).
				build();
	}
}
