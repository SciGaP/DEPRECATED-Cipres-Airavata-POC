/*
 * Workbench.java
 */
package org.ngbw.sdk;


import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.ngbw.sdk.api.core.GenericDataRecordCollection;
import org.ngbw.sdk.api.core.SourceDocumentTransformer;
import org.ngbw.sdk.api.data.SimpleSearchMetaQuery;
import org.ngbw.sdk.common.util.ValidationResult;
import org.ngbw.sdk.core.configuration.ServiceFactory;
import org.ngbw.sdk.core.shared.IndexedDataRecord;
import org.ngbw.sdk.core.shared.SourceDocumentType;
import org.ngbw.sdk.core.types.DataFormat;
import org.ngbw.sdk.core.types.DataType;
import org.ngbw.sdk.core.types.Dataset;
import org.ngbw.sdk.core.types.EntityType;
import org.ngbw.sdk.core.types.RecordFieldType;
import org.ngbw.sdk.core.types.RecordType;
import org.ngbw.sdk.database.Folder;
import org.ngbw.sdk.database.Group;
import org.ngbw.sdk.database.SourceDocument;
import org.ngbw.sdk.database.Task;
import org.ngbw.sdk.database.User;
import org.ngbw.sdk.database.UserDataItem;
import org.ngbw.sdk.tool.DisabledResourceException;
import org.ngbw.sdk.tool.Tool;


/**
 * This class is so far the main entry point into to the NGBW SDK. <br />
 * 
 * The <code>Workbench</code> spawns a <code>WorkbenchSession</code> for User bound
 * interaction. The Workbench keeps track of all spawned WorkbenchSessions and
 * secures that each user interacts with only one WorkbenchSession. The
 * Workbench is also responsible for suspending WorkbenchSessions to disk and
 * resume suspended WorkbenchSessions.
 * 
 * @author Roland H. Niedner
 * @author Paul Hoover
 * 
 */
public interface Workbench {

	/**
		Get properties loaded from workbench.properties on the classpath.
		Should be treated as read-only.
	*/
	public Properties getProperties();

	/* Workbench Basic Methods */

	/**
	 * Method returns the ServiceFactory which provides access to all module
	 * controllers of the workbench.
	 * 
	 * @return serviceFactory
	 */
	public ServiceFactory getServiceFactory();

	/* Session Management */

	/**
	 * Method returns an exclusive session for the user if the authentication
	 * succeeds.
	 * 
	 * @param username
	 * @param password
	 * @return session
	 * @throws UserAuthenticationException 
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public WorkbenchSession getSession(String username, String password) throws UserAuthenticationException, IOException, SQLException;
	
	public WorkbenchSession getSession(String username) throws UserAuthenticationException, IOException, SQLException; 

	/**
	 * Returns the active <code>WorkbenchSession</code> object for the indicated user. A <code>WorkbenchSession</code>
	 * object is only returned if the user actually has an active session, and if the given password matches the
	 * user's persisted password.
	 *  
	 * @param username the name of the user
	 * @param encryptedPassword the MD5 hash value for the user's password
	 * @return a <code>WorkbenchSession</code> object if the user has an active session, null otherwise
	 * @throws IOException
	 * @throws SQLException
	 * @throws UserAuthenticationException
	 */
	public WorkbenchSession getActiveSession(String username, String encryptedPassword) throws IOException, SQLException, UserAuthenticationException;
	
	/**
		This is for internal use by the sdk.  There are cases where some code is initiated from
		a workbench session, but the session isn't passed to all methods that need it.  Those
		methods can get the session by using this method.
	*/
	public WorkbenchSession retrieveActiveSession(long userID) throws Exception;
	
	/**
	 * A temporary measure to enable interaction with the Sirius applet.
	 * 
	 * @param username
	 * @param encryptedPassword
	 * @return
	 * @throws IOException
	 * @throws SQLException
	 * @throws UserAuthenticationException
	 */
	public WorkbenchSession getSessionForApplet(String username, String encryptedPassword) throws IOException, SQLException, UserAuthenticationException;
	
	/**
	 * Suspends the WorkbenchSession for the user with the submitted username by
	 * removing is from the active session map.
	 * 
	 * @param username
	 */
	public void suspendSession(String username);

	/**
	 * Method checks whether the user with the submitted username already has an
	 * active WorkbenchSession.
	 * 
	 * @param username
	 * @return hasActiveSession
	 */
	public boolean hasActiveSession(String username);

	/**
	 * Method returns a set of all usernames from Users with an active
	 * WorkbenchSession.
	 * 
	 * @return activeUsers
	 */
	public Set<String> getActiveUsers();

	/* MetaController Methods */

	/**
	 * Method returns whether there is a SourceDocumentTransformer registered
	 * for the submitted SourceDocumentType.
	 * 
	 * @param type
	 * @return hasTransformer
	 */
	public boolean hasTransformer(SourceDocumentType type, RecordType targetType);
	
	/**
	 * Method returns the set of RecordTypes that a SourceDocuemnt of the submitted
	 * type can be transformed into.
	 *  
	 * @param type
	 * @return targetTypes
	 */
	public Set<RecordType> getTransformationTargetRecordTypes(SourceDocumentType type);

	/**
	 * Return the SourceDocumentTransformer for the
	 * submitted SourceDocument.
	 * 
	 * @param sourceDocument
	 * @return transformer
	 * @throws InstantiationException 
	 * @throws IllegalAccessException 
	 * @throws InvocationTargetException 
	 * @throws NoSuchMethodException 
	 */
	public SourceDocumentTransformer getTransformer(SourceDocument sourceDocument, RecordType targetType) throws InstantiationException, IllegalAccessException, InvocationTargetException, NoSuchMethodException;
	
	/**
	 * Retrieve all user data records associated with the submitted data item.
	 * The DataRecord is a view that gives direct access to parsed out metadata
	 * of the source document. A DataItem may contain 1 or several DataRecords.
	 * These DataRecords are to be understood as a View of the UserDataItem with
	 * no life cycle of their own.
	 * 
	 * @param dataItem
	 * @return DataRecords
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public GenericDataRecordCollection<IndexedDataRecord> extractDataRecords(UserDataItem dataItem) throws IOException, SQLException, ParseException;
	

	/**
	 * Method extract the DataRecords for each UserDataItem in the submitted list.
	 * The returned map keys the extracted DataRecordCollection to the UserDataItem
	 * it was extracted from.
	 * 
	 * @param dataItems
	 * @return dataRecordCollections
	 */
	public Map<UserDataItem, GenericDataRecordCollection<IndexedDataRecord>> extractDataRecordCollections(
			List<UserDataItem> dataItems);
	
	/**
	 * Method extracts the individual record portion from SourceDocument associated
	 * with the submitted UserDataItem corresponding to the submitted index of
	 * the selected DataRecord.
	 * 
	 * @param dataItem
	 * @param dataRecordIndex
	 * @return sourceDocument
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public SourceDocument extractSubSourceDocument(UserDataItem dataItem, int dataRecordIndex) throws IOException, SQLException;
	
	/**
	 * Method extracts the individual record portion from the submitted 
	 * SourceDocument associated corresponding to the submitted index of
	 * the selected DataRecord.
	 * 
	 * @param sourceDocument
	 * @param dataRecordIndex
	 * @return subSourceDocument
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public SourceDocument extractSubSourceDocument(SourceDocument sourceDocument, int dataRecordIndex) throws IOException, SQLException;
	
	/**
	 * Method extracts the individual record portions from SourceDocument associated
	 * with the submitted UserDataItem corresponding to the submitted indices of
	 * the selected DataRecords.
	 * 
	 * @param dataItem
	 * @param dataRecordIndices
	 * @return sourceDocuments
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public List<SourceDocument> extractSubSourceDocuments(UserDataItem dataItem, int[] dataRecordIndices) throws IOException, SQLException;
	
	/**
	 * Method separates all UserDataItems in the submitted folders into RecordTypes
	 * specific Lists and returns these List keyed to their RecordType in a Map.
	 * @param folder
	 * @return typeUserDataItemLists
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public Map<RecordType, List<UserDataItem>> sortDataItemsByRecordType(Folder folder) throws IOException, SQLException ;

	/**
	 * Method separates all UserDataItems in the submitted folders into DataFormat
	 * specific Lists and returns these List keyed to their RecordType in a Map.
	 * 
	 * @param folder
	 * @return typeUserDataItemLists
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public Map<DataFormat, List<UserDataItem>> sortDataItemsByDataFormat(Folder folder) throws IOException, SQLException;

	/* TaskAgent Support Methods */
	/**
	 * Start a new TaskRun for the submitted Task using the submitted inputData.
	 * Since a Task can be shared via group memberships as taskRun might have a
	 * different owner then the task itself. Thus the current userProfile must
	 * me submitted (initial group is the default group for this user.
	 * 
	 * This method will supervise the following steps:
	 * <ol>
	 * <li>look up of the required input DataFormat for the tool of the task</li>
	 * <li>conversion of the inputData into a suitable SourceDocument</li>
	 * <li>getting a filename for the input file</li>
	 * <li>staging of the SourceDocument to the tool workspace</li>
	 * <li>getting filename for each parameter UserDataItem</li>
	 * <li>staging of each parameter file to the tool workspace</li>
	 * <li>render the commandline</li>
	 * <li>launch a process executing the command</li>
	 * <li>depending on the tool: </li>
	 * <ul>
	 * <li>capture the process output directly</li>
	 * <li>retrieve the content of the output file</li>
	 * </ul>
	 * <li>write the output into a new UserDataItem</li>
	 * <li>set the output dataItem to the TaskRun output</li>
	 * 
	 * Depending on the speed of the process the returned TaskRun instance will
	 * either already contain the output or not. TaskRun staging execution and
	 * unstaging happens in a separate thread. You can specify in seconds how
	 * long the submitting thread will wait for the result to come back.
	 * 
	 * @param task
	 * @return updated task instance
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public String submitTask(Task task, Boolean loggedInViaIPlant) 
		throws Exception, DisabledResourceException;

	public String submitTask(Task task) 
			throws Exception, DisabledResourceException;

	/**
	 * Method allows you to submit a transient task. Before submission the task
	 * is saved to the target folder. see submitTask(Task task)
	 * 
	 * @param task
	 * @param folder
	 * @return saved task instance
	 * @throws SQLException 
	 * @throws IOException 
	 * @returns unique jobHandle
	 */
	public String saveAndSubmitTask(Task task, Folder folder, Boolean loggedInViaIPlant) 
		throws Exception, DisabledResourceException;

	public String saveAndSubmitTask(Task task, Folder folder) 
		throws Exception, DisabledResourceException;

	/**
		Run already rendered commands synchronously.  Does so by inserting a Task that
		isn't associated with any user.

		@param toolName

		@param command Rendered command line to be executed.

		@param input Maps filenames (as they appear in command) to their contents as byte arrays.  The data 
		will be staged to the specified files before the command is executed.

		@param outputFiles Maps parameter names to the names of the expected output files.  Filenames may
		include wildcards.  The contents of the files will be harvested to create the map that is returned.

		@param allowMissingFiles if false an exception will be thrown if any of the expected outputFiles
		aren't found.  If true, missing files don't generate an exception.  THIS PARAMETER IS NOW
		IGNORED.  BaseProcessWorker.storeOutputFiles() doesn't throw an exception when a file is
		missing ... missing is always allowed.

		@return Map of output parameter name -> (map of filename -> file contents)
		Each output parameter may map to multiple filenames if wildcards were used in outputFiles.
	 * @throws Exception 
	*/
	/*
	public Map<String, Map<String, byte[]>>
	runCommand(	String toolName,
				String[] command,
				Map<String, byte[]> input,
				Map<String,String> outputFiles,
				boolean allowMissingFiles) throws Exception
	{
		return (new CommandRunner(serviceFactory)).runCommand(toolName, command, input, outputFiles);
	}
	*/

	/* Semantic Annotation Methods */

	/**
	 * Return all registered EntityTypes that are mapped to non-abstract
	 * RecordTypes
	 * 
	 * @return Set<EntityType>
	 */
	public Set<EntityType> getEntityTypes() ;

	/**
	 * Return all registered EntityTypes (such as PROTEIN, NUCLEIC_ACID,
	 * COMPOUND, etc.)
	 * 
	 * @return Set<EntityType>
	 */
	public Set<EntityType> getAllEntityTypes();

	/**
	 * Return all registered DataTypes  that are mapped to non-abstract
	 * RecordTypes.
	 * 
	 * @return Set<DataType>
	 */
	public Set<DataType> getDataTypes();

	/**
	 * Return all registered DataTypes (SEQUENCE, STRUCTURE, SEQUENCE_ALIGNMENT
	 * etc.)
	 * 
	 * @return Set<DataType>
	 */
	public Set<DataType> getAllDataTypes();

	/**
	 * Return all registered RecordTypes (such as PROTEIN_SEQUENCE,
	 * NUCLEIC_ACID_SEQUENCE, COMPOUND_STRUCTURE, etc.)
	 * 
	 * @return Set<RecordType>
	 */
	public Set<RecordType> getRecordTypes();

	/**
	 * Return all registered RecordTypes for the submitted EntityType (such as
	 * PROTEIN_SEQUENCE, PROTEIN_SEQUENCE_ALIGNMENT, etc. for PROTEIN).
	 * 
	 * @param entityType
	 * @return Set<RecordType>
	 */
	public Set<RecordType> getRecordTypes(EntityType entityType);

	/**
	 * Return all registered RecordTypes for the submitted DataType (such as
	 * PROTEIN_SEQUENCE, NUCLEIC_ACID_SEQUENCE, etc. for SEQUENCE).
	 * 
	 * @param dataType
	 * @return Set<RecordType>
	 */
	public Set<RecordType> getRecordTypes(DataType dataType);

	/**
	 * Returns the registered RecordType for the submitted EntityType and DataType.
	 * 
	 * @param entityType
	 * @param dataType
	 * @return RecordType
	 */
	public RecordType getRecordType(EntityType entityType, DataType dataType);
	
	/**
	 * Method returns the DataType of the submitted RecordType.
	 * 
	 * @param recordType
	 * @return dataType
	 */
	public DataType getDataType(RecordType recordType);
	
	/**
	 * Method returns the EntityType of the submitted RecordType.
	 * 
	 * @param recordType
	 * @return entityType
	 */
	public EntityType getEntityType(RecordType recordType);
	
	/**
	 * Method returns all RecordFields for the submitted RecordType.
	 * 
	 * @param recordType
	 * @return recordFields
	 */
	public Set<RecordFieldType> getRecordFields(RecordType recordType);

	/* ConversionService Methods */

	/**
	 * Method splits a (potentially) multi-record SourceDocument into
	 * a List of SourceDocuments, each corresponding to an individual
	 * DataRecord.
	 * 
	 * @param sourceDocument
	 * @return sourceDocumentList
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public List<SourceDocument> splitSourceDocument(SourceDocument sourceDocument) throws IOException, SQLException;

	/**
	 * Method returns all registered DataFormats that can be read into a
	 * DataRecord. Be aware that some DataFormats encode different DataTypes
	 * (like a Fasta formatted data may represent a single Sequence or a
	 * collection of Sequences or an Alignment.
	 * CAVE: registered does not imply readable
	 * 
	 * @return dataFormats
	 */
	public Set<DataFormat> getRegisteredDataFormats();

	/**
	 * Method returns all registered DataFormats for the submitted RecordType
	 * that can be read into a DataRecord.
	 * CAVE: registered does not imply readable
	 * 
	 * @param recordType
	 * @return dataFormats
	 */
	public Set<DataFormat> getRegisteredDataFormats(RecordType recordType);

	/**
	 * Parse a SourceDocument instance that contains a one or more entries (eg.
	 * single sequence fasta file) and populate a DataRecordCollection.
	 * 
	 * @param srcDocument
	 * @return dataRecordCollection
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public GenericDataRecordCollection<IndexedDataRecord> read(SourceDocument srcDocument) throws IOException, SQLException, ParseException;

	/**
	 * This method will parse a SourceDocument and reassemble the data into the
	 * submitted target SourceDocumentType. This conversion will only then lead
	 * to a successful result if the information content of source format <=
	 * target format.
	 * 
	 * @param srcDocument
	 * @param targetKey
	 * @return sourceDocument
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public SourceDocument convert(SourceDocument srcDocument,
			SourceDocumentType targetKey) throws IOException, SQLException, ParseException;

	/**
	 * This method will parse all SourceDocuments of the submitted input
	 * collection and reassemble all of them into one new SourceDocuments of the
	 * submitted target SourceDocumentType. This conversion will only then lead
	 * to a successful result if the information content of source format <=
	 * target format.
	 * 
	 * @param srcDocuments
	 * @param targetKey
	 * @return sourceDocument
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public SourceDocument convert(Collection<SourceDocument> srcDocuments,
			SourceDocumentType targetKey) throws IOException, SQLException, ParseException;

	/**
	 * Method returns all target SemanticKeys that the submitted source
	 * DataFormat can be converted into.
	 * 
	 * @param sourceDocumentType
	 * @return targetSemanticKeys
	 */
	public Set<SourceDocumentType> getSourceDocumentTypes(
			SourceDocumentType sourceDocumentType) ;

	/**
	 * Method checks whether there is a SourceDocumentReader registered in the
	 * ConversionService for the submitted SourceDocumentType.
	 * 
	 * @param sourceDocumentType
	 * @return canRead
	 */
	public boolean canRead(SourceDocumentType sourceDocumentType) ;

	/**
	 * Method checks the submitted SourceDocument whether the data are indeed
	 * formatted in the declared SourceDocumentType. It will also set the flag
	 * of the sourceDocument to validated = true if the check is successful.
	 * 
	 * @param srcDocument
	 * @return isValid
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public boolean validate(SourceDocument srcDocument) throws IOException, SQLException;

	/**
	 * Method checks whether there is a converter registered in the
	 * ConversionService that can submitted SourceDocument can be converted into
	 * the target format.
	 * 
	 * @param sourceKey
	 * @param targetKey
	 * @return true if the SourceDocument can be converted into the target
	 *         format.
	 */
	public boolean canConvert(SourceDocumentType sourceKey,
			SourceDocumentType targetKey) ;

	/* ************ DatasetService Methods ********** */

	/**
	 * Method returns all RecordTypes that have at least one Dataset
	 * registered.
	 * 
	 * @return recordTypes
	 */
	public Set<RecordType> getSearchableRecordTypes();
	
	/**
	 * Method returns all EntityTypes that have at least one Dataset
	 * registered.
	 * 
	 * @return entityTypes
	 */
	public Set<EntityType> getSearchableEntityTypes();
	
	/**
	 * Method returns all DataTypes that have at least one Dataset
	 * registered.
	 * 
	 * @return dataTypes
	 */
	public Set<DataType> getSearchableDataTypes();
	
	/**
	 * Method returns all registered Datasets.
	 * 
	 * @return datasets
	 */
	public Set<Dataset> getDatasets();

	/**
	 * Method returns all registered Datasets for the submitted DataType and
	 * EntityType.
	 * 
	 * @param entityType
	 * @param dataType
	 * @return datasets
	 */
	public Set<Dataset> getDatasets(EntityType entityType, DataType dataType);

	/**
	 * Method returns all registered Datasets for the submitted RecordType.
	 * 
	 * @param recordType
	 * @return datasets
	 */
	public Set<Dataset> getDatasets(RecordType recordType);

	/**
	 * Method returns the SourceDocumentType for the submitted Dataset.
	 * 
	 * @param dataset
	 * @return sourceDocumentType
	 */
	public SourceDocumentType getSourceDocumentType(Dataset dataset);

	/**
	 * Method returns the RecordType for the submitted Dataset.
	 * 
	 * @param dataset
	 * @return recordType
	 */
	public RecordType getRecordType(Dataset dataset) ;

	/* Query Methods */

	/**
	 * Get a SimpleSearchMetaQuery for the submitted Dataset. A
	 * SimpleSearchMetaQuery can be used multiple times and executed with a
	 * different searchPhrase respectively.
	 * 
	 * @param dataset
	 * @return SimpleSearchMetaQuery for the dataset parameter
	 */
	public SimpleSearchMetaQuery getSimpleSearchQuery(Dataset dataset);

	/**
	 * Get a SimpleSearchMetaQuery for the submitted Datasets. A
	 * SimpleSearchMetaQuery can be used multiple times and executed with a
	 * different searchPhrase respectively.
	 * 
	 * @param datasets
	 * @return SimpleSearchMetaQuery for the datasets parameter
	 */
	public SimpleSearchMetaQuery getSimpleSearchQuery(Set<Dataset> datasets);

	/* ************ ToolService Methods ********** */

	/**
	 * Return all registered Tools.
	 * 
	 * @return Set<Tool>
	 */
	public Set<String> getToolIds();

	/*
		Return all registered tools that don't have an inactive=true attribute.

	*/
	public Set<String> getActiveToolIds();

	/* User and UserData Administrative Methods */

	/**
	 * Method allows a client to register a new user account. The method checks
	 * that the submitted fields do not violate any constraints in the user
	 * database.
	 * 
	 * @param user
	 * @return ValidationResult
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public ValidationResult registerNewUser(User user) throws IOException, SQLException;

	/**
	 * Method allows a client to fully register a guest user account. The method
	 * checks that the submitted fields do not violate any constraints in the
	 * user database. The method will typically simply update the existing guest
	 * user account.
	 * 
	 * @param user
	 * @return ValidationResult
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public ValidationResult registerGuestUser(User user) throws IOException, SQLException;

	/**
	 * Method allows a client to update user information. The method checks that
	 * the updated fields do not violate any constraints in the user database.
	 * 
	 * @param user
	 * @return ValidationResult
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public ValidationResult updateUser(User user) throws IOException, SQLException;

	/**
	 * Method allows an administrator to reset a user password without knowing
	 * the existing password.
	 * 
	 * @param username
	 * @param newPassword
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public void resetPasswordAdmin(String username, String newPassword) throws IOException, SQLException ;

	/**
	 * Method saves the submitted group and assigns the user with the submitted
	 * username as group administrator.
	 * 
	 * @param group
	 * @param administrator
	 * @return group
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public Group saveNewGroup(Group group, User administrator) throws IOException, SQLException;

	// Factory methods

	/**
	 * Method returns a new transient User instance.
	 * 
	 * @return user
	 */
	public User getNewUserInstance();

	/**
	 * Method returns a new transient Group instance.
	 * 
	 * @return group
	 */
	public Group getNewGroupInstance();

	public Tool getTool(String toolId);

	public void convertEncoding(File file) throws Exception;

}
