/*
 * SourceDocumentRow.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ngbw.sdk.common.util.TimeUtils;

import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.common.util.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 *
 * @author Paul Hoover
 *
 */
class SourceDocumentRow extends Row implements Comparable<SourceDocumentRow> {
	private static final Log log = LogFactory.getLog(SourceDocumentRow.class.getName());

	private static final String TABLE_NAME = "source_documents";
	private static final String COLUMN_NAMES = TABLE_NAME + ".SOURCE_DOCUMENT_ID, " + TABLE_NAME + ".LENGTH";

	private final LongColumn m_sourceDocumentId = new LongColumn(TABLE_NAME + ".SOURCE_DOCUMENT_ID", false);
	private final LongColumn m_length = new LongColumn(TABLE_NAME + ".LENGTH", false);
	private final FileColumn m_data = new FileColumn(TABLE_NAME + ".FILENAME", false, true, this, m_length);


	// constructors


	/**
	 *
	 */
	SourceDocumentRow()
	{
		super(TABLE_NAME);
	}

	/**
	 *
	 * @param sourceDocumentId
	 * @throws SQLException
	 * @throws IOException
	 */
	SourceDocumentRow(long sourceDocumentId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_sourceDocumentId.assignValue(sourceDocumentId);

		refresh();
	}

	/**
	 *
	 * @param data
	 */
	SourceDocumentRow(byte[] data)
	{
		super(TABLE_NAME);

		m_data.setValue(data);
	}

	/**
	 *
	 * @param data
	 * @throws IOException
	 */
	SourceDocumentRow(InputStream data) throws IOException
	{
		super(TABLE_NAME);
		m_data.setValue(data);
	}

	/**
	 *
	 * @param document
	 * @throws IOException
	 * @throws SQLException
	 */
	SourceDocumentRow(SourceDocument document) throws IOException, SQLException
	{
		super(TABLE_NAME);

		long sourceDocumentId = document.getSourceDocumentId();

		if (sourceDocumentId > 0) {
			m_sourceDocumentId.assignValue(sourceDocumentId);
			m_length.assignValue(document.getDataLength());
		}
		else {
			InputStream data = document.getDataAsStream();

			if (data != null)
				m_data.setValue(data);
		}
	}


	// public methods


	/**
	 *
	 * @return long
	 */
	public long getSourceDocumentId()
	{
		return m_sourceDocumentId.getValue();
	}

	/**
	 *
	 * @return
	 */
	public byte[] getData()
	{
		return m_data.getValue();
	}

	/**
	 *
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 */
	public InputStream getDataAsStream() throws IOException, SQLException
	{
		return m_data.getValueAsStream();
	}

	/**
	 *
	 * @return
	 */
	public long getDataLength()
	{
		return m_length.getValue();
	}

	/**
	 *
	 * @param data
	 */
	public void setData(byte[] data)
	{
		m_data.setValue(data);
	}

	/**
	 *
	 * @param data
	 */
	public void setData(String data)
	{
		setData(data.getBytes());
	}

	/**
	 *
	 * @param data
	 * @throws IOException
	 */
	public void setData(Serializable data) throws IOException
	{
		setData(IOUtils.toBytes(data));
	}

	/**
	 *
	 * @param data
	 * @throws IOException
	 */
	public void setData(InputStream data) throws IOException
	{
		m_data.setValue(data);
	}

	/**
	 * Indicates whether or not the object has been persisted.
	 *
	 * @return <code>true</code> if the object has not been persisted
	 */
	public boolean isNew()
	{
		return m_sourceDocumentId.isNull();
	}

	/**
	 *
	 * @param other
	 * @return
	 */
	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof SourceDocumentRow == false)
			return false;

		SourceDocumentRow otherDoc = (SourceDocumentRow) other;

		if (isNew() || otherDoc.isNew())
			return false;

		return getSourceDocumentId() == otherDoc.getSourceDocumentId();
	}

	/**
	 *
	 * @return
	 */
	@Override
	public int hashCode()
	{
		return (new Long(getSourceDocumentId())).hashCode();
	}

	/**
	 *
	 * @param other
	 * @return
	 */
	public int compareTo(SourceDocumentRow other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getSourceDocumentId() - other.getSourceDocumentId());
	}


	// package methods


	/**
	 * Returns a <code>Criterion</code> object that describes the primary key of the record
	 * that the object represents.
	 *
	 * @return a <code>Criterion</code> object that describes the primary key
	 */
	Criterion getKey()
	{
		return new SimpleKey(m_sourceDocumentId);
	}

	/**
	 * Saves the current state of the object to the database. If the object has not yet been persisted,
	 * new records are inserted in the appropriate tables. If the object has been persisted, then any
	 * changes are written to the backing tables. Only those values that have changed are written, and
	 * if the state of the object is unchanged, the method does nothing.
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_length);
			colList.add(m_data);

			insert(dbConn, new AutoGeneratedKey(m_sourceDocumentId), colList);
		}
		else {
			if (!m_data.isModified())
				return;

			colList.add(m_length);
			colList.add(m_data);

			if (numReferences(dbConn, m_sourceDocumentId.getValue()) > 1)
				insert(dbConn, new AutoGeneratedKey(m_sourceDocumentId), colList);
			else
				update(dbConn, colList);
		}
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_sourceDocumentId.getValue());

		m_sourceDocumentId.reset();
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	void refresh(Connection dbConn) throws IOException, SQLException
	{
		m_data.reset();

		select(dbConn, COLUMN_NAMES);
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param sourceDocumentId
	 * @throws IOException
	 * @throws SQLException
	 */
	static void delete(Connection dbConn, long sourceDocumentId) throws SQLException
	{
		if (numReferences(dbConn, sourceDocumentId) > 0)
			return;

		deleteFile(dbConn, sourceDocumentId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE SOURCE_DOCUMENT_ID = ?");

		try {
			deleteStmt.setLong(1, sourceDocumentId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// protected methods


	/**
	 *
	 * @param row
	 * @throws SQLException
	 */
	protected void populate(ResultSet row) throws SQLException
	{
		m_sourceDocumentId.assignValue(row, 1);
		m_length.assignValue(row, 2);
	}


	// private methods


	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param sourceDocumentId
	 * @return
	 * @throws SQLException
	 */
	private static int numReferences(Connection dbConn, long sourceDocumentId) throws SQLException
	{
		return numUserDataRefs(dbConn, sourceDocumentId) + numTaskInputRefs(dbConn, sourceDocumentId) + numTaskOutputRefs(dbConn, sourceDocumentId);
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param sourceDocumentId
	 * @return
	 * @throws SQLException
	 */
	private static int numUserDataRefs(Connection dbConn, long sourceDocumentId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM userdata WHERE SOURCE_DOCUMENT_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, sourceDocumentId);

			countRow = selectStmt.executeQuery();

			if (!countRow.next())
				return 0;

			return countRow.getInt(1);
		}
		finally {
			if (countRow != null)
				countRow.close();

			selectStmt.close();
		}
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param sourceDocumentId
	 * @return
	 * @throws SQLException
	 */
	private static int numTaskInputRefs(Connection dbConn, long sourceDocumentId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM task_input_source_documents WHERE SOURCE_DOCUMENT_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, sourceDocumentId);

			countRow = selectStmt.executeQuery();

			if (!countRow.next())
				return 0;

			return countRow.getInt(1);
		}
		finally {
			if (countRow != null)
				countRow.close();

			selectStmt.close();
		}
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param sourceDocumentId
	 * @return
	 * @throws SQLException
	 */
	private static int numTaskOutputRefs(Connection dbConn, long sourceDocumentId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM task_output_source_documents WHERE SOURCE_DOCUMENT_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, sourceDocumentId);

			countRow = selectStmt.executeQuery();

			if (!countRow.next())
				return 0;

			return countRow.getInt(1);
		}
		finally {
			if (countRow != null)
				countRow.close();

			selectStmt.close();
		}
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param sourceDocumentId
	 * @throws SQLException
	 */
	private static void deleteFile(Connection dbConn, long sourceDocumentId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT FILENAME FROM " + TABLE_NAME + " WHERE SOURCE_DOCUMENT_ID = ?");
		ResultSet fileRow = null;

		try {
			selectStmt.setLong(1, sourceDocumentId);

			fileRow = selectStmt.executeQuery();

			if (fileRow.next())
				FileColumn.delete(fileRow.getString(1));
		}
		finally {
			if (fileRow != null)
				fileRow.close();

			selectStmt.close();
		}
	}
}
