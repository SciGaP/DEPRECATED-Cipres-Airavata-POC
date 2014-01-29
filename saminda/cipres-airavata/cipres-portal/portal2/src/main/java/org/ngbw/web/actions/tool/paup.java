package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class paup extends ToolParameters
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
// this method pre-populates the form with default values
public void reset() {
super.reset();
setIncrease_( "no" );
setSwap_( "tbr" );
setMultrees_( "no" );
setRatchetreps_("200");
setRatchetprop_("0.2");
setRatchetseed_("0");
}
}
