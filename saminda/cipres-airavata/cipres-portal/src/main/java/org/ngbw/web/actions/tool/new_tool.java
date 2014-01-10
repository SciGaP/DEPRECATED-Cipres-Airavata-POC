package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class new_tool extends ToolParameters
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
public String getDatatype_()
{return getToolParameters().get("datatype_");
}
public void setDatatype_(String datatype_)
{ getToolParameters().put("datatype_", datatype_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setDatatype_( "dna" );
}
}
