/*
 * DbReader.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.Reader;
import java.nio.CharBuffer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Paul Hoover
 *
 */
class DbReader extends Reader {

	private final Connection m_conn;
	private final Statement m_stmt;
	private final ResultSet m_row;
	private final Reader m_stream;


	// constructors


	/**
	 *
	 * @param conn
	 * @param stmt
	 * @param row
	 * @param stream
	 */
	DbReader(Connection conn, Statement stmt, ResultSet row, Reader stream)
	{
		m_conn = conn;
		m_stmt = stmt;
		m_row = row;
		m_stream = stream;
	}


	// public methods


	/**
	 *
	 * @throws IOException
	 */
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
	 * @param readAheadLimit
	 * @throws IOException
	 */
	@Override
	public void mark(int readAheadLimit) throws IOException
	{
		m_stream.mark(readAheadLimit);
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
	@Override
	public int read() throws IOException
	{
		return m_stream.read();
	}

	/**
	 *
	 * @param cbuff
	 * @return
	 * @throws IOException
	 */
	@Override
	public int read(char[] cbuf) throws IOException
	{
		return m_stream.read(cbuf);
	}

	/**
	 *
	 * @param cbuf
	 * @param off
	 * @param len
	 * @return
	 * @throws IOException
	 */
	public int read(char[] cbuf, int off, int len) throws IOException
	{
		return m_stream.read(cbuf, off, len);
	}

	/**
	 *
	 * @param target
	 * @return
	 * @throws IOException
	 */
	@Override
	public int read(CharBuffer target) throws IOException
	{
		return m_stream.read(target);
	}

	/**
	 *
	 * @return
	 * @throws IOException
	 */
	@Override
	public boolean ready() throws IOException
	{
		return m_stream.ready();
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
