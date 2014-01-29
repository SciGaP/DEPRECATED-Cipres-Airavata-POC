package  org.ngbw.cipresrest.webresource;

import java.util.ArrayList; 
import java.util.List; 
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.ngbw.sdk.api.tool.JobValidationException;
import org.ngbw.sdk.api.tool.FieldError;
import org.ngbw.restdatatypes.ErrorData;
import org.ngbw.restdatatypes.ParamError;

/*
	Thrown on job submission if required params are missing or data types are wrong, or min/max
	constraints violated.

	See jobs.Job.submitJob, tool.TaskValidator, generated code in tool.validation and
	code generator: sdk/src/main/codeGeneration/FreeMarker/pise2validationJava.ftl.
*/
@Provider
public class JobValidationExceptionMapper implements ExceptionMapper<JobValidationException> 
{
	private static final Log log = LogFactory.getLog(JobValidationExceptionMapper.class.getName());

	public Response toResponse(JobValidationException jve)
	{
		//log.debug(t.toString(), t);
		log.debug("Job validation exception.");

		return Response.
				status(Status.BAD_REQUEST).
				type("application/xml").
				entity(new ErrorData("Job specification error", 0, convert(jve.fieldError))).
				build();
	}

	private List<ParamError> convert(List<FieldError> fielderrors)
	{
		ArrayList<ParamError> al = new ArrayList<ParamError>(fielderrors.size());
		for (FieldError fe : fielderrors)
		{
			al.add(new ParamError(fe.getField(), fe.getError()));
		}
		return al;
	}
}
