package  org.ngbw.sdk.api.tool;

import org.ngbw.sdk.api.tool.FieldError;

import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
public class JobValidationException extends RuntimeException 
{
	public List<FieldError> fieldError;

	public JobValidationException() 
	{
		super("Job Validation Exception.");
	}

	public JobValidationException(String message) 
	{
		super(message);
	}

	public JobValidationException(List<FieldError> error) 
	{
		super("");
		fieldError = error;
	}

	public String toString()
	{
		String retval = "";
		for (FieldError fe : fieldError)
		{
			retval += (fe.getField() + ":" + fe.getError() + "\n");
		}
		return retval;
	}
}
