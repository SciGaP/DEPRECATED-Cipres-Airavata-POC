package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class merger extends ToolParameters
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
// file-typed property getters and setters
public Long getSequence2_()
{
return getInputDataItemId("sequence2_");
}
public void setSequence2_(Long sequence2_)
{
setInputDataItem("sequence2_",sequence2_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
}
}
