package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class ssearch_p extends ToolParameters
{
// file-typed property getters and setters
public Long getQuery_()
{
return getInputDataItemId("query_");
}
public void setQuery_(Long query_)
{
setInputDataItem("query_",query_);
}
public String getSeqtype_()
{return getToolParameters().get("seqtype_");
}
public void setSeqtype_(String seqtype_)
{ getToolParameters().put("seqtype_", seqtype_);
}
public String getProtein_db_()
{return getToolParameters().get("protein_db_");
}
public void setProtein_db_(String protein_db_)
{ getToolParameters().put("protein_db_", protein_db_);
}
public String getNucleotid_db_()
{return getToolParameters().get("nucleotid_db_");
}
public void setNucleotid_db_(String nucleotid_db_)
{ getToolParameters().put("nucleotid_db_", nucleotid_db_);
}
public String getKtup_()
{return getToolParameters().get("ktup_");
}
public void setKtup_(String ktup_)
{ getToolParameters().put("ktup_", ktup_);
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
public String getDna_match_()
{return getToolParameters().get("dna_match_");
}
public void setDna_match_(String dna_match_)
{ getToolParameters().put("dna_match_", dna_match_);
}
public String getNucleotid_mismatch_()
{return getToolParameters().get("nucleotid_mismatch_");
}
public void setNucleotid_mismatch_(String nucleotid_mismatch_)
{ getToolParameters().put("nucleotid_mismatch_", nucleotid_mismatch_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
}
public String getStat_()
{return getToolParameters().get("stat_");
}
public void setStat_(String stat_)
{ getToolParameters().put("stat_", stat_);
}
public String getRandom_()
{return getToolParameters().get("random_");
}
public void setRandom_(String random_)
{ getToolParameters().put("random_", random_);
}
public String getHistogram_()
{return getToolParameters().get("histogram_");
}
public void setHistogram_(String histogram_)
{ getToolParameters().put("histogram_", histogram_);
}
public String getScores_()
{return getToolParameters().get("scores_");
}
public void setScores_(String scores_)
{ getToolParameters().put("scores_", scores_);
}
public String getAlns_()
{return getToolParameters().get("alns_");
}
public void setAlns_(String alns_)
{ getToolParameters().put("alns_", alns_);
}
public String getHtml_output_()
{return getToolParameters().get("html_output_");
}
public void setHtml_output_(String html_output_)
{ getToolParameters().put("html_output_", html_output_);
}
public String getMarkx_()
{return getToolParameters().get("markx_");
}
public void setMarkx_(String markx_)
{ getToolParameters().put("markx_", markx_);
}
public String getInit1_()
{return getToolParameters().get("init1_");
}
public void setInit1_(String init1_)
{ getToolParameters().put("init1_", init1_);
}
public String getZ_score_out_()
{return getToolParameters().get("z_score_out_");
}
public void setZ_score_out_(String z_score_out_)
{ getToolParameters().put("z_score_out_", z_score_out_);
}
public String getShowall_()
{return getToolParameters().get("showall_");
}
public void setShowall_(String showall_)
{ getToolParameters().put("showall_", showall_);
}
public String getLinlen_()
{return getToolParameters().get("linlen_");
}
public void setLinlen_(String linlen_)
{ getToolParameters().put("linlen_", linlen_);
}
public String getOffsets_()
{return getToolParameters().get("offsets_");
}
public void setOffsets_(String offsets_)
{ getToolParameters().put("offsets_", offsets_);
}
public String getInfo_()
{return getToolParameters().get("info_");
}
public void setInfo_(String info_)
{ getToolParameters().put("info_", info_);
}
public String getFilter_()
{return getToolParameters().get("filter_");
}
public void setFilter_(String filter_)
{ getToolParameters().put("filter_", filter_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setSeqtype_( "protein" );
setProtein_db_( "SWISSPROT.fasta" );
setNucleotid_db_( "GBHTC.fasta" );
setDna_match_("5");
setNucleotid_mismatch_("-4");
setMatrix_( "BL50" );
setStat_( "1" );
setRandom_("false");
setHtml_output_("false");
setMarkx_( "0" );
setZ_score_out_( "0" );
setLinlen_("60");
setFilter_("false");
}
}
