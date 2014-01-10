package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class raxmlhpc extends ToolParameters
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
public String getDatatype_()
{return getToolParameters().get("datatype_");
}
public void setDatatype_(String datatype_)
{ getToolParameters().put("datatype_", datatype_);
}
public String getDna_model_()
{return getToolParameters().get("dna_model_");
}
public void setDna_model_(String dna_model_)
{ getToolParameters().put("dna_model_", dna_model_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
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
public String getInvariable_()
{return getToolParameters().get("invariable_");
}
public void setInvariable_(String invariable_)
{ getToolParameters().put("invariable_", invariable_);
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
public String getStartingtreeonly_()
{return getToolParameters().get("startingtreeonly_");
}
public void setStartingtreeonly_(String startingtreeonly_)
{ getToolParameters().put("startingtreeonly_", startingtreeonly_);
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
// file-typed property getters and setters
public Long getBunchotops_()
{
return getInputDataItemId("bunchotops_");
}
public void setBunchotops_(Long bunchotops_)
{
setInputDataItem("bunchotops_",bunchotops_);
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
// this method pre-populates the form with default values
public void reset() {
super.reset();
setDatatype_( "dna" );
setDna_model_( "GTRGAMMA" );
setMatrix_( "DAYHOFF" );
setNumber_cats_("25");
setRearrangement_yes_("false");
setNumber_rearrange_("10");
setInvariable_( "0" );
setStartingtreeonly_("false");
setBipartitions_("false");
setLog_likelihood_("false");
setMulparambootstrap_seed_("false");
setMulparambootstrap_seed_val_("12345");
setBootstrap_seed_("false");
setBootstrap_seed_val_("12345");
setMlsearch_("false");
setProvide_parsimony_seed_("false");
setParsimony_seed_val_("12345");
setSpecify_bootstraps_("false");
setBootstop_("100");
}
}
