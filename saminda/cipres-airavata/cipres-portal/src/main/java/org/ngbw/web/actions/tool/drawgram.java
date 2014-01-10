package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class drawgram extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getTreefile_()
{
return getInputDataItemId("treefile_");
}
public void setTreefile_(Long treefile_)
{
setInputDataItem("treefile_",treefile_);
}
public String getPlotter_()
{return getToolParameters().get("plotter_");
}
public void setPlotter_(String plotter_)
{ getToolParameters().put("plotter_", plotter_);
}
public String getXres_()
{return getToolParameters().get("xres_");
}
public void setXres_(String xres_)
{ getToolParameters().put("xres_", xres_);
}
public String getYres_()
{return getToolParameters().get("yres_");
}
public void setYres_(String yres_)
{ getToolParameters().put("yres_", yres_);
}
public String getLaserjet_resolution_()
{return getToolParameters().get("laserjet_resolution_");
}
public void setLaserjet_resolution_(String laserjet_resolution_)
{ getToolParameters().put("laserjet_resolution_", laserjet_resolution_);
}
public String getPcx_resolution_()
{return getToolParameters().get("pcx_resolution_");
}
public void setPcx_resolution_(String pcx_resolution_)
{ getToolParameters().put("pcx_resolution_", pcx_resolution_);
}
public String getGrows_()
{return getToolParameters().get("grows_");
}
public void setGrows_(String grows_)
{ getToolParameters().put("grows_", grows_);
}
public String getTree_style_()
{return getToolParameters().get("tree_style_");
}
public void setTree_style_(String tree_style_)
{ getToolParameters().put("tree_style_", tree_style_);
}
public String getBranch_lengths_()
{return getToolParameters().get("branch_lengths_");
}
public void setBranch_lengths_(String branch_lengths_)
{ getToolParameters().put("branch_lengths_", branch_lengths_);
}
public String getHorizontal_margins_()
{return getToolParameters().get("horizontal_margins_");
}
public void setHorizontal_margins_(String horizontal_margins_)
{ getToolParameters().put("horizontal_margins_", horizontal_margins_);
}
public String getVertical_margins_()
{return getToolParameters().get("vertical_margins_");
}
public void setVertical_margins_(String vertical_margins_)
{ getToolParameters().put("vertical_margins_", vertical_margins_);
}
public String getScale_()
{return getToolParameters().get("scale_");
}
public void setScale_(String scale_)
{ getToolParameters().put("scale_", scale_);
}
public String getDepth_()
{return getToolParameters().get("depth_");
}
public void setDepth_(String depth_)
{ getToolParameters().put("depth_", depth_);
}
public String getStem_()
{return getToolParameters().get("stem_");
}
public void setStem_(String stem_)
{ getToolParameters().put("stem_", stem_);
}
public String getCharacter_height_()
{return getToolParameters().get("character_height_");
}
public void setCharacter_height_(String character_height_)
{ getToolParameters().put("character_height_", character_height_);
}
public String getAncestral_()
{return getToolParameters().get("ancestral_");
}
public void setAncestral_(String ancestral_)
{ getToolParameters().put("ancestral_", ancestral_);
}
public String getFont_()
{return getToolParameters().get("font_");
}
public void setFont_(String font_)
{ getToolParameters().put("font_", font_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setPlotter_( "L" );
setXres_("500.00");
setYres_("500.00");
setLaserjet_resolution_( "3" );
setPcx_resolution_( "3" );
setGrows_( "Horizontally" );
setTree_style_( "C" );
setBranch_lengths_("true");
setHorizontal_margins_("1.65");
setVertical_margins_("2.16");
setDepth_("1.00");
setStem_("0.05");
setCharacter_height_("0.3333");
setAncestral_( "I" );
setFont_( "Hershey" );
}
}
