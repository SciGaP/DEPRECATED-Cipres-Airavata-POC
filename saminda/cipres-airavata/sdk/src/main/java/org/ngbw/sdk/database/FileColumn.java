/*
 * FileColumn.java
 */
package org.ngbw.sdk.database;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Properties;
import java.util.UUID;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.ngbw.sdk.common.util.TimeUtils;


/**
 * Represents a <code>LONGVARBINARY</code> column from a database table. The binary value is stored
 * in a file, rather than the database, and the value of the column is the name of the file stored as
 * a <code>VARCHAR</code>.
 *
 * @author Paul Hoover
 *
 */
class FileColumn extends StreamColumn<byte[]> {

  // nested classes


  /**
   *
   */
  private class FileValue implements StreamValue<byte[]> {

    // data fields


    private boolean m_temporary;
    private long m_streamLength;
    private String m_fileName;
    private String m_dbFileName;


    // constructors


    /**
     *
     */
    public FileValue()
    {
      m_temporary = true;
    }


    // public methods


    /**
     *
     * @return
     */
    public byte[] getValue()
    {
      try {
        InputStream inStream = getValueAsStream();

        try {
          ByteArrayOutputStream outBytes = new ByteArrayOutputStream();

          copyStream(inStream, outBytes);

          return outBytes.toByteArray();
        }
        finally {
          inStream.close();
        }
      }
      catch (IOException ioErr) {
        m_log.error("", ioErr);

        return null;
      }
    }

    /**
     *
     * @return
     * @throws IOException
     */
    public InputStream getValueAsStream() throws IOException
    {
      InputStream fileStream = new FileInputStream(m_fileRoot + m_fileName);
      InputStream inStream;

      if (m_compressed)
        inStream = new BufferedInputStream(new GZIPInputStream(fileStream));
      else
        inStream = new BufferedInputStream(fileStream);

      return inStream;
    }

    /**
     *
     * @param value
     */
    public void setValue(byte[] value)
    {
      try {
        setValue(new ByteArrayInputStream(value));
      }
      catch (IOException ioErr) {
        m_log.error("", ioErr);
      }
    }

    /**
     *
     * @param value
     * @throws IOException
     */
    public void setValue(InputStream value) throws IOException
    {
      File newFile = getNewFile(m_temporary, m_compressed);
      OutputStream outFile = new FileOutputStream(newFile);
      OutputStream outStream;

      if (m_compressed)
        outStream = new BufferedOutputStream(new GZIPOutputStream(outFile));
      else
        outStream = new BufferedOutputStream(outFile);

      try {
        m_streamLength = copyStream(value, outStream);
      }
      finally {
        outStream.close();
      }

      m_fileName = newFile.getAbsolutePath().substring(m_fileRoot.length());
    }

    /**
     * Sets the value of the object using a row from a <code>ResultSet</code> object. The row used
     * is the one indicated by the current position of the <code>ResultSet</code> object's cursor.
     *
     * @param value the <code>ResultSet</code> object that contains the row
     * @param index the offset in the row that indicates the column whose value will be assigned to this object
     * @throws IOException
     * @throws SQLException
     */
    public void setValue(ResultSet value, int index) throws IOException, SQLException
    {
      m_fileName = value.getString(index);
      m_temporary = false;
      m_streamLength = 0;

      InputStream inStream = getValueAsStream();

      try {
        int bytesRead;
        byte[] readBuffer = new byte[8192];

        while ((bytesRead = inStream.read(readBuffer, 0, readBuffer.length)) > 0)
          m_streamLength += bytesRead;
      }
      finally {
        inStream.close();
      }
    }

    /**
     *
     * @param statement
     * @param index
     * @throws IOException
     * @throws SQLException
     */
    public void setParamValue(PreparedStatement statement, int index) throws IOException, SQLException
    {
      if (m_temporary) {
        rename();

        m_temporary = false;
      }

      if (!m_owner.isNew())
        m_dbFileName = fetchDbFileName();

      statement.setString(index, m_fileName);
    }

    /**
     *
     * @return
     */
    public long getLength()
    {
      return m_streamLength;
    }

    /**
     *
     * @return
     */
    public boolean isNull()
    {
      return m_fileName == null;
    }

    /**
     *
     * @param other
     * @return
     */
    public boolean isEqual(byte[] other)
    {
      return false;
    }

    /**
     *
     */
    public void finishUpdate()
    {
      if (m_fileName != null && m_temporary) {
        delete(m_fileName);

        m_streamLength = 0;
        m_fileName = null;
      }

      if (m_dbFileName != null) {
        if (!m_dbFileName.equals(m_fileName))
          delete(m_dbFileName);

        m_dbFileName = null;
      }
    }

    /**
     *
     */
    public void reset()
    {
      if (m_fileName != null) {
        if (m_temporary)
          delete(m_fileName);

        m_streamLength = 0;
        m_fileName = null;
      }

      m_temporary = true;
      m_dbFileName = null;
    }


    // private methods


    /**
     *
     */
    private void rename()
    {
      String fileSeparator = System.getProperty("file.separator");
      int offset = m_fileName.lastIndexOf(fileSeparator);
      String subDirName;

      if (offset >= 0)
        subDirName = m_fileName.substring(0, offset + 1);
      else
        subDirName = "";

      String baseName = getRandomName();
      String suffix = ".bin";

      if (m_compressed)
        suffix += ".gz";

      File original = new File(m_fileRoot + m_fileName);

      while (true) {
        String newFileName = subDirName + baseName + suffix;
        File renamed = new File(m_fileRoot + newFileName);

        if (!renamed.exists() && original.renameTo(renamed)) {
          m_fileName = newFileName;

          return;
        }

        baseName = getRandomName();
      }
    }
  }

  /**
   *
   */
  private class FetchHandler implements ResultHandler {

    // data fields


    private String m_dbValue;


    // public methods


    /**
     *
     * @param row
     * @throws SQLException
     */
    public void process(ResultSet row) throws SQLException
    {
      m_dbValue = row.getString(1);
    }

    /**
     *
     * @return
     */
    public String getResult()
    {
      return m_dbValue;
    }
  }


  // data fields


  private static final Log m_log = LogFactory.getLog(FileColumn.class);
  private static final int MAX_MINOR_DIRS = 1024;
  private static final int MAX_FILES = 2048;
  private static final String FILE_ROOT_PROPERTY = ConnectionSource.DATABASE_PROP_PREFIX + "fileRoot";
  private static int m_majorDirName;
  private static int m_minorDirName;
  private static String m_fileRoot;
  private final boolean m_compressed;
  private final LongColumn m_length;


  static {
    try {
      Properties configProps = ConnectionSource.getDatabaseConfiguration();
      String fileRoot = configProps.getProperty(FILE_ROOT_PROPERTY);

      if (fileRoot == null || fileRoot.length() == 0)
        throw new Exception("Property " + FILE_ROOT_PROPERTY + " is empty");

      String fileSeparator = System.getProperty("file.separator");

      if (fileRoot.endsWith(fileSeparator))
        m_fileRoot = fileRoot;
      else
        m_fileRoot = fileRoot + fileSeparator;

      File initialDir = new File(m_fileRoot + String.valueOf(m_majorDirName) + fileSeparator + String.valueOf(m_minorDirName));

      if (!initialDir.exists())
        initialDir.mkdirs();
    }
    catch (Exception err) {
      m_log.error("", err);
    }
  }


  // constructors


  /**
   * Constructs a column representation and assigns a <code>null</code> value to it.
   *
   * @param name the name of the column
   * @param nullable whether the column lacks or has a <code>NOT NULL</code> constraint
   * @param compressed whether or not data stored in the column is compressed
   * @param owner a reference to the <code>Row</code> object that owns this object
   */
  FileColumn(String name, boolean nullable, boolean compressed, Row owner)
  {
    this(name, nullable, compressed, owner, null);
  }

  /**
   * Constructs a column representation and assigns a <code>null</code> value to it.
   *
   * @param name the name of the column
   * @param nullable whether the column lacks or has a <code>NOT NULL</code> constraint
   * @param compressed whether or not data stored in the column is compressed
   * @param owner a reference to the <code>Row</code> object that owns this object
   * @param length a reference to a <code>LongColumn</code> object that contains the length of the value
   */
  FileColumn(String name, boolean nullable, boolean compressed, Row owner, LongColumn length)
  {
    super(name, nullable, owner);

    m_length = length;
    m_compressed = compressed;
  }

  /**
   * Constructs a column representation and assigns the given value to it.
   *
   * @param name the name of the column
   * @param nullable whether the column lacks or has a <code>NOT NULL</code> constraint
   * @param compressed whether or not data in the column is compressed
   * @param owner a reference to the <code>Row</code> object that owns this object
   * @param length a reference to a <code>LongColumn</code> object that contains the length of the value
   * @param value an initial value to assign to the object
   */
  FileColumn(String name, boolean nullable, boolean compressed, Row owner, LongColumn length, byte[] value)
  {
    this(name, nullable, compressed, owner, length);

    assignValue(value);
  }


  // public methods


  /**
   * Assigns a value to the object and sets the modified and populated states to <code>true</code>. The
   * assignment is ignored if the value provided is equal to the current value of the object.
   *
   * @param value the value to assign to the object
   */
  @Override
  public void setValue(byte[] value)
  {
    m_value.reset();

    super.setValue(value);

    if (m_length != null)
      m_length.setValue(((FileValue)m_value).getLength());
  }

  /**
   *
   * @param value
   * @throws IOException
   */
  public void setValue(InputStream value) throws IOException
  {
    m_value.reset();

    super.setValue(value);

    if (m_length != null)
      m_length.setValue(((FileValue)m_value).getLength());
  }

  /**
   * Assigns a value to the object, sets the modified state to <code>false</code>, and
   * sets the populated state to <code>true</code>.
   *
   * @param value the value to assign to the object
   */
  @Override
  public void assignValue(byte[] value)
  {
    m_value.reset();

    super.assignValue(value);

    if (m_length != null)
      m_length.assignValue(((FileValue)m_value).getLength());
  }

  /**
   * Assigns a value to the object using a row from a <code>ResultSet</code> object. The row used
   * is the one indicated by the current position of the <code>ResultSet</code> object's cursor.
   *
   * @param value the <code>ResultSet</code> object that contains the row
   * @param index the offset in the row that indicates the column whose value will be assigned to this object
   * @throws IOException
   * @throws SQLException
   */
  @Override
  public void assignValue(ResultSet value, int index) throws IOException, SQLException
  {
    m_value.reset();

    super.assignValue(value, index);

    if (m_length != null)
      m_length.assignValue(((FileValue)m_value).getLength());
  }


  // package methods


  /**
   *
   * @param fileName
   */
  static void delete(String fileName)
  {
    (new File(m_fileRoot + fileName)).delete();
  }


  // protected methods


  /**
   * Returns the SQL data type of the column
   *
   * @return the SQL data type of the column
   */
  protected int getType()
  {
    return Types.VARCHAR;
  }

  /**
   *
   * @return
   */
  protected Value<byte[]> createValue()
  {
    return new FileValue();
  }


  // private methods


  /**
   *
   * @param inStream
   * @param outStream
   * @return
   * @throws IOException
   */
  private long copyStream(InputStream inStream, OutputStream outStream) throws IOException
  {
    int bytesRead;
    long totalRead = 0;
    byte[] readBuffer = new byte[8192];

    while ((bytesRead = inStream.read(readBuffer, 0, readBuffer.length)) > 0) {
      outStream.write(readBuffer, 0, bytesRead);

      totalRead += bytesRead;
    }

    return totalRead;
  }

  /**
   *
   * @return
   * @throws IOException
   * @throws SQLException
   */
  private String fetchDbFileName() throws IOException, SQLException
  {
    FetchHandler handler = new FetchHandler();

    fetchDbValue(handler);

    return handler.getResult();
  }

  /**
   *
   * @return a <code>String</code> object with a random value
   */
  private static String getRandomName()
  {
    return UUID.randomUUID().toString().replaceAll("-", "");
  }

  /**
   *
   * @param temporary
   * @param compressed
   * @return a <code>File</code> object opened on the new file
   * @throws IOException
   */
  private static synchronized File getNewFile(boolean temporary, boolean compressed) throws IOException
  {
    TimeUtils tu = new TimeUtils();
    int tries = 0;

    m_log.debug("Start new file creation");

    try {
      String fileSeparator = System.getProperty("file.separator");
      String dirName = m_fileRoot + String.valueOf(m_majorDirName) + fileSeparator + String.valueOf(m_minorDirName);

      while (true) {
        //m_log.debug("Checking to see if the maximum number of files in " + dirName + " has been exceeded");

        int numFiles = (new File(dirName)).list().length;

        if (numFiles <= MAX_FILES) {
          //m_log.debug("Found usable directory " + dirName);

          break;
        }

        //m_log.debug(dirName + " has " + numFiles + " files, searching for another directory");

        if (m_minorDirName < MAX_MINOR_DIRS - 1)
          m_minorDirName += 1;
        else {
          m_majorDirName += 1;
          m_minorDirName = 0;
        }

        dirName = m_fileRoot + String.valueOf(m_majorDirName) + fileSeparator + String.valueOf(m_minorDirName);

        File nextDir = new File(dirName);

        if (!nextDir.exists()) {
          nextDir.mkdirs();

         //m_log.debug("Created " + dirName);

          break;
        }
      }

      String suffix = ".bin";
      String prefix;
      File result;

      if (temporary)
        prefix = "temp-";
      else
        prefix = "";

      if (compressed)
        suffix += ".gz";

      while (true) {
        String baseName = getRandomName();
        String fileName = dirName + fileSeparator + prefix + baseName + suffix;

        result = new File(fileName);

        //m_log.debug("Attempting to create " + fileName);

        if (result.createNewFile())
          break;

        //m_log.debug("Failed to create " + fileName + ", trying again");
      }

      return result;
    }
    finally {
      //m_log.debug("Finish new file creation, number of tries = " + tries);

      if (tu.checkCutoff(60))
        m_log.debug("DB TIME: New file creation took " + tu.getElapsed());
    }
  }
}
