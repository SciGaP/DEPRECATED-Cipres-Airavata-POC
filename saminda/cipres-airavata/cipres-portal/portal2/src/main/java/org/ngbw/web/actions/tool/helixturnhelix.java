package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class helixturnhelix extends ToolParameters
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
public String getMean_()
{return getToolParameters().get("mean_");
}
public void setMean_(String mean_)
{ getToolParameters().put("mean_", mean_);
}
public String getSd_()
{return getToolParameters().get("sd_");
}
public void setSd_(String sd_)
{ getToolParameters().put("sd_", sd_);
}
public String getMinsd_()
{return getToolParameters().get("minsd_");
}
public void setMinsd_(String minsd_)
{ getToolParameters().put("minsd_", minsd_);
}
public String getEightyseven_()
{return getToolParameters().get("eightyseven_");
}
public void setEightyseven_(String eightyseven_)
{ getToolParameters().put("eightyseven_", eightyseven_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMean_("238.71");
setSd_("293.61");
setMinsd_("2.5");
}
}
