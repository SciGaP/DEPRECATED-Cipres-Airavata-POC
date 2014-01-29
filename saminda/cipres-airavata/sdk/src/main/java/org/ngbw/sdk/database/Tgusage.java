/*
 * Tgusage.java
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.ngbw.sdk.WorkbenchException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



/**
 *
 * @author Terri Liebowitz Schwartz
 *
 */
public class Tgusage extends Row implements Comparable<Tgusage>
{
	private static final Log log = LogFactory.getLog(Tgusage.class.getName());

	/**
	 *
	 */

	private static final String TABLE_NAME = "tgusage";
	private static final String COLUMN_NAMES =
			TABLE_NAME + ".TGUSAGE_ID, " +
			TABLE_NAME + ".RESOURCE, " +
			TABLE_NAME + ".JOBID, " +
			TABLE_NAME + ".FULL_JOBID, " +
			TABLE_NAME + ".FULL_RESOURCE, " +
			TABLE_NAME + ".CHARGE, " +
			TABLE_NAME + ".START_TIME, " +
			TABLE_NAME + ".ENDTIME, " +
			TABLE_NAME + ".SUBMIT_TIME, " +
			TABLE_NAME + ".CHARGE_NUMBER, " +
			TABLE_NAME + ".WALL_HRS, " +
			TABLE_NAME + ".SU, " +
			TABLE_NAME + ".NODECOUNT, " +
			TABLE_NAME + ".PROCESSORS, " +
			TABLE_NAME + ".QUEUE ";

	private static DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss z");


	// not-null = false, nullable = true
	private LongColumn m_tgusage_id = new LongColumn(TABLE_NAME + ".TGUSAGE_ID", false);
	private StringColumn m_resource = new StringColumn(TABLE_NAME + ".RESOURCE", false, 100);
	private StringColumn m_jobid = new StringColumn(TABLE_NAME + ".JOBID", false, 100);
	private StringColumn m_full_jobid = new StringColumn(TABLE_NAME + ".FULL_JOBID", false, 255);
	private StringColumn m_full_resource = new StringColumn(TABLE_NAME + ".FULL_RESOURCE", false, 255);
	private IntegerColumn m_charge = new IntegerColumn(TABLE_NAME + ".CHARGE", false);
	private DateColumn m_start_time = new DateColumn(TABLE_NAME + ".START_TIME", false);
	private DateColumn m_end_time = new DateColumn(TABLE_NAME + ".END_TIME", false);
	private DateColumn m_submit_time = new DateColumn(TABLE_NAME + ".SUBMIT_TIME", false);
	private StringColumn m_charge_number = new StringColumn(TABLE_NAME + ".CHARGE_NUMBER", false, 100);
	private StringColumn m_wall_hrs = new StringColumn(TABLE_NAME + ".WALL_HRS", false, 10);
	private IntegerColumn m_su = new IntegerColumn(TABLE_NAME + ".SU", false);
	private IntegerColumn m_nodecount = new IntegerColumn(TABLE_NAME + ".NODECOUNT", false);
	private IntegerColumn m_processors = new IntegerColumn(TABLE_NAME + ".PROCESSORS", false);
	private StringColumn m_queue = new StringColumn(TABLE_NAME + ".QUEUE", false, 100);


	// constructors
	public Tgusage()
	{
		super(TABLE_NAME);
	}

	// retrieve a record based on it's id and populate a Tgusage object.
	public Tgusage(long id) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_tgusage_id.assignValue(id);
		refresh();
	}

	// populate a Tgusage object from a database row.
	private Tgusage(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);
		populate(row);
	}

	/**
		Can throw field index out of bounds or parsing exceptions
	*/
	public Tgusage(String fields[]) throws Exception
	{
		super(TABLE_NAME);

		// We match Tgusage rows with Statistic and maybe RunningTask rows based on the resource and jobid
		// so we need to make sure the resource names and the job id format that we get from the tgusage
		// database is mapped to what the cipres tables use.
		setResource(toCipresResource(fields[0]));
		setFullResource(fields[0]);

		setJobid(toCipresJobid(fields[1]));
		setFullJobid(fields[1]);

		setCharge(toInt(fields[2]));

		// need to convert 2010-07-03 08:14:58-07 type string to a Date object
		setStartTime(toDate(fields[3]));
		setEndTime(toDate(fields[4]));
		setSubmitTime(toDate(fields[5]));

		setChargeNumber(fields[6]);
		setWallHrs(fields[7]);

		setSu(toInt(fields[8]));
		setNodeCount(toInt(fields[9]));
		setProcessors(toInt(fields[10]));

		setQueue(fields[11]);
	}

	int toInt(String str)
	{
		try
		{
			return Integer.parseInt(str);
		}
		catch (Exception e)
		{
			return 0;
		}
	}

	// Job Ids on the hosts we use tend to have the format number.host.  We just store the numeric part
	// since systems seem to change the host part on occassion and remote qstat, etc commands seem to
	// accept just the numeric part.
	private String toCipresJobid(String s)
	{
		int dot = s.indexOf('.');
		return (dot == -1) ? s : s.substring(0, dot);
	}

	// Looks like resource name in tgusage records happens to be fully qualified host name
	// and fortunately for teragrid machines we use just the unqualifed hostname, lowercase,
	// so we should match up like this.
	private String toCipresResource(String s)
	{
		int dot = s.indexOf('.');
		return (dot == -1) ? s : s.substring(0, dot);
	}

	private Date toDate(String s) throws java.text.ParseException
	{
		return dateFormat.parse(s);
	}



	// public methods

	public long getTgusageId()
	{
		return m_tgusage_id.getValue();
	}

	public String getResource() { return m_resource.getValue(); }
	public void setResource(String i) { m_resource.setValue(i); }

	public String getJobid() { return m_jobid.getValue(); }
	public void setJobid(String i) { m_jobid.setValue(i); }

	public String getFullJobid() { return m_full_jobid.getValue(); }
	public void setFullJobid(String i) { m_full_jobid.setValue(i); }

	public String getFullResource() { return m_full_resource.getValue(); }
	public void setFullResource(String i) { m_full_resource.setValue(i); }

	public int getCharge() { return m_charge.getValue(); }
	public void setCharge(int i) { m_charge.setValue(i); }

	public Date getStartTime() { return m_start_time.getValue(); }
	public void setStartTime(Date i) { m_start_time.setValue(i); }

	public Date getEndTime() { return m_end_time.getValue(); }
	public void setEndTime(Date i) { m_end_time.setValue(i); }

	public Date getSubmitTime() { return m_submit_time.getValue(); }
	public void setSubmitTime(Date i) { m_submit_time.setValue(i); }

	public String getChargeNumber() { return m_charge_number.getValue(); }
	public void setChargeNumber(String i) { m_charge_number.setValue(i); }

	public String getWallHhrs() { return m_wall_hrs.getValue(); }
	public void setWallHrs(String i) { m_wall_hrs.setValue(i); }

	public int getSu() { return m_su.getValue(); }
	public void setSu(int i) { m_su.setValue(i); }

	public int getNodeCount() { return m_nodecount.getValue(); }
	public void setNodeCount(int i) { m_nodecount.setValue(i); }

	public int getProcessors() { return m_processors.getValue(); }
	public void setProcessors(int i) { m_processors.setValue(i); }

	public String getQueue() { return m_queue.getValue(); }
	public void setQueue(String i) { m_queue.setValue(i); }


	public boolean isNew()
	{
		return m_tgusage_id.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof Tgusage == false)
			return false;

		Tgusage otherTgusage = (Tgusage) other;

		if (isNew() || otherTgusage.isNew())
			return false;

		return getTgusageId() == otherTgusage.getTgusageId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getTgusageId())).hashCode();
	}

	public int compareTo(Tgusage other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getTgusageId() - other.getTgusageId());
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_tgusage_id);
	}


	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_resource);
			colList.add(m_jobid);
			colList.add(m_full_jobid);
			colList.add(m_full_resource);
			colList.add(m_charge);
			colList.add(m_start_time);
			colList.add(m_end_time);
			colList.add(m_submit_time);
			colList.add(m_charge_number);
			colList.add(m_wall_hrs);
			colList.add(m_su);
			colList.add(m_nodecount);
			colList.add(m_processors);
			colList.add(m_queue);

			insert(dbConn, new AutoGeneratedKey(m_tgusage_id), colList);

		}
		else {
			if (m_resource.isModified())
				colList.add(m_resource);

			if (m_jobid.isModified())
				colList.add(m_jobid);

			if (m_full_jobid.isModified())
				colList.add(m_full_jobid);

			if (m_resource.isModified())
				colList.add(m_resource);

			if (m_charge.isModified())
				colList.add(m_charge);

			if (m_start_time.isModified())
				colList.add(m_start_time);

			if (m_end_time.isModified())
				colList.add(m_end_time);

			if (m_submit_time.isModified())
				colList.add(m_submit_time);

			if (m_charge_number.isModified())
				colList.add(m_charge_number);

			if (m_wall_hrs.isModified())
				colList.add(m_wall_hrs);

			if (m_su.isModified())
				colList.add(m_su);

			if (m_nodecount.isModified())
				colList.add(m_nodecount);

			if (m_processors.isModified())
				colList.add(m_processors);

			if (m_queue.isModified())
				colList.add(m_queue);

			update(dbConn, colList);
		}
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_tgusage_id.getValue());

		m_tgusage_id.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);
	}


	static void delete(Connection dbConn, long tgusage_id) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE TGUSAGE_ID = ?");

		try {
			deleteStmt.setLong(1, tgusage_id);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	public static List<Tgusage> findTgusage(String resource, String jobid) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");
		stmtBuilder.append(" RESOURCE = ? AND JOBID = ?");

		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet tgusageRows = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());
			selectStmt.setString(1, resource);
			selectStmt.setString(2, jobid);

			tgusageRows = selectStmt.executeQuery();
			List<Tgusage> retval = new ArrayList<Tgusage>();
			while (tgusageRows.next())
				retval.add(new Tgusage(tgusageRows));

			return retval;
		}
		finally {
			if (tgusageRows != null)
				tgusageRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}




	static List<Tgusage> findTgusage(Criterion key) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");

		stmtBuilder.append(key.getPhrase());

		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet tgusageRows = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());

			key.setParameter(selectStmt, 1);

			tgusageRows = selectStmt.executeQuery();

			List<Tgusage> retval = new ArrayList<Tgusage>();

			while (tgusageRows.next())
				retval.add(new Tgusage(tgusageRows));

			return retval;
		}
		finally {
			if (tgusageRows != null)
				tgusageRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}



	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_tgusage_id.assignValue(row, 1);
		m_resource.assignValue(row, 2);
		m_jobid.assignValue(row, 3);
		m_full_jobid.assignValue(row, 4);
		m_resource.assignValue(row, 5);
		m_charge.assignValue(row, 6);
		m_start_time.assignValue(row, 7);
		m_end_time.assignValue(row, 8);
		m_submit_time.assignValue(row, 9);
		m_charge_number.assignValue(row, 10);
		m_wall_hrs.assignValue(row, 11);
		m_su.assignValue(row, 12);
		m_nodecount.assignValue(row, 13);
		m_processors.assignValue(row, 14);
		m_queue.assignValue(row, 15);
	}

	// private methods

}
