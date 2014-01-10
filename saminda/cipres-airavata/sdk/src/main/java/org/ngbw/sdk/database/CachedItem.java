/*
 * CachedItem.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.common.util.IOUtils;


/**
 *
 * @author Paul Hoover
 *
 */
public class CachedItem extends VersionedRow implements Comparable<CachedItem> {

	private static final String TABLE_NAME = "cached_items";
	private static final String COLUMN_NAMES = TABLE_NAME + ".CACHED_ITEM_ID, " + TABLE_NAME + ".COMMENT, " +
			TABLE_NAME + ".ATTRIBUTE, " + TABLE_NAME + ".SESSION_ID, " + TABLE_NAME + ".VERSION";

	private final LongColumn m_cachedItemId = new LongColumn(TABLE_NAME + ".CACHED_ITEM_ID", false);
	private final StringColumn m_comment = new StringColumn(TABLE_NAME + ".COMMENT", true, 255);
	private final StringColumn m_attribute = new StringColumn(TABLE_NAME + ".ATTRIBUTE", false, 255);
	private final StringColumn m_sessionId = new StringColumn(TABLE_NAME + ".SESSION_ID", false, 255);
	private final BinaryColumn m_value = new BinaryColumn(TABLE_NAME + ".VALUE", true, true, this);


	// constructors


	/**
	 *
	 * @param sessionId
	 * @param attribute
	 */
	public CachedItem(String sessionId, String attribute)
	{
		super(TABLE_NAME);

		setSessionId(sessionId);
		setAttribute(attribute);
	}

	/**
	 *
	 * @param cachedItemId
	 * @throws IOException
	 * @throws SQLException
	 */
	public CachedItem(long cachedItemId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_cachedItemId.assignValue(cachedItemId);

		refresh();
	}

	/**
	 *
	 * @param row
	 * @throws IOException
	 * @throws SQLException
	 */
	private CachedItem(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
	}


	// public methods


	/**
	 *
	 * @return
	 */
	public long getCachedItemId()
	{
		return m_cachedItemId.getValue();
	}

	/**
	 *
	 * @return
	 */
	public String getComment()
	{
		return m_comment.getValue();
	}

	/**
	 *
	 * @param comment
	 */
	public void setComment(String comment)
	{
		m_comment.setValue(comment);
	}

	/**
	 *
	 * @return
	 */
	public String getAttribute()
	{
		return m_attribute.getValue();
	}

	/**
	 *
	 * @param attribute
	 */
	public void setAttribute(String attribute)
	{
		m_attribute.setValue(attribute);
	}

	/**
	 *
	 * @return
	 */
	public String getSessionId()
	{
		return m_sessionId.getValue();
	}

	/**
	 *
	 * @param sessionId
	 */
	public void setSessionId(String sessionId)
	{
		m_sessionId.setValue(sessionId);
	}

	/**
	 *
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 */
	public byte[] getValue() throws IOException, SQLException
	{
		return m_value.getValue();
	}

	/**
	 *
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 */
	public InputStream getValueAsStream() throws IOException, SQLException
	{
		return m_value.getValueAsStream();
	}

	/**
	 *
	 * @param value
	 */
	public void setValue(byte[] value)
	{
		m_value.setValue(value);
	}

	/**
	 *
	 * @param value
	 */
	public void setValue(String value)
	{
		setValue(value.getBytes());
	}

	/**
	 *
	 * @param value
	 * @throws IOException
	 */
	public void setValue(Serializable value) throws IOException
	{
		setValue(IOUtils.toBytes(value));
	}

	/**
	 *
	 * @param sessionId
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 */
	public static List<CachedItem> findCachedItems(String sessionId) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE SESSION_ID = ?");
		ResultSet itemRows = null;

		try {
			selectStmt.setString(1, sessionId);

			itemRows = selectStmt.executeQuery();

			List<CachedItem> items = new ArrayList<CachedItem>();

			while (itemRows.next())
				items.add(new CachedItem(itemRows));

			return items;
		}
		finally {
			if (itemRows != null)
				itemRows.close();

			selectStmt.close();
		}
	}

	/**
	 * Indicates whether or not the object has been persisted.
	 *
	 * @return <code>true</code> if the object has not been persisted
	 */
	public boolean isNew()
	{
		return m_cachedItemId.isNull();
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

		if (other instanceof CachedItem == false)
			return false;

		CachedItem otherItem = (CachedItem) other;

		// an object that hasn't been persisted can only be equal to itself
		if (isNew() || otherItem.isNew())
			return false;

		return getCachedItemId() == otherItem.getCachedItemId();
	}

	/**
	 *
	 * @return
	 */
	@Override
	public int hashCode()
	{
		return (new Long(getCachedItemId())).hashCode();
	}

	/**
	 *
	 * @param other
	 * @return
	 */
	public int compareTo(CachedItem other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getCachedItemId() - other.getCachedItemId());
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
		return new SimpleKey(m_cachedItemId);
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
			colList.add(m_comment);
			colList.add(m_attribute);
			colList.add(m_sessionId);
			colList.add(m_value);

			insert(dbConn, new AutoGeneratedKey(m_cachedItemId), colList);
		}
		else {
			if (m_comment.isModified())
				colList.add(m_comment);

			if (m_attribute.isModified())
				colList.add(m_attribute);

			if (m_sessionId.isModified())
				colList.add(m_sessionId);

			if (m_value.isModified())
				colList.add(m_value);

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

		delete(dbConn, m_cachedItemId.getValue());

		m_cachedItemId.reset();
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_value.reset();
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param cachedItemId
	 * @throws IOException
	 * @throws SQLException
	 */
	static void delete(Connection dbConn, long cachedItemId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE CACHED_ITEM_ID = ?");

		try {
			deleteStmt.setLong(1, cachedItemId);

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
	 * @throws IOException
	 * @throws SQLException
	 */
	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_cachedItemId.assignValue(row, 1);
		m_comment.assignValue(row, 2);
		m_attribute.assignValue(row, 3);
		m_sessionId.assignValue(row, 4);

		super.populate(row, 5);
	}
}
