/*
 * TaskOutputParameter.java
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
class TaskOutputParameter {

	// package methods


	static Map<String, List<TaskOutputSourceDocument>> findTaskOutput(long taskId) throws IOException, SQLException
	{
		return findTaskOutput(taskId, false);
	}

	static Map<String, List<TaskOutputSourceDocument>> findIntermediateTaskOutput(long taskId) throws IOException, SQLException
	{
		return findTaskOutput(taskId, true);
	}

	static void delete(Connection dbConn, long outputId) throws SQLException
	{
		deleteOutputDocs(dbConn, outputId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM task_output_parameters WHERE OUTPUT_ID = ?");

		try {
			deleteStmt.setLong(1, outputId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}


	// private methods


	private static Map<String, List<TaskOutputSourceDocument>> findTaskOutput(long taskId, boolean intermediate) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet paramRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT OUTPUT_ID, PARAMETER FROM task_output_parameters WHERE TASK_ID = ? AND INTERMEDIATE = ?");

			selectStmt.setLong(1, taskId);
			selectStmt.setBoolean(2, intermediate);

			paramRows = selectStmt.executeQuery();

			Map<String, List<TaskOutputSourceDocument>> outputMap = new TreeMap<String, List<TaskOutputSourceDocument>>();

			while (paramRows.next()) {
				long outputId = paramRows.getLong(1);
				String outputParam = paramRows.getString(2);
				List<TaskOutputSourceDocument> outputDocs = TaskOutputSourceDocument.findOutputDocuments(dbConn, outputId);

				outputMap.put(outputParam, outputDocs);
			}

			return outputMap;
		}
		finally {
			if (paramRows != null)
				paramRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	private static void deleteOutputDocs(Connection dbConn, long outputId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT OUTPUT_DOCUMENT_ID FROM task_output_source_documents WHERE OUTPUT_ID = ?");
		ResultSet outputRows = null;

		try {
			selectStmt.setLong(1, outputId);

			outputRows = selectStmt.executeQuery();

			while (outputRows.next())
				TaskOutputSourceDocument.delete(dbConn, outputRows.getLong(1));
		}
		finally {
			if (outputRows != null)
				outputRows.close();

			selectStmt.close();
		}
	}
}
