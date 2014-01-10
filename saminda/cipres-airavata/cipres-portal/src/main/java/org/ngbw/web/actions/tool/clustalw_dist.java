package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class clustalw_dist extends ToolParameters
{
// file-typed property getters and setters
public Long getInfile_()
{
return getInputDataItemId("infile_");
}
public void setInfile_(Long infile_)
{
setInputDataItem("infile_",infile_);
}
public String getActions_()
{return getToolParameters().get("actions_");
}
public void setActions_(String actions_)
{ getToolParameters().put("actions_", actions_);
}
public String getKimura_()
{return getToolParameters().get("kimura_");
}
public void setKimura_(String kimura_)
{ getToolParameters().put("kimura_", kimura_);
}
public String getTossgaps_()
{return getToolParameters().get("tossgaps_");
}
public void setTossgaps_(String tossgaps_)
{ getToolParameters().put("tossgaps_", tossgaps_);
}
public String getOutputtree_()
{return getToolParameters().get("outputtree_");
}
public void setOutputtree_(String outputtree_)
{ getToolParameters().put("outputtree_", outputtree_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setActions_( "-tree" );
setKimura_("false");
setTossgaps_("false");
setOutputtree_( "DIST" );
}
}
