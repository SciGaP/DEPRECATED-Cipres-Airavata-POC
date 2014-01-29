
/*
 * StatisticsEvent.java
 */
package org.ngbw.sdk.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.database.ConnectionManager;
import org.ngbw.sdk.database.LongCriterion;


public class StatisticsEvent extends Row implements Comparable<StatisticsEvent>
{
	private static final Log log = LogFactory.getLog(StatisticsEvent.class.getName());

	private static final String TABLE_NAME   = "job_events";
	private static final String COLUMN_NAMES =	TABLE_NAME + ".SE_ID, " + 
												TABLE_NAME + ".JOBHANDLE, " + 
												TABLE_NAME + ".EVENT_DATE, " + 
												TABLE_NAME + ".TASK_STAGE, " + 
												TABLE_NAME + ".NAME, " + 
												TABLE_NAME + ".VALUE " ; 
                                                                                         
	// false in 3rd column = NOT NULLABLE, true in optional 4th column means truncate string if too long.
	private LongColumn m_id = new LongColumn(TABLE_NAME + ".SE_ID", false);
	private final StringColumn	m_jobhandle		= new StringColumn(TABLE_NAME + ".JOBHANDLE", false, 255); 
	private final DateColumn	m_eventDate	= new DateColumn(TABLE_NAME + ".EVENT_DATE", false);
	private final StringColumn	m_taskStage		= new StringColumn(TABLE_NAME + ".TASK_STAGE", true, 100); 
	private final StringColumn	m_eventName		= new StringColumn(TABLE_NAME + ".NAME", false, 100); 
	private TextColumn m_eventValue = new TextColumn(TABLE_NAME + ".VALUE", true, this);

	private static final Log m_log = LogFactory.getLog(StatisticsEvent.class.getName());

	// constructors

	/* Create new StatisticsEvent */
	public StatisticsEvent(String jobhandle) throws IOException, SQLException
	{
		super(TABLE_NAME);
		m_jobhandle.assignValue(jobhandle);
		m_eventDate.assignValue(new Date());
	}

	// Poplulates this object from specified ResultSet.
	public StatisticsEvent(ResultSet rs) throws IOException, SQLException
	{
		super(TABLE_NAME);
		populate(rs);

	}

	// public methods
	public long getId()
	{
		return m_id.getValue();
	}

	public String getJobhandle()
	{
		return m_jobhandle.getValue();
	}

	public Date getEventDate()
	{
		return m_eventDate.getValue();
	}

	public String getTaskStage()
	{
		return m_taskStage.getValue();
	}
	public void setTaskStage(String s)
	{
		m_taskStage.setValue(s);
	}

	public String getEventName()
	{
		return m_eventName.getValue();
	}

	public void setEventName(String s)
	{
		m_eventName.setValue(s);
	}

	public String getEventValue()
	{
		return m_eventValue.getValue();
	}

	public void setEventValue(String s)
	{
		m_eventValue.setValue(s);
	}


	/**
	 * Indicates whether or not the object has been persisted.
	 *
	 * @return <code>true</code> if the object has not been persisted
	 */
	public boolean isNew()
	{
		return m_id.isNull();
	}

	/**
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

		if (other instanceof StatisticsEvent == false)
			return false;

		StatisticsEvent otherRow = (StatisticsEvent) other;

		// an object that hasn't been persisted can only be equal to itself
		if (isNew() || otherRow.isNew())
			return false;

		return getId() == otherRow.getId();
	}

	/**
	 * @return
	 */
	@Override
	public int hashCode()
	{
		return (new Long(getId())).hashCode();
	}

	/**
	 *
	 * @param other
	 * @return
	 */
	public int compareTo(StatisticsEvent other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return  0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getId() - other.getId());
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
		return new SimpleKey(m_id);
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
		
		if (isNew()) { //this gets called, if I insert records
			colList.add(m_jobhandle);	
			colList.add(m_eventDate);	
			colList.add(m_taskStage);	
			colList.add(m_eventName);
			colList.add(m_eventValue);
			
			insert(dbConn,  new AutoGeneratedKey(m_id), colList);
		}
		else { 
			if (m_jobhandle.isModified())
				colList.add(m_jobhandle);	
			if (m_eventDate.isModified())
				colList.add(m_eventDate);	
			if (m_taskStage.isModified())
				colList.add(m_taskStage);
			if (m_eventName.isModified())
				colList.add(m_eventName);
			if (m_eventValue.isModified())
				colList.add(m_eventValue);
			update(dbConn, colList);
		}
	}

	/**
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_id.getValue());
		m_id.reset();
	}

	/**
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @throws IOException
	 * @throws SQLException
	 */
	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);
	}

	/**
	 * @param dbConn a <code>Connection</code> object that will be used to communicate with the database
	 * @param exampleId
	 * @throws IOException
	 * @throws SQLException
	 */
	public void delete(Connection dbConn, long exampleId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE SE_ID = ?");

		try {
			deleteStmt.setLong(1, exampleId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// protected methods

	/**
	 * @param row
	 * @throws SQLException
	 * @throws IOException 
	 */
	protected void populate(ResultSet row) throws SQLException, IOException
	{
		m_id.assignValue(row, 1);
		m_jobhandle.assignValue(row, 2);
		m_eventDate.assignValue(row, 3);	
		m_taskStage.assignValue(row, 4);	
		m_eventName.assignValue(row, 5);
		m_eventValue.assignValue(row, 6);
	}

}

