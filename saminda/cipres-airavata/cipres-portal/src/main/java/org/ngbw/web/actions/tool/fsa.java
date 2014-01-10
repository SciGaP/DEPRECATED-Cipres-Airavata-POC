package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class fsa extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getInfile_()
{
return getInputDataItemId("infile_");
}
public void setInfile_(Long infile_)
{
setInputDataItem("infile_",infile_);
}
public String getData_type_()
{return getToolParameters().get("data_type_");
}
public void setData_type_(String data_type_)
{ getToolParameters().put("data_type_", data_type_);
}
public String getUse_anchors_()
{return getToolParameters().get("use_anchors_");
}
public void setUse_anchors_(String use_anchors_)
{ getToolParameters().put("use_anchors_", use_anchors_);
}
public String getNo_anchors_()
{return getToolParameters().get("no_anchors_");
}
public void setNo_anchors_(String no_anchors_)
{ getToolParameters().put("no_anchors_", no_anchors_);
}
public String getAlign_in_protspace_()
{return getToolParameters().get("align_in_protspace_");
}
public void setAlign_in_protspace_(String align_in_protspace_)
{ getToolParameters().put("align_in_protspace_", align_in_protspace_);
}
public String getProt_anchor_()
{return getToolParameters().get("prot_anchor_");
}
public void setProt_anchor_(String prot_anchor_)
{ getToolParameters().put("prot_anchor_", prot_anchor_);
}
public String getSensitivity_max_()
{return getToolParameters().get("sensitivity_max_");
}
public void setSensitivity_max_(String sensitivity_max_)
{ getToolParameters().put("sensitivity_max_", sensitivity_max_);
}
public String getFast_alignment_()
{return getToolParameters().get("fast_alignment_");
}
public void setFast_alignment_(String fast_alignment_)
{ getToolParameters().put("fast_alignment_", fast_alignment_);
}
public String getCall_exonerate_()
{return getToolParameters().get("call_exonerate_");
}
public void setCall_exonerate_(String call_exonerate_)
{ getToolParameters().put("call_exonerate_", call_exonerate_);
}
public String getMake_softmasked_()
{return getToolParameters().get("make_softmasked_");
}
public void setMake_softmasked_(String make_softmasked_)
{ getToolParameters().put("make_softmasked_", make_softmasked_);
}
public String getOutput_stockholm_()
{return getToolParameters().get("output_stockholm_");
}
public void setOutput_stockholm_(String output_stockholm_)
{ getToolParameters().put("output_stockholm_", output_stockholm_);
}
public String getSubst_model_()
{return getToolParameters().get("subst_model_");
}
public void setSubst_model_(String subst_model_)
{ getToolParameters().put("subst_model_", subst_model_);
}
public String getEvtime_param_()
{return getToolParameters().get("evtime_param_");
}
public void setEvtime_param_(String evtime_param_)
{ getToolParameters().put("evtime_param_", evtime_param_);
}
public String getNum_indel_states_()
{return getToolParameters().get("num_indel_states_");
}
public void setNum_indel_states_(String num_indel_states_)
{ getToolParameters().put("num_indel_states_", num_indel_states_);
}
public String getAlpha_R_()
{return getToolParameters().get("alpha_R_");
}
public void setAlpha_R_(String alpha_R_)
{ getToolParameters().put("alpha_R_", alpha_R_);
}
public String getAlpha_Y_()
{return getToolParameters().get("alpha_Y_");
}
public void setAlpha_Y_(String alpha_Y_)
{ getToolParameters().put("alpha_Y_", alpha_Y_);
}
public String getTN_beta_()
{return getToolParameters().get("TN_beta_");
}
public void setTN_beta_(String TN_beta_)
{ getToolParameters().put("TN_beta_", TN_beta_);
}
public String getOpen_set1_of_indelstates_()
{return getToolParameters().get("open_set1_of_indelstates_");
}
public void setOpen_set1_of_indelstates_(String open_set1_of_indelstates_)
{ getToolParameters().put("open_set1_of_indelstates_", open_set1_of_indelstates_);
}
public String getGap_set1_of_indelstates_()
{return getToolParameters().get("gap_set1_of_indelstates_");
}
public void setGap_set1_of_indelstates_(String gap_set1_of_indelstates_)
{ getToolParameters().put("gap_set1_of_indelstates_", gap_set1_of_indelstates_);
}
public String getOpen_set2_of_indelstates_()
{return getToolParameters().get("open_set2_of_indelstates_");
}
public void setOpen_set2_of_indelstates_(String open_set2_of_indelstates_)
{ getToolParameters().put("open_set2_of_indelstates_", open_set2_of_indelstates_);
}
public String getGap_set2_of_indelstates_()
{return getToolParameters().get("gap_set2_of_indelstates_");
}
public void setGap_set2_of_indelstates_(String gap_set2_of_indelstates_)
{ getToolParameters().put("gap_set2_of_indelstates_", gap_set2_of_indelstates_);
}
public String getUpload_probfile_()
{return getToolParameters().get("upload_probfile_");
}
public void setUpload_probfile_(String upload_probfile_)
{ getToolParameters().put("upload_probfile_", upload_probfile_);
}
// file-typed property getters and setters
public Long getPosterior_probfile_()
{
return getInputDataItemId("posterior_probfile_");
}
public void setPosterior_probfile_(Long posterior_probfile_)
{
setInputDataItem("posterior_probfile_",posterior_probfile_);
}
public String getLearn_gap_()
{return getToolParameters().get("learn_gap_");
}
public void setLearn_gap_(String learn_gap_)
{ getToolParameters().put("learn_gap_", learn_gap_);
}
public String getNolearn_gap_()
{return getToolParameters().get("nolearn_gap_");
}
public void setNolearn_gap_(String nolearn_gap_)
{ getToolParameters().put("nolearn_gap_", nolearn_gap_);
}
public String getLearnemit_all_()
{return getToolParameters().get("learnemit_all_");
}
public void setLearnemit_all_(String learnemit_all_)
{ getToolParameters().put("learnemit_all_", learnemit_all_);
}
public String getNot_learnemitbypair_()
{return getToolParameters().get("not_learnemitbypair_");
}
public void setNot_learnemitbypair_(String not_learnemitbypair_)
{ getToolParameters().put("not_learnemitbypair_", not_learnemitbypair_);
}
public String getLearnemit_pair_()
{return getToolParameters().get("learnemit_pair_");
}
public void setLearnemit_pair_(String learnemit_pair_)
{ getToolParameters().put("learnemit_pair_", learnemit_pair_);
}
public String getNot_learnemitall_()
{return getToolParameters().get("not_learnemitall_");
}
public void setNot_learnemitall_(String not_learnemitall_)
{ getToolParameters().put("not_learnemitall_", not_learnemitall_);
}
public String getNo_learn_()
{return getToolParameters().get("no_learn_");
}
public void setNo_learn_(String no_learn_)
{ getToolParameters().put("no_learn_", no_learn_);
}
public String getNo_regularize_()
{return getToolParameters().get("no_regularize_");
}
public void setNo_regularize_(String no_regularize_)
{ getToolParameters().put("no_regularize_", no_regularize_);
}
public String getReg_gapscale_()
{return getToolParameters().get("reg_gapscale_");
}
public void setReg_gapscale_(String reg_gapscale_)
{ getToolParameters().put("reg_gapscale_", reg_gapscale_);
}
public String getReg_emitscale_()
{return getToolParameters().get("reg_emitscale_");
}
public void setReg_emitscale_(String reg_emitscale_)
{ getToolParameters().put("reg_emitscale_", reg_emitscale_);
}
public String getMin_increase_()
{return getToolParameters().get("min_increase_");
}
public void setMin_increase_(String min_increase_)
{ getToolParameters().put("min_increase_", min_increase_);
}
public String getMax_rounds_()
{return getToolParameters().get("max_rounds_");
}
public void setMax_rounds_(String max_rounds_)
{ getToolParameters().put("max_rounds_", max_rounds_);
}
public String getMin_gapdata_()
{return getToolParameters().get("min_gapdata_");
}
public void setMin_gapdata_(String min_gapdata_)
{ getToolParameters().put("min_gapdata_", min_gapdata_);
}
public String getMin_emitdata_()
{return getToolParameters().get("min_emitdata_");
}
public void setMin_emitdata_(String min_emitdata_)
{ getToolParameters().put("min_emitdata_", min_emitdata_);
}
public String getGap_factor_()
{return getToolParameters().get("gap_factor_");
}
public void setGap_factor_(String gap_factor_)
{ getToolParameters().put("gap_factor_", gap_factor_);
}
public String getNum_iterations_()
{return getToolParameters().get("num_iterations_");
}
public void setNum_iterations_(String num_iterations_)
{ getToolParameters().put("num_iterations_", num_iterations_);
}
public String getNo_dynweight_()
{return getToolParameters().get("no_dynweight_");
}
public void setNo_dynweight_(String no_dynweight_)
{ getToolParameters().put("no_dynweight_", no_dynweight_);
}
public String getRequire_homology_()
{return getToolParameters().get("require_homology_");
}
public void setRequire_homology_(String require_homology_)
{ getToolParameters().put("require_homology_", require_homology_);
}
public String getRef_alignment_()
{return getToolParameters().get("ref_alignment_");
}
public void setRef_alignment_(String ref_alignment_)
{ getToolParameters().put("ref_alignment_", ref_alignment_);
}
public String getMin_spantree_()
{return getToolParameters().get("min_spantree_");
}
public void setMin_spantree_(String min_spantree_)
{ getToolParameters().put("min_spantree_", min_spantree_);
}
public String getMax_spantree_()
{return getToolParameters().get("max_spantree_");
}
public void setMax_spantree_(String max_spantree_)
{ getToolParameters().put("max_spantree_", max_spantree_);
}
public String getMax_palmtree_()
{return getToolParameters().get("max_palmtree_");
}
public void setMax_palmtree_(String max_palmtree_)
{ getToolParameters().put("max_palmtree_", max_palmtree_);
}
public String getNumber_degree_()
{return getToolParameters().get("number_degree_");
}
public void setNumber_degree_(String number_degree_)
{ getToolParameters().put("number_degree_", number_degree_);
}
public String getKmer_length_()
{return getToolParameters().get("kmer_length_");
}
public void setKmer_length_(String kmer_length_)
{ getToolParameters().put("kmer_length_", kmer_length_);
}
public String getAlignment_fraction_()
{return getToolParameters().get("alignment_fraction_");
}
public void setAlignment_fraction_(String alignment_fraction_)
{ getToolParameters().put("alignment_fraction_", alignment_fraction_);
}
public String getAlignment_number_()
{return getToolParameters().get("alignment_number_");
}
public void setAlignment_number_(String alignment_number_)
{ getToolParameters().put("alignment_number_", alignment_number_);
}
public String getMin_anchorlen_()
{return getToolParameters().get("min_anchorlen_");
}
public void setMin_anchorlen_(String min_anchorlen_)
{ getToolParameters().put("min_anchorlen_", min_anchorlen_);
}
public String getMax_joinlen_()
{return getToolParameters().get("max_joinlen_");
}
public void setMax_joinlen_(String max_joinlen_)
{ getToolParameters().put("max_joinlen_", max_joinlen_);
}
public String getUse_hardmask_()
{return getToolParameters().get("use_hardmask_");
}
public void setUse_hardmask_(String use_hardmask_)
{ getToolParameters().put("use_hardmask_", use_hardmask_);
}
public String getExon_minscore_()
{return getToolParameters().get("exon_minscore_");
}
public void setExon_minscore_(String exon_minscore_)
{ getToolParameters().put("exon_minscore_", exon_minscore_);
}
// file-typed property getters and setters
public Long getProvide_mercator_()
{
return getInputDataItemId("provide_mercator_");
}
public void setProvide_mercator_(Long provide_mercator_)
{
setInputDataItem("provide_mercator_",provide_mercator_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setData_type_( "na" );
setUse_anchors_("false");
setNo_anchors_("false");
setAlign_in_protspace_("false");
setProt_anchor_("false");
setSensitivity_max_("false");
setFast_alignment_("false");
setCall_exonerate_("false");
setMake_softmasked_("false");
setOutput_stockholm_("false");
setSubst_model_( "1" );
setNum_indel_states_( "indel2" );
setUpload_probfile_("false");
setLearn_gap_("true");
setNolearn_gap_("false");
setLearnemit_all_("false");
setNot_learnemitbypair_("false");
setLearnemit_pair_("false");
setNot_learnemitall_("false");
setNo_learn_("false");
setNo_regularize_("false");
setGap_factor_("1.0");
setNo_dynweight_("false");
setRequire_homology_("false");
setRef_alignment_("false");
setMax_joinlen_("2");
setExon_minscore_("100");
}
}
