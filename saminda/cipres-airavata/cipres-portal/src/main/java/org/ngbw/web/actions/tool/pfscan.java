package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class pfscan extends ToolParameters
{
public String getPftools_()
{return getToolParameters().get("pftools_");
}
public void setPftools_(String pftools_)
{ getToolParameters().put("pftools_", pftools_);
}
// file-typed property getters and setters
public Long getSeqfile_()
{
return getInputDataItemId("seqfile_");
}
public void setSeqfile_(Long seqfile_)
{
setInputDataItem("seqfile_",seqfile_);
}
public String getProsite_()
{return getToolParameters().get("prosite_");
}
public void setProsite_(String prosite_)
{ getToolParameters().put("prosite_", prosite_);
}
// file-typed property getters and setters
public Long getProfiledb_()
{
return getInputDataItemId("profiledb_");
}
public void setProfiledb_(Long profiledb_)
{
setInputDataItem("profiledb_",profiledb_);
}
public String getPfscan_cutoff_()
{return getToolParameters().get("pfscan_cutoff_");
}
public void setPfscan_cutoff_(String pfscan_cutoff_)
{ getToolParameters().put("pfscan_cutoff_", pfscan_cutoff_);
}
public String getCompl_()
{return getToolParameters().get("compl_");
}
public void setCompl_(String compl_)
{ getToolParameters().put("compl_", compl_);
}
public String getRaw_score_()
{return getToolParameters().get("raw_score_");
}
public void setRaw_score_(String raw_score_)
{ getToolParameters().put("raw_score_", raw_score_);
}
public String getUnique_()
{return getToolParameters().get("unique_");
}
public void setUnique_(String unique_)
{ getToolParameters().put("unique_", unique_);
}
public String getOptimal_()
{return getToolParameters().get("optimal_");
}
public void setOptimal_(String optimal_)
{ getToolParameters().put("optimal_", optimal_);
}
public String getListseq_()
{return getToolParameters().get("listseq_");
}
public void setListseq_(String listseq_)
{ getToolParameters().put("listseq_", listseq_);
}
public String getPsa_format_()
{return getToolParameters().get("psa_format_");
}
public void setPsa_format_(String psa_format_)
{ getToolParameters().put("psa_format_", psa_format_);
}
public String getBetween_()
{return getToolParameters().get("between_");
}
public void setBetween_(String between_)
{ getToolParameters().put("between_", between_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setPftools_( "pfscan" );
setProsite_("true");
}
}
