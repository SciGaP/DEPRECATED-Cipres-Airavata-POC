/*
 * LongCriterion.java
 */
package org.ngbw.sdk.database;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;


/**
 * An object that represents a <code>WHERE</code> clause search criterion that uses a <code>BIGINT</code> value.
 * 
 * @author Paul Hoover
 *
 */
class LongCriterion implements Criterion {

	private final String m_colName;
	private final Long m_value;


	// constructors


	/**
	 * Constructs a representation of a search criterion for the given column name and value.
	 * 
	 * @param colName the name of the column
	 * @param value the value of the column
	 */
	LongCriterion(String colName, Long value)
	{
		m_colName = colName;
		m_value = value;
	}


	// public methods


	/**
	 * Creates a phrase describing the search clause criterion using the name and value given
	 * in the constructor.
	 * 
	 * @return a phrase describing the criterion
	 */
	public String getPhrase()
	{
		return m_colName + " = ?";
	}

	/**
	 * Sets the value of a parameter in a <code>PreparedStatement</code> object using the name and
	 * value given in the constructor.
	 * 
	 * @param statement the <code>PreparedStatement</code> object for which a parameter will be set
	 * @param index the offset that indicates the parameter to set
	 * @return the next offset to use when setting parameters
	 * @throws SQLException
	 */
	public int setParameter(PreparedStatement statement, int index) throws SQLException
	{
		if (m_value != null)
			statement.setLong(index, m_value);
		else 
			statement.setNull(index, Types.BIGINT);

		return index + 1;
	}

	/**
	 * Returns a string representation of the object. The representation is built using the
	 * name and value of the column given in the constructor.
	 * 
	 * @return a string representation of the object
	 */
	@Override
	public String toString()
	{
		return m_colName + " = " + String.valueOf(m_value);
	}
}
