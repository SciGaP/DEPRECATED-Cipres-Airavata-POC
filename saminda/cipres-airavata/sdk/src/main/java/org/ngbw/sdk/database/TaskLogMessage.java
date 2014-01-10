/*
 * TaskLogMessage.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.core.shared.TaskRunStage;
import org.ngbw.sdk.tool.Tool;


/**
 *
 * @author Paul Hoover
 *
 */
public class TaskLogMessage extends Row implements Comparable<TaskLogMessage> {

	private static final String TABLE_NAME = "task_log_messages";
	private static final String COLUMN_NAMES = TABLE_NAME + ".TASK_ID, " + TABLE_NAME + ".MESSAGE_INDEX, " +
			TABLE_NAME + ".CREATION_DATE, " + TABLE_NAME + ".STAGE, " + TABLE_NAME + ".ERROR, " + TABLE_NAME + ".MESSAGE";

	private LongColumn m_taskId = new LongColumn(TABLE_NAME + ".TASK_ID", false);
	private IntegerColumn m_messageIndex = new IntegerColumn(TABLE_NAME + ".MESSAGE_INDEX", false);
	private DateColumn m_creationDate = new DateColumn(TABLE_NAME + ".CREATION_DATE", false);
	private StringColumn m_stage = new StringColumn(TABLE_NAME + ".STAGE", false, 20);
	private BooleanColumn m_error = new BooleanColumn(TABLE_NAME + ".ERROR", false);
	private TextColumn m_message = new TextColumn(TABLE_NAME + ".MESSAGE", true, this);
	private String m_jobHandle;

	private static final Log log = LogFactory.getLog(TaskLogMessage.class);


	// constructors


	public TaskLogMessage(Task owner)
	{
		super(TABLE_NAME);

		if (owner.isNew())
			throw new WorkbenchException("Can't create a log message for an unpersisted task");

		setError(false);
		setTaskId(owner.getTaskId());
		setJobHandle(owner.getJobHandle());

		m_creationDate.setValue(Calendar.getInstance().getTime());

//		log.debug(" ************************************************************** CALL Consrtructor 1 **********");
	}

	public TaskLogMessage(long taskId, int messageIndex) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_taskId.assignValue(taskId);
		m_messageIndex.assignValue(messageIndex);

		refresh();
//		log.debug(" ************************************************************** CALL Consrtructor 2 **********");
	}

	private TaskLogMessage(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
//		log.debug(" ************************************************************** CALL Consrtructor 3 **********");
	}

	public TaskLogMessage()
	{
		super(TABLE_NAME);
//		log.debug(" ************************************************************** CALL Consrtructor 4 **********");
	}


	// public methods


	public long getTaskId()
	{
		return m_taskId.getValue();
	}

	public int getMessageIndex()
	{
		return m_messageIndex.getValue();
	}

	public Date getCreationDate()
	{
		return m_creationDate.getValue();
	}

	public TaskRunStage getStage()
	{
		return TaskRunStage.valueOf(m_stage.getValue());
	}

	public void setStage(TaskRunStage stage)
	{
		m_stage.setValue(stage.toString());
	}

	public boolean isError()
	{
		return m_error.getValue();
	}

	public void setError(Boolean error)
	{
		m_error.setValue(error);
	}

	public String getMessage() throws IOException, SQLException
	{
		return m_message.getValue();
	}

	public Reader getMessageAsStream() throws IOException, SQLException
	{
		return new InputStreamReader(m_message.getValueAsStream());
	}

	public void setMessage(String message)
	{
		m_message.setValue(message);
	}

	public boolean isNew()
	{
		return m_taskId.isNull() || m_messageIndex.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof TaskLogMessage == false)
			return false;

		TaskLogMessage otherMessage = (TaskLogMessage) other;

		if (isNew() || otherMessage.isNew())
			return false;

		return getTaskId() == otherMessage.getTaskId() && getMessageIndex() == otherMessage.getMessageIndex();
	}

	@Override
	public int hashCode()
	{
		int hash = 31 + (new Long(getTaskId())).hashCode();

		return 31 * hash + (new Integer(getMessageIndex())).hashCode();
	}

	public int compareTo(TaskLogMessage other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		int comparison = (int) (getTaskId() - other.getTaskId());

		if (comparison != 0)
			return comparison;

		return (int) (getMessageIndex() - other.getMessageIndex());
	}

	@Override
	public String toString()
	{
		//log.debug("UUUUUUUUUU CALL  class: TaskLogMessage  method: toString   -   beginning of the method");
		try {
			StringBuilder messageBuilder = new StringBuilder();
			DateFormat dateFormatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");

			messageBuilder.append(dateFormatter.format(m_creationDate.getValue()));
			messageBuilder.append(" > ");
			messageBuilder.append(m_stage.getValue());
			messageBuilder.append(m_error.getValue() ? " : ERROR : " : " : SUCCESS : ");
			messageBuilder.append(m_jobHandle);
			messageBuilder.append(" : ");
			messageBuilder.append(m_message.getValue());
			messageBuilder.append("\n");

			//log.debug("**** CALL  class: TaskLogMessage  method: toString | messageBuilder.toString(): " + messageBuilder.toString());

			return messageBuilder.toString();

		}
		catch (Exception err) {
			throw new RuntimeException(err);
		}
	}


	// package methods


	void setTaskId(Long taskId)
	{
		m_taskId.setValue(taskId);
	}

	void setJobHandle(String jobHandle)
	{
		m_jobHandle = jobHandle;
	}

	Criterion getKey()
	{
		return new CompositeKey(m_taskId, m_messageIndex);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
//		log.debug(" ************************** CALL: TaskLogMessage   method: save **********");

		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			m_messageIndex.setValue(getNextMessageIndex(dbConn));

			colList.add(m_taskId);
			colList.add(m_messageIndex);
			colList.add(m_creationDate);
			colList.add(m_stage);
			colList.add(m_error);
			colList.add(m_message);

			insert(dbConn, null, colList);
		}
		else {
			if (m_stage.isModified())
				colList.add(m_stage);

			if (m_error.isModified())
				colList.add(m_error);

			if (m_message.isModified())
				colList.add(m_message);

			update(dbConn, colList);
		}
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_taskId.getValue(), m_messageIndex.getValue());

		m_taskId.reset();
		m_messageIndex.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_jobHandle = getJobHandle(dbConn);
	}

	static List<TaskLogMessage> findLogMessages(long taskId) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet messageRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES + ", tasks.JOBHANDLE " +
					"FROM tasks " +
						"INNER JOIN " + TABLE_NAME + " ON tasks.TASK_ID = " + TABLE_NAME + ".TASK_ID " +
					"WHERE tasks.TASK_ID = ? ORDER BY " + TABLE_NAME + ".MESSAGE_INDEX");

			selectStmt.setLong(1, taskId);

			messageRows = selectStmt.executeQuery();

			List<TaskLogMessage> messages = new ArrayList<TaskLogMessage>();

			while (messageRows.next())
				messages.add(new TaskLogMessage(messageRows));

			return messages;
		}
		finally {
			if (messageRows != null)
				messageRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	static void delete(Connection dbConn, long taskId, int messageIndex) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE TASK_ID = ? AND MESSAGE_INDEX = ?");

		try {
			deleteStmt.setLong(1, taskId);
			deleteStmt.setInt(2, messageIndex);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate **********");
		m_taskId.assignValue(row, 1);
		m_messageIndex.assignValue(row, 2);
		m_creationDate.assignValue(row, 3);
		m_stage.assignValue(row, 4);
		m_error.assignValue(row, 5);
		m_message.assignValue(row, 6);

		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  **********  m_taskId:       " + m_taskId);
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  **********  m_messageIndex: " + m_messageIndex);
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  **********  m_creationDate: " + m_creationDate);
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  **********  m_stage:        " + m_stage);
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  **********  m_error:        " + m_error);
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  **********  m_message:      " + m_message);
		//log.debug(" ************************** CALL  TaskLogMessage   method: populate  Try to create string for my db table **********");
		StringColumn jobStatus = m_stage;
		TaskRunStage jobStatus2 = getStage();
		try {
			String jobStatus3 = getMessage();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (row.getMetaData().getColumnCount() >= 7)
			m_jobHandle = row.getString(7);
	}


	// private methods


	private int getNextMessageIndex(Connection dbConn) throws IOException, SQLException
	{
//		log.debug(" ************************** CALL TaskLogMessage   method: getNextMessageIndex  m_taskId: " + m_taskId );

		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT MAX(MESSAGE_INDEX) FROM " + TABLE_NAME + " WHERE TASK_ID = ?");
		ResultSet indexRow = null;

//		log.debug(" ************************** CALL  MAYBE THIS IS HOW TO GET ALL THE DIFFERENT MESSAGES???? | m_taskId: " + m_taskId );
//		log.debug(" ********************* CALL TaskLogMessage   method: getNextMessageIndex  | selectStmt: " + selectStmt );


		try {
			m_taskId.setParameter(selectStmt, 1);

//			log.debug(" ************************** CALL TaskLogMessage   method: getNextMessageIndex | m_taskId " + m_taskId);

			indexRow = selectStmt.executeQuery();

			if (!indexRow.next())
				return 0;

			return indexRow.getInt(1) + 1;
		}
		finally {
			if (indexRow != null)
				indexRow.close();

			selectStmt.close();
		}
	}

	private String getJobHandle(Connection dbConn) throws IOException, SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT JOBHANDLE FROM tasks WHERE TASK_ID = ?");
		ResultSet handleRow = null;

		try {
			m_taskId.setParameter(selectStmt, 1);

			handleRow = selectStmt.executeQuery();

			if (!handleRow.next())
				return null;

			return handleRow.getString(1);
		}
		finally {
			if (handleRow != null)
				handleRow.close();

			selectStmt.close();
		}
	}
}
