package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class psiblast extends ToolParameters
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
public String getStart_region_()
{return getToolParameters().get("start_region_");
}
public void setStart_region_(String start_region_)
{ getToolParameters().put("start_region_", start_region_);
}
public String getEnd_region_()
{return getToolParameters().get("end_region_");
}
public void setEnd_region_(String end_region_)
{ getToolParameters().put("end_region_", end_region_);
}
public String getProtein_db_()
{return getToolParameters().get("protein_db_");
}
public void setProtein_db_(String protein_db_)
{ getToolParameters().put("protein_db_", protein_db_);
}
public String getFilter_()
{return getToolParameters().get("filter_");
}
public void setFilter_(String filter_)
{ getToolParameters().put("filter_", filter_);
}
public String getExpect_()
{return getToolParameters().get("Expect_");
}
public void setExpect_(String Expect_)
{ getToolParameters().put("Expect_", Expect_);
}
public String getWindow_()
{return getToolParameters().get("window_");
}
public void setWindow_(String window_)
{ getToolParameters().put("window_", window_);
}
public String getExtend_hit_()
{return getToolParameters().get("extend_hit_");
}
public void setExtend_hit_(String extend_hit_)
{ getToolParameters().put("extend_hit_", extend_hit_);
}
public String getDropoff_y_()
{return getToolParameters().get("dropoff_y_");
}
public void setDropoff_y_(String dropoff_y_)
{ getToolParameters().put("dropoff_y_", dropoff_y_);
}
public String getGapped_alig_()
{return getToolParameters().get("gapped_alig_");
}
public void setGapped_alig_(String gapped_alig_)
{ getToolParameters().put("gapped_alig_", gapped_alig_);
}
public String getDropoff_()
{return getToolParameters().get("dropoff_");
}
public void setDropoff_(String dropoff_)
{ getToolParameters().put("dropoff_", dropoff_);
}
public String getDropoff_z_()
{return getToolParameters().get("dropoff_z_");
}
public void setDropoff_z_(String dropoff_z_)
{ getToolParameters().put("dropoff_z_", dropoff_z_);
}
public String getWord_size_()
{return getToolParameters().get("word_size_");
}
public void setWord_size_(String word_size_)
{ getToolParameters().put("word_size_", word_size_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
}
public String getOpen_a_gap_()
{return getToolParameters().get("open_a_gap_");
}
public void setOpen_a_gap_(String open_a_gap_)
{ getToolParameters().put("open_a_gap_", open_a_gap_);
}
public String getExtend_a_gap_()
{return getToolParameters().get("extend_a_gap_");
}
public void setExtend_a_gap_(String extend_a_gap_)
{ getToolParameters().put("extend_a_gap_", extend_a_gap_);
}
public String getMax_passes_()
{return getToolParameters().get("max_passes_");
}
public void setMax_passes_(String max_passes_)
{ getToolParameters().put("max_passes_", max_passes_);
}
public String getExpect_in_multipass_()
{return getToolParameters().get("expect_in_multipass_");
}
public void setExpect_in_multipass_(String expect_in_multipass_)
{ getToolParameters().put("expect_in_multipass_", expect_in_multipass_);
}
public String getPseudocounts_()
{return getToolParameters().get("pseudocounts_");
}
public void setPseudocounts_(String pseudocounts_)
{ getToolParameters().put("pseudocounts_", pseudocounts_);
}
public String getTrigger_()
{return getToolParameters().get("trigger_");
}
public void setTrigger_(String trigger_)
{ getToolParameters().put("trigger_", trigger_);
}
public String getDescriptions_()
{return getToolParameters().get("Descriptions_");
}
public void setDescriptions_(String Descriptions_)
{ getToolParameters().put("Descriptions_", Descriptions_);
}
public String getAlignments_()
{return getToolParameters().get("Alignments_");
}
public void setAlignments_(String Alignments_)
{ getToolParameters().put("Alignments_", Alignments_);
}
public String getView_alignments_()
{return getToolParameters().get("view_alignments_");
}
public void setView_alignments_(String view_alignments_)
{ getToolParameters().put("view_alignments_", view_alignments_);
}
public String getHtmloutput_()
{return getToolParameters().get("htmloutput_");
}
public void setHtmloutput_(String htmloutput_)
{ getToolParameters().put("htmloutput_", htmloutput_);
}
public String getAlignment_restart_()
{return getToolParameters().get("alignment_restart_");
}
public void setAlignment_restart_(String alignment_restart_)
{ getToolParameters().put("alignment_restart_", alignment_restart_);
}
// file-typed property getters and setters
public Long getInalign_infile_()
{
return getInputDataItemId("inalign_infile_");
}
public void setInalign_infile_(Long inalign_infile_)
{
setInputDataItem("inalign_infile_",inalign_infile_);
}
public String getRestart_me_()
{return getToolParameters().get("restart_me_");
}
public void setRestart_me_(String restart_me_)
{ getToolParameters().put("restart_me_", restart_me_);
}
// file-typed property getters and setters
public Long getCheckpoint_infile_()
{
return getInputDataItemId("checkpoint_infile_");
}
public void setCheckpoint_infile_(Long checkpoint_infile_)
{
setInputDataItem("checkpoint_infile_",checkpoint_infile_);
}
public String getScoremat_in_()
{return getToolParameters().get("scoremat_in_");
}
public void setScoremat_in_(String scoremat_in_)
{ getToolParameters().put("scoremat_in_", scoremat_in_);
}
public String getBelieve_()
{return getToolParameters().get("believe_");
}
public void setBelieve_(String believe_)
{ getToolParameters().put("believe_", believe_);
}
public String getSeqalign_file_()
{return getToolParameters().get("seqalign_file_");
}
public void setSeqalign_file_(String seqalign_file_)
{ getToolParameters().put("seqalign_file_", seqalign_file_);
}
public String getSave_matrix_txt_()
{return getToolParameters().get("save_matrix_txt_");
}
public void setSave_matrix_txt_(String save_matrix_txt_)
{ getToolParameters().put("save_matrix_txt_", save_matrix_txt_);
}
public String getSave_matrix_chk_()
{return getToolParameters().get("save_matrix_chk_");
}
public void setSave_matrix_chk_(String save_matrix_chk_)
{ getToolParameters().put("save_matrix_chk_", save_matrix_chk_);
}
public String getScoremat_out_()
{return getToolParameters().get("scoremat_out_");
}
public void setScoremat_out_(String scoremat_out_)
{ getToolParameters().put("scoremat_out_", scoremat_out_);
}
public String getComp_based_stats_()
{return getToolParameters().get("comp_based_stats_");
}
public void setComp_based_stats_(String comp_based_stats_)
{ getToolParameters().put("comp_based_stats_", comp_based_stats_);
}
public String getUni_p_()
{return getToolParameters().get("uni_p_");
}
public void setUni_p_(String uni_p_)
{ getToolParameters().put("uni_p_", uni_p_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setStart_region_("1");
setEnd_region_("-1");
setProtein_db_( "UNIPROT" );
setFilter_("false");
setExpect_("10");
setWindow_("40");
setExtend_hit_("0");
setDropoff_y_("7.0");
setGapped_alig_("true");
setDropoff_("15");
setDropoff_z_("25");
setWord_size_("3");
setMatrix_( "BLOSUM62" );
setOpen_a_gap_("11");
setExtend_a_gap_("1");
setMax_passes_("5");
setExpect_in_multipass_("0.01");
setPseudocounts_("10");
setTrigger_("22.0");
setDescriptions_("500");
setAlignments_("250");
setView_alignments_( "0" );
setAlignment_restart_("false");
setRestart_me_("false");
setScoremat_in_( "0" );
setBelieve_("false");
setSave_matrix_txt_("false");
setSave_matrix_chk_("false");
setScoremat_out_( "0" );
setComp_based_stats_( "0" );
setUni_p_("false");
}
}
