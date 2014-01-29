package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class blastx extends ToolParameters
{
public String getBlast2_()
{return getToolParameters().get("blast2_");
}
public void setBlast2_(String blast2_)
{ getToolParameters().put("blast2_", blast2_);
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
public String getOther_filters_()
{return getToolParameters().get("other_filters_");
}
public void setOther_filters_(String other_filters_)
{ getToolParameters().put("other_filters_", other_filters_);
}
public String getLower_case_()
{return getToolParameters().get("lower_case_");
}
public void setLower_case_(String lower_case_)
{ getToolParameters().put("lower_case_", lower_case_);
}
public String getExpect_()
{return getToolParameters().get("Expect_");
}
public void setExpect_(String Expect_)
{ getToolParameters().put("Expect_", Expect_);
}
public String getWord_size_()
{return getToolParameters().get("word_size_");
}
public void setWord_size_(String word_size_)
{ getToolParameters().put("word_size_", word_size_);
}
public String getDist_hits_()
{return getToolParameters().get("dist_hits_");
}
public void setDist_hits_(String dist_hits_)
{ getToolParameters().put("dist_hits_", dist_hits_);
}
public String getExtend_hit_()
{return getToolParameters().get("extend_hit_");
}
public void setExtend_hit_(String extend_hit_)
{ getToolParameters().put("extend_hit_", extend_hit_);
}
public String getDropoff_extent_()
{return getToolParameters().get("dropoff_extent_");
}
public void setDropoff_extent_(String dropoff_extent_)
{ getToolParameters().put("dropoff_extent_", dropoff_extent_);
}
public String getKeep_hits_()
{return getToolParameters().get("keep_hits_");
}
public void setKeep_hits_(String keep_hits_)
{ getToolParameters().put("keep_hits_", keep_hits_);
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
public String getDropoff_final_()
{return getToolParameters().get("dropoff_final_");
}
public void setDropoff_final_(String dropoff_final_)
{ getToolParameters().put("dropoff_final_", dropoff_final_);
}
public String getMismatch_()
{return getToolParameters().get("mismatch_");
}
public void setMismatch_(String mismatch_)
{ getToolParameters().put("mismatch_", mismatch_);
}
public String getMatch_()
{return getToolParameters().get("match_");
}
public void setMatch_(String match_)
{ getToolParameters().put("match_", match_);
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
public String getGc_query_()
{return getToolParameters().get("gc_query_");
}
public void setGc_query_(String gc_query_)
{ getToolParameters().put("gc_query_", gc_query_);
}
public String getGc_db_()
{return getToolParameters().get("gc_db_");
}
public void setGc_db_(String gc_db_)
{ getToolParameters().put("gc_db_", gc_db_);
}
public String getStrand_()
{return getToolParameters().get("strand_");
}
public void setStrand_(String strand_)
{ getToolParameters().put("strand_", strand_);
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
public String getShow_gi_()
{return getToolParameters().get("show_gi_");
}
public void setShow_gi_(String show_gi_)
{ getToolParameters().put("show_gi_", show_gi_);
}
public String getBelieve_()
{return getToolParameters().get("believe_");
}
public void setBelieve_(String believe_)
{ getToolParameters().put("believe_", believe_);
}
public String getHtmloutput_()
{return getToolParameters().get("htmloutput_");
}
public void setHtmloutput_(String htmloutput_)
{ getToolParameters().put("htmloutput_", htmloutput_);
}
public String getExternal_links_()
{return getToolParameters().get("external_links_");
}
public void setExternal_links_(String external_links_)
{ getToolParameters().put("external_links_", external_links_);
}
public String getOne_HSP_per_line_()
{return getToolParameters().get("one_HSP_per_line_");
}
public void setOne_HSP_per_line_(String one_HSP_per_line_)
{ getToolParameters().put("one_HSP_per_line_", one_HSP_per_line_);
}
public String getImage_query_()
{return getToolParameters().get("image_query_");
}
public void setImage_query_(String image_query_)
{ getToolParameters().put("image_query_", image_query_);
}
// file-typed property getters and setters
public Long getRestrict_db_()
{
return getInputDataItemId("restrict_db_");
}
public void setRestrict_db_(Long restrict_db_)
{
setInputDataItem("restrict_db_",restrict_db_);
}
// file-typed property getters and setters
public Long getPsi_checkpoint_()
{
return getInputDataItemId("psi_checkpoint_");
}
public void setPsi_checkpoint_(Long psi_checkpoint_)
{
setInputDataItem("psi_checkpoint_",psi_checkpoint_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setBlast2_( "blastx" );
setProtein_db_( "UNIPROT" );
setFilter_("true");
setLower_case_("false");
setExpect_("10");
setGapped_alig_("true");
setMismatch_("-3");
setMatch_("1");
setMatrix_( "BLOSUM62" );
setGc_query_( "1" );
setGc_db_( "1" );
setStrand_( "3" );
setDescriptions_("500");
setAlignments_("250");
setView_alignments_( "0" );
setShow_gi_("false");
setBelieve_("false");
setHtmloutput_("true");
setExternal_links_("false");
setOne_HSP_per_line_("false");
setImage_query_("false");
}
}
