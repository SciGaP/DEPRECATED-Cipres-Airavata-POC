package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class rid3paup extends ToolParameters
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
public String getMaxtrees_()
{return getToolParameters().get("maxtrees_");
}
public void setMaxtrees_(String maxtrees_)
{ getToolParameters().put("maxtrees_", maxtrees_);
}
public String getIncrease_()
{return getToolParameters().get("increase_");
}
public void setIncrease_(String increase_)
{ getToolParameters().put("increase_", increase_);
}
public String getAutoincrease_()
{return getToolParameters().get("autoincrease_");
}
public void setAutoincrease_(String autoincrease_)
{ getToolParameters().put("autoincrease_", autoincrease_);
}
public String getSwap_()
{return getToolParameters().get("swap_");
}
public void setSwap_(String swap_)
{ getToolParameters().put("swap_", swap_);
}
public String getMultrees_()
{return getToolParameters().get("multrees_");
}
public void setMultrees_(String multrees_)
{ getToolParameters().put("multrees_", multrees_);
}
public String getRearrlimit_()
{return getToolParameters().get("rearrlimit_");
}
public void setRearrlimit_(String rearrlimit_)
{ getToolParameters().put("rearrlimit_", rearrlimit_);
}
public String getTimelimit_()
{return getToolParameters().get("timelimit_");
}
public void setTimelimit_(String timelimit_)
{ getToolParameters().put("timelimit_", timelimit_);
}
public String getReconlimit_()
{return getToolParameters().get("reconlimit_");
}
public void setReconlimit_(String reconlimit_)
{ getToolParameters().put("reconlimit_", reconlimit_);
}
public String getRatchetreps_()
{return getToolParameters().get("ratchetreps_");
}
public void setRatchetreps_(String ratchetreps_)
{ getToolParameters().put("ratchetreps_", ratchetreps_);
}
public String getRatchetprop_()
{return getToolParameters().get("ratchetprop_");
}
public void setRatchetprop_(String ratchetprop_)
{ getToolParameters().put("ratchetprop_", ratchetprop_);
}
public String getRatchetseed_()
{return getToolParameters().get("ratchetseed_");
}
public void setRatchetseed_(String ratchetseed_)
{ getToolParameters().put("ratchetseed_", ratchetseed_);
}
public String getS_maxtrees_()
{return getToolParameters().get("s_maxtrees_");
}
public void setS_maxtrees_(String s_maxtrees_)
{ getToolParameters().put("s_maxtrees_", s_maxtrees_);
}
public String getS_increase_()
{return getToolParameters().get("s_increase_");
}
public void setS_increase_(String s_increase_)
{ getToolParameters().put("s_increase_", s_increase_);
}
public String getS_autoincrease_()
{return getToolParameters().get("s_autoincrease_");
}
public void setS_autoincrease_(String s_autoincrease_)
{ getToolParameters().put("s_autoincrease_", s_autoincrease_);
}
public String getS_swap_()
{return getToolParameters().get("s_swap_");
}
public void setS_swap_(String s_swap_)
{ getToolParameters().put("s_swap_", s_swap_);
}
public String getS_multrees_()
{return getToolParameters().get("s_multrees_");
}
public void setS_multrees_(String s_multrees_)
{ getToolParameters().put("s_multrees_", s_multrees_);
}
public String getS_rearrlimit_()
{return getToolParameters().get("s_rearrlimit_");
}
public void setS_rearrlimit_(String s_rearrlimit_)
{ getToolParameters().put("s_rearrlimit_", s_rearrlimit_);
}
public String getS_timelimit_()
{return getToolParameters().get("s_timelimit_");
}
public void setS_timelimit_(String s_timelimit_)
{ getToolParameters().put("s_timelimit_", s_timelimit_);
}
public String getS_reconlimit_()
{return getToolParameters().get("s_reconlimit_");
}
public void setS_reconlimit_(String s_reconlimit_)
{ getToolParameters().put("s_reconlimit_", s_reconlimit_);
}
public String getS_ratchetreps_()
{return getToolParameters().get("s_ratchetreps_");
}
public void setS_ratchetreps_(String s_ratchetreps_)
{ getToolParameters().put("s_ratchetreps_", s_ratchetreps_);
}
public String getS_ratchetprop_()
{return getToolParameters().get("s_ratchetprop_");
}
public void setS_ratchetprop_(String s_ratchetprop_)
{ getToolParameters().put("s_ratchetprop_", s_ratchetprop_);
}
public String getS_ratchetseed_()
{return getToolParameters().get("s_ratchetseed_");
}
public void setS_ratchetseed_(String s_ratchetseed_)
{ getToolParameters().put("s_ratchetseed_", s_ratchetseed_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMaxtaxasubsetpercent_("50");
setMaxiterations_("10");
setIgnorestartedgelen_( "no" );
setBreakties_( "yes" );
setSeed_("0");
setIncrease_( "no" );
setSwap_( "tbr" );
setMultrees_( "no" );
setTimelimit_("3600 ");
setRatchetreps_("0");
setRatchetprop_("0.2");
setRatchetseed_("0");
setS_increase_( "no" );
setS_swap_( "tbr" );
setS_multrees_( "no" );
setS_ratchetreps_("5");
setS_ratchetprop_("0.25");
setS_ratchetseed_("0");
}
}
