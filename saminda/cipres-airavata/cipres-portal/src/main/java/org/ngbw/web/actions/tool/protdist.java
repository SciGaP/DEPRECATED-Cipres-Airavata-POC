package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class protdist extends ToolParameters
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
public String getMethod_()
{return getToolParameters().get("method_");
}
public void setMethod_(String method_)
{ getToolParameters().put("method_", method_);
}
public String getGamma_dist_()
{return getToolParameters().get("gamma_dist_");
}
public void setGamma_dist_(String gamma_dist_)
{ getToolParameters().put("gamma_dist_", gamma_dist_);
}
public String getSeqboot_()
{return getToolParameters().get("seqboot_");
}
public void setSeqboot_(String seqboot_)
{ getToolParameters().put("seqboot_", seqboot_);
}
public String getResamp_method_()
{return getToolParameters().get("resamp_method_");
}
public void setResamp_method_(String resamp_method_)
{ getToolParameters().put("resamp_method_", resamp_method_);
}
public String getSeqboot_seed_()
{return getToolParameters().get("seqboot_seed_");
}
public void setSeqboot_seed_(String seqboot_seed_)
{ getToolParameters().put("seqboot_seed_", seqboot_seed_);
}
public String getReplicates_()
{return getToolParameters().get("replicates_");
}
public void setReplicates_(String replicates_)
{ getToolParameters().put("replicates_", replicates_);
}
public String getWeights_()
{return getToolParameters().get("weights_");
}
public void setWeights_(String weights_)
{ getToolParameters().put("weights_", weights_);
}
// file-typed property getters and setters
public Long getWeights_file_()
{
return getInputDataItemId("weights_file_");
}
public void setWeights_file_(Long weights_file_)
{
setInputDataItem("weights_file_",weights_file_);
}
public String getPrintdata_()
{return getToolParameters().get("printdata_");
}
public void setPrintdata_(String printdata_)
{ getToolParameters().put("printdata_", printdata_);
}
public String getCode_()
{return getToolParameters().get("code_");
}
public void setCode_(String code_)
{ getToolParameters().put("code_", code_);
}
public String getCategorization_()
{return getToolParameters().get("categorization_");
}
public void setCategorization_(String categorization_)
{ getToolParameters().put("categorization_", categorization_);
}
public String getChange_prob_()
{return getToolParameters().get("change_prob_");
}
public void setChange_prob_(String change_prob_)
{ getToolParameters().put("change_prob_", change_prob_);
}
public String getRatio_()
{return getToolParameters().get("ratio_");
}
public void setRatio_(String ratio_)
{ getToolParameters().put("ratio_", ratio_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMethod_( "J" );
setSeqboot_("false");
setResamp_method_( "bootstrap" );
setReplicates_("100");
setPrintdata_("false");
setCode_( "U" );
setCategorization_( "G" );
setChange_prob_("0.4570");
setRatio_("2.000");
}
}
