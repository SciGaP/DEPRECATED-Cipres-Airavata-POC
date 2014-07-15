/*
 * User.java
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
import org.ngbw.sdk.core.shared.UserRole;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 *
 * @author Paul Hoover
 *
 */
public class User extends VersionedRow implements Comparable<User> {
	private static final Log log = LogFactory.getLog(User.class.getName());
	private static String accountingPeriodStart = null;

	/**
	 *
	 */
	private class AddMembershipOp implements RowOperation {

		private final long m_groupId;


		// constructors


		protected AddMembershipOp(long groupId)
		{
			m_groupId = groupId;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO user_group_lookup (USER_ID, GROUP_ID) VALUES (?, ?)");

			try {
				m_userId.setParameter(insertStmt, 1);
				insertStmt.setLong(2, m_groupId);

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
	private class RemoveMembershipOp implements RowOperation {

		private final long m_groupId;


		// constructors


		protected RemoveMembershipOp(long groupId)
		{
			m_groupId = groupId;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_group_lookup WHERE USER_ID = ? AND GROUP_ID = ?");

			try {
				m_userId.setParameter(deleteStmt, 1);
				deleteStmt.setLong(2, m_groupId);

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
	private class RemoveAllMembershipsOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_group_lookup WHERE USER_ID = ? AND GROUP_ID <> ?");

			try {
				m_userId.setParameter(deleteStmt, 1);
				m_defaultGroupId.setParameter(deleteStmt, 2);

				deleteStmt.executeUpdate();
			}
			finally {
				deleteStmt.close();
			}

			m_memberships = null;
		}
	}

	/**
	 *
	 */
	private class MembershipSet extends MonitoredSet<Group> {

		// constructors


		protected MembershipSet(Set<Group> groups)
		{
			super(groups);
		}


		// protected methods


		protected void addSetAddOp(Group element)
		{
			if (element.isNew())
				throw new WorkbenchException("Can't add membership in an unpersisted group");

			m_opQueue.add(new AddMembershipOp(element.getGroupId()));
		}

		protected void addSetRemoveOp(Group element)
		{
			long groupId = element.getGroupId();

			if (groupId == m_defaultGroupId.getValue())
				throw new WorkbenchException("Can't remove membership in default group");

			m_opQueue.add(new RemoveMembershipOp(groupId));
		}

		protected void addSetClearOp()
		{
			m_opQueue.add(new RemoveAllMembershipsOp());
		}
	}

	/**
	 *
	 */
	private class AddPreferenceOp implements RowOperation {

		private final String m_preference;
		private final String m_value;


		// constructors


		protected AddPreferenceOp(String preference, String value)
		{
			if (preference == null)
				throw new NullPointerException("preference");

			m_preference = preference;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement insertStmt = dbConn.prepareStatement("INSERT INTO user_preferences (USER_ID, PREFERENCE, VALUE) VALUES (?, ?, ?)");

			try {
				m_userId.setParameter(insertStmt, 1);
				insertStmt.setString(2, m_preference);

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
	private class SetPreferenceOp implements RowOperation {

		private final String m_preference;
		private final String m_value;


		// constructors


		protected SetPreferenceOp(String preference, String value)
		{
			if (preference == null)
				throw new NullPointerException("preference");

			m_preference = preference;
			m_value = value;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement updateStmt = dbConn.prepareStatement("UPDATE user_preferences SET VALUE = ? WHERE USER_ID = ? AND PREFERENCE = ?");

			try {
				if (m_value != null)
					updateStmt.setString(1, m_value);
				else
					updateStmt.setNull(1, Types.VARCHAR);

				m_userId.setParameter(updateStmt, 2);
				updateStmt.setString(3, m_preference);

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
	private class RemovePreferenceOp implements RowOperation {

		private final String m_preference;


		// constructors


		protected RemovePreferenceOp(String preference)
		{
			if (preference == null)
				throw new NullPointerException("preference");

			m_preference = preference;
		}


		// public methods


		public void execute(Connection dbConn) throws IOException, SQLException
		{
			PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_preferences WHERE USER_ID = ? AND PREFERENCE = ?");

			try {
				m_userId.setParameter(deleteStmt, 1);
				deleteStmt.setString(2, m_preference);

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
	private class RemoveAllPreferencesOp implements RowOperation {

		// public methods


		public void execute(Connection dbConn) throws SQLException
		{
			deletePrefs(dbConn, m_userId.getValue());
		}
	}

	/**
	 *
	 */
	private class PreferenceMap extends MonitoredMap<String, String> {

		// constructors


		protected PreferenceMap(Map<String, String> prefMap)
		{
			super(prefMap);
		}


		// protected methods


		protected void addMapPutOp(String key, String value)
		{
			m_opQueue.add(new AddPreferenceOp(key, value));
		}

		protected void addMapSetOp(String key, String oldValue, String newValue)
		{
			m_opQueue.add(new SetPreferenceOp(key, newValue));
		}

		protected void addMapRemoveOp(String key)
		{
			m_opQueue.add(new RemovePreferenceOp(key));
		}

		protected void addMapClearOp()
		{
			m_opQueue.add(new RemoveAllPreferencesOp());
		}
	}


	private static final String TABLE_NAME = "users";
	private static final String COLUMN_NAMES = 
			TABLE_NAME + ".USER_ID, " + 
			TABLE_NAME + ".FIRST_NAME, " + 
			TABLE_NAME + ".LAST_NAME, " +
			TABLE_NAME + ".USERNAME, " + 
			TABLE_NAME + ".APPNAME, " + 
			TABLE_NAME + ".PASSWORD, " + 
			TABLE_NAME + ".INSTITUTION, " + 
			TABLE_NAME + ".ROLE, " +
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
			TABLE_NAME + ".DEFAULT_GROUP_ID, " +
			TABLE_NAME + ".ACTIVE, " + 
			TABLE_NAME + ".CAN_SUBMIT, " + 
			TABLE_NAME + ".LAST_LOGIN, " + 
			TABLE_NAME + ".VERSION ";

	private LongColumn m_userId = new LongColumn(TABLE_NAME + ".USER_ID", false);
	private StringColumn m_firstName = new StringColumn(TABLE_NAME + ".FIRST_NAME", false, 100);
	private StringColumn m_lastName = new StringColumn(TABLE_NAME + ".LAST_NAME", false, 100);
	private StringColumn m_username = new StringColumn(TABLE_NAME + ".USERNAME", false, 200);
	private StringColumn m_appname = new StringColumn(TABLE_NAME + ".APPNAME", false, 30);
	private StringColumn m_password = new StringColumn(TABLE_NAME + ".PASSWORD", false, 50);
	private StringColumn m_institution = new StringColumn(TABLE_NAME + ".INSTITUTION", true, 255);
	private StringColumn m_role = new StringColumn(TABLE_NAME + ".ROLE", false, 50);
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
	private LongColumn m_defaultGroupId = new LongColumn(TABLE_NAME + ".DEFAULT_GROUP_ID", true);
	private BooleanColumn m_active = new BooleanColumn(TABLE_NAME + ".ACTIVE", false);
	private BooleanColumn m_canSubmit = new BooleanColumn(TABLE_NAME + ".CAN_SUBMIT", false);
	private DateColumn  m_lastLogin  = new DateColumn(TABLE_NAME + ".LAST_LOGIN", true);


	private List<RowOperation> m_opQueue = new ArrayList<RowOperation>();
	private MembershipSet m_memberships;
	private PreferenceMap m_preferences;


	// constructors


	public User()
	{
		super(TABLE_NAME);

		setAppname("");
		setActive(true);
		setCanSubmit(true);
	}

	/*
		Create a REST Api psuedo user representing the end user.
	*/
	public User(String appname, String username, String email, String institution)
	{
		super(TABLE_NAME);
		this.setAppname(appname);
		this.setUsername(appname + "." + username);
		this.setEmail(email);
		this.setInstitution(institution);

		this.setFirstName("");
		this.setLastName("");

		String password = "REST" + username + Calendar.getInstance().getTimeInMillis();
		this.setPassword(password);

		this.setRole(UserRole.REST_END_USER);
		this.setActive(true);
		this.setCanSubmit(true);

		this.setLastLogin(new Date());
	}


	public User(long userId) throws IOException, SQLException
	{
		super(TABLE_NAME);

		m_userId.assignValue(userId);

		refresh();
	}

	private User(ResultSet row) throws IOException, SQLException
	{
		super(TABLE_NAME);

		populate(row);
	}



	// public methods


	public long getUserId()
	{
		return m_userId.getValue();
	}

	public String getFirstName()
	{
		return m_firstName.getValue();
	}

	public void setFirstName(String firstName)
	{
		m_firstName.setValue(firstName);
	}

	public String getLastName()
	{
		return m_lastName.getValue();
	}

	public void setLastName(String lastName)
	{
		m_lastName.setValue(lastName);
	}

	public String getUsername() { return m_username.getValue(); }
	public void setUsername(String username) { m_username.setValue(username); }

	public String getAppname() { return m_appname.getValue(); }
	public void setAppname(String username) 
	{ 
		m_appname.setValue(username); 
	}

	public String getPassword()
	{
		return m_password.getValue();
	}

	public void setPassword(String password)
	{
		m_password.setValue(StringUtils.getMD5HexString(password));
	}

	public String getInstitution()
	{
		return m_institution.getValue();
	}

	public void setInstitution(String institution)
	{
		m_institution.setValue(institution);
	}

	public UserRole getRole()
	{
		return UserRole.valueOf(m_role.getValue());
	}

	public void setRole(UserRole role)
	{
		m_role.setValue(role.toString());
	}

	public String getStreetAddress()
	{
		return m_streetAddress.getValue();
	}

	public void setStreetAddress(String streetAddress)
	{
		m_streetAddress.setValue(streetAddress);
	}

	public String getCity()
	{
		return m_city.getValue();
	}

	public void setCity(String city)
	{
		m_city.setValue(city);
	}

	public String getState()
	{
		return m_state.getValue();
	}

	public void setState(String state)
	{
		m_state.setValue(state);
	}

	public String getCountry()
	{
		return m_country.getValue();
	}

	public void setCountry(String country)
	{
		m_country.setValue(country);
	}

	public String getMailCode()
	{
		return m_mailCode.getValue();
	}

	public void setMailCode(String mailCode)
	{
		m_mailCode.setValue(mailCode);
	}

	public String getZipCode()
	{
		return m_zipCode.getValue();
	}

	public void setZipCode(String zipCode)
	{
		m_zipCode.setValue(zipCode);
	}

	public String getAreaCode()
	{
		return m_areaCode.getValue();
	}

	public void setAreaCode(String areaCode)
	{
		m_areaCode.setValue(areaCode);
	}

	public String getPhoneNumber()
	{
		return m_phoneNumber.getValue();
	}

	public void setPhoneNumber(String phoneNumber)
	{
		m_phoneNumber.setValue(phoneNumber);
	}

	public String getEmail()
	{
		return m_email.getValue();
	}

	public void setEmail(String email)
	{
		m_email.setValue(email);
	}

	public String getWebsiteUrl()
	{
		return m_websiteUrl.getValue();
	}

	public void setWebsiteUrl(String websiteUrl)
	{
		m_websiteUrl.setValue(websiteUrl);
	}

	public String getComment()
	{
		return m_comment.getValue();
	}

	public void setComment(String comment)
	{
		m_comment.setValue(comment);
	}

	public long getDefaultGroupId()
	{
		return m_defaultGroupId.getValue();
	}

	public void setDefaultGroupId(Long defaultGroupId)
	{
		m_defaultGroupId.setValue(defaultGroupId);
	}

	public Group getDefaultGroup() throws IOException, SQLException
	{
		if (m_defaultGroupId.isNull())
			return null;

		return new Group(m_defaultGroupId.getValue());
	}

	public void setDefaultGroup(Group defaultGroup)
	{
		if (defaultGroup != null && !defaultGroup.isNew())
			setDefaultGroupId(defaultGroup.getGroupId());
		else
			setDefaultGroupId(null);
	}

	public boolean isActive()
	{
		return m_active.getValue();
	}

	public void setActive(Boolean active)
	{
		m_active.setValue(active);
	}

	public boolean canSubmit()
	{
		return m_canSubmit.getValue();
	}


	public void setCanSubmit(Boolean canSubmit)
	{
		m_canSubmit.setValue(canSubmit);
	}

	public Date getLastLogin() { return m_lastLogin.getValue(); }

	public void setLastLogin(Date date) { m_lastLogin.setValue(date); }


	public Set<Group> memberships() throws IOException, SQLException
	{
		if (m_memberships == null) {
			Set<Group> groupMemberships;

			if (!isNew())
				groupMemberships = Group.findMemberships(m_userId.getValue());
			else
				groupMemberships = new TreeSet<Group>();

			m_memberships = new MembershipSet(groupMemberships);
		}

		return m_memberships;
	}

	public Map<String, String> preferences() throws IOException, SQLException
	{
		if (m_preferences == null) {
			Map<String, String> newPreferences = new TreeMap<String, String>();

			if (!isNew()) {
				Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
				PreparedStatement selectStmt = null;
				ResultSet prefRows = null;

				try {
					selectStmt = dbConn.prepareStatement("SELECT PREFERENCE, VALUE FROM user_preferences WHERE USER_ID = ?");

					m_userId.setParameter(selectStmt, 1);

					prefRows = selectStmt.executeQuery();

					while (prefRows.next())
						newPreferences.put(prefRows.getString(1), prefRows.getString(2));
				}
				finally {
					if (prefRows != null)
						prefRows.close();

					if (selectStmt != null)
						selectStmt.close();

					dbConn.close();
				}
			}

			m_preferences = new PreferenceMap(newPreferences);
		}

		return m_preferences;
	}

	public List<Folder> findFolders() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return Folder.findFolders(new LongCriterion("USER_ID", m_userId.getValue()));
	}

	public List<UserDataItem> findDataItems() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return UserDataItem.findDataItems(new LongCriterion("USER_ID", m_userId.getValue()));
	}

	public List<Task> findTasks() throws IOException, SQLException
	{
		if (isNew())
			return null;

		return Task.findTasks(new LongCriterion("USER_ID", m_userId.getValue()));
	}

	public static List<User> findAllUsers() throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet userRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME);

			userRows = selectStmt.executeQuery();

			List<User> users = new ArrayList<User>();

			while (userRows.next())
				users.add(new User(userRows));

			return users;
		}
		finally {
			if (userRows != null)
				userRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}


	public static User findUserByUsername(String username) throws IOException, SQLException
	{
		return findUser(new StringCriterion("USERNAME", username));
	}

	public static User findUserByEmail(String email) throws IOException, SQLException
	{
		return findUser(new StringCriterion("EMAIL", email));
	}

	public boolean isNew()
	{
		return m_userId.isNull();
	}

	@Override
	public boolean equals(Object other)
	{
		if (other == null)
			return false;

		if (this == other)
			return true;

		if (other instanceof User == false)
			return false;

		User otherUser = (User) other;

		if (isNew() || otherUser.isNew())
			return false;

		return getUserId() == otherUser.getUserId();
	}

	@Override
	public int hashCode()
	{
		return (new Long(getUserId())).hashCode();
	}

	public int compareTo(User other)
	{
		if (other == null)
			throw new NullPointerException("other");

		if (this == other)
			return 0;

		if (isNew())
			return -1;

		if (other.isNew())
			return 1;

		return (int) (getUserId() - other.getUserId());
	}

	/**
		I'm adding a feature (for teragrid hosts) that lets us store user's personal account info and use it
		to run jobs.  For teragrid we just need to store a single "charge code" string so I'm storing it in
		the user preferences.

		The preference name has the form "account_<accountGroup>".  The same teragrid charge code is used
		for multiple teragrid hosts, so in the tool registry and ToolResource class I'm adding an accountGroup
		field.  For instance, both abe and lonestar will have accountGroup=teragrid.

		When a user edits his profile and enters his teragrid accountGroup we store it by calling:
			User.setAccount("teragrid", chargeCode)
		Pass in null for chargeCode to clear the value.

		This form can display the existing value if any with
			User.getAccount("teragrid").
		ProcessWorker's do:
			User.getAccount(ToolResource.getAccountGroup())

		Internally, we add the "account_" prefix to reduce the possibility of name clashes with other
		preferences.
	*/

	public void setAccount(String accountGroup, String chargeCode)
	{
		try
		{
			Map<String, String> p = preferences();
			accountGroup = "account_" + accountGroup;
			p.put(accountGroup, chargeCode);
			save();
		}
		catch(Exception e)
		{
			log.error("", e);
			throw new WorkbenchException("Internal Database Error");
		}
	}

	/**
		Returns null if not found.
	*/
	public String getAccount(String accountGroup)
	{
		try
		{
			Map<String, String> p = preferences();
			accountGroup = "account_" + accountGroup;
			return p.get(accountGroup);
		}
		catch(Exception e)
		{
			log.error("", e);
			throw new WorkbenchException("Internal Database Error");
		}
	}


	// package methods


	Criterion getKey()
	{
		return new SimpleKey(m_userId);
	}

	void save(Connection dbConn) throws IOException, SQLException
	{
		List<Column<?>> colList = new ArrayList<Column<?>>();

		if (isNew()) {
			colList.add(m_firstName);
			colList.add(m_lastName);
			colList.add(m_username);
			colList.add(m_appname);
			colList.add(m_password);
			colList.add(m_institution);
			colList.add(m_role);
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
			colList.add(m_defaultGroupId);
			colList.add(m_active);
			colList.add(m_canSubmit);
			colList.add(m_lastLogin);

			insert(dbConn, new AutoGeneratedKey(m_userId), colList);

			if (m_defaultGroupId.isNull()) {
				Group defaultGroup = new Group();

				defaultGroup.setGroupname(m_username.getValue());
				defaultGroup.setAdministratorId(m_userId.getValue());
				defaultGroup.save(dbConn);

				long groupId = defaultGroup.getGroupId();

				m_defaultGroupId.setValue(groupId);

				colList.clear();
				colList.add(m_defaultGroupId);

				update(dbConn, colList);

				m_opQueue.add(new AddMembershipOp(groupId));
			}
		}
		else {
			if (m_firstName.isModified())
				colList.add(m_firstName);

			if (m_lastName.isModified())
				colList.add(m_lastName);

			if (m_username.isModified())
				colList.add(m_username);

			if (m_appname.isModified())
				colList.add(m_appname);

			if (m_password.isModified())
				colList.add(m_password);

			if (m_institution.isModified())
				colList.add(m_institution);

			if (m_role.isModified())
				colList.add(m_role);

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

			if (m_defaultGroupId.isModified())
				colList.add(m_defaultGroupId);

			if (m_active.isModified())
				colList.add(m_active);

			if (m_canSubmit.isModified())
				colList.add(m_canSubmit);

			if (m_lastLogin.isModified())
				colList.add(m_lastLogin);

			update(dbConn, colList);
		}

		for (Iterator<RowOperation> operations = m_opQueue.iterator() ; operations.hasNext() ; )
			operations.next().execute(dbConn);

		m_opQueue.clear();
	}

	void delete(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		delete(dbConn, m_userId.getValue());

		m_userId.reset();
	}

	void deleteData(Connection dbConn) throws IOException, SQLException
	{
		if (isNew())
			throw new WorkbenchException("Not persisted");

		deleteData(dbConn, m_userId.getValue());
	}

	void refresh(Connection dbConn) throws IOException, SQLException
	{
		select(dbConn, COLUMN_NAMES);

		m_opQueue.clear();
		m_memberships = null;
		m_preferences = null;
	}

	static Set<User> findMembers(long groupId) throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet userRows = null;

		try {
			selectStmt = dbConn.prepareStatement("SELECT " + COLUMN_NAMES +
					"FROM groups " +
						"INNER JOIN user_group_lookup ON groups.GROUP_ID = user_group_lookup.GROUP_ID " +
						"INNER JOIN " + TABLE_NAME + " ON user_group_lookup.USER_ID = " + TABLE_NAME + ".USER_ID " +
					"WHERE groups.GROUP_ID = ?");

			selectStmt.setLong(1, groupId);

			userRows = selectStmt.executeQuery();

			Set<User> members = new TreeSet<User>();

			while (userRows.next())
				members.add(new User(userRows));

			return members;
		}
		finally {
			if (userRows != null)
				userRows.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	//###
	public static Long getSusForThisPeriod(long userId) throws IOException, SQLException, Exception
	{
		if (accountingPeriodStart == null)
		{
			accountingPeriodStart = WorkbenchCIPRES.getInstance().getProperties().getProperty("accounting.period.start");
			if (accountingPeriodStart == null)
			{
				throw new Exception("Unable to retrieve accounting.period.start from workbench.properties");
			}
			log.debug("accountingPeriodStart for cpu Hrs is '" + accountingPeriodStart + "'");
		}
		String stmtBuilder = "select convert(sum(tgusage.su), unsigned) " +
				"from job_stats, tgusage where " +
				"job_stats.resource = tgusage.resource and " +
				"job_stats.remote_job_id = tgusage.jobid and " +
				"abs(datediff(job_stats.date_submitted, tgusage.submit_time)) < 2 and " +
				"job_stats.date_submitted > '" + accountingPeriodStart +  "' and " +
				"job_stats.user_id= ?";
		log.debug("query is:'" + stmtBuilder + "'");
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet userRow = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder);
			selectStmt.setLong(1, userId);

			userRow = selectStmt.executeQuery();
			if (!userRow.next())
			{
				log.debug("no row returned");
				return null;
			}
			// column indices start with 1!  Apparently the sum() will be a decimal.
			long retval = userRow.getLong(1);
			log.debug("got " + retval);
			return userRow.wasNull() ? null : new Long(retval);
		}
		finally {
			if (userRow != null)
				userRow.close();
			if (selectStmt != null)
				selectStmt.close();
			dbConn.close();
		}
	}

	//### DELETE
	static void delete(Connection dbConn, long userId) throws SQLException
	{
		long groupId = getDefaultGroupId(dbConn, userId);

		unsetAdministrator(dbConn, userId);
		deletePrefs(dbConn, userId);
		deleteLookups(dbConn, userId);
		deleteFolders(dbConn, userId);

		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM " + TABLE_NAME + " WHERE USER_ID = ?");

		try {
			deleteStmt.setLong(1, userId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}

		Group.delete(dbConn, groupId);
	}

	public void deleteData() throws IOException, SQLException
	{
		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();

		try {
			dbConn.setAutoCommit(false);

			deleteData(dbConn);

			dbConn.commit();
		}
		catch (IOException ioErr) {
			log.error("", ioErr);
			dbConn.rollback();
			throw ioErr;
		}
		catch (SQLException sqlErr) {
			log.error("", sqlErr);
			dbConn.rollback();
			throw sqlErr;
		}
		finally {
			dbConn.close();
		}
	}

	static void deleteData(Connection dbConn, long userId) throws SQLException
	{
		deleteFolders(dbConn, userId);
	}


	// protected methods


	protected void populate(ResultSet row) throws IOException, SQLException
	{
		m_userId.assignValue(row, 1);
		m_firstName.assignValue(row, 2);
		m_lastName.assignValue(row, 3);
		m_username.assignValue(row, 4);
		m_appname.assignValue(row, 5);
		m_password.assignValue(row, 6);
		m_institution.assignValue(row, 7);
		m_role.assignValue(row, 8);
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
		m_defaultGroupId.assignValue(row, 20);
		m_active.assignValue(row, 21);
		m_canSubmit.assignValue(row, 22);
		m_lastLogin.assignValue(row, 23);

		super.populate(row, 24);
	}


	// private methods


	private static User findUser(Criterion key) throws IOException, SQLException
	{
		StringBuilder stmtBuilder = new StringBuilder("SELECT " + COLUMN_NAMES + " FROM " + TABLE_NAME + " WHERE ");
		stmtBuilder.append(key.getPhrase());


		Connection dbConn = ConnectionManager.getConnectionSource().getConnection();
		PreparedStatement selectStmt = null;
		ResultSet userRow = null;

		try {
			selectStmt = dbConn.prepareStatement(stmtBuilder.toString());

			key.setParameter(selectStmt, 1);

			log.debug("findUser query='" + selectStmt.toString() + "'");

			userRow = selectStmt.executeQuery();

			if (!userRow.next())
				return null;

			return new User(userRow);
		}
		finally {
			if (userRow != null)
				userRow.close();

			if (selectStmt != null)
				selectStmt.close();

			dbConn.close();
		}
	}

	private static long getDefaultGroupId(Connection dbConn, long userId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT DEFAULT_GROUP_ID FROM " + TABLE_NAME + " WHERE USER_ID = ?");
		ResultSet groupRow = null;

		try {
			selectStmt.setLong(1, userId);

			groupRow = selectStmt.executeQuery();

			if (!groupRow.next())
				return 0;

			return groupRow.getLong(1);
		}
		finally {
			if (groupRow != null)
				groupRow.close();

			selectStmt.close();
		}
	}

	private static void unsetAdministrator(Connection dbConn, long userId) throws SQLException
	{
		PreparedStatement updateStmt = dbConn.prepareStatement("UPDATE groups SET ADMINISTRATOR = NULL WHERE ADMINISTRATOR = ?");

		try {
			updateStmt.setLong(1, userId);

			updateStmt.executeUpdate();
		}
		finally {
			updateStmt.close();
		}
	}

	private static void deletePrefs(Connection dbConn, long userId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_preferences WHERE USER_ID = ?");

		try {
			deleteStmt.setLong(1, userId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteLookups(Connection dbConn, long userId) throws SQLException
	{
		PreparedStatement deleteStmt = dbConn.prepareStatement("DELETE FROM user_group_lookup WHERE USER_ID = ?");

		try {
			deleteStmt.setLong(1, userId);

			deleteStmt.executeUpdate();
		}
		finally {
			deleteStmt.close();
		}
	}

	private static void deleteFolders(Connection dbConn, long userId) throws SQLException
	{
		PreparedStatement selectStmt = dbConn.prepareStatement("SELECT FOLDER_ID FROM folders WHERE USER_ID = ?");
		ResultSet folderRows = null;

		try {
			selectStmt.setLong(1, userId);

			folderRows = selectStmt.executeQuery();

			while (folderRows.next())
				Folder.delete(dbConn, folderRows.getLong(1));
		}
		finally {
			if (folderRows != null)
				folderRows.close();

			selectStmt.close();
		}
	}
}
