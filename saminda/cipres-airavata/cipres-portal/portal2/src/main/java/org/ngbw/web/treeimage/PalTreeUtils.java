//package org.cipres.util.tree;
package org.ngbw.web.treeimage;

import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.PushbackReader;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import pal.tree.*;

/**
 * This class isn't public because user's of our util library should not "see"
 * the pal library.
 */
class PalTreeUtils
{
	public static pal.tree.SimpleTree newickToPal(final String newickTree) throws TreeParseException
	{
		try
		{
			final PushbackReader reader = new PushbackReader(new BufferedReader(new StringReader(newickTree)));

			final pal.tree.SimpleTree palTree = new pal.tree.ReadTree(reader);
			return palTree;
		}
		catch (final Exception e)
		{
			throw new TreeParseException(e);
		}

	}

	public static String palToNewick(final pal.tree.SimpleTree palTree, final boolean withBrLens)
	{
		return palToNewick(palTree, withBrLens, UTree.MAP_NONE, null);
	}

	public static String palToNewick(final pal.tree.SimpleTree palTree, final boolean withBrLens, final int mapping, final String[] taxaMgr)
	{
		final StringWriter sw = new StringWriter();
		printNH(new PrintWriter(sw), palTree.getRoot(), withBrLens, mapping, taxaMgr);
		sw.write(";");
		return sw.toString();
	}

	public static boolean hasBrLens(final pal.tree.SimpleTree tree)
	{
		return (tree.getRoot().getNodeHeight() != 0.0);
	}

	public static void printNH(final PrintWriter out, final pal.tree.Node node, final boolean printLengths)
	{
		printNH(out, node, printLengths, UTree.MAP_NONE, null);
	}

	public static String[] getStrLeafsetTaxa(final pal.tree.SimpleTree tree)
	{
		final pal.misc.SimpleIdGroup sig = new pal.misc.SimpleIdGroup(pal.tree.TreeUtils.getLeafIdGroup(tree));
		final String[] strLeafsetTaxa = new String[sig.getIdCount()];
		for (int i = 0; i < sig.getIdCount(); i++)
		{
			strLeafsetTaxa[i] = sig.getName(i);
		}
		return strLeafsetTaxa;
	}

	public static void printNH(final PrintWriter out, final pal.tree.Node node, final boolean printLengths, final int mapping, final String[] taxaMgr)
	{
		if (!node.isLeaf())
		{
			out.print("(");

			for (int i = 0; i < node.getChildCount(); i++)
			{
				if (i != 0)
				{
					out.print(",");
				}

				printNH(out, node.getChild(i), printLengths, mapping, taxaMgr);
			}
			out.print(")");
		}

		if (!node.isRoot())
		{
			if (node.isLeaf())
			{
				String id = node.getIdentifier().toString();
				if (taxaMgr != null)
				{
					id = mapTaxa(id, mapping, taxaMgr);
				}
				out.print(id);
			}

			if (printLengths)
			{
				out.print(":");
				pal.io.FormattedOutput.getInstance().displayDecimal(out, node.getBranchLength(), 7);
			}
		}
	}


	/*
		Maps node index to taxa name or name to index.  If index isn't an integer is is greater
		than the number of taxa, or if taxa name isn't found, logs an error and returns and returns the
		orignal name.
	*/
	private static String mapTaxa(String id, final int mapping, final String[] taxaMgr)
	{
		assert(taxaMgr != null);

		String originalId = id;
		try
		{
			int index = -1;
			switch(mapping)
			{
				case UTree.MAP_NAMES_TO_INDICES:
					// look for the name in taxaMgr and return the index (plus 1) if found.
					for (int i = 0; i < taxaMgr.length; i++)
					{
						if (originalId.equals(taxaMgr[i]))
						{
							index = i;
							return new Integer(index + 1).toString();
						}
					}
					// didn't find the name in our list of taxa, so throw an exception
					throw new Exception("Taxa name " + originalId + " not found.");
					//break;
				case UTree.MAP_INDICES_TO_NAMES:
					index = (Integer.parseInt(id) - 1); // exception if id isn't an integer.
					if (index < taxaMgr.length)
					{
						return taxaMgr[index];
					} 
					throw new Exception("Too few taxa for node index of " + index);
					//break;

				default:
					assert(false);
					throw new Exception("Internal error: invalid mapping");
			}
		}
		catch (final Exception e)
		{
			//logger.error("", e);
		}
		return originalId; 
	}

	// Can throw IllegalArgumentException a runtime error (not derived from Exception)
	// Throws if outgroup isn't valid
	public static Tree reroot(Tree tree, String outgroups[]) 
	{
		Tree newTree;
		// Pal code says multiple trees are possible for some choices of outgroup ???
		newTree = TreeManipulator.getRootedBy(tree, outgroups);
		return newTree;
	}

}
