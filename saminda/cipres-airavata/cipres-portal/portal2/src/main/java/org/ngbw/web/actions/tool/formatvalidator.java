package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class formatvalidator extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getInfile_()
{
return getInputDataItemId("infile_");
}
public void setInfile_(Long infile_)
{
setInputDataItem("infile_",infile_);
}
public String getSetnexusformat_()
{return getToolParameters().get("setnexusformat_");
}
public void setSetnexusformat_(String setnexusformat_)
{ getToolParameters().put("setnexusformat_", setnexusformat_);
}
public String getSetnexuscontrol_()
{return getToolParameters().get("setnexuscontrol_");
}
public void setSetnexuscontrol_(String setnexuscontrol_)
{ getToolParameters().put("setnexuscontrol_", setnexuscontrol_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setSetnexusformat_( "-fnexus" );
setSetnexuscontrol_( "-s2" );
}
}
