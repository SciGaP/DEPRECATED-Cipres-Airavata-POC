package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class raxmlhpc2_tgbi extends ToolParameters
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
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
public String getNchars_()
{return getToolParameters().get("nchars_");
}
public void setNchars_(String nchars_)
{ getToolParameters().put("nchars_", nchars_);
}
public String getDatatype_()
{return getToolParameters().get("datatype_");
}
public void setDatatype_(String datatype_)
{ getToolParameters().put("datatype_", datatype_);
}
public String getOutgroup_()
{return getToolParameters().get("outgroup_");
}
public void setOutgroup_(String outgroup_)
{ getToolParameters().put("outgroup_", outgroup_);
}
public String getNumber_cats_()
{return getToolParameters().get("number_cats_");
}
public void setNumber_cats_(String number_cats_)
{ getToolParameters().put("number_cats_", number_cats_);
}
// file-typed property getters and setters
public Long getTreetop_()
{
return getInputDataItemId("treetop_");
}
public void setTreetop_(Long treetop_)
{
setInputDataItem("treetop_",treetop_);
}
public String getProvide_parsimony_seed_()
{return getToolParameters().get("provide_parsimony_seed_");
}
public void setProvide_parsimony_seed_(String provide_parsimony_seed_)
{ getToolParameters().put("provide_parsimony_seed_", provide_parsimony_seed_);
}
public String getParsimony_seed_val_()
{return getToolParameters().get("parsimony_seed_val_");
}
public void setParsimony_seed_val_(String parsimony_seed_val_)
{ getToolParameters().put("parsimony_seed_val_", parsimony_seed_val_);
}
public String getRearrangement_yes_()
{return getToolParameters().get("rearrangement_yes_");
}
public void setRearrangement_yes_(String rearrangement_yes_)
{ getToolParameters().put("rearrangement_yes_", rearrangement_yes_);
}
public String getNumber_rearrange_()
{return getToolParameters().get("number_rearrange_");
}
public void setNumber_rearrange_(String number_rearrange_)
{ getToolParameters().put("number_rearrange_", number_rearrange_);
}
// file-typed property getters and setters
public Long getConstraint_()
{
return getInputDataItemId("constraint_");
}
public void setConstraint_(Long constraint_)
{
setInputDataItem("constraint_",constraint_);
}
// file-typed property getters and setters
public Long getBinary_backbone_()
{
return getInputDataItemId("binary_backbone_");
}
public void setBinary_backbone_(Long binary_backbone_)
{
setInputDataItem("binary_backbone_",binary_backbone_);
}
// file-typed property getters and setters
public Long getPartition_()
{
return getInputDataItemId("partition_");
}
public void setPartition_(Long partition_)
{
setInputDataItem("partition_",partition_);
}
public String getEstimate_perpartbrlen_()
{return getToolParameters().get("estimate_perpartbrlen_");
}
public void setEstimate_perpartbrlen_(String estimate_perpartbrlen_)
{ getToolParameters().put("estimate_perpartbrlen_", estimate_perpartbrlen_);
}
// file-typed property getters and setters
public Long getExclude_file_()
{
return getInputDataItemId("exclude_file_");
}
public void setExclude_file_(Long exclude_file_)
{
setInputDataItem("exclude_file_",exclude_file_);
}
public String getDna_gtrcat_()
{return getToolParameters().get("dna_gtrcat_");
}
public void setDna_gtrcat_(String dna_gtrcat_)
{ getToolParameters().put("dna_gtrcat_", dna_gtrcat_);
}
public String getDna_gtrgamma_()
{return getToolParameters().get("dna_gtrgamma_");
}
public void setDna_gtrgamma_(String dna_gtrgamma_)
{ getToolParameters().put("dna_gtrgamma_", dna_gtrgamma_);
}
public String getProt_sub_model_()
{return getToolParameters().get("prot_sub_model_");
}
public void setProt_sub_model_(String prot_sub_model_)
{ getToolParameters().put("prot_sub_model_", prot_sub_model_);
}
public String getProt_matrix_spec_()
{return getToolParameters().get("prot_matrix_spec_");
}
public void setProt_matrix_spec_(String prot_matrix_spec_)
{ getToolParameters().put("prot_matrix_spec_", prot_matrix_spec_);
}
public String getInvariable_()
{return getToolParameters().get("invariable_");
}
public void setInvariable_(String invariable_)
{ getToolParameters().put("invariable_", invariable_);
}
// file-typed property getters and setters
public Long getUser_prot_matrix_()
{
return getInputDataItemId("user_prot_matrix_");
}
public void setUser_prot_matrix_(Long user_prot_matrix_)
{
setInputDataItem("user_prot_matrix_",user_prot_matrix_);
}
public String getUse_emp_freqs_()
{return getToolParameters().get("use_emp_freqs_");
}
public void setUse_emp_freqs_(String use_emp_freqs_)
{ getToolParameters().put("use_emp_freqs_", use_emp_freqs_);
}
// file-typed property getters and setters
public Long getSec_str_file_()
{
return getInputDataItemId("sec_str_file_");
}
public void setSec_str_file_(Long sec_str_file_)
{
setInputDataItem("sec_str_file_",sec_str_file_);
}
public String getRna_model_()
{return getToolParameters().get("rna_model_");
}
public void setRna_model_(String rna_model_)
{ getToolParameters().put("rna_model_", rna_model_);
}
public String getBin_model_()
{return getToolParameters().get("bin_model_");
}
public void setBin_model_(String bin_model_)
{ getToolParameters().put("bin_model_", bin_model_);
}
public String getMulti_model_()
{return getToolParameters().get("multi_model_");
}
public void setMulti_model_(String multi_model_)
{ getToolParameters().put("multi_model_", multi_model_);
}
public String getChoose_multi_model_()
{return getToolParameters().get("choose_multi_model_");
}
public void setChoose_multi_model_(String choose_multi_model_)
{ getToolParameters().put("choose_multi_model_", choose_multi_model_);
}
public String getStartingtreeonly_()
{return getToolParameters().get("startingtreeonly_");
}
public void setStartingtreeonly_(String startingtreeonly_)
{ getToolParameters().put("startingtreeonly_", startingtreeonly_);
}
public String getSpecify_runs_()
{return getToolParameters().get("specify_runs_");
}
public void setSpecify_runs_(String specify_runs_)
{ getToolParameters().put("specify_runs_", specify_runs_);
}
public String getAltrun_number_()
{return getToolParameters().get("altrun_number_");
}
public void setAltrun_number_(String altrun_number_)
{ getToolParameters().put("altrun_number_", altrun_number_);
}
public String getBipartitions_()
{return getToolParameters().get("bipartitions_");
}
public void setBipartitions_(String bipartitions_)
{ getToolParameters().put("bipartitions_", bipartitions_);
}
public String getLog_likelihood_()
{return getToolParameters().get("log_likelihood_");
}
public void setLog_likelihood_(String log_likelihood_)
{ getToolParameters().put("log_likelihood_", log_likelihood_);
}
public String getCompute_mr_()
{return getToolParameters().get("compute_mr_");
}
public void setCompute_mr_(String compute_mr_)
{ getToolParameters().put("compute_mr_", compute_mr_);
}
public String getSpecify_mr_()
{return getToolParameters().get("specify_mr_");
}
public void setSpecify_mr_(String specify_mr_)
{ getToolParameters().put("specify_mr_", specify_mr_);
}
// file-typed property getters and setters
public Long getBunchotops_()
{
return getInputDataItemId("bunchotops_");
}
public void setBunchotops_(Long bunchotops_)
{
setInputDataItem("bunchotops_",bunchotops_);
}
public String getCompute_ml_distances_()
{return getToolParameters().get("compute_ml_distances_");
}
public void setCompute_ml_distances_(String compute_ml_distances_)
{ getToolParameters().put("compute_ml_distances_", compute_ml_distances_);
}
public String getMulparambootstrap_seed_()
{return getToolParameters().get("mulparambootstrap_seed_");
}
public void setMulparambootstrap_seed_(String mulparambootstrap_seed_)
{ getToolParameters().put("mulparambootstrap_seed_", mulparambootstrap_seed_);
}
public String getMulparambootstrap_seed_val_()
{return getToolParameters().get("mulparambootstrap_seed_val_");
}
public void setMulparambootstrap_seed_val_(String mulparambootstrap_seed_val_)
{ getToolParameters().put("mulparambootstrap_seed_val_", mulparambootstrap_seed_val_);
}
public String getBootstrap_seed_()
{return getToolParameters().get("bootstrap_seed_");
}
public void setBootstrap_seed_(String bootstrap_seed_)
{ getToolParameters().put("bootstrap_seed_", bootstrap_seed_);
}
public String getBootstrap_seed_val_()
{return getToolParameters().get("bootstrap_seed_val_");
}
public void setBootstrap_seed_val_(String bootstrap_seed_val_)
{ getToolParameters().put("bootstrap_seed_val_", bootstrap_seed_val_);
}
public String getMlsearch_()
{return getToolParameters().get("mlsearch_");
}
public void setMlsearch_(String mlsearch_)
{ getToolParameters().put("mlsearch_", mlsearch_);
}
public String getPrintbrlength_()
{return getToolParameters().get("printbrlength_");
}
public void setPrintbrlength_(String printbrlength_)
{ getToolParameters().put("printbrlength_", printbrlength_);
}
public String getSpecify_bootstraps_()
{return getToolParameters().get("specify_bootstraps_");
}
public void setSpecify_bootstraps_(String specify_bootstraps_)
{ getToolParameters().put("specify_bootstraps_", specify_bootstraps_);
}
public String getBootstop_()
{return getToolParameters().get("bootstop_");
}
public void setBootstop_(String bootstop_)
{ getToolParameters().put("bootstop_", bootstop_);
}
public String getUse_bootstopping_()
{return getToolParameters().get("use_bootstopping_");
}
public void setUse_bootstopping_(String use_bootstopping_)
{ getToolParameters().put("use_bootstopping_", use_bootstopping_);
}
public String getFreq_bootstopping_()
{return getToolParameters().get("freq_bootstopping_");
}
public void setFreq_bootstopping_(String freq_bootstopping_)
{ getToolParameters().put("freq_bootstopping_", freq_bootstopping_);
}
public String getMr_bootstopping_()
{return getToolParameters().get("mr_bootstopping_");
}
public void setMr_bootstopping_(String mr_bootstopping_)
{ getToolParameters().put("mr_bootstopping_", mr_bootstopping_);
}
public String getMrbootstopping_type_()
{return getToolParameters().get("mrbootstopping_type_");
}
public void setMrbootstopping_type_(String mrbootstopping_type_)
{ getToolParameters().put("mrbootstopping_type_", mrbootstopping_type_);
}
public String getUse_apobootstopping_()
{return getToolParameters().get("use_apobootstopping_");
}
public void setUse_apobootstopping_(String use_apobootstopping_)
{ getToolParameters().put("use_apobootstopping_", use_apobootstopping_);
}
public String getAposterior_bootstopping_()
{return getToolParameters().get("aposterior_bootstopping_");
}
public void setAposterior_bootstopping_(String aposterior_bootstopping_)
{ getToolParameters().put("aposterior_bootstopping_", aposterior_bootstopping_);
}
// file-typed property getters and setters
public Long getApo_tops_()
{
return getInputDataItemId("apo_tops_");
}
public void setApo_tops_(Long apo_tops_)
{
setInputDataItem("apo_tops_",apo_tops_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.25");
setNchars_("1000");
setDatatype_( "dna" );
setNumber_cats_("25");
setProvide_parsimony_seed_("true");
setParsimony_seed_val_("12345");
setRearrangement_yes_("false");
setNumber_rearrange_("10");
setEstimate_perpartbrlen_("false");
setDna_gtrcat_("true");
setDna_gtrgamma_("false");
setProt_sub_model_( "PROTCAT" );
setProt_matrix_spec_( "DAYHOFF" );
setRna_model_( "S16A" );
setBin_model_( "BINCAT" );
setMulti_model_( "MULTICAT" );
setChoose_multi_model_( "GTR" );
setStartingtreeonly_("false");
setBipartitions_("false");
setLog_likelihood_("false");
setCompute_mr_("false");
setCompute_ml_distances_("false");
setMulparambootstrap_seed_("false");
setMulparambootstrap_seed_val_("12345");
setBootstrap_seed_("true");
setBootstrap_seed_val_("12345");
setMlsearch_("false");
setPrintbrlength_("false");
setSpecify_bootstraps_("true");
setBootstop_("100");
setUse_bootstopping_("false");
setFreq_bootstopping_("false");
setMr_bootstopping_("true");
setMrbootstopping_type_( "autoMRE" );
setUse_apobootstopping_("false");
}
}
