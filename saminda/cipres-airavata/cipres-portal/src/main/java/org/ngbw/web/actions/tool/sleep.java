package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class sleep extends ToolParameters
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
public String getSeconds_()
{return getToolParameters().get("seconds_");
}
public void setSeconds_(String seconds_)
{ getToolParameters().put("seconds_", seconds_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setSeconds_("10");
}
}
