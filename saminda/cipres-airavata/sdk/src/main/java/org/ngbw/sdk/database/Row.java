/*
 * Row.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.common.util.TimeUtils;

import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.database.NotExistException;


/**
 * Represents a row from a database table.
 *
 * @author Paul Hoover
 *
 */
public abstract class Row {
	private static final Log log = LogFactory.getLog(Row.class.getName());

	protected final String m_tableName;


	// constructors


	/**
	 * Constructs a row representation.
	 *
	 * @param tableName the name of the backing table
	 */
	protected Row(String tableName)
	{
		m_tableName = tableName;
	}


	// public methods


	/**
	 * Indicates whether or not the object has been persisted.
	 *
	 * @return <code>true</code> if the object has not been persisted
	 */
	public abstract boolean isNew();

	/**
	 * Saves any changes to the columns of the row to the backing table.
	 * Only updates columns that have been modified.
	 *
	 * @throws IOException
	 * @throws SQLException
	 */
	public void save() throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();

		try {
			dbConn.setAutoCommit(false);

			save(dbConn);

			dbConn.commit();
		}
		catch (IOException ioErr) {
			log.error("", ioErr);
			dbConn.rollback();
			throw ioErr;
		}
		catch (SQLException sqlErr) {
			log.error("", sqlErr);
			dbConn.rollback();
			throw sqlErr;
		}
		finally {
			dbConn.close();
		}
	}

	/**
	 *
	 * @throws IOException
	 * @throws SQLException
	 */
	public void delete() throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();

		try {
			dbConn.setAutoCommit(false);

			delete(dbConn);

			dbConn.commit();
		}
		catch (IOException ioErr) {
			log.error("", ioErr);
			dbConn.rollback();

			throw ioErr;
		}
		catch (SQLException sqlErr) {
			log.error("", sqlErr);
			dbConn.rollback();

			throw sqlErr;
		}
		finally {
			dbConn.close();
		}
	}

	/**
	 *
	 * Syncrhonize the fields of this object with the current values from the database.
	 * @throws IOException
	 * @throws SQLException
	 */
	public void refresh() throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();

		try {
			dbConn.setAutoCommit(false);

			refresh(dbConn);

			dbConn.commit();
		}
		catch (IOException ioErr) {
			log.error("", ioErr);
			dbConn.rollback();
			throw ioErr;
		}
		catch (SQLException sqlErr) {
			log.error("", sqlErr);
			dbConn.rollback();
			throw sqlErr;
		}
		finally {
			dbConn.close();
		}
	}


	// package methods


	/**
	 * Returns a <code>Criterion</code> object that describes the primary key of the record
	 * that the object represents.
	 *
	 * @return a <code>Criterion</code> object that describes the primary key
	 */
	abstract Criterion getKey();

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	abstract void save(Connection dbConn) throws IOException, SQLException;

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	abstract void delete(Connection dbConn) throws IOException, SQLException;

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	abstract void refresh(Connection dbConn) throws IOException, SQLException;

	/**
	 *
	 * @return the name of the backing table
	 */
	String getTableName()
	{
		return m_tableName;
	}


	// protected methods


	/**
	 *
	 * @param row a <code>ResultSet</code> object
	 * @throws IOException
	 * @throws SQLException
	 */
	protected abstract void populate(ResultSet row) throws IOException, SQLException;

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param colNames
	 * @throws IOException
	 * @throws SQLException
	 */
	protected void select(Connection dbConn, String colNames) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		Criterion key = getKey();
		StringBuilder stmtBuilder = new StringBuilder("SELECT ");

		stmtBuilder.append(colNames);
		stmtBuilder.append(" FROM ");
		stmtBuilder.append(m_tableName);
		stmtBuilder.append(" WHERE ");
		stmtBuilder.append(key.getPhrase());

		PreparedStatement selectStmt = dbConn.prepareStatement(stmtBuilder.toString());
		ResultSet tableRow = null;

		try {
			key.setParameter(selectStmt, 1);

			tableRow = selectStmt.executeQuery();

			if (!tableRow.next())
				throw new NotExistException("No row in " + m_tableName +  " for key " + key.toString());

			populate(tableRow);
		}
		finally {
			if (tableRow != null)
				tableRow.close();

			selectStmt.close();
		}
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param colList
	 * @throws IOException
	 * @throws SQLException
	 */
	protected void update(Connection dbConn, List<Column<?>> colList) throws IOException, SQLException
	{
		if (colList.isEmpty())
			return;

		Criterion key = getKey();
		StringBuilder stmtBuilder = new StringBuilder();
		Iterator<Column<?>> columns = colList.iterator();

		stmtBuilder.append("UPDATE ");
		stmtBuilder.append(m_tableName);
		stmtBuilder.append(" SET ");
		stmtBuilder.append(columns.next().getName());
		stmtBuilder.append(" = ?");

		while (columns.hasNext()) {
			stmtBuilder.append(", ");
			stmtBuilder.append(columns.next().getName());
			stmtBuilder.append(" = ?");
		}

		stmtBuilder.append(" WHERE ");
		stmtBuilder.append(key.getPhrase());

		PreparedStatement updateStmt = dbConn.prepareStatement(stmtBuilder.toString());

		try {
			int index = 1;

			for (columns = colList.iterator() ; columns.hasNext() ; index += 1)
				columns.next().setParameter(updateStmt, index);

			key.setParameter(updateStmt, index);

			if (updateStmt.executeUpdate() == 0)
				throw new NotExistException("No row in " + m_tableName +  " for key " + key.toString());
		}
		finally {
			updateStmt.close();
		}

		for (Column<?> col : colList)
			col.finishUpdate();
	}

	/**
	 *
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param key
	 * @param colList
	 * @throws IOException
	 * @throws SQLException
	 */
	protected void insert(Connection dbConn, AutoGeneratedKey key, List<Column<?>> colList) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder();

		stmtBuilder.append("INSERT INTO ");
		stmtBuilder.append(m_tableName);

		Iterator<Column<?>> columns = colList.iterator();

		if (columns.hasNext()) {
			stmtBuilder.append(" (");
			stmtBuilder.append(columns.next().getName());

			while (columns.hasNext()) {
				stmtBuilder.append(", ");
				stmtBuilder.append(columns.next().getName());
			}

			stmtBuilder.append(") VALUES (?");

			for (int i = 1 ; i < colList.size() ; i += 1)
				stmtBuilder.append(", ?");

			stmtBuilder.append(")");
		}

		int autoGeneratedKeys = key != null ? Statement.RETURN_GENERATED_KEYS : Statement.NO_GENERATED_KEYS;
		PreparedStatement insertStmt = dbConn.prepareStatement(stmtBuilder.toString(), autoGeneratedKeys);

		try {
			int index = 1;

			for (columns = colList.iterator() ; columns.hasNext() ; index += 1)
				columns.next().setParameter(insertStmt, index);

			insertStmt.executeUpdate();

			if (key != null)
				key.getGeneratedKeys(insertStmt);
		}
		finally {
			insertStmt.close();
		}

		for (Column<?> col : colList)
			col.finishUpdate();
	}
}
