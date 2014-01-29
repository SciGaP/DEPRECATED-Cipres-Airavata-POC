package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class raxml_light2 extends ToolParameters
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
// file-typed property getters and setters
public Long getPartition_()
{
return getInputDataItemId("partition_");
}
public void setPartition_(Long partition_)
{
setInputDataItem("partition_",partition_);
}
public String getEstimate_branch_()
{return getToolParameters().get("estimate_branch_");
}
public void setEstimate_branch_(String estimate_branch_)
{ getToolParameters().put("estimate_branch_", estimate_branch_);
}
public String getOutgroup_()
{return getToolParameters().get("outgroup_");
}
public void setOutgroup_(String outgroup_)
{ getToolParameters().put("outgroup_", outgroup_);
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
public String getEmpirical_()
{return getToolParameters().get("empirical_");
}
public void setEmpirical_(String empirical_)
{ getToolParameters().put("empirical_", empirical_);
}
public String getNumber_cats_()
{return getToolParameters().get("number_cats_");
}
public void setNumber_cats_(String number_cats_)
{ getToolParameters().put("number_cats_", number_cats_);
}
public String getPars_hours_()
{return getToolParameters().get("pars_hours_");
}
public void setPars_hours_(String pars_hours_)
{ getToolParameters().put("pars_hours_", pars_hours_);
}
public String getRsearch_seed_()
{return getToolParameters().get("rsearch_seed_");
}
public void setRsearch_seed_(String rsearch_seed_)
{ getToolParameters().put("rsearch_seed_", rsearch_seed_);
}
public String getNum_rsearches_()
{return getToolParameters().get("num_rsearches_");
}
public void setNum_rsearches_(String num_rsearches_)
{ getToolParameters().put("num_rsearches_", num_rsearches_);
}
public String getSearch_hours_()
{return getToolParameters().get("search_hours_");
}
public void setSearch_hours_(String search_hours_)
{ getToolParameters().put("search_hours_", search_hours_);
}
public String getUse_mlsearchcc_()
{return getToolParameters().get("use_mlsearchcc_");
}
public void setUse_mlsearchcc_(String use_mlsearchcc_)
{ getToolParameters().put("use_mlsearchcc_", use_mlsearchcc_);
}
public String getNum_bsearches_()
{return getToolParameters().get("num_bsearches_");
}
public void setNum_bsearches_(String num_bsearches_)
{ getToolParameters().put("num_bsearches_", num_bsearches_);
}
public String getBootstrap_seed_()
{return getToolParameters().get("bootstrap_seed_");
}
public void setBootstrap_seed_(String bootstrap_seed_)
{ getToolParameters().put("bootstrap_seed_", bootstrap_seed_);
}
public String getAposterior_bootstopping_()
{return getToolParameters().get("aposterior_bootstopping_");
}
public void setAposterior_bootstopping_(String aposterior_bootstopping_)
{ getToolParameters().put("aposterior_bootstopping_", aposterior_bootstopping_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setDatatype_( "dna" );
setDna_model_( "GTRCAT" );
setProt_sub_model_( "PROTCAT" );
setProt_matrix_spec_( "DAYHOFF" );
setEmpirical_( "" );
setNumber_cats_("25");
setPars_hours_("1");
setRsearch_seed_("12345");
setNum_rsearches_( "20" );
setSearch_hours_("1");
setUse_mlsearchcc_("false");
setNum_bsearches_( "100" );
setBootstrap_seed_( "12345" );
setAposterior_bootstopping_( "autoMRE" );
}
}
