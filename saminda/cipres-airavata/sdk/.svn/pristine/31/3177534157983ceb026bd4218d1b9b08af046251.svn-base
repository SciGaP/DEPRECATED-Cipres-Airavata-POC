/*
 * JobCompleteEvent.java
 *
 *	@author Terri Liebowitz Schwartz
 */
package org.ngbw.sdk.tool;

import java.util.HashMap;
import java.util.Map;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.cipres.utils.MailService;

public class JobCompleteEvent
{
	private String username;
	private String email;
	private String jobLabel;
	private String errMsg;

	public JobCompleteEvent(String username, String email, String jobLabel, String errMsg)
	{
		this.username = username;
		this.email = email;
		this.jobLabel = jobLabel;
		if (errMsg == null)
		{
			this.errMsg = "";
		} else
		{
			this.errMsg = errMsg;
		}
	}
	
	public void notifyComplete() throws Exception
	{
		ClassPathXmlApplicationContext appContext = 
			new ClassPathXmlApplicationContext("tool/spring-mail.xml");
		MailService mailservice = (MailService)appContext.getBean("mailService");

		Enable enabled = (Enable)appContext.getBean("jobEmailEnable");
		if (enabled.getEnable() == false)
		{
			return;
		}

		Map<String, String> properties = new HashMap<String, String>();
		properties.put("username", username);
		properties.put("jobLabel", jobLabel);
		properties.put("errMsg", errMsg);

		// arguments are <to>, <from>, <subject>, <resource-template-prefix>, <properties>
		// we leave <from> as null so that it's picked up from spring-mail.xml which can
		// be customized at build time, depending on the project, etc.
		mailservice.sendMimeMessage(email, null, "Job Finished", "job", properties);
	}

	public static class Enable
	{
		private boolean enable;
		public Enable(){;}
		public boolean getEnable() { return enable; }
		public void setEnable(boolean enable) { this.enable = enable; } 
	}

};
