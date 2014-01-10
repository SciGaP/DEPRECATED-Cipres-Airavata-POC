package org.ngbw.web.treeimage;

import java.util.Properties;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.io.IOException;
import java.io.FileNotFoundException;
import org.apache.log4j.Logger;
import org.ngbw.sdk.common.util.StringUtils;

public class ImageMaker
{
	private static final Logger LOGGER = Logger.getLogger(ImageMaker.class);
	private String python_path;
	private String phy_fi_path;

	private Properties errors = new Properties();
	public Properties getErrors() { return errors; }

	private String warning = null;
	public String getWarning() { return warning; }

	// full path of input tree file
	private File tree;

	// full path of possibly rerooted tree file we create 
	private File retree;

	// Name of retree file will be same as treefile with ".rr" appended.
	private static final String RETREE_SUFFIX = ".rr";

	// comma separated list of nodes to collapse
	private String collapsedNodesStr;

	private String[] collapsedNodes;

	// directory that contains tree file
	private File dir;

	private File pngFile;
	private File nodePosFile;

	private String outgroups;

	private static int defaultWidth = 500; 
	private static int defaultHeight = -10; // -10 means autocalc based on number taxa
	public int getDefaultWidth() { return defaultWidth; }
	public int getDefaultHeight() { return defaultHeight; }

	public ImageMaker(File tree, String collapsedNodesStr, String python_path, String phy_fi_path,
		String outgroups) 
	{
		LOGGER.debug("In ImageMaker ctor");
		this.python_path = python_path;
		this.phy_fi_path = phy_fi_path;

		this.tree = tree;
		retree = new File(tree.getAbsolutePath() + RETREE_SUFFIX);
		pngFile = new File(tree.getAbsolutePath() + ".png");
		nodePosFile = new File(tree.getAbsolutePath() + ".nodepos");
		/*
		this.dir = tree.getParentFile();
		pngFile = new File(this.dir, "tree.png");
		nodePosFile = new File(this.dir, "tree.nodepos");
		*/

		this.collapsedNodesStr = (collapsedNodesStr == null? "" : collapsedNodesStr);
		collapsedNodes = this.collapsedNodesStr.split(",");

		this.outgroups = outgroups; 
	}

	/**
		Just the filename.  For now it's always "tree.png" but if we change the
		way phy.fi is invoked it can be different.

		This is used in treedraw.jsp to tell TreePic which image file is to be displayed.
	*/
	public String getImageFileName()
	{
		return pngFile.getName();
	}


	/*
		Creates a new collapsed node list string.  If node is in list
		of existing collapsed nodes, it won't be in the new string.  If it
		isn't there it will be in the new string.
	*/
	String newNodeList(String node)
	{
		boolean foundIt = false;
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < collapsedNodes.length; i++)
		{
			if (node.equals(collapsedNodes[i]))
			{
				foundIt = true;
				continue;
			}
			if (sb.length() > 0)
			{
				sb.append(",");
			}
			sb.append(collapsedNodes[i]);
		}
		if (foundIt == false)
		{
			if (sb.length() > 0)
			{
				sb.append(",");
			}
			sb.append(node);
		}
		return sb.toString();
	}



	public boolean makeImage() throws Exception
		{ return makeImage(defaultWidth, defaultHeight); }

	public boolean makeImage(int width, int height) throws Exception
	{
		LOGGER.debug("In makeImage");
		String treeStr = retree.getName(); //retree will contain the newick tree after we call reroot
		String dirStr = tree.getParent();

		String[] cmd = {	python_path,	
							phy_fi_path,	
							dirStr,
							treeStr,
							collapsedNodesStr,
							String.valueOf(width),
							String.valueOf(height),
							pngFile.getAbsolutePath(),
							nodePosFile.getAbsolutePath()
						};

		String debugCmd = StringUtils.join(cmd);
							
		try
		{
			pngFile.delete();
			nodePosFile.delete();
			if (pngFile.exists() || nodePosFile.exists())
			{
				throw new Exception("Internal error: Unable to delete stale " + pngFile.getAbsolutePath() + " or " + nodePosFile.getAbsolutePath()); 
			}

			// Parses contents of tree file and write it back out to retree file,
			// rerooting tree if outgroups isn't null.  
			if (!reroot())
			{
				return false; // invalid outgroup was specified (didn't contain any valid nodes)
			}

			LOGGER.debug("Running command: " + debugCmd);
			Process process = Runtime.getRuntime().exec(cmd);
			StreamGobbler.go(process.getInputStream());
			StreamGobbler errorGobbler = StreamGobbler.go(process.getErrorStream());
			process.waitFor();	

			if (!(pngFile.exists() && nodePosFile.exists()))
			{
				LOGGER.debug("Unable to find output files, there must have been an error running newick_parser_2.py");
				String msg = "This doesn't appear to be a properly formatted newick phylogeny. " ;
				if (errorGobbler.getLastLine() != null)
				{
					msg += errorGobbler.getLastLine();
				}
				throw new Exception (msg);
			}
			LOGGER.debug("Created image file: " + pngFile.getAbsolutePath());
			return true;
		}
		catch (Exception e)
		{
			LOGGER.debug("", e);
			throw e;
		}
	}

	private boolean reroot() 
		throws FileNotFoundException, IOException, TreeParseException, Exception
	{
		String[] og  = null;
		LOGGER.debug("outgroups is '" + outgroups + "'");
		if (outgroups != null && outgroups.trim().length() > 0)
		{
			og = outgroups.split(",");
			for (int i = 0; i < og.length; i++)
			{
				og[i] = og[i].trim();
			}
		}
		try
		{
			UTree.reroot(tree, retree, og);
			return true;
		}
		catch (TreeParseException tpe)
		{
			// With pal-1.5.1-modified-1 handles quoted taxa labels so this error should
			// no longer appear.
			LOGGER.debug("Unable to reroot tree; complex taxa labels? correct version of modified pal library?", tpe);

			// If we fail to parse the tree using pal library, for whatever reason, we just copy the
			// input file to the output and we'll deal with whatever error phy.fi ends up giving us.  It
			// seems to give slightly more detailed error messages than pal, so better to pass them on 
			// to the user.
			copyFile(tree, retree);
			return true;
		}
		catch(IllegalArgumentException e)
		{
			LOGGER.debug("", e);
			return false;
		}
	}

	public NodeInfo[] getNodeInfo() throws java.io.IOException
	{
		if (!nodePosFile.exists())
		{
			return null;
		}
		ArrayList<NodeInfo> list = new ArrayList<NodeInfo>();
		NodeInfo node;

		BufferedReader reader = null;
		try
		{
			String line;
			String[] words;
			reader = new BufferedReader(new FileReader(nodePosFile));
			while ((line = reader.readLine()) != null) 
			{
				words = line.split("\\s");
				node = new NodeInfo();
				node.number  = Integer.parseInt(words[0]);
				node.x = Integer.parseInt(words[1]);
				node.y = Integer.parseInt(words[2]);
				node.collapse = newNodeList(words[0]);
				list.add(node);
			}
		}
		finally
		{
			if (reader != null) reader.close();
		}
		return list.toArray(new NodeInfo[0]);
	}

	public static class NodeInfo
	{
		public NodeInfo() {;}
		int number;
		int x;
		int y;
		String collapse;

		public int getNumber() { return number; }
		public int getX() {return x;}
		public int getY() {return y;}
		public String getCollapse() {return collapse;}
	}

	void copyFile(File in, File out) throws IOException 
	{
		int bytes_read = 0;
		final byte[] buffer = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;
		try
		{
			fin = new FileInputStream(in);
			fout = new FileOutputStream(out);
			while ((bytes_read = fin.read(buffer)) != -1)
			{
				fout.write(buffer, 0, bytes_read);
			}
		}
		catch(Exception e)
		{
			if (fin != null) { fin.close();  }
			if (fout != null) { fout.close(); }
		}
	}

	public void cleanup()
	{
		pngFile.delete();
		nodePosFile.delete();
		retree.delete();
	}

	public static void main(String args[]) throws Exception
	{
		/*
		ImageMaker im = new ImageMaker(new File("/Users/terri/raxml_test/runit/RAxML_bestTree.terri"), "8,18");
		NodeInfo[] ni = im.getNodeInfo();
		System.out.printf("ni has %d entries\n", ni.length);
		for (int i = 0; i < ni.length; i++)
		{
			System.out.printf("number=%d, x=%d, y=%d, collapse=%s\n", ni[i].number, ni[i].x, ni[i].y, ni[i].collapse);
		}
		*/
	}


}
