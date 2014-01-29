package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class mafft_tg extends ToolParameters
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
public String getDatatype_()
{return getToolParameters().get("datatype_");
}
public void setDatatype_(String datatype_)
{ getToolParameters().put("datatype_", datatype_);
}
public String getAuto_analysis_()
{return getToolParameters().get("auto_analysis_");
}
public void setAuto_analysis_(String auto_analysis_)
{ getToolParameters().put("auto_analysis_", auto_analysis_);
}
public String getAnalysis_type_()
{return getToolParameters().get("analysis_type_");
}
public void setAnalysis_type_(String analysis_type_)
{ getToolParameters().put("analysis_type_", analysis_type_);
}
public String getConfigure_analysis_()
{return getToolParameters().get("configure_analysis_");
}
public void setConfigure_analysis_(String configure_analysis_)
{ getToolParameters().put("configure_analysis_", configure_analysis_);
}
public String getAccurate_executable_()
{return getToolParameters().get("accurate_executable_");
}
public void setAccurate_executable_(String accurate_executable_)
{ getToolParameters().put("accurate_executable_", accurate_executable_);
}
public String getFast_executables_()
{return getToolParameters().get("fast_executables_");
}
public void setFast_executables_(String fast_executables_)
{ getToolParameters().put("fast_executables_", fast_executables_);
}
public String getRna_executable_()
{return getToolParameters().get("rna_executable_");
}
public void setRna_executable_(String rna_executable_)
{ getToolParameters().put("rna_executable_", rna_executable_);
}
public String getUse_contrafold_()
{return getToolParameters().get("use_contrafold_");
}
public void setUse_contrafold_(String use_contrafold_)
{ getToolParameters().put("use_contrafold_", use_contrafold_);
}
public String getXinsi_option_()
{return getToolParameters().get("xinsi_option_");
}
public void setXinsi_option_(String xinsi_option_)
{ getToolParameters().put("xinsi_option_", xinsi_option_);
}
public String getDistanceMetric_()
{return getToolParameters().get("distanceMetric_");
}
public void setDistanceMetric_(String distanceMetric_)
{ getToolParameters().put("distanceMetric_", distanceMetric_);
}
public String getWeighting_factor_()
{return getToolParameters().get("weighting_factor_");
}
public void setWeighting_factor_(String weighting_factor_)
{ getToolParameters().put("weighting_factor_", weighting_factor_);
}
public String getRetrees_()
{return getToolParameters().get("retrees_");
}
public void setRetrees_(String retrees_)
{ getToolParameters().put("retrees_", retrees_);
}
public String getIterativeRefinements_()
{return getToolParameters().get("iterativeRefinements_");
}
public void setIterativeRefinements_(String iterativeRefinements_)
{ getToolParameters().put("iterativeRefinements_", iterativeRefinements_);
}
public String getUseFFT_()
{return getToolParameters().get("useFFT_");
}
public void setUseFFT_(String useFFT_)
{ getToolParameters().put("useFFT_", useFFT_);
}
public String getNoScore_()
{return getToolParameters().get("noScore_");
}
public void setNoScore_(String noScore_)
{ getToolParameters().put("noScore_", noScore_);
}
public String getMemSave_()
{return getToolParameters().get("memSave_");
}
public void setMemSave_(String memSave_)
{ getToolParameters().put("memSave_", memSave_);
}
public String getUsePartTree_()
{return getToolParameters().get("usePartTree_");
}
public void setUsePartTree_(String usePartTree_)
{ getToolParameters().put("usePartTree_", usePartTree_);
}
public String getPartTreeMetric_()
{return getToolParameters().get("partTreeMetric_");
}
public void setPartTreeMetric_(String partTreeMetric_)
{ getToolParameters().put("partTreeMetric_", partTreeMetric_);
}
public String getPartTreePartitions_()
{return getToolParameters().get("partTreePartitions_");
}
public void setPartTreePartitions_(String partTreePartitions_)
{ getToolParameters().put("partTreePartitions_", partTreePartitions_);
}
public String getMaxAlignment_()
{return getToolParameters().get("maxAlignment_");
}
public void setMaxAlignment_(String maxAlignment_)
{ getToolParameters().put("maxAlignment_", maxAlignment_);
}
public String getUse_seed_()
{return getToolParameters().get("use_seed_");
}
public void setUse_seed_(String use_seed_)
{ getToolParameters().put("use_seed_", use_seed_);
}
// file-typed property getters and setters
public Long getSeed_alignment1_()
{
return getInputDataItemId("seed_alignment1_");
}
public void setSeed_alignment1_(Long seed_alignment1_)
{
setInputDataItem("seed_alignment1_",seed_alignment1_);
}
public String getUse_add_()
{return getToolParameters().get("use_add_");
}
public void setUse_add_(String use_add_)
{ getToolParameters().put("use_add_", use_add_);
}
// file-typed property getters and setters
public Long getAdd_alignment1_()
{
return getInputDataItemId("add_alignment1_");
}
public void setAdd_alignment1_(Long add_alignment1_)
{
setInputDataItem("add_alignment1_",add_alignment1_);
}
public String getUse_addfrag_()
{return getToolParameters().get("use_addfrag_");
}
public void setUse_addfrag_(String use_addfrag_)
{ getToolParameters().put("use_addfrag_", use_addfrag_);
}
public String getLarge_align_()
{return getToolParameters().get("large_align_");
}
public void setLarge_align_(String large_align_)
{ getToolParameters().put("large_align_", large_align_);
}
// file-typed property getters and setters
public Long getRef_alignment1_()
{
return getInputDataItemId("ref_alignment1_");
}
public void setRef_alignment1_(Long ref_alignment1_)
{
setInputDataItem("ref_alignment1_",ref_alignment1_);
}
public String getReorder_add_()
{return getToolParameters().get("reorder_add_");
}
public void setReorder_add_(String reorder_add_)
{ getToolParameters().put("reorder_add_", reorder_add_);
}
public String getUse_addprof_()
{return getToolParameters().get("use_addprof_");
}
public void setUse_addprof_(String use_addprof_)
{ getToolParameters().put("use_addprof_", use_addprof_);
}
// file-typed property getters and setters
public Long getExisting_alignment1_()
{
return getInputDataItemId("existing_alignment1_");
}
public void setExisting_alignment1_(Long existing_alignment1_)
{
setInputDataItem("existing_alignment1_",existing_alignment1_);
}
public String getUse_merge_()
{return getToolParameters().get("use_merge_");
}
public void setUse_merge_(String use_merge_)
{ getToolParameters().put("use_merge_", use_merge_);
}
// file-typed property getters and setters
public Long getSubmsa_table_()
{
return getInputDataItemId("submsa_table_");
}
public void setSubmsa_table_(Long submsa_table_)
{
setInputDataItem("submsa_table_",submsa_table_);
}
// file-typed property getters and setters
public Long getTreein_tree_()
{
return getInputDataItemId("treein_tree_");
}
public void setTreein_tree_(Long treein_tree_)
{
setInputDataItem("treein_tree_",treein_tree_);
}
public String getDnaMatrix_()
{return getToolParameters().get("dnaMatrix_");
}
public void setDnaMatrix_(String dnaMatrix_)
{ getToolParameters().put("dnaMatrix_", dnaMatrix_);
}
public String getAaMatrix_()
{return getToolParameters().get("aaMatrix_");
}
public void setAaMatrix_(String aaMatrix_)
{ getToolParameters().put("aaMatrix_", aaMatrix_);
}
public String getJtt_()
{return getToolParameters().get("jtt_");
}
public void setJtt_(String jtt_)
{ getToolParameters().put("jtt_", jtt_);
}
public String getTm_()
{return getToolParameters().get("tm_");
}
public void setTm_(String tm_)
{ getToolParameters().put("tm_", tm_);
}
// file-typed property getters and setters
public Long getUserMatrix_()
{
return getInputDataItemId("userMatrix_");
}
public void setUserMatrix_(Long userMatrix_)
{
setInputDataItem("userMatrix_",userMatrix_);
}
public String getOpPenaltyGroupToGroup_()
{return getToolParameters().get("opPenaltyGroupToGroup_");
}
public void setOpPenaltyGroupToGroup_(String opPenaltyGroupToGroup_)
{ getToolParameters().put("opPenaltyGroupToGroup_", opPenaltyGroupToGroup_);
}
public String getExtendPenaltyGroupToGroup_()
{return getToolParameters().get("extendPenaltyGroupToGroup_");
}
public void setExtendPenaltyGroupToGroup_(String extendPenaltyGroupToGroup_)
{ getToolParameters().put("extendPenaltyGroupToGroup_", extendPenaltyGroupToGroup_);
}
public String getOpPenaltyPairwise_()
{return getToolParameters().get("opPenaltyPairwise_");
}
public void setOpPenaltyPairwise_(String opPenaltyPairwise_)
{ getToolParameters().put("opPenaltyPairwise_", opPenaltyPairwise_);
}
public String getOffsetValuePairwise_()
{return getToolParameters().get("offsetValuePairwise_");
}
public void setOffsetValuePairwise_(String offsetValuePairwise_)
{ getToolParameters().put("offsetValuePairwise_", offsetValuePairwise_);
}
public String getExtendPenaltyPairwise_()
{return getToolParameters().get("extendPenaltyPairwise_");
}
public void setExtendPenaltyPairwise_(String extendPenaltyPairwise_)
{ getToolParameters().put("extendPenaltyPairwise_", extendPenaltyPairwise_);
}
public String getOpPenaltySkip_()
{return getToolParameters().get("opPenaltySkip_");
}
public void setOpPenaltySkip_(String opPenaltySkip_)
{ getToolParameters().put("opPenaltySkip_", opPenaltySkip_);
}
public String getExtendPenaltySkip_()
{return getToolParameters().get("extendPenaltySkip_");
}
public void setExtendPenaltySkip_(String extendPenaltySkip_)
{ getToolParameters().put("extendPenaltySkip_", extendPenaltySkip_);
}
public String getFmodel_()
{return getToolParameters().get("fmodel_");
}
public void setFmodel_(String fmodel_)
{ getToolParameters().put("fmodel_", fmodel_);
}
public String getOutputFormat_()
{return getToolParameters().get("outputFormat_");
}
public void setOutputFormat_(String outputFormat_)
{ getToolParameters().put("outputFormat_", outputFormat_);
}
public String getOutputOrder_()
{return getToolParameters().get("outputOrder_");
}
public void setOutputOrder_(String outputOrder_)
{ getToolParameters().put("outputOrder_", outputOrder_);
}
public String getOutputGuideTree_()
{return getToolParameters().get("outputGuideTree_");
}
public void setOutputGuideTree_(String outputGuideTree_)
{ getToolParameters().put("outputGuideTree_", outputGuideTree_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.5");
setDatatype_( "0" );
setAuto_analysis_("true");
setAnalysis_type_( "accurate" );
setConfigure_analysis_("false");
setAccurate_executable_( "linsi68" );
setRna_executable_( "qinsi" );
setXinsi_option_( "scarnapair" );
setDistanceMetric_( "0" );
setWeighting_factor_("2.7");
setRetrees_("2");
setIterativeRefinements_("0");
setUseFFT_( "1" );
setNoScore_( "1" );
setMemSave_( "0" );
setUsePartTree_( "0" );
setPartTreeMetric_( "0" );
setPartTreePartitions_("50");
setUse_seed_("false");
setUse_add_("false");
setUse_addfrag_("false");
setLarge_align_("false");
setReorder_add_("true");
setUse_addprof_("false");
setUse_merge_("false");
setDnaMatrix_( "200" );
setAaMatrix_( "0" );
setOpPenaltyGroupToGroup_("1.53");
setExtendPenaltyGroupToGroup_("0.123");
setOpPenaltyPairwise_("-2.00");
setOffsetValuePairwise_("0.1");
setExtendPenaltyPairwise_("-0.1");
setOpPenaltySkip_("-6.00");
setExtendPenaltySkip_("0.00");
setFmodel_( "0" );
setOutputFormat_( "0" );
setOutputOrder_( "1" );
setOutputGuideTree_( "0" );
}
}
