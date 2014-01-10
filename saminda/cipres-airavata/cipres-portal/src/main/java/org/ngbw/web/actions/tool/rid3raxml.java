package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class rid3raxml extends ToolParameters
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
public String getMaxtaxasubsetsize_()
{return getToolParameters().get("maxtaxasubsetsize_");
}
public void setMaxtaxasubsetsize_(String maxtaxasubsetsize_)
{ getToolParameters().put("maxtaxasubsetsize_", maxtaxasubsetsize_);
}
public String getMaxtaxasubsetpercent_()
{return getToolParameters().get("maxtaxasubsetpercent_");
}
public void setMaxtaxasubsetpercent_(String maxtaxasubsetpercent_)
{ getToolParameters().put("maxtaxasubsetpercent_", maxtaxasubsetpercent_);
}
public String getMaxrecursionlevels_()
{return getToolParameters().get("maxrecursionlevels_");
}
public void setMaxrecursionlevels_(String maxrecursionlevels_)
{ getToolParameters().put("maxrecursionlevels_", maxrecursionlevels_);
}
public String getMaxiterations_()
{return getToolParameters().get("maxiterations_");
}
public void setMaxiterations_(String maxiterations_)
{ getToolParameters().put("maxiterations_", maxiterations_);
}
public String getMaxanalysistime_()
{return getToolParameters().get("maxanalysistime_");
}
public void setMaxanalysistime_(String maxanalysistime_)
{ getToolParameters().put("maxanalysistime_", maxanalysistime_);
}
public String getIgnorestartedgelen_()
{return getToolParameters().get("ignorestartedgelen_");
}
public void setIgnorestartedgelen_(String ignorestartedgelen_)
{ getToolParameters().put("ignorestartedgelen_", ignorestartedgelen_);
}
public String getBreakties_()
{return getToolParameters().get("breakties_");
}
public void setBreakties_(String breakties_)
{ getToolParameters().put("breakties_", breakties_);
}
public String getSeed_()
{return getToolParameters().get("seed_");
}
public void setSeed_(String seed_)
{ getToolParameters().put("seed_", seed_);
}
public String getNumcat_()
{return getToolParameters().get("numcat_");
}
public void setNumcat_(String numcat_)
{ getToolParameters().put("numcat_", numcat_);
}
public String getModel_()
{return getToolParameters().get("model_");
}
public void setModel_(String model_)
{ getToolParameters().put("model_", model_);
}
public String getInitrearrange_()
{return getToolParameters().get("initrearrange_");
}
public void setInitrearrange_(String initrearrange_)
{ getToolParameters().put("initrearrange_", initrearrange_);
}
public String getS_numcat_()
{return getToolParameters().get("s_numcat_");
}
public void setS_numcat_(String s_numcat_)
{ getToolParameters().put("s_numcat_", s_numcat_);
}
public String getS_model_()
{return getToolParameters().get("s_model_");
}
public void setS_model_(String s_model_)
{ getToolParameters().put("s_model_", s_model_);
}
public String getS_initrearrange_()
{return getToolParameters().get("s_initrearrange_");
}
public void setS_initrearrange_(String s_initrearrange_)
{ getToolParameters().put("s_initrearrange_", s_initrearrange_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMaxtaxasubsetpercent_("50");
setMaxiterations_("10");
setIgnorestartedgelen_( "no" );
setBreakties_( "yes" );
setSeed_("0");
setNumcat_("25");
setModel_( "GTRGAMMA" );
setInitrearrange_("10");
setS_numcat_("25");
setS_model_( "GTRGAMMA" );
setS_initrearrange_("10");
}
}
