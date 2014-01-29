package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class drawtree extends ToolParameters
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
public String getXxres_()
{return getToolParameters().get("xxres_");
}
public void setXxres_(String xxres_)
{ getToolParameters().put("xxres_", xxres_);
}
public String getXyres_()
{return getToolParameters().get("xyres_");
}
public void setXyres_(String xyres_)
{ getToolParameters().put("xyres_", xyres_);
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
public String getBranch_lengths_()
{return getToolParameters().get("branch_lengths_");
}
public void setBranch_lengths_(String branch_lengths_)
{ getToolParameters().put("branch_lengths_", branch_lengths_);
}
public String getAngle_()
{return getToolParameters().get("angle_");
}
public void setAngle_(String angle_)
{ getToolParameters().put("angle_", angle_);
}
public String getFixed_angle_()
{return getToolParameters().get("fixed_angle_");
}
public void setFixed_angle_(String fixed_angle_)
{ getToolParameters().put("fixed_angle_", fixed_angle_);
}
public String getRotation_()
{return getToolParameters().get("rotation_");
}
public void setRotation_(String rotation_)
{ getToolParameters().put("rotation_", rotation_);
}
public String getArc_()
{return getToolParameters().get("arc_");
}
public void setArc_(String arc_)
{ getToolParameters().put("arc_", arc_);
}
public String getIterate_()
{return getToolParameters().get("iterate_");
}
public void setIterate_(String iterate_)
{ getToolParameters().put("iterate_", iterate_);
}
public String getScale_()
{return getToolParameters().get("scale_");
}
public void setScale_(String scale_)
{ getToolParameters().put("scale_", scale_);
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
public String getCharacter_height_()
{return getToolParameters().get("character_height_");
}
public void setCharacter_height_(String character_height_)
{ getToolParameters().put("character_height_", character_height_);
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
setXxres_("500.00");
setXyres_("500.00");
setLaserjet_resolution_( "3" );
setPcx_resolution_( "3" );
setBranch_lengths_("true");
setAngle_( "M" );
setFixed_angle_("0.0");
setRotation_("0.0");
setArc_("0.0");
setIterate_( "E" );
setHorizontal_margins_("1.73");
setVertical_margins_("2.24");
setCharacter_height_("0.3333");
setFont_( "Hershey" );
}
}
