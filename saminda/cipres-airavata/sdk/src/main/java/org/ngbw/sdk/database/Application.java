/*
 * Application.java
 */
package org.ngbw.sdk.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.Date;
import java.util.Calendar;

import org.ngbw.sdk.WorkbenchCIPRES;
import org.ngbw.sdk.WorkbenchException;
import org.ngbw.sdk.common.util.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class Application extends Row implements Comparable<Application> {
	private static final Log log = LogFactory.getLog(Application.class.getName());

	public static final String DIRECT = "DIRECT";
	public static final String UMBRELLA = "UMBRELLA";


	private static final String TABLE_NAME = "applications";
	private static final String COLUMN_NAMES = 
			TABLE_NAME + ".APP_ID, " + 
			TABLE_NAME + ".NAME, " + 
			TABLE_NAME + ".LONGNAME, " + 
			TABLE_NAME + ".AUTH_TYPE, " + 
			TABLE_NAME + ".AUTH_USER_ID, " + 

			TABLE_NAME + ".FIRST_NAME, " + 
			TABLE_NAME + ".LAST_NAME, " +
			TABLE_NAME + ".INSTITUTION, " + 
			TABLE_NAME + ".STREET_ADDRESS, " + 
			TABLE_NAME + ".CITY, " + 
			TABLE_NAME + ".STATE, " + 
			TABLE_NAME + ".COUNTRY, " +
			TABLE_NAME + ".MAILCODE, " + 
			TABLE_NAME + ".ZIP_CODE, " + 
			TABLE_NAME + ".AREA_CODE, " + 
			TABLE_NAME + ".PHONE_NUMBER, " +
			TABLE_NAME + ".EMAIL, " + 
			TABLE_NAME + ".WEBSITE_URL, " + 
			TABLE_NAME + ".COMMENT, " + 
			TABLE_NAME + ".ACTIVE "; 

	private LongColumn m_appId = new LongColumn(TABLE_NAME + ".APP_ID", false);

	private StringColumn m_name = new StringColumn(TABLE_NAME + ".NAME", false, 30);
	private StringColumn m_longName = new StringColumn(TABLE_NAME + ".LONGNAME", false, 100);
	private StringColumn m_authType = new StringColumn(TABLE_NAME + ".AUTH_TYPE", false, 30);
	private LongColumn m_authUserId = new LongColumn(TABLE_NAME + ".AUTH_USER_ID", true);

	private StringColumn m_firstName = new StringColumn(TABLE_NAME + ".FIRST_NAME", false, 100);
	private StringColumn m_lastName = new StringColumn(TABLE_NAME + ".LAST_NAME", false, 100);
	private StringColumn m_institution = new StringColumn(TABLE_NAME + ".INSTITUTION", true, 255);
	private StringColumn m_streetAddress = new StringColumn(TABLE_NAME + ".STREET_ADDRESS", true, 255);
	private StringColumn m_city = new StringColumn(TABLE_NAME + ".CITY", true, 100);
	private StringColumn m_state = new StringColumn(TABLE_NAME + ".STATE", true, 50);
	private StringColumn m_country = new StringColumn(TABLE_NAME + ".COUNTRY", true, 50);
	private StringColumn m_mailCode = new StringColumn(TABLE_NAME + ".MAILCODE", true, 10);
	private StringColumn m_zipCode = new StringColumn(TABLE_NAME + ".ZIP_CODE", true, 10);
	private StringColumn m_areaCode = new StringColumn(TABLE_NAME + ".AREA_CODE", true, 10);
	private StringColumn m_phoneNumber = new StringColumn(TABLE_NAME + ".PHONE_NUMBER", true, 20);
	private StringColumn m_email = new StringColumn(TABLE_NAME + ".EMAIL", false, 200);
	private StringColumn m_websiteUrl = new StringColumn(TABLE_NAME + ".WEBSITE_URL", true, 255);
	private StringColumn m_comment = new StringColumn(TABLE_NAME + ".COMMENT", true, 255);
	private BooleanColumn m_active = new BooleanColumn(TABLE_NAME + ".ACTIVE", false);

	// constructors


	public Application()
	{
		super(TABLE_NAME);
		setActive(true);
	}


	public Application(long appId) throws IOException, SQLException
	{
		super(TABLE_NAME);
		m_appId.assignValue(appId);
		refresh();
	}

	private Application(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);
		populate(row);
	}



	// public methods


	public long getAppId()
	{
		return m_appId.getValue();
	}

	public String getFirstName() { return m_firstName.getValue(); }
	public void setFirstName(String firstName) { m_firstName.setValue(firstName); }

	public String getName() { return m_name.getValue(); }
	public void setName(String name) { m_name.setValue(name); }

	public String getLongName() { return m_longName.getValue(); }
	public void setLongName(String name) { m_longName.setValue(name); }

	public String getAuthType() { return m_authType.getValue(); }
	public void setAuthType(String a) { m_authType.setValue(a); }

	public long  getAuthUserId() { return m_authUserId.getValue(); }
	public void setAuthUserId(long a) { m_authUserId.setValue(a); }

	public String getLastName() { return m_lastName.getValue(); }

	public void setLastName(String lastName) { m_lastName.setValue(lastName); }

	public String getInstitution() { return m_institution.getValue(); }
	public void setInstitution(String institution) { m_institution.setValue(institution); }

	public String getStreetAddress() { return m_streetAddress.getValue(); } 
	public void setStreetAddress(String streetAddress) { m_streetAddress.setValue(streetAddress); }

	public String getCity() { return m_city.getValue(); }
	public void setCity(String city) { m_city.setValue(city); }

	public String getState() { return m_state.getValue(); }
	public void setState(String state) { m_state.setValue(state); }

	public String getCountry() { return m_country.getValue(); }
	public void setCountry(String country) { m_country.setValue(country); }

	public String getMailCode() { return m_mailCode.getValue(); }
	public void setMailCode(String mailCode) { m_mailCode.setValue(mailCode); }

	public String getZipCode() { return m_zipCode.getValue(); }
	public void setZipCode(String zipCode) { m_zipCode.setValue(zipCode); }

	public String getAreaCode() { return m_areaCode.getValue(); }
	public void setAreaCode(String areaCode) { m_areaCode.setValue(areaCode); }

	public String getPhoneNumber() { return m_phoneNumber.getValue(); }
	public void setPhoneNumber(String phoneNumber) { m_phoneNumber.setValue(phoneNumber); }

	public String getEmail() { return m_email.getValue(); }
	public void setEmail(String email) { m_email.setValue(email); }

	public String getWebsiteUrl() { return m_websiteUrl.getValue(); }
	public void setWebsiteUrl(String websiteUrl) { m_websiteUrl.setValue(websiteUrl); }

	public String getComment() { return m_comment.getValue(); }
	public void setComment(String comment) { m_comment.setValue(comment); }

	public boolean isActive() { return m_active.getValue(); }
	public void setActive(Boolean active) { m_active.setValue(active); }

	public boolean isNew()
	{
		return m_appId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof Application == false)
			return false;

		Application otherUser = (Application) other;

		if (isNew() || otherUser.isNew())
			return false;

		return getAppId() == otherUser.getAppId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getAppId())).hashCode();
	}

	public int compareTo(Application other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getAppId() - other.getAppId());
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_appId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_name);
			colList.add(m_longName);
			colList.add(m_authType);
			colList.add(m_authUserId);

			colList.add(m_firstName);
			colList.add(m_lastName);
			colList.add(m_institution);
			colList.add(m_streetAddress);
			colList.add(m_city);
			colList.add(m_state);
			colList.add(m_country);
			colList.add(m_mailCode);
			colList.add(m_zipCode);
			colList.add(m_areaCode);
			colList.add(m_phoneNumber);
			colList.add(m_email);
			colList.add(m_websiteUrl);
			colList.add(m_comment);
			colList.add(m_active);

			insert(dbConn, new AutoGeneratedKey(m_appId), colList);
		}
		else {
			if (m_name.isModified())
				colList.add(m_name);
			if (m_longName.isModified())
				colList.add(m_longName);
			if (m_authType.isModified())
				colList.add(m_authType);
			if (m_authUserId.isModified())
				colList.add(m_authUserId);

			if (m_firstName.isModified())
				colList.add(m_firstName);

			if (m_lastName.isModified())
				colList.add(m_lastName);

			if (m_institution.isModified())
				colList.add(m_institution);

			if (m_streetAddress.isModified())
				colList.add(m_streetAddress);

			if (m_city.isModified())
				colList.add(m_city);

			if (m_state.isModified())
				colList.add(m_state);

			if (m_country.isModified())
				colList.add(m_country);

			if (m_mailCode.isModified())
				colList.add(m_mailCode);

			if (m_zipCode.isModified())
				colList.add(m_zipCode);

			if (m_areaCode.isModified())
				colList.add(m_areaCode);

			if (m_phoneNumber.isModified())
				colList.add(m_phoneNumber);

			if (m_email.isModified())
				colList.add(m_email);

			if (m_websiteUrl.isModified())
				colList.add(m_websiteUrl);

			if (m_comment.isModified())
				colList.add(m_comment);

			if (m_active.isModified())
				colList.add(m_active);

			update(dbConn, colList);
		}
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_appId.getValue());

		m_appId.reset();
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);
	}

	static void delete(Connection dbConn, long appId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE APP_ID = ?");

		try {
			deleteStmt.setLong(1, appId);
			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_appId.assignValue(row, 1);
		m_name.assignValue(row, 2);
		m_longName.assignValue(row, 3);
		m_authType.assignValue(row, 4);
		m_authUserId.assignValue(row, 5);

		m_firstName.assignValue(row, 6);
		m_lastName.assignValue(row, 7);
		m_institution.assignValue(row, 8);
		m_streetAddress.assignValue(row, 9);
		m_city.assignValue(row, 10);
		m_state.assignValue(row, 11);
		m_country.assignValue(row, 12);
		m_mailCode.assignValue(row, 13);
		m_zipCode.assignValue(row, 14);
		m_areaCode.assignValue(row, 15);
		m_phoneNumber.assignValue(row, 16);
		m_email.assignValue(row, 17);
		m_websiteUrl.assignValue(row, 18);
		m_comment.assignValue(row, 19);
		m_active.assignValue(row, 20);
	}


	public static Application findApplication(String appname) throws IOException, SQLException
	{
		Criterion appKey = new StringCriterion("APPNAME", appname);
		return findApplication(appKey);
	}


	/* private */

	private static Application findApplication(Criterion key) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");
		stmtBuilder.append(key.getPhrase());


		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet userRow = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());

			key.setParameter(selectStmt, 1);

			userRow = selectStmt.executeQuery();

			if (!userRow.next())
				return null;

			return new Application(userRow);
		}
		finally {
			if (userRow != null)
				userRow.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

}
