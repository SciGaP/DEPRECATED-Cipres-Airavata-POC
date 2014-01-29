/*
 * TaskInputSourceDocument.java
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

import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.common.util.IOUtils;
import org.ngbw.sdk.core.shared.SourceDocumentType;
import org.ngbw.sdk.core.types.DataFormat;
import org.ngbw.sdk.core.types.DataType;
import org.ngbw.sdk.core.types.EntityType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 *
 * @author Paul Hoover
 *
 */
public class TaskInputSourceDocument extends Row implements SourceDocument, Comparable<TaskInputSourceDocument> {

	private static final Log log = LogFactory.getLog(TaskInputSourceDocument.class.getName());

	private static final String TABLE_NAME = "task_input_source_documents";
	private static final String COLUMN_NAMES = TABLE_NAME + ".INPUT_DOCUMENT_ID, " + TABLE_NAME + ".INPUT_ID, " +
			TABLE_NAME + ".DATAFORMAT, " + TABLE_NAME + ".DATATYPE, " + TABLE_NAME + ".ENTITYTYPE, " +
			TABLE_NAME + ".NAME, " + TABLE_NAME + ".VALIDATED, " + TABLE_NAME + ".SOURCE_DOCUMENT_ID ";

	private LongColumn m_inputDocumentId = new LongColumn(TABLE_NAME + ".INPUT_DOCUMENT_ID", false);
	private LongColumn m_inputId = new LongColumn(TABLE_NAME + ".INPUT_ID", false);
	private StringColumn m_dataFormat = new StringColumn(TABLE_NAME + ".DATAFORMAT", false, 255);
	private StringColumn m_dataType = new StringColumn(TABLE_NAME + ".DATATYPE", false, 255);
	private StringColumn m_entityType = new StringColumn(TABLE_NAME + ".ENTITYTYPE", false, 255);
	private StringColumn m_name = new StringColumn(TABLE_NAME + ".NAME", true, 255);
	private BooleanColumn m_validated = new BooleanColumn(TABLE_NAME + ".VALIDATED", false);
	private LongColumn m_sourceDocumentId = new LongColumn(TABLE_NAME + ".SOURCE_DOCUMENT_ID", false);
	private SourceDocumentRow m_sourceDocument;


	// constructors


	public TaskInputSourceDocument()
	{
		super(TABLE_NAME);

		setDataFormat(DataFormat.UNKNOWN);
		setDataType(DataType.UNKNOWN);
		setEntityType(EntityType.UNKNOWN);
		setValidated(false);

		m_sourceDocument = new SourceDocumentRow();
	}

	public TaskInputSourceDocument(long inputDocumentId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_inputDocumentId.assignValue(inputDocumentId);

		refresh();
	}

	public TaskInputSourceDocument(SourceDocument document) throws IOException, SQLException
	{
		super(TABLE_NAME);

		setDataFormat(document.getDataFormat());
		setDataType(document.getDataType());
		setEntityType(document.getEntityType());
		setName(document.getName());
		setValidated(document.isValidated());

		m_sourceDocument = new SourceDocumentRow(document);
	}

	public TaskInputSourceDocument(String name, byte[] data)
	{
		this(name, EntityType.UNKNOWN, DataType.UNKNOWN, DataFormat.UNKNOWN, data, false);
	}

	public TaskInputSourceDocument(String name, EntityType entity, DataType dataType, DataFormat format, byte[] data, boolean validated)
	{
		super(TABLE_NAME);

		setDataFormat(format);
		setDataType(dataType);
		setEntityType(entity);
		setName(name);
		setValidated(validated);

		m_sourceDocument = new SourceDocumentRow(data);
	}

	public TaskInputSourceDocument(String name, InputStream data) throws IOException
	{
		this(name, EntityType.UNKNOWN, DataType.UNKNOWN, DataFormat.UNKNOWN, data, false);
	}

	public TaskInputSourceDocument(String name, EntityType entity, DataType dataType, DataFormat format, InputStream data, boolean validated) throws IOException
	{
		super(TABLE_NAME);

		setDataFormat(format);
		setDataType(dataType);
		setEntityType(entity);
		setName(name);
		setValidated(validated);

		m_sourceDocument = new SourceDocumentRow(data);
	}

	private TaskInputSourceDocument(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
	}


	// public methods


	public long getInputDocumentId()
	{
		return m_inputDocumentId.getValue();
	}

	public long getInputId()
	{
		return m_inputId.getValue();
	}

	public DataFormat getDataFormat()
	{
		return DataFormat.valueOf(m_dataFormat.getValue());
	}

	public void setDataFormat(DataFormat dataFormat)
	{
		m_dataFormat.setValue(dataFormat.toString());
	}

	public DataType getDataType()
	{
		return DataType.valueOf(m_dataType.getValue());
	}

	public void setDataType(DataType dataType)
	{
		m_dataType.setValue(dataType.toString());
	}

	public EntityType getEntityType()
	{
		return EntityType.valueOf(m_entityType.getValue());
	}

	public void setEntityType(EntityType entityType)
	{
		m_entityType.setValue(entityType.toString());
	}

	public SourceDocumentType getType()
	{
		return new SourceDocumentType(getEntityType(), getDataType(), getDataFormat());
	}

	public String getName()
	{
		return m_name.getValue();
	}

	public void setName(String name)
	{
		m_name.setValue(name);
	}

	public boolean isValidated()
	{
		return m_validated.getValue();
	}

	public void setValidated(Boolean validated)
	{
		m_validated.setValue(validated);
	}

	public void setValidated()
	{
		setValidated(true);
	}

	public byte[] getData()
	{
		return m_sourceDocument.getData();
	}

	public InputStream getDataAsStream() throws IOException, SQLException
	{
		return m_sourceDocument.getDataAsStream();
	}

	public long getDataLength()
	{
		return m_sourceDocument.getDataLength();
	}

	public void setData(byte[] data)
	{
		m_sourceDocument.setData(data);
	}

	public void setData(String data)
	{
		setData(data.getBytes());
	}

	public void setData(Serializable data) throws IOException
	{
		setData(IOUtils.toBytes(data));
	}

	public void setData(InputStream data) throws IOException
	{
		m_sourceDocument.setData(data);
	}

	public long getSourceDocumentId()
	{
		return m_sourceDocument.getSourceDocumentId();
	}

	public boolean isNew()
	{
		return m_inputDocumentId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof TaskInputSourceDocument == false)
			return false;

		TaskInputSourceDocument otherDoc = (TaskInputSourceDocument) other;

		if (isNew() || otherDoc.isNew())
			return false;

		return getInputDocumentId() == otherDoc.getInputDocumentId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getInputDocumentId())).hashCode();
	}

	public int compareTo(TaskInputSourceDocument other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getInputDocumentId() - other.getInputDocumentId());
	}


	// package methods


	void setInputId(Long inputId)
	{
		m_inputId.setValue(inputId);
	}

	Criterion getKey()
	{
		return new SimpleKey(m_inputDocumentId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();


		m_sourceDocument.save(dbConn);


		m_sourceDocumentId.setValue(m_sourceDocument.getSourceDocumentId());


		if (isNew()) {
			colList.add(m_inputId);
			colList.add(m_dataFormat);
			colList.add(m_dataType);
			colList.add(m_entityType);
			colList.add(m_name);
			colList.add(m_validated);
			colList.add(m_sourceDocumentId);

			insert(dbConn, new AutoGeneratedKey(m_inputDocumentId), colList);
		}
		else {
			if (m_inputId.isModified())
				colList.add(m_inputId);

			if (m_dataFormat.isModified())
				colList.add(m_dataFormat);

			if (m_dataType.isModified())
				colList.add(m_dataType);

			if (m_entityType.isModified())
				colList.add(m_entityType);

			if (m_name.isModified())
				colList.add(m_name);

			if (m_validated.isModified())
				colList.add(m_validated);

			if (m_sourceDocumentId.isModified())
				colList.add(m_sourceDocumentId);

			update(dbConn, colList);
		}
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_inputDocumentId.getValue());

		m_inputDocumentId.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);
	}

	static List<TaskInputSourceDocument> findInputDocuments(Connection dbConn, long inputId) throws IOException, SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE INPUT_ID = ?");
		ResultSet inputRows = null;

		try {
			selectStmt.setLong(1, inputId);

			inputRows = selectStmt.executeQuery();

			List<TaskInputSourceDocument> inputDocs = new ArrayList<TaskInputSourceDocument>();

			while (inputRows.next())
				inputDocs.add(new TaskInputSourceDocument(inputRows));

			return inputDocs;
		}
		finally {
			if (inputRows != null)
				inputRows.close();

			selectStmt.close();
		}
	}

	static void delete(Connection dbConn, long inputDocumentId) throws SQLException
	{
		long sourceDocumentId = getSourceDocId(dbConn, inputDocumentId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE INPUT_DOCUMENT_ID = ?");

		try {
			deleteStmt.setLong(1, inputDocumentId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}

		SourceDocumentRow.delete(dbConn, sourceDocumentId);
	}


	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_inputDocumentId.assignValue(row, 1);
		m_inputId.assignValue(row, 2);
		m_dataFormat.assignValue(row, 3);
		m_dataType.assignValue(row, 4);
		m_entityType.assignValue(row, 5);
		m_name.assignValue(row, 6);
		m_validated.assignValue(row, 7);
		m_sourceDocumentId.assignValue(row, 8);

		m_sourceDocument = new SourceDocumentRow(m_sourceDocumentId.getValue());
	}


	// private methods


	private static long getSourceDocId(Connection dbConn, long inputDocumentId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT SOURCE_DOCUMENT_ID FROM " + TABLE_NAME + " WHERE INPUT_DOCUMENT_ID = ?");
		ResultSet docRow = null;

		try {
			selectStmt.setLong(1, inputDocumentId);

			docRow = selectStmt.executeQuery();

			if (!docRow.next())
				return 0;

			return docRow.getLong(1);
		}
		finally {
			if (docRow != null)
				docRow.close();

			selectStmt.close();
		}
	}
}
