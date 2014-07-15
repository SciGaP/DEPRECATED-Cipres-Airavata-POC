
/*
 * WorkingDirectory.java
 */
package org.ngbw.sdk.tool;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.ngbw.sdk.api.tool.FileHandler;


/**
 * 
 * @author Terri Liebowitz Schwartz
 *
 */
public interface WorkingDirectory 
{

	public boolean fileExists(String filename) throws Exception;
	
	public boolean workingDirectoryExists() throws Exception;
	/*
		Returns a list of filenames (just the filename, not the path) in working directory.  
		Todo: currently this skips over subdirs.   

		This will throw an IOException exception if the working directory is deleted (or possibly if
		a file is removed) while this method is executing.
	*/
	public List<FileHandler.FileAttributes> listWorkingDirectory() throws IOException, Exception;
	/*
		TODO: web app is using this.  It should be streaming, not reading the whole thing into memory!

		This will throw a RunTime exception if the working directory is deleted (or if
		file is removed) while this method is executing.
	*/
	public InputStream getFileFromWorkingDirectory(String filename) throws IOException, Exception;
	/*
		Here's how the cleanup works in the gridftp case, at least:
			- The filehandler has a GridFtpClient object that it normally opens
			and closes in each of it's methods, except that inorder to return an InputStream
			it must leave the connection open.  So, it returns a GridftpInputStream which client
			is responsible for closing.  GridftpInputStream.close() closes the GridFtpClient
			that is normally closed by the GridftpFileHandler.

			- If streamFileFromWorkingDirectory throws an exception it must first
			close the InputStream so that clients don't have to. 
	*/
	public InputStream streamFileFromWorkingDirectory(String filename) throws IOException, Exception;
}
