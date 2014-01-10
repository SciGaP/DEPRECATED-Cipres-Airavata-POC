package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class psipred extends ToolParameters
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
public String getFilter_iterations_()
{return getToolParameters().get("filter_iterations_");
}
public void setFilter_iterations_(String filter_iterations_)
{ getToolParameters().put("filter_iterations_", filter_iterations_);
}
public String getHelix_()
{return getToolParameters().get("helix_");
}
public void setHelix_(String helix_)
{ getToolParameters().put("helix_", helix_);
}
public String getStrand_()
{return getToolParameters().get("strand_");
}
public void setStrand_(String strand_)
{ getToolParameters().put("strand_", strand_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setFilter_iterations_("1");
setHelix_("1.0");
setStrand_("1.0");
}
}
