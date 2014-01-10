package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class unroot extends ToolParameters
{
// file-typed property getters and setters
public Long getTreefile_()
{
return getInputDataItemId("treefile_");
}
public void setTreefile_(Long treefile_)
{
setInputDataItem("treefile_",treefile_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
}
}
