package org.ngbw.web.treeimage;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

public class Util
{
	public static byte[] getContents(File file) throws java.io.IOException
	{
		int len = (int)file.length();
		byte[] buffer = new byte[len];
		BufferedInputStream reader = null; 
		try
		{
			reader = new BufferedInputStream( new FileInputStream(file));
			reader.read(buffer);
		}
		finally
		{
			if (reader != null) reader.close();
		}
		return buffer; 
	}
}
