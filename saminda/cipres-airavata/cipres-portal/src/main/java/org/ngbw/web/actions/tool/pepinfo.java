package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class pepinfo extends ToolParameters
{
// file-typed property getters and setters
public Long getSequence_()
{
return getInputDataItemId("sequence_");
}
public void setSequence_(Long sequence_)
{
setInputDataItem("sequence_",sequence_);
}
public String getHwindow_()
{return getToolParameters().get("hwindow_");
}
public void setHwindow_(String hwindow_)
{ getToolParameters().put("hwindow_", hwindow_);
}
public String getAaproperties_()
{return getToolParameters().get("aaproperties_");
}
public void setAaproperties_(String aaproperties_)
{ getToolParameters().put("aaproperties_", aaproperties_);
}
public String getAahydropathy_()
{return getToolParameters().get("aahydropathy_");
}
public void setAahydropathy_(String aahydropathy_)
{ getToolParameters().put("aahydropathy_", aahydropathy_);
}
public String getGraph_()
{return getToolParameters().get("graph_");
}
public void setGraph_(String graph_)
{ getToolParameters().put("graph_", graph_);
}
public String getGeneralplot_()
{return getToolParameters().get("generalplot_");
}
public void setGeneralplot_(String generalplot_)
{ getToolParameters().put("generalplot_", generalplot_);
}
public String getHydropathyplot_()
{return getToolParameters().get("hydropathyplot_");
}
public void setHydropathyplot_(String hydropathyplot_)
{ getToolParameters().put("hydropathyplot_", hydropathyplot_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setHwindow_("9");
setAaproperties_( "Eaa_properties.dat" );
setAahydropathy_( "Eaa_hydropathy.dat" );
setGraph_( "png" );
setGeneralplot_("true");
setHydropathyplot_("true");
}
}
