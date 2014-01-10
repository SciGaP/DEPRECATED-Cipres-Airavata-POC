//package org.cipres.util.tree;
package org.ngbw.web.treeimage;

/*
 Copied this from the pal library because we don't
 want to expose the pal library to clients of the
 cipres library.
 */

public class TreeParseException extends Exception
{
	private static final long serialVersionUID = -5724444551449806330L;

	public TreeParseException()
	{}

	public TreeParseException(final String msg, final Throwable cause)
	{
		super(msg, cause);
	}

	public TreeParseException(final Throwable cause)
	{
		super(cause);
	}

	public TreeParseException(final String msg)
	{
		super(msg);
	}
}
