package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class dssp extends ToolParameters
{
// file-typed property getters and setters
public Long getPdbfile_()
{
return getInputDataItemId("pdbfile_");
}
public void setPdbfile_(Long pdbfile_)
{
setInputDataItem("pdbfile_",pdbfile_);
}
public String getSurface_()
{return getToolParameters().get("surface_");
}
public void setSurface_(String surface_)
{ getToolParameters().put("surface_", surface_);
}
public String getClassic_()
{return getToolParameters().get("classic_");
}
public void setClassic_(String classic_)
{ getToolParameters().put("classic_", classic_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setSurface_("false");
setClassic_("false");
}
}
