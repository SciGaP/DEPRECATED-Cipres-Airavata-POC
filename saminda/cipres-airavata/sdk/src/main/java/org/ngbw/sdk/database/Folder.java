/*
 * Folder.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
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


/**
 *
 * @author Paul Hoover
 *
 */
public class Folder extends VersionedRow implements FolderItem, Comparable<Folder> {

	/**
	 *
	 */
	private class AddPreferenceOp implements RowOperation {

		private final String m_preference;
		private final String m_value;


		// constructors


		protected AddPreferenceOp(String preference, String value)
		{
			if (preference == null)
				throw new NullPointerException("preference");

			m_preference = preference;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO folder_preferences (FOLDER_ID, PREFERENCE, VALUE) VALUES (?, ?, ?)");

			try {
				m_folderId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_preference);

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
	private class SetPreferenceOp implements RowOperation {

		private final String m_preference;
		private final String m_value;


		// constructors


		protected SetPreferenceOp(String preference, String value)
		{
			if (preference == null)
				throw new NullPointerException("preference");

			m_preference = preference;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement updateStmt = dbConn.prepareStatement("UPDATE folder_preferences SET VALUE = ? WHERE FOLDER_ID = ? AND PREFERENCE = ?");

			try {
				if (m_value != null)
					updateStmt.setString(1, m_value);
				else
					updateStmt.setNull(1, Types.VARCHAR);

				m_folderId.setParameter(updateStmt, 2);
				updateStmt.setString(3, m_preference);

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
	private class RemovePreferenceOp implements RowOperation {

		private final String m_preference;


		// constructors


		protected RemovePreferenceOp(String preference)
		{
			if (preference == null)
				throw new NullPointerException("preference");

			m_preference = preference;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM folder_preferences WHERE FOLDER_ID = ? AND PREFERENCE = ?");

			try {
				m_folderId.setParameter(deleteStmt, 1);
				deleteStmt.setString(2, m_preference);

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
	private class RemoveAllPreferencesOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws SQLException
		{
			deletePrefs(dbConn, m_folderId.getValue());
		}
	}

	/**
	 *
	 */
	private class PreferenceMap extends MonitoredMap<String, String> {

		// constructors


		protected PreferenceMap(Map<String, String> prefMap)
		{
			super(prefMap);
		}


		// protected methods


		protected void addMapPutOp(String key, String value)
		{
			m_opQueue.add(new AddPreferenceOp(key, value));
		}

		protected void addMapSetOp(String key, String oldValue, String newValue)
		{
			m_opQueue.add(new SetPreferenceOp(key, newValue));
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemovePreferenceOp(key));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllPreferencesOp());
		}
	}


	private static final String TABLE_NAME = "folders";
	private static final String COLUMN_NAMES = TABLE_NAME + ".FOLDER_ID, " + TABLE_NAME + ".COMMENT, " +
			TABLE_NAME + ".GROUP_READABLE, " + TABLE_NAME + ".WORLD_READABLE, " + TABLE_NAME + ".GROUP_ID, " +
			TABLE_NAME + ".USER_ID, " + TABLE_NAME + ".CREATION_DATE, " + TABLE_NAME + ".LABEL, " +
			TABLE_NAME + ".ENCLOSING_FOLDER_ID, " + TABLE_NAME + ".VERSION";

	private final LongColumn m_folderId = new LongColumn(TABLE_NAME + ".FOLDER_ID", false);
	private final StringColumn m_comment = new StringColumn(TABLE_NAME + ".COMMENT", true, 255);
	private final BooleanColumn m_groupReadable = new BooleanColumn(TABLE_NAME + ".GROUP_READABLE", false);
	private final BooleanColumn m_worldReadable = new BooleanColumn(TABLE_NAME + ".WORLD_READABLE", false);
	private final LongColumn m_groupId = new LongColumn(TABLE_NAME + ".GROUP_ID", false);
	private final LongColumn m_userId = new LongColumn(TABLE_NAME + ".USER_ID", false);
	private final DateColumn m_creationDate = new DateColumn(TABLE_NAME + ".CREATION_DATE", false);
	private final StringColumn m_label = new StringColumn(TABLE_NAME + ".LABEL", false, 255);
	private final LongColumn m_enclosingFolderId = new LongColumn(TABLE_NAME + ".ENCLOSING_FOLDER_ID", true);
	private final List<RowOperation> m_opQueue = new ArrayList<RowOperation>();
	private PreferenceMap m_preferences;


	// constructors


	public Folder(User owner)
	{
		super(TABLE_NAME);

		if (owner.isNew())
			throw new WorkbenchException("Can't create a folder for an unpersisted user");

		setGroupReadable(false);
		setWorldReadable(false);
		setUserId(owner.getUserId());
		setGroupId(owner.getDefaultGroupId());

		m_creationDate.setValue(Calendar.getInstance().getTime());
	}

	public Folder(Folder enclosingFolder)
	{
		super(TABLE_NAME);

		if (enclosingFolder.isNew())
			throw new WorkbenchException("Can't create a folder in an unpersisted folder");

		setGroupReadable(false);
		setWorldReadable(false);
		setUserId(enclosingFolder.getUserId());
		setGroupId(enclosingFolder.getGroupId());
		setEnclosingFolderId(enclosingFolder.getFolderId());

		m_creationDate.setValue(Calendar.getInstance().getTime());
	}

	public Folder(long folderId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_folderId.assignValue(folderId);

		refresh();
	}

	private Folder(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
	}


	// public methods


	public long getFolderId()
	{
		return m_folderId.getValue();
	}

	public String getComment()
	{
		return m_comment.getValue();
	}

	public void setComment(String comment)
	{
		m_comment.setValue(comment);
	}

	public boolean isGroupReadable()
	{
		return m_groupReadable.getValue();
	}

	public void setGroupReadable(Boolean groupReadable)
	{
		m_groupReadable.setValue(groupReadable);
	}

	public boolean isWorldReadable()
	{
		return m_worldReadable.getValue();
	}

	public void setWorldReadable(Boolean worldReadable)
	{
		m_worldReadable.setValue(worldReadable);
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

	public Map<String, String> preferences() throws IOException, SQLException
	{
		if (m_preferences == null) {
			Map<String, String> newPreferences = new TreeMap<String, String>();

			if (!isNew()) {
				Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
				PreparedStatement selectStmt = null;
				ResultSet prefRows = null;

				try {
					selectStmt = dbConn.prepareStatement("SELECT PREFERENCE, VALUE FROM folder_preferences WHERE FOLDER_ID = ?");

					m_folderId.setParameter(selectStmt, 1);

					prefRows = selectStmt.executeQuery();

					while (prefRows.next())
						newPreferences.put(prefRows.getString(1), prefRows.getString(2));
				}
				finally {
					if (prefRows != null)
						prefRows.close();

					if (selectStmt != null)
						selectStmt.close();

					dbConn.close();
				}
			}

			m_preferences = new PreferenceMap(newPreferences);
		}

		return m_preferences;
	}

	public List<Task> findTasks() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return Task.findTasks(new LongCriterion("ENCLOSING_FOLDER_ID", m_folderId.getValue()));
	}

	public List<UserDataItem> findDataItems() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return UserDataItem.findDataItems(new LongCriterion("ENCLOSING_FOLDER_ID", m_folderId.getValue()));
	}

	public List<Folder> findSubFolders() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return findFolders(new LongCriterion("ENCLOSING_FOLDER_ID", m_folderId.getValue()));
	}

	public boolean isNew()
	{
		return m_folderId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof Folder == false)
			return false;

		Folder otherFolder = (Folder) other;

		if (isNew() || otherFolder.isNew())
			return false;

		return getFolderId() == otherFolder.getFolderId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getFolderId())).hashCode();
	}

	public int compareTo(Folder other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getFolderId() - other.getFolderId());
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_folderId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_comment);
			colList.add(m_groupReadable);
			colList.add(m_worldReadable);
			colList.add(m_groupId);
			colList.add(m_userId);
			colList.add(m_creationDate);
			colList.add(m_label);
			colList.add(m_enclosingFolderId);

			insert(dbConn, new AutoGeneratedKey(m_folderId), colList);
		}
		else {
			if (m_comment.isModified())
				colList.add(m_comment);

			if (m_groupReadable.isModified())
				colList.add(m_groupReadable);

			if (m_worldReadable.isModified())
				colList.add(m_worldReadable);

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

		delete(dbConn, m_folderId.getValue());

		m_folderId.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_opQueue.clear();
		m_preferences = null;
	}

	static List<Folder> findFolders(Criterion key) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");

		stmtBuilder.append(key.getPhrase());

		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet folderRows = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());

			key.setParameter(selectStmt, 1);

			folderRows = selectStmt.executeQuery();

			List<Folder> folders = new ArrayList<Folder>();

			while (folderRows.next())
				folders.add(new Folder(folderRows));

			return folders;
		}
		finally {
			if (folderRows != null)
				folderRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	static void delete(Connection dbConn, long folderId) throws SQLException
	{
		deletePrefs(dbConn, folderId);
		deleteData(dbConn, folderId);
		deleteTasks(dbConn, folderId);
		deleteSubFolders(dbConn, folderId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE FOLDER_ID = ?");

		try {
			deleteStmt.setLong(1, folderId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_folderId.assignValue(row, 1);
		m_comment.assignValue(row, 2);
		m_groupReadable.assignValue(row, 3);
		m_worldReadable.assignValue(row, 4);
		m_groupId.assignValue(row, 5);
		m_userId.assignValue(row, 6);
		m_creationDate.assignValue(row, 7);
		m_label.assignValue(row, 8);
		m_enclosingFolderId.assignValue(row, 9);

		super.populate(row, 10);
	}


	// private methods


	private static void deletePrefs(Connection dbConn, long folderId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM folder_preferences WHERE FOLDER_ID = ?");

		try {
			deleteStmt.setLong(1, folderId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteData(Connection dbConn, long folderId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT USERDATA_ID FROM userdata WHERE ENCLOSING_FOLDER_ID = ?");
		ResultSet dataRows = null;

		try {
			selectStmt.setLong(1, folderId);

			dataRows = selectStmt.executeQuery();

			while (dataRows.next())
				UserDataItem.delete(dbConn, dataRows.getLong(1));
		}
		finally {
			if (dataRows != null)
				dataRows.close();

			selectStmt.close();
		}
	}

	private static void deleteTasks(Connection dbConn, long folderId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT TASK_ID FROM tasks WHERE ENCLOSING_FOLDER_ID = ?");
		ResultSet taskRows = null;

		try {
			selectStmt.setLong(1, folderId);

			taskRows = selectStmt.executeQuery();

			while (taskRows.next())
				Task.delete(dbConn, taskRows.getLong(1));
		}
		finally {
			if (taskRows != null)
				taskRows.close();

			selectStmt.close();
		}
	}

	private static void deleteSubFolders(Connection dbConn, long folderId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT FOLDER_ID FROM folders WHERE ENCLOSING_FOLDER_ID = ?");
		ResultSet folderRows = null;

		try {
			selectStmt.setLong(1, folderId);

			folderRows = selectStmt.executeQuery();

			while (folderRows.next())
				Folder.delete(dbConn, folderRows.getLong(1));
		}
		finally {
			if (folderRows != null)
				folderRows.close();

			selectStmt.close();
		}
	}
}
