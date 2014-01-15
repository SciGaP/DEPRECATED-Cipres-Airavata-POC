/*
 * JobMetadata.java
 */
package org.ngbw.sdk.jobs;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.Workbench;
import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.WorkbenchSession;
import java.util.Map;
import org.apache.commons.beanutils.BeanUtils;



/**
 * @author Terri Liebowitz Schwartz
 *
 */
/*
	Todo: check field lenghts, depending on where we store this data in the database.
*/
public class JobMetadata
{
	private static final Log log = LogFactory.getLog(Job.class.getName());
	private static final int MAXLEN = 100;
	String clientJobId;
	String clientJobName;
	String clientToolName;
	String statusEmail;
	String statusUrl;
	String emailOnStatus;
	String urlOnStatus; 
	
	public JobMetadata()
	{
	}

	public JobMetadata(
				String clientJobId,
				String clientJobName,
				String clientToolName,
				String statusEmail,
				String statusUrl,
				String emailOnStatus,
				String urlOnStatus)
	{
		setClientJobId(clientJobId);
		setClientJobName(clientJobName);
		setClientToolName(clientToolName);
		setStatusEmail(statusEmail);
		setStatusUrl(statusUrl);
		setEmailOnStatus(emailOnStatus);
		setUrlOnStatus(urlOnStatus);
	}

	public static JobMetadata fromMap(Map<String, String> properties) throws Exception
	{
		JobMetadata m = new JobMetadata();
		BeanUtils.populate(m, properties);
		return m;
	}

	public Map<String, String> toMap() throws Exception
	{
		return BeanUtils.describe(this);
	}

	private String checkLen(String s)
	{

		if ((s != null) && s.length() > MAXLEN)
		{
			return s.substring(0, MAXLEN);
		} 
		return s;
	}


	public String getClientJobId() { return clientJobId; }
	public String getClientJobName() { return clientJobName; }
	public String getClientToolName() { return clientToolName; }
	public String getStatusEmail() { return statusEmail; }
	public String getStatusUrl() { return statusUrl; }
	public String getEmailOnStatus() { return emailOnStatus; }
	public String getUrlOnStatus() { return urlOnStatus; }

	public void setClientJobId(String clientJobId) { this.clientJobId = checkLen(clientJobId); }
	public void setClientJobName(String clientJobName) { this.clientJobName = checkLen(clientJobName); }
	public void setClientToolName(String clientToolName) { this.clientToolName = checkLen(clientToolName); }
	public void setStatusEmail(String statusEmail) { this.statusEmail = checkLen(statusEmail); }
	public void setStatusUrl(String statusUrl) { this.statusUrl = checkLen(statusUrl); }
	public void setEmailOnStatus(String emailOnStatus) { this.emailOnStatus = checkLen(emailOnStatus); }
	public void setUrlOnStatus(String urlOnStatus) {this.urlOnStatus = checkLen(urlOnStatus); }

}
