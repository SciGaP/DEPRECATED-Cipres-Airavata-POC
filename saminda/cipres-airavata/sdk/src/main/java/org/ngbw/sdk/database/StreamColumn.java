/*
 * StreamColumn.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.WorkbenchException;


/**
 * Represents a column from a database table whose value is not retrieved from the database until it's requested.
 *
 * @author Paul Hoover
 *
 * @param <T>
 */
abstract class StreamColumn<T> extends Column<T> {

	// nested classes


	/**
	 *
	 * @param <V>
	 */
	protected interface StreamValue<V> extends Value<V> {

		/**
		 *
		 * @return
		 * @throws IOException
		 */
		InputStream getValueAsStream() throws IOException;

		/**
		 *
		 * @param value
		 * @throws IOException
		 */
		void setValue(InputStream value) throws IOException;

		/**
		 *
		 * @return
		 */
		long getLength();
	}

	/**
	 *
	 */
	protected interface ResultHandler {

		/**
		 *
		 * @param row
		 * @throws IOException
		 * @throws SQLException
		 */
		void process(ResultSet row) throws IOException, SQLException;
	}

	/**
	 *
	 */
	private class AssignmentHandler implements ResultHandler {

		/**
		 *
		 * @param row
		 * @throws IOException
		 * @throws SQLException
		 */
		public void process(ResultSet row) throws IOException, SQLException
		{
			assignValue(row, 1);
		}
	}


  // data fields


	protected final Row m_owner;
	protected boolean m_populated;

	private static final Log m_log = LogFactory.getLog(StreamColumn.class);


	// constructors


	/**
	 * Constructs a column representation and assigns a <code>null</code> value to it.
	 *
	 * @param name the name of the column
	 * @param nullable whether the column lacks or has a <code>NOT NULL</code> constraint
	 * @param owner a reference to the <code>Row</code> object that owns this object
	 */
	protected StreamColumn(String name, boolean nullable, Row owner)
	{
		super(name, nullable);

		m_owner = owner;
	}

	/**
	 * Constructs a column representation and assigns the given value to it. The populated state of
	 * the object is set to <code>true</code>.
	 *
	 * @param name the name of the column
	 * @param nullable whether the column lacks or has a <code>NOT NULL</code> constraint
	 * @param owner a reference to the <code>Row</code> object that owns this object
	 * @param value an initial value to assign to the object
	 */
	protected StreamColumn(String name, boolean nullable, Row owner, T value)
	{
		this(name, nullable, owner);

		assignValue(value);
	}


	// public methods


	/**
	 * Returns the current value of the object. If the populated state of the object is <code>false</code>,
	 * a value is fetched from the database using the primary key and table name of the <code>Row</code>
	 * object that owns this object, and the populated state of the object is set to <code>true</code>.
	 *
	 * @return the current value of the object
	 */
	@Override
	public T getValue()
	{
		try {
			if (!m_populated && !m_owner.isNew())
				assignDbValue();

			return m_value.getValue();
		}
		catch (Exception err) {
			m_log.error("", err);

			return null;
		}
	}

	/**
	 * Returns an <code>InputStream</code> backed by the column represented by the object. If the populated
	 * state of the object is <code>false</code>, a value is fetched from the database using the primary
	 * key and table name of the <code>Row</code> object that owns this object, and the populated state
	 * of the object is set to <code>true</code>.
	 *
	 * @return an <code>InputStream</code> backed by the column value
	 * @throws IOException
	 * @throws SQLException
	 */
	public InputStream getValueAsStream() throws IOException, SQLException
	{
		if (!m_populated && !m_owner.isNew())
			assignDbValue();

		return ((StreamValue<T>)m_value).getValueAsStream();
	}

	/**
	 * Assigns a value to the object and sets the modified and populated states to <code>true</code>. The
	 * assignment is ignored if the value provided is equal to the current value of the object.
	 *
	 * @param value the value to assign to the object
	 */
	@Override
	public void setValue(T value)
	{
		super.setValue(value);

		m_populated = true;
	}

	/**
	 *
	 * @param value
	 * @throws IOException
	 */
	public void setValue(InputStream value) throws IOException
	{
		try {
			((StreamValue<T>)m_value).setValue(value);

			m_isModified = true;
			m_populated = true;
		}
		finally {
			value.close();
		}
	}

	/**
	 * Assigns a value to the object, sets the modified state to <code>false</code>, and
	 * sets the populated state to <code>true</code>.
	 *
	 * @param value the value to assign to the object
	 */
	@Override
	public void assignValue(T value)
	{
		super.assignValue(value);

		m_populated = true;
	}

	/**
	 * Assigns a value to the object using a row from a <code>ResultSet</code> object. The row used
	 * is the one indicated by the current position of the <code>ResultSet</code> object's cursor.
	 *
	 * @param value the <code>ResultSet</code> object that contains the row
	 * @param index the offset in the row that indicates the column whose value will be assigned to this object
	 * @throws IOException
	 * @throws SQLException
	 */
	@Override
	public void assignValue(ResultSet value, int index) throws IOException, SQLException
	{
		super.assignValue(value, index);

		m_populated = true;
	}

	/**
	 * Sets the value of the object to <code>null</code> and the modified and populated states to <code>false</code>.
	 */
	@Override
	public void reset()
	{
		super.reset();

		m_populated = false;
	}


	// protected methods


	/**
	 *
	 * @param handler
	 * @throws IOException
	 * @throws SQLException
	 */
	protected void fetchDbValue(ResultHandler handler) throws IOException, SQLException
	{
		Criterion key = m_owner.getKey();
		StringBuilder queryBuilder = new StringBuilder("SELECT ");

		queryBuilder.append(m_name);
		queryBuilder.append(" FROM ");
		queryBuilder.append(m_owner.getTableName());
		queryBuilder.append(" WHERE ");
		queryBuilder.append(key.getPhrase());

		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet row = null;

		try {
			selectStmt = dbConn.prepareStatement(queryBuilder.toString());

			key.setParameter(selectStmt, 1);

			row = selectStmt.executeQuery();

			if (!row.next())
				throw new WorkbenchException("No row in " + m_owner.getTableName() +  " for key " + key.toString());

			handler.process(row);
		}
		finally {
			if (row != null)
				row.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}


	// private methods


	/**
	 *
	 * @throws IOException
	 * @throws SQLException
	 */
	private void assignDbValue() throws IOException, SQLException
	{
		fetchDbValue(new AssignmentHandler());
	}
}
