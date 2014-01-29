package org.ngbw.web.treeimage;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class StreamGobbler extends Thread
{
	InputStream is;
	String lastLine;

	public StreamGobbler(final InputStream is)
	{
		this.is = is;
	}

	public static StreamGobbler go(final InputStream is)
	{
		StreamGobbler sg = null;
		((sg = new StreamGobbler(is))).run();
		return sg;
	}

	public void run()
	{
		try
		{
			final InputStreamReader isr = new InputStreamReader(is);
			final BufferedReader br = new BufferedReader(isr);
			String line = null;
			while ((line = br.readLine()) != null)
			{
				if (line.trim().length() > 0)
				{
					lastLine = line;
				}
				System.out.println(">" + line);
			}
		}
		catch (final IOException ioe)
		{
			ioe.printStackTrace();
		}
	}

	/**
		If a python program throws an exception, then generally, the last
		line of stderr will be the exception type and message.
	*/
	public String getLastLine()
	{
		return lastLine;
	}
}
