package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class ppsearch extends ToolParameters
{
// file-typed property getters and setters
public Long getInputfile_()
{
return getInputDataItemId("inputfile_");
}
public void setInputfile_(Long inputfile_)
{
setInputDataItem("inputfile_",inputfile_);
}
public String getAbundant_patterns_()
{return getToolParameters().get("abundant_patterns_");
}
public void setAbundant_patterns_(String abundant_patterns_)
{ getToolParameters().put("abundant_patterns_", abundant_patterns_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setAbundant_patterns_("false");
}
}
