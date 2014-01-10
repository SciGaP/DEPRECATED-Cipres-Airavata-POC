package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class pepstats extends ToolParameters
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
public String getTermini_()
{return getToolParameters().get("termini_");
}
public void setTermini_(String termini_)
{ getToolParameters().put("termini_", termini_);
}
public String getAadata_()
{return getToolParameters().get("aadata_");
}
public void setAadata_(String aadata_)
{ getToolParameters().put("aadata_", aadata_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setTermini_("true");
setAadata_( "Eamino.dat" );
}
}
