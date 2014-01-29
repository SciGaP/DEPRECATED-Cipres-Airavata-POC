package org.ngbw.sdk.tool;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;

public class SchedulerProperties
{
	/*
		Convert string of format name=value;name=value;name=value ... to Properties object.
	*/
	public static Properties string2Properties(String pstring) throws IOException
	{
		pstring = pstring.replace(';', '\n');
		
		Properties properties = new Properties();
		properties.load(new ByteArrayInputStream(pstring.getBytes()));
		return properties;
	}

	public static String properties2String(Properties p) throws IOException
	{
		StringBuffer sb = new StringBuffer();
		for (Enumeration<?> e = p.propertyNames(); e.hasMoreElements() ;)
		{
			String name = (String)e.nextElement();
			sb.append(name + "=" +  p.getProperty(name) + ";");
		}
		return sb.toString();
	}
}
