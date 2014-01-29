package org.ngbw.sdk.database;

import org.ngbw.sdk.WorkbenchException;


/**
 * 
 * @author Paul Hoover
 *
 */
public class NotExistException extends WorkbenchException {

	// constructors


	NotExistException(String msg)
	{
		super(msg);
	}

}
