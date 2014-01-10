package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class tmap extends ToolParameters
{
// file-typed property getters and setters
public Long getSequences_()
{
return getInputDataItemId("sequences_");
}
public void setSequences_(Long sequences_)
{
setInputDataItem("sequences_",sequences_);
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
setGraph_( "png" );
}
}
