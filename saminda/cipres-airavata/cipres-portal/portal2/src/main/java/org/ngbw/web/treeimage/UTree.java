/**
 Utility library's representation of a tree.

 */
//package org.cipres.util.tree;
package org.ngbw.web.treeimage;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;


/*
*/
public class UTree
{

	private pal.tree.SimpleTree m_palTree;

	public UTree(final pal.tree.SimpleTree palTree)
	{
		m_palTree = palTree;
	}

	public UTree(final String newick) throws TreeParseException
	{
		m_palTree = PalTreeUtils.newickToPal(newick);
	}

	public UTree(File file) throws TreeParseException, IOException, FileNotFoundException
	{
		BufferedReader br = null;
		try
		{
			br = new BufferedReader(new FileReader(file));
			String newick = ""; 
			String line;
			while ((line = br.readLine()) != null)
			{
				newick +=line;
			}
			m_palTree = PalTreeUtils.newickToPal(newick);
		}
		finally
		{
			if (br != null) br.close();
		}
	}

	public String asNewick()
	{
		return PalTreeUtils.palToNewick(m_palTree, PalTreeUtils.hasBrLens(m_palTree));
	}

	public static final int MAP_NONE = 0;

	public static final int MAP_NAMES_TO_INDICES = 1;

	public static final int MAP_INDICES_TO_NAMES = 2;

	public String asNewick(final int mapping, final String[] taxaMgr)
	{
		return PalTreeUtils.palToNewick(m_palTree, PalTreeUtils.hasBrLens(m_palTree), mapping, taxaMgr);
	}

	/**
	 * getStrLeafsetTaxa
	 * @return String[] - array of taxa names comprising the tree
	 */
	public String[] getStrLeafsetTaxa()
	{
		return PalTreeUtils.getStrLeafsetTaxa(m_palTree);
	}

	public static void newickToFile(File file, String newick) throws FileNotFoundException
	{
		PrintWriter pw = null;
		try
		{
			pw = new PrintWriter(file);
			pw.printf(newick);
		}
		finally
		{
			if (pw != null) pw.close();
		}
	}

	// Throws IllegalArgument exception if outgroups is invalid
	public void reroot(String[] outgroups)
	{
		m_palTree = (pal.tree.SimpleTree)PalTreeUtils.reroot(m_palTree,outgroups);
	}

	/**
		Use's Pal library's TreeManipulator to reroot the tree.

		If outgroups is null or empty just copies the input file to the output,
		using the pal library so that branch lengths will be written in the pal 
		formatting regardless of whether the tree is rerooted or not.

		Throws IllegalArgument exception if none of the taxa specified are
		part of the tree.

		PAL documentation says that MRCA of specified outgroup taxa "influences"
		the rooting.
	*/
	public static void reroot(File infile, File outfile, String outgroups[]) throws
		FileNotFoundException, IOException, TreeParseException
	{
		UTree utree = new UTree(infile);
		if ((outgroups != null) && (outgroups.length > 0))
		{
			utree.reroot(outgroups);
		}
		String newick = utree.asNewick();
		UTree.newickToFile(outfile, newick);
	}

	public static void main(String args[])
	{
		String infile, outfile, outgroups;
		infile = System.getProperty("infile");
		outfile = System.getProperty("outfile");
		outgroups = System.getProperty("outgroups");
		if (infile == null || outfile == null || outgroups == null)
		{
			System.exit(-1);
		}
		String outgroupArray[] = outgroups.split(",");

		for (int i = 0; i < outgroupArray.length; i++)
		{
			outgroupArray[i] = outgroupArray[i].trim();
		}
		try
		{
			UTree.reroot(new File(infile), new File(outfile), outgroupArray);
		}
		catch(Throwable t)
		{
			//t.printStackTrace();
			System.err.println(t.getMessage());
			System.exit(-1);
		}
	}


}
