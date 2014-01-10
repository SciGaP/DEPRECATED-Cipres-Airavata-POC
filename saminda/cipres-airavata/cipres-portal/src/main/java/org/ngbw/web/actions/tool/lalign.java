package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class lalign extends ToolParameters
{
// file-typed property getters and setters
public Long getQuery1_()
{
return getInputDataItemId("query1_");
}
public void setQuery1_(Long query1_)
{
setInputDataItem("query1_",query1_);
}
// file-typed property getters and setters
public Long getQuery2_()
{
return getInputDataItemId("query2_");
}
public void setQuery2_(Long query2_)
{
setInputDataItem("query2_",query2_);
}
public String getGapinit_()
{return getToolParameters().get("gapinit_");
}
public void setGapinit_(String gapinit_)
{ getToolParameters().put("gapinit_", gapinit_);
}
public String getGapext_()
{return getToolParameters().get("gapext_");
}
public void setGapext_(String gapext_)
{ getToolParameters().put("gapext_", gapext_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
}
public String getLinlen_()
{return getToolParameters().get("linlen_");
}
public void setLinlen_(String linlen_)
{ getToolParameters().put("linlen_", linlen_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMatrix_( "BL50" );
setLinlen_("60");
}
}
