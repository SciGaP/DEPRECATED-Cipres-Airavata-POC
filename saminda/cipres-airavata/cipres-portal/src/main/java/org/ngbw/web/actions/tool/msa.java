package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class msa extends ToolParameters
{
// file-typed property getters and setters
public Long getSeqs_()
{
return getInputDataItemId("seqs_");
}
public void setSeqs_(Long seqs_)
{
setInputDataItem("seqs_",seqs_);
}
public String getOptimal_()
{return getToolParameters().get("optimal_");
}
public void setOptimal_(String optimal_)
{ getToolParameters().put("optimal_", optimal_);
}
// file-typed property getters and setters
public Long getForcedres_()
{
return getInputDataItemId("forcedres_");
}
public void setForcedres_(Long forcedres_)
{
setInputDataItem("forcedres_",forcedres_);
}
public String getEndgap_()
{return getToolParameters().get("endgap_");
}
public void setEndgap_(String endgap_)
{ getToolParameters().put("endgap_", endgap_);
}
public String getUnweight_()
{return getToolParameters().get("unweight_");
}
public void setUnweight_(String unweight_)
{ getToolParameters().put("unweight_", unweight_);
}
public String getMaxscore_()
{return getToolParameters().get("maxscore_");
}
public void setMaxscore_(String maxscore_)
{ getToolParameters().put("maxscore_", maxscore_);
}
// file-typed property getters and setters
public Long getEpsilons_()
{
return getInputDataItemId("epsilons_");
}
public void setEpsilons_(Long epsilons_)
{
setInputDataItem("epsilons_",epsilons_);
}
// file-typed property getters and setters
public Long getCosts_()
{
return getInputDataItemId("costs_");
}
public void setCosts_(Long costs_)
{
setInputDataItem("costs_",costs_);
}
public String getQuiet_()
{return getToolParameters().get("quiet_");
}
public void setQuiet_(String quiet_)
{ getToolParameters().put("quiet_", quiet_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setOptimal_("false");
setEndgap_("false");
setUnweight_("false");
}
}
