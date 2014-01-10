/*
 * UserDataItem.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.common.util.IOUtils;
import org.ngbw.sdk.core.shared.SourceDocumentType;
import org.ngbw.sdk.core.types.DataFormat;
import org.ngbw.sdk.core.types.DataType;
import org.ngbw.sdk.core.types.EntityType;


/**
 *
 * @author Paul Hoover
 *
 */
public class UserDataItem extends VersionedRow implements SourceDocument, FolderItem, Comparable<UserDataItem> {

	/**
	 *
	 */
	private class AddMetaDataOp implements RowOperation {

		private final String m_field;
		private final String m_value;


		// constructors


		protected AddMetaDataOp(String field, String value)
		{
			if (field == null)
				throw new NullPointerException("field");

			m_field = field;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO item_metadata (USERDATA_ID, FIELD, VALUE) VALUES (?, ?, ?)");

			try {
				m_userDataId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_field);

				if (m_value != null)
					insertStmt.setString(3, m_value);
				else
					insertStmt.setNull(3, Types.VARCHAR);

				insertStmt.executeUpdate();
			}
			finally {
				insertStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class SetMetaDataOp implements RowOperation {

		private final String m_field;
		private final String m_value;


		// constructors


		protected SetMetaDataOp(String field, String value)
		{
			if (field == null)
				throw new NullPointerException("field");

			m_field = field;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement updateStmt = dbConn.prepareStatement("UPDATE item_metadata SET VALUE = ? WHERE USERDATA_ID = ? AND FIELD = ?");

			try {
				if (m_value != null)
					updateStmt.setString(1, m_value);
				else
					updateStmt.setNull(1, Types.VARCHAR);

				m_userDataId.setParameter(updateStmt, 2);
				updateStmt.setString(3, m_field);

				updateStmt.executeUpdate();
			}
			finally {
				updateStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveMetaDataOp implements RowOperation {

		private final String m_field;


		// constructors


		protected RemoveMetaDataOp(String field)
		{
			if (field == null)
				throw new NullPointerException("field");

			m_field = field;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM item_metadata WHERE USERDATA_ID = ? AND FIELD = ?");

			try {
				m_userDataId.setParameter(deleteStmt, 1);
				deleteStmt.setString(2, m_field);

				deleteStmt.executeUpdate();
			}
			finally {
				deleteStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveAllMetaDataOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws SQLException
		{
			deleteMetaData(dbConn, m_userDataId.getValue());
		}
	}

	/**
	 *
	 */
	private class MetaDataMap extends MonitoredMap<String, String> {

		// constructors


		protected MetaDataMap(Map<String, String> prefMap)
		{
			super(prefMap);
		}


		// protected methods


		protected void addMapPutOp(String key, String value)
		{
			m_opQueue.add(new AddMetaDataOp(key, value));
		}

		protected void addMapSetOp(String key, String oldValue, String newValue)
		{
			m_opQueue.add(new SetMetaDataOp(key, newValue));
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemoveMetaDataOp(key));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllMetaDataOp());
		}
	}

	/**
	 *
	 */
	private class AddDataRecordOp implements RowOperation {

		private final UserItemDataRecord m_record;


		// constructors


		protected AddDataRecordOp(UserItemDataRecord record)
		{
			if (record.isNew())
				m_record = record;
			else
				m_record = new UserItemDataRecord(record);
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			m_record.setUserDataId(getUserDataId());

			m_record.save(dbConn);
		}
	}

	/**
	 *
	 */
	private class RemoveDataRecordOp implements RowOperation {

		private final UserItemDataRecord m_record;


		// constructors


		protected RemoveDataRecordOp(UserItemDataRecord record)
		{
			m_record = record;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			m_record.delete(dbConn);
		}
	}

	/**
	 *
	 */
	private class DataRecordList extends MonitoredList<UserItemDataRecord> {

		// constructors


		protected DataRecordList(List<UserItemDataRecord> records)
		{
			super(records);
		}


		// protected methods


		protected void addListAddOp(UserItemDataRecord record)
		{
			m_opQueue.add(new AddDataRecordOp(record));
		}

		protected void addListSetOp(UserItemDataRecord oldRecord, UserItemDataRecord newRecord)
		{
			m_opQueue.add(new RemoveDataRecordOp(oldRecord));
			m_opQueue.add(new AddDataRecordOp(newRecord));
		}

		protected void addListRemoveOp(UserItemDataRecord record)
		{
			m_opQueue.add(new RemoveDataRecordOp(record));
		}

		protected MonitoredList<UserItemDataRecord> newListInstance(List<UserItemDataRecord> list)
		{
			return new DataRecordList(list);
		}
	}


	private static final String TABLE_NAME = "userdata";
	private static final String COLUMN_NAMES = TABLE_NAME + ".USERDATA_ID, " + TABLE_NAME + ".COMMENT, " +
			TABLE_NAME + ".DATAFORMAT, " + TABLE_NAME + ".DATATYPE, " + TABLE_NAME + ".ENTITYTYPE, " +
			TABLE_NAME + ".VALIDATED, " + TABLE_NAME + ".SOURCE_DOCUMENT_ID, " + TABLE_NAME + ".GROUP_ID, " +
			TABLE_NAME + ".USER_ID, " + TABLE_NAME + ".CREATION_DATE, " + TABLE_NAME + ".LABEL, " +
			TABLE_NAME + ".ENCLOSING_FOLDER_ID, " + TABLE_NAME + ".VERSION";

	private LongColumn m_userDataId = new LongColumn(TABLE_NAME + ".USERDATA_ID", false);
	private StringColumn m_comment = new StringColumn(TABLE_NAME + ".COMMENT", true, 255);
	private StringColumn m_dataFormat = new StringColumn(TABLE_NAME + ".DATAFORMAT", false, 255);
	private StringColumn m_dataType = new StringColumn(TABLE_NAME + ".DATATYPE", false, 255);
	private StringColumn m_entityType = new StringColumn(TABLE_NAME + ".ENTITYTYPE", false, 255);
	private BooleanColumn m_validated = new BooleanColumn(TABLE_NAME + ".VALIDATED", false);
	private LongColumn m_sourceDocumentId = new LongColumn(TABLE_NAME + ".SOURCE_DOCUMENT_ID", false);
	private LongColumn m_groupId = new LongColumn(TABLE_NAME + ".GROUP_ID", false);
	private LongColumn m_userId = new LongColumn(TABLE_NAME + ".USER_ID", false);
	private DateColumn m_creationDate = new DateColumn(TABLE_NAME + ".CREATION_DATE", false);
	private StringColumn m_label = new StringColumn(TABLE_NAME + ".LABEL", false, 1023);
	private LongColumn m_enclosingFolderId = new LongColumn(TABLE_NAME + ".ENCLOSING_FOLDER_ID", false);
	private List<RowOperation> m_opQueue = new ArrayList<RowOperation>();
	private SourceDocumentRow m_sourceDocument;
	private MetaDataMap m_metaData;
	private DataRecordList m_dataRecords;


	// constructors


	public UserDataItem(Folder enclosingFolder)
	{
		super(TABLE_NAME);

		if (enclosingFolder.isNew())
			throw new WorkbenchException("Can't create a data item in an unpersisted folder");

		setDataFormat(DataFormat.UNKNOWN);
		setDataType(DataType.UNKNOWN);
		setEntityType(EntityType.UNKNOWN);
		setValidated(false);
		setUserId(enclosingFolder.getUserId());
		setGroupId(enclosingFolder.getGroupId());
		setEnclosingFolderId(enclosingFolder.getFolderId());

		m_creationDate.setValue(Calendar.getInstance().getTime());
		m_sourceDocument = new SourceDocumentRow();
	}

	public UserDataItem(SourceDocument document, Folder enclosingFolder) throws IOException, SQLException
	{
		super(TABLE_NAME);

		if (enclosingFolder.isNew())
			throw new WorkbenchException("Can't create a data item in an unpersisted folder");

		setDataFormat(document.getDataFormat());
		setDataType(document.getDataType());
		setEntityType(document.getEntityType());
		setValidated(document.isValidated());
		setUserId(enclosingFolder.getUserId());
		setGroupId(enclosingFolder.getGroupId());
		setEnclosingFolderId(enclosingFolder.getFolderId());

		m_creationDate.setValue(Calendar.getInstance().getTime());
		m_sourceDocument = new SourceDocumentRow(document);
	}

	public UserDataItem(UserDataItem otherItem, Folder enclosingFolder) throws IOException, SQLException
	{
		this((SourceDocument) otherItem, enclosingFolder);

		setComment(otherItem.getComment());
		setLabel(otherItem.getLabel());

		m_metaData = new MetaDataMap(new TreeMap<String, String>());

		m_metaData.putAll(otherItem.metaData());

		m_dataRecords = new DataRecordList(new ArrayList<UserItemDataRecord>());

		for (Iterator<UserItemDataRecord> records = otherItem.dataRecords().iterator() ; records.hasNext() ; )
			m_dataRecords.add(new UserItemDataRecord(records.next()));
	}

	public UserDataItem(long userDataId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_userDataId.assignValue(userDataId);

		refresh();
	}

	private UserDataItem(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
	}


	// public methods


	public long getUserDataId()
	{
		return m_userDataId.getValue();
	}

	public String getComment()
	{
		return m_comment.getValue();
	}

	public void setComment(String comment)
	{
		m_comment.setValue(comment);
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

	public String getName()
	{
		return null;
	}

	public byte[] getData() throws IOException, SQLException
	{
		return m_sourceDocument.getData();
	}

	public InputStream getDataAsStream() throws IOException, SQLException
	{
		return m_sourceDocument.getDataAsStream();
	}

	public long getDataLength() throws IOException, SQLException
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
		return m_sourceDocumentId.getValue();
	}

	public long getGroupId()
	{
		return m_groupId.getValue();
	}

	public void setGroupId(Long groupId)
	{
		m_groupId.setValue(groupId);
	}

	public Group getGroup() throws IOException, SQLException
	{
		if (m_groupId.isNull())
			return null;

		return new Group(m_groupId.getValue());
	}

	public void setGroup(Group group)
	{
		if (group != null && !group.isNew())
			setGroupId(group.getGroupId());
		else
			setGroupId(null);
	}

	public long getUserId()
	{
		return m_userId.getValue();
	}

	public void setUserId(Long userId)
	{
		m_userId.setValue(userId);
	}

	public User getUser() throws IOException, SQLException
	{
		if (m_userId.isNull())
			return null;

		return new User(m_userId.getValue());
	}

	public void setUser(User user)
	{
		if (user != null && !user.isNew())
			setUserId(user.getUserId());
		else
			setUserId(null);
	}

	public Date getCreationDate()
	{
		return m_creationDate.getValue();
	}

	public String getLabel()
	{
		return m_label.getValue();
	}

	public void setLabel(String label)
	{
		m_label.setValue(label);
	}

	public long getEnclosingFolderId()
	{
		return m_enclosingFolderId.getValue();
	}

	public void setEnclosingFolderId(Long enclosingFolderId)
	{
		m_enclosingFolderId.setValue(enclosingFolderId);
	}

	public Folder getEnclosingFolder() throws IOException, SQLException
	{
		if (m_enclosingFolderId.isNull())
			return null;

		return new Folder(m_enclosingFolderId.getValue());
	}

	public void setEnclosingFolder(Folder enclosingFolder)
	{
		if (enclosingFolder != null && !enclosingFolder.isNew())
			setEnclosingFolderId(enclosingFolder.getFolderId());
		else
			setEnclosingFolderId(null);
	}

	public Map<String, String> metaData() throws IOException, SQLException
	{
		if (m_metaData == null) {
			Map<String, String> metaData = new TreeMap<String, String>();

			if (!isNew()) {
				Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
				PreparedStatement selectStmt = null;
				ResultSet dataRows = null;

				try {
					selectStmt = dbConn.prepareStatement("SELECT FIELD, VALUE FROM item_metadata WHERE USERDATA_ID = ?");

					m_userDataId.setParameter(selectStmt, 1);

					dataRows = selectStmt.executeQuery();

					while (dataRows.next())
						metaData.put(dataRows.getString(1), dataRows.getString(2));
				}
				finally {
					if (dataRows != null)
						dataRows.close();

					if (selectStmt != null)
						selectStmt.close();

					dbConn.close();
				}
			}

			m_metaData = new MetaDataMap(metaData);
		}

		return m_metaData;
	}

	public List<UserItemDataRecord> dataRecords() throws IOException, SQLException
	{
		if (m_dataRecords == null) {
			List<UserItemDataRecord> newRecords;

			if (!isNew())
				newRecords = UserItemDataRecord.findDataRecords(new LongCriterion("USERDATA_ID", m_userDataId.getValue()));
			else
				newRecords = new ArrayList<UserItemDataRecord>();

			m_dataRecords = new DataRecordList(newRecords);
		}

		return m_dataRecords;
	}

	public boolean isNew()
	{
		return m_userDataId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof UserDataItem == false)
			return false;

		UserDataItem otherItem = (UserDataItem) other;

		if (isNew() || otherItem.isNew())
			return false;

		return getUserDataId() == otherItem.getUserDataId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getUserDataId())).hashCode();
	}

	public int compareTo(UserDataItem other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getUserDataId() - other.getUserDataId());
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_userDataId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		m_sourceDocument.save(dbConn);
		m_sourceDocumentId.setValue(m_sourceDocument.getSourceDocumentId());

		if (isNew()) {
			colList.add(m_comment);
			colList.add(m_dataFormat);
			colList.add(m_dataType);
			colList.add(m_entityType);
			colList.add(m_sourceDocumentId);
			colList.add(m_groupId);
			colList.add(m_userId);
			colList.add(m_creationDate);
			colList.add(m_label);
			colList.add(m_enclosingFolderId);

			insert(dbConn, new AutoGeneratedKey(m_userDataId), colList);
		}
		else {
			if (m_comment.isModified())
				colList.add(m_comment);

			if (m_dataFormat.isModified())
				colList.add(m_dataFormat);

			if (m_dataType.isModified())
				colList.add(m_dataType);

			if (m_entityType.isModified())
				colList.add(m_entityType);

			if (m_sourceDocumentId.isModified())
				colList.add(m_sourceDocumentId);

			if (m_groupId.isModified())
				colList.add(m_groupId);

			if (m_userId.isModified())
				colList.add(m_userId);

			if (m_label.isModified())
				colList.add(m_label);

			if (m_enclosingFolderId.isModified())
				colList.add(m_enclosingFolderId);

			update(dbConn, colList);
		}

		for (Iterator<RowOperation> operations = m_opQueue.iterator() ; operations.hasNext() ; )
			operations.next().execute(dbConn);

		m_opQueue.clear();
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_userDataId.getValue());

		m_userDataId.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_opQueue.clear();
		m_metaData = null;
		m_dataRecords = null;
	}

	static List<UserDataItem> findDataItems(Criterion key) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");

		stmtBuilder.append(key.getPhrase());

		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet itemRows = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());

			key.setParameter(selectStmt, 1);

			itemRows = selectStmt.executeQuery();

			List<UserDataItem> dataItems = new ArrayList<UserDataItem>();

			while (itemRows.next())
				dataItems.add(new UserDataItem(itemRows));

			return dataItems;
		}
		finally {
			if (itemRows != null)
				itemRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	static void delete(Connection dbConn, long userDataId) throws SQLException
	{
		long sourceDocumentId = getSourceDocId(dbConn, userDataId);

		deleteMetaData(dbConn, userDataId);
		deleteDataRecords(dbConn, userDataId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE USERDATA_ID = ?");

		try {
			deleteStmt.setLong(1, userDataId);

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
		m_userDataId.assignValue(row, 1);
		m_comment.assignValue(row, 2);
		m_dataFormat.assignValue(row, 3);
		m_dataType.assignValue(row, 4);
		m_entityType.assignValue(row, 5);
		m_validated.assignValue(row, 6);
		m_sourceDocumentId.assignValue(row, 7);
		m_groupId.assignValue(row, 8);
		m_userId.assignValue(row, 9);
		m_creationDate.assignValue(row, 10);
		m_label.assignValue(row, 11);
		m_enclosingFolderId.assignValue(row, 12);

		m_sourceDocument = new SourceDocumentRow(m_sourceDocumentId.getValue());

		super.populate(row, 13);
	}


	// private methods


	private static long getSourceDocId(Connection dbConn, long userDataId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT SOURCE_DOCUMENT_ID FROM " + TABLE_NAME + " WHERE USERDATA_ID = ?");
		ResultSet docRow = null;

		try {
			selectStmt.setLong(1, userDataId);

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

	private static void deleteMetaData(Connection dbConn, long userDataId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM item_metadata WHERE USERDATA_ID = ?");

		try {
			deleteStmt.setLong(1, userDataId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteDataRecords(Connection dbConn, long userDataId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT RECORD_ID FROM data_records WHERE USERDATA_ID = ?");
		ResultSet recordRows = null;

		try {
			selectStmt.setLong(1, userDataId);

			recordRows = selectStmt.executeQuery();

			while (recordRows.next())
				UserItemDataRecord.delete(dbConn, recordRows.getLong(1));
		}
		finally {
			if (recordRows != null)
				recordRows.close();

			selectStmt.close();
		}
	}
}
