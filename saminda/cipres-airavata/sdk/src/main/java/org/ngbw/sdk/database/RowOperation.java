/*
 * Operation.java
 */
package org.ngbw.sdk.database;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


/**
 * 
 * @author Paul Hoover
 *
 */
interface RowOperation {

	void execute(Connection dbConn) throws IOException, SQLException;
}
