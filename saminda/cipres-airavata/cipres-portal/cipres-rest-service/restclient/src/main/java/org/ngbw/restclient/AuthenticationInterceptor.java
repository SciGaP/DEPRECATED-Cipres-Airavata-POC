package org.ngbw.restclient; 

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class AuthenticationInterceptor implements Interceptor
{
	private static final Log log = LogFactory.getLog(AuthenticationInterceptor.class.getName());

	public void init() 
	{
		log.info("Intializing AuthenticationInterceptor");
	}

	public void destroy() 
	{
	}

	public String intercept(ActionInvocation invocation) throws Exception 
	{
		Map session = invocation.getInvocationContext().getSession();
		String user = (String)session.get("user");
		if (user == null) 
		{
			log.debug("interceptor returning login");
			return "login";
		} 
		log.debug("interceptor invoking action");
		return invocation.invoke();
  	}

}

