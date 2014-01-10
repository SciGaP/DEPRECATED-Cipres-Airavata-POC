package org.ngbw.restdatatypes;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="link")
public class LinkData 
{
	public String url;
	public String rel;
	public String title;

	public LinkData() {;} 
	public LinkData(String url, String rel, String title)
	{
		this.url = url;
		this.rel = rel;
		this.title = title;
	}

}
