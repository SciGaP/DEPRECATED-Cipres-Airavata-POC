/*
 * Group.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.ngbw.sdk.WorkbenchException;


/**
 *
 * @author Paul Hoover
 *
 */
public class Group extends VersionedRow implements Comparable<Group> {

	/**
	 *
	 */
	private class AddMemberOp implements RowOperation {

		private final long m_userId;


		// constructors


		protected AddMemberOp(long userId)
		{
			m_userId = userId;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO user_group_lookup (USER_ID, GROUP_ID) VALUES (?, ?)");

			try {
				insertStmt.setLong(1, m_userId);
				m_groupId.setParameter(insertStmt, 2);

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
	private class RemoveMemberOp implements RowOperation {

		private final long m_userId;


		// constructors


		protected RemoveMemberOp(long userId)
		{
			m_userId = userId;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			if (isDefaultMembership(dbConn))
				throw new WorkbenchException("Can't remove membership in default group");

			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_group_lookup WHERE USER_ID = ? AND GROUP_ID = ?");

			try {
				deleteStmt.setLong(1, m_userId);
				m_groupId.setParameter(deleteStmt, 2);

				deleteStmt.executeUpdate();
			}
			finally {
				deleteStmt.close();
			}
		}


		// private methods


		private boolean isDefaultMembership(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement selectStmt = dbConn.prepareStatement("SELECT USER_ID FROM users WHERE USER_ID = ? AND DEFAULT_GROUP_ID = ?");
			ResultSet userRow = null;

			try {
				selectStmt.setLong(1, m_userId);
				m_groupId.setParameter(selectStmt, 2);

				userRow = selectStmt.executeQuery();

				return userRow.next();
			}
			finally {
				if (userRow != null)
					userRow.close();

				selectStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveAllMembersOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_group_lookup " +
					"WHERE GROUP_ID = ? AND USER_ID NOT IN ( " +
						"SELECT USER_ID FROM users WHERE DEFAULT_GROUP_ID = ? )");

			try {
				m_groupId.setParameter(deleteStmt, 1);
				m_groupId.setParameter(deleteStmt, 2);

				deleteStmt.executeUpdate();
			}
			finally {
				deleteStmt.close();
			}

			m_members = null;
		}
	}

	/**
	 *
	 */
	private class MemberSet extends MonitoredSet<User> {

		// constructors


		protected MemberSet(Set<User> users)
		{
			super(users);
		}


		// protected methods


		protected void addSetAddOp(User element)
		{
			if (element.isNew())
				throw new WorkbenchException("Can't add membership for an unpersisted user");

			m_opQueue.add(new AddMemberOp(element.getUserId()));
		}

		protected void addSetRemoveOp(User element)
		{
			m_opQueue.add(new RemoveMemberOp(element.getUserId()));
		}

		protected void addSetClearOp()
		{
			m_opQueue.add(new RemoveAllMembersOp());
		}
	}


	private static final String TABLE_NAME = "groups";
	private static final String COLUMN_NAMES = TABLE_NAME + ".GROUP_ID, " + TABLE_NAME + ".COMMENT, " +
			TABLE_NAME + ".CREATION_DATE, " + TABLE_NAME + ".DESCRIPTION, " + TABLE_NAME + ".GROUPNAME, " +
			TABLE_NAME + ".ADMINISTRATOR, " + TABLE_NAME + ".VERSION ";

	private final LongColumn m_groupId = new LongColumn(TABLE_NAME + ".GROUP_ID", false);
	private final StringColumn m_comment = new StringColumn(TABLE_NAME + ".COMMENT", true, 255);
	private final DateColumn m_creationDate = new DateColumn(TABLE_NAME + ".CREATION_DATE", false);
	private final StringColumn m_description = new StringColumn(TABLE_NAME + ".DESCRIPTION", true, 1023);
	private final StringColumn m_groupname = new StringColumn(TABLE_NAME + ".GROUPNAME", false, 255);
	private final LongColumn m_administrator = new LongColumn(TABLE_NAME + ".ADMINISTRATOR", true);
	private final List<RowOperation> m_opQueue = new ArrayList<RowOperation>();
	private MemberSet m_members;


	// constructors


	public Group()
	{
		super(TABLE_NAME);

		m_creationDate.setValue(Calendar.getInstance().getTime());
	}

	public Group(long groupId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_groupId.assignValue(groupId);

		refresh();
	}

	private Group(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
	}


	// public methods


	public long getGroupId()
	{
		return m_groupId.getValue();
	}

	public String getComment()
	{
		return m_comment.getValue();
	}

	public void setComment(String comment)
	{
		m_comment.setValue(comment);
	}

	public Date getCreationDate()
	{
		return m_creationDate.getValue();
	}

	public String getDescription()
	{
		return m_description.getValue();
	}

	public void setDescription(String description)
	{
		m_description.setValue(description);
	}

	public String getGroupname()
	{
		return m_groupname.getValue();
	}

	public void setGroupname(String groupname)
	{
		m_groupname.setValue(groupname);
	}

	public long getAdministratorId()
	{
		return m_administrator.getValue();
	}

	public void setAdministratorId(Long administratorId)
	{
		m_administrator.setValue(administratorId);
	}

	public User getAdministrator() throws IOException, SQLException
	{
		if (m_administrator.isNull())
			return null;

		return new User(m_administrator.getValue());
	}

	public void setAdministrator(User administrator)
	{
		if (administrator != null && !administrator.isNew())
			setAdministratorId(administrator.getUserId());
		else
			setAdministratorId(null);
	}

	public Set<User> members() throws IOException, SQLException
	{
		if (m_members == null) {
			Set<User> groupMembers;

			if (!isNew())
				groupMembers = User.findMembers(m_groupId.getValue());
			else
				groupMembers = new TreeSet<User>();

			m_members = new MemberSet(groupMembers);
		}

		return m_members;
	}

	public List<Folder> findFolders() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return Folder.findFolders(new LongCriterion("GROUP_ID", m_groupId.getValue()));
	}

	public List<UserDataItem> findDataItems() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return UserDataItem.findDataItems(new LongCriterion("GROUP_ID", m_groupId.getValue()));
	}

	public List<Task> findTasks() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return Task.findTasks(new LongCriterion("GROUP_ID", m_groupId.getValue()));
	}

	public static Group findGroupByGroupname(String groupname) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet groupRow = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES + " FROM groups WHERE GROUPNAME = ?");

			selectStmt.setString(1, groupname);

			groupRow = selectStmt.executeQuery();

			if (!groupRow.next())
				return null;

			return new Group(groupRow);
		}
		finally {
			if (groupRow != null)
				groupRow.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	public boolean isNew()
	{
		return m_groupId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof Group == false)
			return false;

		Group otherGroup = (Group) other;

		if (isNew() || otherGroup.isNew())
			return false;

		return getGroupId() == otherGroup.getGroupId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getGroupId())).hashCode();
	}

	public int compareTo(Group other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getGroupId() - other.getGroupId());
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_groupId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_comment);
			colList.add(m_creationDate);
			colList.add(m_description);
			colList.add(m_groupname);
			colList.add(m_administrator);

			insert(dbConn, new AutoGeneratedKey(m_groupId), colList);
		}
		else {
			if (m_comment.isModified())
				colList.add(m_comment);

			if (m_description.isModified())
				colList.add(m_description);

			if (m_groupname.isModified())
				colList.add(m_groupname);

			if (m_administrator.isModified())
				colList.add(m_administrator);

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

		long groupId = m_groupId.getValue();

		if (numDefaultMemberships(dbConn, groupId) > 0)
			throw new WorkbenchException("Can't delete a default group");

		if (isOwner(dbConn, groupId))
			throw new WorkbenchException("Can't delete a group that owns other entities");

		deleteGroup(dbConn, groupId);

		m_groupId.reset();
		m_opQueue.clear();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_opQueue.clear();
		m_members = null;
	}

	static Set<Group> findMemberships(long userId) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet groupRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES +
					"FROM users " +
						"INNER JOIN user_group_lookup ON users.USER_ID = user_group_lookup.USER_ID " +
						"INNER JOIN " + TABLE_NAME + " ON user_group_lookup.GROUP_ID = " + TABLE_NAME + ".GROUP_ID " +
					"WHERE users.USER_ID = ?");

			selectStmt.setLong(1, userId);

			groupRows = selectStmt.executeQuery();

			Set<Group> memberships = new TreeSet<Group>();

			while (groupRows.next())
				memberships.add(new Group(groupRows));

			return memberships;
		}
		finally {
			if (groupRows != null)
				groupRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	static void delete(Connection dbConn, long groupId) throws SQLException
	{
		if (numDefaultMemberships(dbConn, groupId) > 0 || isOwner(dbConn, groupId))
			return;

		deleteGroup(dbConn, groupId);
	}


	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_groupId.assignValue(row, 1);
		m_comment.assignValue(row, 2);
		m_creationDate.assignValue(row, 3);
		m_description.assignValue(row, 4);
		m_groupname.assignValue(row, 5);
		m_administrator.assignValue(row, 6);

		super.populate(row, 7);
	}


	// private methods


	static void deleteGroup(Connection dbConn, long groupId) throws SQLException
	{
		deleteLookups(dbConn, groupId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE GROUP_ID = ?");

		try {
			deleteStmt.setLong(1, groupId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static int numDefaultMemberships(Connection dbConn, long groupId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM users WHERE DEFAULT_GROUP_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, groupId);

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

	private static boolean isOwner(Connection dbConn, long groupId) throws SQLException
	{
		return numOwnedFolders(dbConn, groupId) > 0 || numOwnedTasks(dbConn, groupId) > 0 || numOwnedDataItems(dbConn, groupId) > 0;
	}

	private static int numOwnedFolders(Connection dbConn, long groupId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM folders WHERE GROUP_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, groupId);

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

	private static int numOwnedTasks(Connection dbConn, long groupId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM tasks WHERE GROUP_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, groupId);

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

	private static int numOwnedDataItems(Connection dbConn, long groupId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT COUNT(*) FROM userdata WHERE GROUP_ID = ?");
		ResultSet countRow = null;

		try {
			selectStmt.setLong(1, groupId);

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

	private static void deleteLookups(Connection dbConn, long groupId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_group_lookup WHERE GROUP_ID = ?");

		try {
			deleteStmt.setLong(1, groupId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}
}
