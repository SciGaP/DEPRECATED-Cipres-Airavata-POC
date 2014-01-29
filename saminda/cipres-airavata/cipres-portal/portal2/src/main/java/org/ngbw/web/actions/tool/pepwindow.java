package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class pepwindow extends ToolParameters
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
public Long getDatafile_()
{
return getInputDataItemId("datafile_");
}
public void setDatafile_(Long datafile_)
{
setInputDataItem("datafile_",datafile_);
}
public String getLength_()
{return getToolParameters().get("length_");
}
public void setLength_(String length_)
{ getToolParameters().put("length_", length_);
}
public String getGraph_()
{return getToolParameters().get("graph_");
}
public void setGraph_(String graph_)
{ getToolParameters().put("graph_", graph_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setLength_("7");
setGraph_( "png" );
}
}
