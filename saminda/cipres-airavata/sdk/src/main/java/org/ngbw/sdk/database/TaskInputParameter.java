/*
 * TaskInputParameter.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;


/**
 * 
 * @author Paul Hoover
 *
 */
class TaskInputParameter {

	// package methods


	static Map<String, List<TaskInputSourceDocument>> findTaskInput(long taskId) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet paramRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT INPUT_ID, PARAMETER FROM task_input_parameters WHERE TASK_ID = ?");

			selectStmt.setLong(1, taskId);

			paramRows = selectStmt.executeQuery();

			Map<String, List<TaskInputSourceDocument>> inputMap = new TreeMap<String, List<TaskInputSourceDocument>>();

			while (paramRows.next()) {
				long inputId = paramRows.getLong(1);
				String inputParam = paramRows.getString(2);
				List<TaskInputSourceDocument> outputDocs = TaskInputSourceDocument.findInputDocuments(dbConn, inputId);

				inputMap.put(inputParam, outputDocs);
			}

			return inputMap;
		}
		finally {
			if (paramRows != null)
				paramRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	static void delete(Connection dbConn, long inputId) throws SQLException
	{
		deleteInputDocs(dbConn, inputId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM task_input_parameters WHERE INPUT_ID = ?");

		try {
			deleteStmt.setLong(1, inputId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// private methods


	private static void deleteInputDocs(Connection dbConn, long inputId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT INPUT_DOCUMENT_ID FROM task_input_source_documents WHERE INPUT_ID = ?");
		ResultSet inputRows = null;

		try {
			selectStmt.setLong(1, inputId);

			inputRows = selectStmt.executeQuery();

			while (inputRows.next())
				TaskInputSourceDocument.delete(dbConn, inputRows.getLong(1));
		}
		finally {
			if (inputRows != null)
				inputRows.close();

			selectStmt.close();
		}
	}
}
