package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class tfasty extends ToolParameters
{
public String getFasta_()
{return getToolParameters().get("fasta_");
}
public void setFasta_(String fasta_)
{ getToolParameters().put("fasta_", fasta_);
}
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
public String getNucleotid_db_()
{return getToolParameters().get("nucleotid_db_");
}
public void setNucleotid_db_(String nucleotid_db_)
{ getToolParameters().put("nucleotid_db_", nucleotid_db_);
}
public String getBreak_long_()
{return getToolParameters().get("break_long_");
}
public void setBreak_long_(String break_long_)
{ getToolParameters().put("break_long_", break_long_);
}
public String getKtup_()
{return getToolParameters().get("ktup_");
}
public void setKtup_(String ktup_)
{ getToolParameters().put("ktup_", ktup_);
}
public String getOptcut_()
{return getToolParameters().get("optcut_");
}
public void setOptcut_(String optcut_)
{ getToolParameters().put("optcut_", optcut_);
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
public String getHigh_expect_()
{return getToolParameters().get("high_expect_");
}
public void setHigh_expect_(String high_expect_)
{ getToolParameters().put("high_expect_", high_expect_);
}
public String getLow_expect_()
{return getToolParameters().get("low_expect_");
}
public void setLow_expect_(String low_expect_)
{ getToolParameters().put("low_expect_", low_expect_);
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
public String getX_penalty_()
{return getToolParameters().get("X_penalty_");
}
public void setX_penalty_(String X_penalty_)
{ getToolParameters().put("X_penalty_", X_penalty_);
}
public String getFrameshift_()
{return getToolParameters().get("frameshift_");
}
public void setFrameshift_(String frameshift_)
{ getToolParameters().put("frameshift_", frameshift_);
}
public String getFrameshift_within_()
{return getToolParameters().get("frameshift_within_");
}
public void setFrameshift_within_(String frameshift_within_)
{ getToolParameters().put("frameshift_within_", frameshift_within_);
}
public String getThreeframe_()
{return getToolParameters().get("threeframe_");
}
public void setThreeframe_(String threeframe_)
{ getToolParameters().put("threeframe_", threeframe_);
}
public String getInvert_()
{return getToolParameters().get("invert_");
}
public void setInvert_(String invert_)
{ getToolParameters().put("invert_", invert_);
}
public String getGenetic_code_()
{return getToolParameters().get("genetic_code_");
}
public void setGenetic_code_(String genetic_code_)
{ getToolParameters().put("genetic_code_", genetic_code_);
}
public String getBand_()
{return getToolParameters().get("band_");
}
public void setBand_(String band_)
{ getToolParameters().put("band_", band_);
}
public String getSwalig_()
{return getToolParameters().get("swalig_");
}
public void setSwalig_(String swalig_)
{ getToolParameters().put("swalig_", swalig_);
}
public String getNoopt_()
{return getToolParameters().get("noopt_");
}
public void setNoopt_(String noopt_)
{ getToolParameters().put("noopt_", noopt_);
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
setFasta_( "tfasty" );
setSeqtype_( "protein" );
setNucleotid_db_( "NCBI_NT.fasta" );
setHigh_expect_("0.001");
setDna_match_("5");
setNucleotid_mismatch_("-4");
setMatrix_( "BL50" );
setGenetic_code_( "1" );
setStat_( "1" );
setRandom_("false");
setHtml_output_("false");
setMarkx_( "0" );
setZ_score_out_( "0" );
setLinlen_("60");
setFilter_("false");
}
}
