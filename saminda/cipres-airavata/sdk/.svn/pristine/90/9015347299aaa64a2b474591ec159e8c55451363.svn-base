/*
 * Task.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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
public class Task extends VersionedRow implements FolderItem, Comparable<Task> {
	private static final Log log = LogFactory.getLog(Task.class);

	/**
	 *
	 */
	private class AddPropertyOp implements RowOperation {

		private final String m_property;
		private final String m_value;


		// constructors


		protected AddPropertyOp(String property, String value)
		{
			if (property == null)
				throw new NullPointerException("property");

			m_property = property;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO task_properties (TASK_ID, PROPERTY, VALUE) VALUES (?, ?, ?)");

			try {
				m_taskId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_property);

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
	private class SetPropertyOp implements RowOperation {

		private final String m_property;
		private final String m_value;


		// constructors


		protected SetPropertyOp(String property, String value)
		{
			if (property == null)
				throw new NullPointerException("property");

			m_property = property;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement updateStmt = dbConn.prepareStatement("UPDATE task_properties SET VALUE = ? WHERE TASK_ID = ? AND PROPERTY = ?");

			try {
				if (m_value != null)
					updateStmt.setString(1, m_value);
				else
					updateStmt.setNull(1, Types.VARCHAR);

				m_taskId.setParameter(updateStmt, 2);
				updateStmt.setString(3, m_property);

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
	private class RemovePropertyOp implements RowOperation {

		private final String m_property;


		// constructors


		protected RemovePropertyOp(String property)
		{
			if (property == null)
				throw new NullPointerException("property");

			m_property = property;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM task_properties WHERE TASK_ID = ? AND PROPERTY = ?");

			try {
				m_taskId.setParameter(deleteStmt, 1);
				deleteStmt.setString(2, m_property);

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
	private class RemoveAllPropertiesOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws SQLException
		{
			deleteTaskProps(dbConn, m_taskId.getValue());
		}
	}

	/**
	 *
	 */
	private class PropertyMap extends MonitoredMap<String, String> {

		// constructors


		protected PropertyMap(Map<String, String> propMap)
		{
			super(propMap);
		}


		// protected methods


		protected void addMapPutOp(String key, String value)
		{
			m_opQueue.add(new AddPropertyOp(key, value));
		}

		protected void addMapSetOp(String key, String oldValue, String newValue)
		{
			m_opQueue.add(new SetPropertyOp(key, newValue));
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemovePropertyOp(key));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllPropertiesOp());
		}
	}

	/**
	 *
	 */
	private class AddParameterOp implements RowOperation {

		private final String m_parameter;
		private final String m_value;


		// constructors


		protected AddParameterOp(String parameter, String value)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_parameter = parameter;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO tool_parameters (TASK_ID, PARAMETER, VALUE) VALUES (?, ?, ?)");

			try {
				m_taskId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_parameter);

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
	private class SetParameterOp implements RowOperation {

		private final String m_parameter;
		private final String m_value;


		// constructors


		protected SetParameterOp(String parameter, String value)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_parameter = parameter;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement updateStmt = dbConn.prepareStatement("UPDATE tool_parameters SET VALUE = ? WHERE TASK_ID = ? AND PARAMETER = ?");

			try {
				if (m_value != null)
					updateStmt.setString(1, m_value);
				else
					updateStmt.setNull(1, Types.VARCHAR);

				m_taskId.setParameter(updateStmt, 2);
				updateStmt.setString(3, m_parameter);

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
	private class RemoveParameterOp implements RowOperation {

		private final String m_parameter;


		// constructors


		protected RemoveParameterOp(String parameter)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_parameter = parameter;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM tool_parameters WHERE TASK_ID = ? AND PARAMETER = ?");

			try {
				m_taskId.setParameter(deleteStmt, 1);
				deleteStmt.setString(2, m_parameter);

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
	private class RemoveAllParametersOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws SQLException
		{
			deleteToolParams(dbConn, m_taskId.getValue());
		}
	}

	/**
	 *
	 */
	private class ParameterMap extends MonitoredMap<String, String> {

		// constructors


		protected ParameterMap(Map<String, String> paramMap)
		{
			super(paramMap);
		}


		// protected methods


		protected void addMapPutOp(String key, String value)
		{
			m_opQueue.add(new AddParameterOp(key, value));
		}

		protected void addMapSetOp(String key, String oldValue, String newValue)
		{
			m_opQueue.add(new SetParameterOp(key, newValue));
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemoveParameterOp(key));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllParametersOp());
		}
	}

	/**
	 *
	 */
	private class AddInputOp implements RowOperation {

		private final String m_parameter;
		private final List<TaskInputSourceDocument> m_value;


		// constructors


		protected AddInputOp(String parameter, List<TaskInputSourceDocument> value)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_parameter = parameter;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			long inputId = insertInputParam(dbConn);

			for (Iterator<TaskInputSourceDocument> inputDocs = m_value.iterator() ; inputDocs.hasNext() ; ) 
			{
				TaskInputSourceDocument doc = inputDocs.next();

				doc.setInputId(inputId);

				doc.save(dbConn);
			}
		}


		// private methods


		private long insertInputParam(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO task_input_parameters (TASK_ID, PARAMETER) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
			ResultSet newKey = null;

			try {
				m_taskId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_parameter);

				insertStmt.executeUpdate();

				newKey = insertStmt.getGeneratedKeys();


				if (!newKey.next())
					return 0;

				return newKey.getLong(1);
			}
			finally {
				if (newKey != null)
					newKey.close();

				insertStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveInputOp implements RowOperation {

		private final String m_parameter;


		// constructors


		protected RemoveInputOp(String parameter)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_parameter = parameter;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement selectStmt = dbConn.prepareStatement("SELECT INPUT_ID FROM task_input_parameters WHERE PARAMETER = ? AND TASK_ID = ?");
			ResultSet inputRow = null;

			try {
				selectStmt.setString(1, m_parameter);
				m_taskId.setParameter(selectStmt, 2);

				inputRow = selectStmt.executeQuery();

				while (inputRow.next())
					TaskInputParameter.delete(dbConn, inputRow.getLong(1));
			}
			finally {
				if (inputRow != null)
					inputRow.close();

				selectStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveAllInputOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws SQLException
		{
			deleteInputParams(dbConn, m_taskId.getValue());
		}
	}

	/**
	 *
	 */
	private class InputMap extends MonitoredMap<String, List<TaskInputSourceDocument>> {

		// constructors


		protected InputMap(Map<String, List<TaskInputSourceDocument>> inputMap)
		{
			super(inputMap);
		}


		// protected methods


		protected void addMapPutOp(String key, List<TaskInputSourceDocument> value)
		{
			m_opQueue.add(new AddInputOp(key, value));
		}

		protected void addMapSetOp(String key, List<TaskInputSourceDocument> oldValue, List<TaskInputSourceDocument> newValue)
		{
			throw new UnsupportedOperationException();
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemoveInputOp(key));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllInputOp());
		}
	}

	/**
	 *
	 */
	private class AddOutputOp implements RowOperation {

		private final boolean m_intermediate;
		private final String m_parameter;
		private final List<TaskOutputSourceDocument> m_value;


		// constructors


		protected AddOutputOp(String parameter, List<TaskOutputSourceDocument> value, boolean intermediate)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_intermediate = intermediate;
			m_parameter = parameter;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			long outputId = insertOutputParam(dbConn);

			for (Iterator<TaskOutputSourceDocument> outputDocs = m_value.iterator() ; outputDocs.hasNext() ; ) {
				TaskOutputSourceDocument doc = outputDocs.next();

				doc.setOutputId(outputId);

				doc.save(dbConn);
			}
		}


		// private methods


		private long insertOutputParam(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO task_output_parameters (TASK_ID, PARAMETER, INTERMEDIATE) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
			ResultSet newKey = null;

			try {
				m_taskId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_parameter);
				insertStmt.setBoolean(3, m_intermediate);

				insertStmt.executeUpdate();

				newKey = insertStmt.getGeneratedKeys();

				if (!newKey.next())
					return 0;

				return newKey.getLong(1);
			}
			finally {
				if (newKey != null)
					newKey.close();

				insertStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveOutputOp implements RowOperation {

		private final boolean m_intermediate;
		private final String m_parameter;


		// constructors


		protected RemoveOutputOp(String parameter, boolean intermediate)
		{
			if (parameter == null)
				throw new NullPointerException("parameter");

			m_intermediate = intermediate;
			m_parameter = parameter;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement selectStmt = dbConn.prepareStatement("SELECT OUTPUT_ID FROM task_output_parameters WHERE TASK_ID = ? AND PARAMETER = ? AND INTERMEDIATE = ?");
			ResultSet outputRow = null;

			try {
				m_taskId.setParameter(selectStmt, 1);
				selectStmt.setString(2, m_parameter);
				selectStmt.setBoolean(3, m_intermediate);

				outputRow = selectStmt.executeQuery();

				while (outputRow.next())
					TaskOutputParameter.delete(dbConn, outputRow.getLong(1));
			}
			finally {
				if (outputRow != null)
					outputRow.close();

				selectStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class RemoveAllOutputOp implements RowOperation {

		private final boolean m_intermediate;


		// constructors


		public RemoveAllOutputOp(boolean intermediate)
		{
			m_intermediate = intermediate;
		}


		// public methods


		public void execute(Connection dbConn) throws SQLException, IOException
		{
			PreparedStatement selectStmt = dbConn.prepareStatement("SELECT OUTPUT_ID FROM task_output_parameters WHERE TASK_ID = ? AND INTERMEDIATE = ?");
			ResultSet paramRows = null;

			try {
				m_taskId.setParameter(selectStmt, 1);
				selectStmt.setBoolean(2, m_intermediate);

				paramRows = selectStmt.executeQuery();

				while (paramRows.next())
					TaskOutputParameter.delete(dbConn, paramRows.getLong(1));
			}
			finally {
				if (paramRows != null)
					paramRows.close();

				selectStmt.close();
			}
		}
	}

	/**
	 *
	 */
	private class OutputMap extends MonitoredMap<String, List<TaskOutputSourceDocument>> {

		private final boolean m_intermediate;


		// constructors


		protected OutputMap(Map<String, List<TaskOutputSourceDocument>> outputMap, boolean intermediate)
		{
			super(outputMap);

			m_intermediate = intermediate;
		}


		// protected methods


		protected void addMapPutOp(String key, List<TaskOutputSourceDocument> value)
		{
			m_opQueue.add(new AddOutputOp(key, value, m_intermediate));
		}

		protected void addMapSetOp(String key, List<TaskOutputSourceDocument> oldValue, List<TaskOutputSourceDocument> newValue)
		{
			m_opQueue.add(new RemoveOutputOp(key, m_intermediate));
			m_opQueue.add(new AddOutputOp(key, newValue, m_intermediate));
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemoveOutputOp(key, m_intermediate));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllOutputOp(m_intermediate));
		}
	}

	/**
	 *
	 */
	private class AddLogMessageOp implements RowOperation {

		private final TaskLogMessage m_message;


		// constructors


		protected AddLogMessageOp(TaskLogMessage message)
		{
			m_message = message;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			m_message.setTaskId(getTaskId());
			m_message.setJobHandle(getJobHandle());

			m_message.save(dbConn);
		}
	}

	/**
	 *
	 */
	private class RemoveLogMessageOp implements RowOperation {

		private final TaskLogMessage m_message;


		// constructors


		protected RemoveLogMessageOp(TaskLogMessage message)
		{
			m_message = message;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			m_message.delete(dbConn);
		}
	}

	/**
	 *
	 */
	private class LogMessageList extends MonitoredList<TaskLogMessage> {

		// constructors


		protected LogMessageList(List<TaskLogMessage> records)
		{
			super(records);
		}


		// protected methods


		protected void addListAddOp(TaskLogMessage message)
		{
			m_opQueue.add(new AddLogMessageOp(message));
		}

		protected void addListSetOp(TaskLogMessage oldMessage, TaskLogMessage newMessage)
		{
			m_opQueue.add(new RemoveLogMessageOp(oldMessage));
			m_opQueue.add(new AddLogMessageOp(newMessage));
		}

		protected void addListRemoveOp(TaskLogMessage message)
		{
			m_opQueue.add(new RemoveLogMessageOp(message));
		}

		protected MonitoredList<TaskLogMessage> newListInstance(List<TaskLogMessage> list)
		{
			return new LogMessageList(list);
		}
	}


	private static final String TABLE_NAME = "tasks";
	private static final String COLUMN_NAMES = TABLE_NAME + ".TASK_ID, " + TABLE_NAME + ".COMMENT, " +
			TABLE_NAME + ".JOBHANDLE, " + TABLE_NAME + ".OK, " + TABLE_NAME + ".STAGE, " + TABLE_NAME + ".TOOL_ID, " +
			TABLE_NAME + ".GROUP_ID, " + TABLE_NAME + ".USER_ID, " + TABLE_NAME + ".CREATION_DATE, " +
			TABLE_NAME + ".LABEL, " + TABLE_NAME + ".ENCLOSING_FOLDER_ID, " + 
			TABLE_NAME + ".IS_TERMINAL, " +
			TABLE_NAME + ".VERSION " ;	// VERSION must be last

	private LongColumn m_taskId = new LongColumn(TABLE_NAME + ".TASK_ID", false);
	private StringColumn m_comment = new StringColumn(TABLE_NAME + ".COMMENT", true, 255);
	private StringColumn m_jobHandle = new StringColumn(TABLE_NAME + ".JOBHANDLE", true, 255);
	private BooleanColumn m_ok = new BooleanColumn(TABLE_NAME + ".OK", false);
	private StringColumn m_stage = new StringColumn(TABLE_NAME + ".STAGE", false, 20);
	private StringColumn m_toolId = new StringColumn(TABLE_NAME + ".TOOL_ID", true, 100);
	private LongColumn m_groupId = new LongColumn(TABLE_NAME + ".GROUP_ID", false);
	private LongColumn m_userId = new LongColumn(TABLE_NAME + ".USER_ID", false);
	private DateColumn m_creationDate = new DateColumn(TABLE_NAME + ".CREATION_DATE", false);
	private StringColumn m_label = new StringColumn(TABLE_NAME + ".LABEL", false, 255);
	private LongColumn m_enclosingFolderId = new LongColumn(TABLE_NAME + ".ENCLOSING_FOLDER_ID", false);
	private BooleanColumn m_isTerminal = new BooleanColumn(TABLE_NAME + ".IS_TERMINAL", false);
	private List<RowOperation> m_opQueue = new ArrayList<RowOperation>();
	private PropertyMap m_properties;
	private ParameterMap m_toolParameters;
	private InputMap m_taskInput;
	private OutputMap m_taskOutput;
	private OutputMap m_intermediateTaskOutput;
	private LogMessageList m_logMessages;


	// constructors


	public Task(Folder enclosingFolder)
	{
		super(TABLE_NAME);

		if (enclosingFolder.isNew())
			throw new WorkbenchException("Can't create a task in an unpersisted folder");

		setOk(true);
		setTerminal(false);
		setStage(TaskRunStage.NEW);
		setUserId(enclosingFolder.getUserId());
		setGroupId(enclosingFolder.getGroupId());
		setEnclosingFolderId(enclosingFolder.getFolderId());

		m_creationDate.setValue(Calendar.getInstance().getTime());
	}

	public Task(long taskId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_taskId.assignValue(taskId);

		refresh();
	}

	public Task(Task otherTask) throws IOException, SQLException
	{
		super(TABLE_NAME);

		setComment(otherTask.getComment());
		setOk(true);
		setTerminal(false);
		setStage(TaskRunStage.NEW);
		setToolId(otherTask.getToolId());
		setUserId(otherTask.getUserId());
		setGroupId(otherTask.getGroupId());
		setLabel(otherTask.getLabel());
		setEnclosingFolderId(otherTask.getEnclosingFolderId());

		m_creationDate.setValue(Calendar.getInstance().getTime());

		m_properties = new PropertyMap(new TreeMap<String, String>());

		m_properties.putAll(otherTask.properties());

		m_toolParameters = new ParameterMap(new TreeMap<String, String>());

		m_toolParameters.putAll(otherTask.toolParameters());

		m_taskInput = new InputMap(new TreeMap<String, List<TaskInputSourceDocument>>());

		for (Iterator<Map.Entry<String, List<TaskInputSourceDocument>>> entries = otherTask.input().entrySet().iterator() ; entries.hasNext() ; ) {
			Map.Entry<String, List<TaskInputSourceDocument>> entry = entries.next();
			List<TaskInputSourceDocument> inputDocs = new ArrayList<TaskInputSourceDocument>();

			for (Iterator<TaskInputSourceDocument> docs = entry.getValue().iterator() ; docs.hasNext() ; )
				inputDocs.add(new TaskInputSourceDocument(docs.next()));

			m_taskInput.put(entry.getKey(), inputDocs);
		}
	}

	private Task(ResultSet row) throws SQLException, IOException
	{
		super(TABLE_NAME);

		populate(row);
	}


	// public methods


	public long getTaskId()
	{
		return m_taskId.getValue();
	}

	public String getComment()
	{
		return m_comment.getValue();
	}

	public void setComment(String comment)
	{
		m_comment.setValue(comment);
	}

	public String getJobHandle()
	{
		return m_jobHandle.getValue();
	}

	public void setJobHandle(String jobHandle)
	{
		m_jobHandle.setValue(jobHandle);
	}

	public boolean isOk()
	{
		return m_ok.getValue();
	}

	public void setOk(Boolean ok)
	{
		m_ok.setValue(ok);
	}

	public boolean isTerminal()
	{
		return m_isTerminal.getValue();
	}

	public void setTerminal(Boolean b)
	{
		m_isTerminal.setValue(b);
	}


	public TaskRunStage getStage()
	{
		return TaskRunStage.valueOf(m_stage.getValue());
	}

	public void setStage(TaskRunStage stage)
	{
		m_stage.setValue(stage.toString());
	}

	public String getToolId()
	{
		return m_toolId.getValue();
	}

	public void setToolId(String toolId)
	{
		m_toolId.setValue(toolId);
	}

	public void setTool(Tool tool)
	{
		setToolId(tool.getToolId());
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

	/*
		Returns true if task has been placed in cipres run queue, or is being
		processed.  

		False if task hasn't been queued to run, or has finished/failed.

		You can also just check isTerminal() if you know the job was started
		and want to see if it has finished.  On completion isOK = true if 
		job finished ok, isOK = false if not.
	*/
	public boolean isRunning()
	{
		//return ((getStage() >= TaskRunStage.QUEUE) && !isTerminal());
		return (getStage().compareTo(TaskRunStage.QUEUE) >= 0) && !isTerminal();
	}

	public Map<String, String> properties() throws SQLException, IOException
	{
		if (m_properties == null) {
			Map<String, String> newProperties = new TreeMap<String, String>();

			if (!isNew()) {
				Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
				PreparedStatement selectStmt = null;
				ResultSet propRows = null;

				try {
					selectStmt = dbConn.prepareStatement("SELECT PROPERTY, VALUE FROM task_properties WHERE TASK_ID = ?");

					m_taskId.setParameter(selectStmt, 1);

					propRows = selectStmt.executeQuery();

					while (propRows.next())
						newProperties.put(propRows.getString(1), propRows.getString(2));
				}
				finally {
					if (propRows != null)
						propRows.close();

					if (selectStmt != null)
						selectStmt.close();

					dbConn.close();
				}
			}

			m_properties = new PropertyMap(newProperties);
		}

		return m_properties;
	}

	public Map<String, String> toolParameters() throws SQLException, IOException
	{
		if (m_toolParameters == null) {
			Map<String, String> newParameters = new TreeMap<String, String>();

			if (!isNew()) {
				Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
				PreparedStatement selectStmt = null;
				ResultSet paramRows = null;

				try {
					selectStmt = dbConn.prepareStatement("SELECT PARAMETER, VALUE FROM tool_parameters WHERE TASK_ID = ?");

					m_taskId.setParameter(selectStmt, 1);

					paramRows = selectStmt.executeQuery();

					while (paramRows.next())
						newParameters.put(paramRows.getString(1), paramRows.getString(2));
				}
				finally {
					if (paramRows != null)
						paramRows.close();

					if (selectStmt != null)
						selectStmt.close();

					dbConn.close();
				}
			}

			m_toolParameters = new ParameterMap(newParameters);
		}

		return m_toolParameters;
	}

	public Map<String, List<TaskInputSourceDocument>> input() throws IOException, SQLException
	{
		if (m_taskInput == null) {
			Map<String, List<TaskInputSourceDocument>> newInput;

			if (!isNew())
				newInput = TaskInputParameter.findTaskInput(m_taskId.getValue());
			else
				newInput = new TreeMap<String, List<TaskInputSourceDocument>>();

			m_taskInput = new InputMap(newInput);
		}

		return m_taskInput;
	}

	public Map<String, List<TaskOutputSourceDocument>> output() throws IOException, SQLException
	{
		if (m_taskOutput == null) {
			Map<String, List<TaskOutputSourceDocument>> newOutput;

			if (!isNew())
				newOutput = TaskOutputParameter.findTaskOutput(m_taskId.getValue());
			else
				newOutput = new TreeMap<String, List<TaskOutputSourceDocument>>();

			m_taskOutput = new OutputMap(newOutput, false);
		}

		return m_taskOutput;
	}

	public Map<String, List<TaskOutputSourceDocument>> intermediateOutput() throws IOException, SQLException
	{
		if (m_intermediateTaskOutput == null) {
			Map<String, List<TaskOutputSourceDocument>> newOutput;

			if (!isNew())
				newOutput = TaskOutputParameter.findIntermediateTaskOutput(m_taskId.getValue());
			else
				newOutput = new TreeMap<String, List<TaskOutputSourceDocument>>();

			m_intermediateTaskOutput = new OutputMap(newOutput, true);
		}

		return m_intermediateTaskOutput;
	}

	public List<TaskLogMessage> logMessages() throws SQLException, IOException
	{
		if (m_logMessages == null) {
			List<TaskLogMessage> newMessages;

			if (!isNew())
				newMessages = TaskLogMessage.findLogMessages(m_taskId.getValue());
			else
				newMessages = new ArrayList<TaskLogMessage>();

			m_logMessages = new LogMessageList(newMessages);
		}

		return m_logMessages;
	}

	public boolean isNew()
	{
		return m_taskId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof Task == false)
			return false;

		Task otherTask = (Task) other;

		if (isNew() || otherTask.isNew())
			return false;

		return getTaskId() == otherTask.getTaskId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getTaskId())).hashCode();
	}

	public int compareTo(Task other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getTaskId() - other.getTaskId());
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_taskId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_comment);
			colList.add(m_jobHandle);
			colList.add(m_ok);
			colList.add(m_stage);
			colList.add(m_toolId);
			colList.add(m_groupId);
			colList.add(m_userId);
			colList.add(m_creationDate);
			colList.add(m_label);
			colList.add(m_enclosingFolderId);
			colList.add(m_isTerminal);

			insert(dbConn, new AutoGeneratedKey(m_taskId), colList);
		}
		else {
			if (m_comment.isModified())
				colList.add(m_comment);

			if (m_jobHandle.isModified())
				colList.add(m_jobHandle);

			if (m_ok.isModified())
				colList.add(m_ok);

			if (m_isTerminal.isModified())
				colList.add(m_isTerminal);

			if (m_stage.isModified())
				colList.add(m_stage);

			if (m_toolId.isModified())
				colList.add(m_toolId);

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
		{
			operations.next().execute(dbConn);
		}

		m_opQueue.clear();
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		//log.debug("Deleting task " + m_taskId.getValue());
		delete(dbConn, m_taskId.getValue());

		m_taskId.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_opQueue.clear();
		m_properties = null;
		m_toolParameters = null;
		m_taskInput = null;
		m_taskOutput = null;
		m_logMessages = null;
	}

	static List<Task> findTasks(Criterion key) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");

		stmtBuilder.append(key.getPhrase());

		stmtBuilder.append(" order by CREATION_DATE ");

		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet taskRows = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());

			key.setParameter(selectStmt, 1);

			taskRows = selectStmt.executeQuery();

			List<Task> folders = new ArrayList<Task>();

			while (taskRows.next())
				folders.add(new Task(taskRows));

			return folders;
		}
		finally {
			if (taskRows != null)
				taskRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	/* 
		Returns task with specified job handle.  Null if no tasks found.  Throws exception
		if more than one found (todo: this should be an assertion).
	*/
	public static Task findTaskByJobHandle(String jobHandle) throws Exception
	{
		List<Task> tasks;
		tasks = Task.findTasks(new StringCriterion("JOBHANDLE", jobHandle));
		if (tasks.size() == 0)
		{
			return null;
		}
		if (tasks.size() == 1)
		{
			return tasks.get(0);
		}
		throw new Exception("Found multiple tasks with jobHandle: " + jobHandle);
	}

	/**
		### DELETE
	*/
	static void delete(Connection dbConn, long taskId) throws SQLException
	{
		deleteTaskProps(dbConn, taskId);
		deleteToolParams(dbConn, taskId);
		deleteLogMessages(dbConn, taskId);
		deleteInputParams(dbConn, taskId);
		deleteOutputParams(dbConn, taskId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE TASK_ID = ?");

		try {
			deleteStmt.setLong(1, taskId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// protected methods


	protected void populate(ResultSet row) throws SQLException, IOException
	{
		m_taskId.assignValue(row, 1);
		m_comment.assignValue(row, 2);
		m_jobHandle.assignValue(row, 3);
		m_ok.assignValue(row, 4);
		m_stage.assignValue(row, 5);
		m_toolId.assignValue(row, 6);
		m_groupId.assignValue(row, 7);
		m_userId.assignValue(row, 8);
		m_creationDate.assignValue(row, 9);
		m_label.assignValue(row, 10);
		m_enclosingFolderId.assignValue(row, 11);
		m_isTerminal.assignValue(row, 12);

		super.populate(row, 13);
	}


	// private methods


	private static void deleteTaskProps(Connection dbConn, long taskId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM task_properties WHERE TASK_ID = ?");

		try {
			deleteStmt.setLong(1, taskId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteToolParams(Connection dbConn, long taskId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM tool_parameters WHERE TASK_ID = ?");

		try {
			deleteStmt.setLong(1, taskId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteLogMessages(Connection dbConn, long taskId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM task_log_messages WHERE TASK_ID = ?");

		try {
			deleteStmt.setLong(1, taskId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteInputParams(Connection dbConn, long taskId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT INPUT_ID FROM task_input_parameters WHERE TASK_ID = ?");
		ResultSet paramRows = null;

		try {
			selectStmt.setLong(1, taskId);

			paramRows = selectStmt.executeQuery();

			while (paramRows.next())
				TaskInputParameter.delete(dbConn, paramRows.getLong(1));
		}
		finally {
			if (paramRows != null)
				paramRows.close();

			selectStmt.close();
		}
	}

	private static void deleteOutputParams(Connection dbConn, long taskId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT OUTPUT_ID FROM task_output_parameters WHERE TASK_ID = ?");
		ResultSet paramRows = null;

		try {
			selectStmt.setLong(1, taskId);

			paramRows = selectStmt.executeQuery();

			while (paramRows.next())
				TaskOutputParameter.delete(dbConn, paramRows.getLong(1));
		}
		finally {
			if (paramRows != null)
				paramRows.close();

			selectStmt.close();
		}
	}
}
