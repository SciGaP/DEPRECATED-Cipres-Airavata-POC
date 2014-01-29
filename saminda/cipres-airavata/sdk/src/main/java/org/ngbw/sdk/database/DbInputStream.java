/*
 * DbInputStream.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author Paul Hoover
 *
 */
class DbInputStream extends InputStream {

	private final Connection m_conn;
	private final Statement m_stmt;
	private final ResultSet m_row;
	private final InputStream m_stream;


	// constructors


	/**
	 *
	 * @param conn
	 * @param stmt
	 * @param row
	 * @param stream
	 */
	DbInputStream(Connection conn, Statement stmt, ResultSet row, InputStream stream)
	{
		m_conn = conn;
		m_stmt = stmt;
		m_row = row;
		m_stream = stream;
	}


	// public methods


	/**
	 *
	 * @return
	 * @throws IOException
	 */
	@Override
	public int available() throws IOException
	{
		return m_stream.available();
	}

	/**
	 *
	 * @throws IOException
	 */
	@Override
	public void close() throws IOException
	{
		m_stream.close();

		try {
			m_row.close();
			m_stmt.close();
			m_conn.close();
		}
		catch (SQLException sqlErr) {
			throw new IOException(sqlErr.getMessage());
		}
	}

	/**
	 *
	 * @param readlimit
	 */
	@Override
	public void mark(int readlimit)
	{
		m_stream.mark(readlimit);
	}

	/**
	 *
	 * @return
	 */
	@Override
	public boolean markSupported()
	{
		return m_stream.markSupported();
	}

	/**
	 *
	 * @return
	 * @throws IOException
	 */
	public int read() throws IOException
	{
		return m_stream.read();
	}

	/**
	 *
	 * @param b
	 * @return
	 * @throws IOException
	 */
	@Override
	public int read(byte[] b) throws IOException
	{
		return m_stream.read(b);
	}

	/**
	 *
	 * @param b
	 * @param off
	 * @param len
	 * @return
	 * @throws IOException
	 */
	@Override
	public int read(byte[] b, int off, int len) throws IOException
	{
		return m_stream.read(b, off, len);
	}

	/**
	 *
	 * @throws IOException
	 */
	@Override
	public void reset() throws IOException
	{
		m_stream.reset();
	}

	/**
	 *
	 * @param n
	 * @return
	 * @throws IOException
	 */
	@Override
	public long skip(long n) throws IOException
	{
		return m_stream.skip(n);
	}
}
