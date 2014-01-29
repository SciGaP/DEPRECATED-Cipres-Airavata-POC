package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class fingerprintscan extends ToolParameters
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
public String getMotif_()
{return getToolParameters().get("motif_");
}
public void setMotif_(String motif_)
{ getToolParameters().put("motif_", motif_);
}
public String getThreshold_()
{return getToolParameters().get("threshold_");
}
public void setThreshold_(String threshold_)
{ getToolParameters().put("threshold_", threshold_);
}
public String getGraph_scan_()
{return getToolParameters().get("graph_scan_");
}
public void setGraph_scan_(String graph_scan_)
{ getToolParameters().put("graph_scan_", graph_scan_);
}
public String getNumber_bits_()
{return getToolParameters().get("number_bits_");
}
public void setNumber_bits_(String number_bits_)
{ getToolParameters().put("number_bits_", number_bits_);
}
public String getRandom_shuffle_()
{return getToolParameters().get("random_shuffle_");
}
public void setRandom_shuffle_(String random_shuffle_)
{ getToolParameters().put("random_shuffle_", random_shuffle_);
}
public String getProfile_score_()
{return getToolParameters().get("profile_score_");
}
public void setProfile_score_(String profile_score_)
{ getToolParameters().put("profile_score_", profile_score_);
}
public String getP_value_()
{return getToolParameters().get("p_value_");
}
public void setP_value_(String p_value_)
{ getToolParameters().put("p_value_", p_value_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setGraph_scan_("false");
setNumber_bits_("");
setRandom_shuffle_("false");
setProfile_score_("15");
}
}
