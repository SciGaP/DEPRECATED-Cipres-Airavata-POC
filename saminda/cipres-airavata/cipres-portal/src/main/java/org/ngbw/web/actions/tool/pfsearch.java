package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class pfsearch extends ToolParameters
{
public String getPftools_()
{return getToolParameters().get("pftools_");
}
public void setPftools_(String pftools_)
{ getToolParameters().put("pftools_", pftools_);
}
// file-typed property getters and setters
public Long getProfile_()
{
return getInputDataItemId("profile_");
}
public void setProfile_(Long profile_)
{
setInputDataItem("profile_",profile_);
}
public String getGcg2psa_()
{return getToolParameters().get("gcg2psa_");
}
public void setGcg2psa_(String gcg2psa_)
{ getToolParameters().put("gcg2psa_", gcg2psa_);
}
public String getAa_or_nuc_db_()
{return getToolParameters().get("aa_or_nuc_db_");
}
public void setAa_or_nuc_db_(String aa_or_nuc_db_)
{ getToolParameters().put("aa_or_nuc_db_", aa_or_nuc_db_);
}
public String getAadb_()
{return getToolParameters().get("aadb_");
}
public void setAadb_(String aadb_)
{ getToolParameters().put("aadb_", aadb_);
}
public String getNucdb_()
{return getToolParameters().get("nucdb_");
}
public void setNucdb_(String nucdb_)
{ getToolParameters().put("nucdb_", nucdb_);
}
public String getPfsearch_cutoff_()
{return getToolParameters().get("pfsearch_cutoff_");
}
public void setPfsearch_cutoff_(String pfsearch_cutoff_)
{ getToolParameters().put("pfsearch_cutoff_", pfsearch_cutoff_);
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
setPftools_( "pfsearch" );
setGcg2psa_("false");
setAa_or_nuc_db_( "protein" );
setAadb_( "UNIPROT.fasta" );
setNucdb_( "GBALL.fasta" );
}
}
