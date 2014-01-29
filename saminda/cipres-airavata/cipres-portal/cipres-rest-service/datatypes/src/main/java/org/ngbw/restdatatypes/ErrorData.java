package org.ngbw.restdatatypes;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;
import org.ngbw.restdatatypes.ParamError;


@XmlRootElement(name="error")
public class ErrorData 
{
	public String message;
	public int code;
	public List<ParamError> paramError;

	public ErrorData() {;} 
	public ErrorData(String message, int code)
	{
		this.message = message;
		this.code = code;
	}

	public ErrorData(String message, int code, List<ParamError> paramError)
	{
		this.message = message;
		this.code = code;
		this.paramError = paramError;
	}
}
