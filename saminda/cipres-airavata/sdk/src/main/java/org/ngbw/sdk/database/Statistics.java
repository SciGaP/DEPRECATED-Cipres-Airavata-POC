/*
 * Statistics.java
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


public class Statistics extends Row implements Comparable<Statistics>
{
	private static final Log log = LogFactory.getLog(Statistics.class.getName());

	private boolean m_isNew = true;

	private static final String TABLE_NAME   = "job_stats";
	private static final String COLUMN_NAMES =	TABLE_NAME + ".JOBHANDLE, " + 
												TABLE_NAME + ".RESOURCE, " + 
												TABLE_NAME + ".TOOL_ID, " + 
												TABLE_NAME + ".TASK_ID, " + 
												TABLE_NAME + ".USER_ID, " + 
												TABLE_NAME + ".EMAIL, " + 
												TABLE_NAME + ".SUBMITTER, " + 
												TABLE_NAME + ".TG_CHARGE_NUMBER, " + 
												TABLE_NAME + ".DATE_ENTERED, " +
												TABLE_NAME + ".REMOTE_JOB_ID, " +
												TABLE_NAME + ".DATE_SUBMITTED, "  +
												TABLE_NAME + ".DATE_TERMINATED "; 
                                                                                         
	// false = NOT NULL
	private final StringColumn	m_jobhandle		= new StringColumn(TABLE_NAME + ".JOBHANDLE", false, 255); 
	private final StringColumn	m_resource		= new StringColumn(TABLE_NAME + ".RESOURCE", false, 100); 
	private final StringColumn	m_toolId			= new StringColumn(TABLE_NAME + ".TOOL_ID", false, 100); 
	private final LongColumn	m_taskId        	= new LongColumn(TABLE_NAME + ".TASK_ID", false);
	private final LongColumn	m_userId        	= new LongColumn(TABLE_NAME + ".USER_ID", false);
	private final StringColumn	m_email			= new StringColumn(TABLE_NAME + ".EMAIL", false, 100); 
	private final StringColumn	m_submitter		= new StringColumn(TABLE_NAME + ".SUBMITTER", false, 1023); 
	private final StringColumn	m_tgChargeNumber	= new StringColumn(TABLE_NAME + ".TG_CHARGE_NUMBER", true, 100); 
	private final DateColumn	m_dateEntered	= new DateColumn(TABLE_NAME + ".DATE_ENTERED", false);
	private final StringColumn	m_remoteJobId	= new StringColumn(TABLE_NAME + ".REMOTE_JOB_ID", true, 1023);
	private final DateColumn	m_dateSubmitted	= new DateColumn(TABLE_NAME + ".DATE_SUBMITTED", true);
	private final DateColumn	m_dateTerminated	= new DateColumn(TABLE_NAME + ".DATE_TERMINATED", true);

	private static final Log m_log = LogFactory.getLog(Statistics.class.getName());
	

	public static Statistics find(String jobhandle) throws IOException, SQLException
	{
		Statistics s = new Statistics();
		s.m_jobhandle.setValue(jobhandle);
		try
		{
			s.refresh();
			return s;
		}
        catch (NotExistException nee)
        {
            return null;
        }
	}

	// constructors
	private Statistics () throws IOException, SQLException
	{
		super(TABLE_NAME);
		m_isNew = false;
	}

	// Creates a new object (jobhandle must not be in db yet or save() will fail).
	// Todo: this is really hokey but I'm just passing in the Task as a way to 
	// distinguish this ctor from the one above.
	public Statistics(String jobhandle, Task task) throws SQLException, IOException
	{
		super(TABLE_NAME);
		m_jobhandle.assignValue(jobhandle);
		m_dateEntered.assignValue(new Date());
		m_taskId.assignValue(task.getTaskId());
		m_toolId.assignValue(task.getToolId());
		m_userId.assignValue(task.getUserId());
		m_email.assignValue((new User(task.getUserId())).getEmail());
	}

	// Poplulates this object from specified ResultSet.
	public Statistics(ResultSet rs) throws IOException, SQLException
	{
		super(TABLE_NAME);
		populate(rs);
		m_isNew = false;
	}


	// public methods

	public String getJobhandle()
	{
		return m_jobhandle.getValue();
	}


	public String getResource()
	{
		return m_resource.getValue();
	}
	public void setResource(String i)
	{
		m_resource.setValue(i);
	}

	public String getToolId()
	{
		return m_toolId.getValue();
	}
	public void setToolId(String i)
	{
		m_toolId.setValue(i);
	}


	public long getTaskId()
	{
		return m_taskId.getValue();
	}
	public void setTaskId(long i)
	{
		m_taskId.setValue(i);
	}

	public long getUserId()
	{
		return m_userId.getValue();
	}
	public void setUserId(long i)
	{
		m_userId.setValue(i);
	}


	public String getEmail()
	{
		return m_email.getValue();
	}
	public void setEmail(String i)
	{
		m_email.setValue(i);
	}

	public String getSubmitter()
	{
		return m_submitter.getValue();
	}
	public void setSubmitter(String i)
	{
		m_submitter.setValue(i);
	}

	

	public String getTgChargeNumber()
	{
		return m_tgChargeNumber.getValue();
	}
	public void setTgChargeNumber(String i)
	{
		m_tgChargeNumber.setValue(i);
	}

	public Date getDateEntered()
	{
		return m_dateEntered.getValue();
	}
	public void setDateEntered(Date i)
	{
		m_dateEntered.setValue(i);
	}

	public String getRemoteJobId()
	{
		return m_remoteJobId.getValue();
	}
	public void setRemoteJobId(String i)
	{
		m_remoteJobId.setValue(i);
	}

	public Date getDateSubmitted()
	{
		return m_dateSubmitted.getValue();
	}
	public void setDateSubmitted(Date i)
	{
		m_dateSubmitted.setValue(i);
	}
	public Date getDateTerminated()
	{
		return m_dateTerminated.getValue();
	}
	public void setDateTerminated(Date i)
	{
		m_dateTerminated.setValue(i);
	}

	public Task getTask() throws IOException, SQLException
	{
		if (m_taskId.isNull()) {
			return null;
		}
		return new Task(m_taskId.getValue());
	}
	

	/**
	 * Indicates whether or not the object has been persisted.
	 *
	 * @return <code>true</code> if the object has not been persisted
	 */
	public boolean isNew()
	{
		return m_isNew; 
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

		if (other instanceof Statistics == false)
			return false;

		Statistics otherRow = (Statistics) other;

		// an object that hasn't been persisted can only be equal to itself
		if (isNew() || otherRow.isNew())
			return false;

		return getJobhandle().equals(otherRow.getJobhandle());
	}

	/**
	 * @return
	 */
	@Override
	public int hashCode()
	{
		return (new String(getJobhandle())).hashCode();
	}

	/**
	 *
	 * @param other
	 * @return
	 */
	public int compareTo(Statistics other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return  0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getJobhandle().compareTo(other.getJobhandle()));
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
		return new SimpleKey(m_jobhandle);
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
			colList.add(m_resource);	
			colList.add(m_toolId);
			colList.add(m_taskId);
			colList.add(m_userId);
			colList.add(m_email);
			colList.add(m_submitter);		
			colList.add(m_tgChargeNumber);	
			colList.add(m_dateEntered	);
			colList.add(m_remoteJobId	);
			colList.add(m_dateSubmitted	);
			colList.add(m_dateTerminated);
			
			insert(dbConn, null, colList);

			// TODO: really this should be done after transaction is saved, but I think
			// we're OK since we don't keep using the object after and db exception is thrown.
			m_isNew = false; 
		}
		else { 
			if (m_resource.isModified())
				colList.add(m_resource);	
			if (m_toolId.isModified())
				colList.add(m_toolId);
			if (m_taskId.isModified())
				colList.add(m_taskId);
			if (m_userId.isModified())
				colList.add(m_userId);
			if (m_email.isModified())
				colList.add(m_email);
			if (m_submitter.isModified())
				colList.add(m_submitter);		
			if (m_tgChargeNumber.isModified())
				colList.add(m_tgChargeNumber);	
			if (m_dateEntered.isModified())
				colList.add(m_dateEntered	);
			if (m_remoteJobId.isModified())
				colList.add(m_remoteJobId	);
			if (m_dateSubmitted.isModified())
				colList.add(m_dateSubmitted	);
			if (m_dateTerminated.isModified())
				colList.add(m_dateTerminated	);

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

		delete(dbConn, m_jobhandle.getValue());

		m_jobhandle.reset();
		m_isNew = true;
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
	public void delete(Connection dbConn, String exampleId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE JOBHANDLE = ?");

		try {
			deleteStmt.setString(1, exampleId);

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
		m_jobhandle.assignValue(row, 1);	
		m_resource.assignValue(row, 2);	
		m_toolId.assignValue(row, 3);
		m_taskId.assignValue(row, 4);
		m_userId.assignValue(row, 5);
		m_email.assignValue(row, 6);
		m_submitter.assignValue(row, 7);		
		m_tgChargeNumber.assignValue(row, 8);	
		m_dateEntered.assignValue(row, 9);
		m_remoteJobId.assignValue(row, 10);
		m_dateSubmitted.assignValue(row, 11);
		m_dateTerminated.assignValue(row, 12);
		m_isNew = false;
	}

	
	
	public static List<Statistics> findAllStatistics() throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet statisticsRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME);
			statisticsRows = selectStmt.executeQuery();

			List<Statistics> list = new ArrayList<Statistics>();

			while (statisticsRows.next())
				list.add(new Statistics(statisticsRows));

			return list;
		}
		finally {
			if (statisticsRows != null)
				statisticsRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

}

