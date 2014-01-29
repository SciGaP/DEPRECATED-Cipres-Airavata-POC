package org.ngbw.restdatatypes;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;

import java.util.Date;
import java.util.Map;
import java.util.Collection;

/*
	There appears to be a JAXB bug related to marshalling of type Map().
	It complains about the Map if I use XmlAccessType.PROPERTY and mark each field with
	@XmlElement, as I was doing.  All I had to do though was change to accessType.FIELD
	and remove the @XmlElemetn annotations.

	commandline field will only be set when the StatusData is used to return a value from
	Validate, not when a job has actually been submitted.
*/
@XmlRootElement(name="jobstatus")
@XmlAccessorType(XmlAccessType.FIELD)
public class StatusData
{
	public String jobHandle;
	public String commandline;
	public Map<String, String> clientMetadata;
	public String jobStage;
	public boolean terminalStage;
	public boolean failed;
	public Date dateSubmitted;
	public LinkData statusUri;
	public LinkData resultsUri;
	public LinkData workingDirUri;
	public Collection<JobMessage> messages;

	public StatusData() 
	{
		;
	} 

	public StatusData(String commandline)
	{
		this.commandline = commandline;
	}
}
