package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class raxmlhpc2bb_abe extends ToolParameters
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
// file-typed property getters and setters
public Long getExclude_file_()
{
return getInputDataItemId("exclude_file_");
}
public void setExclude_file_(Long exclude_file_)
{
setInputDataItem("exclude_file_",exclude_file_);
}
public String getInvariable_()
{return getToolParameters().get("invariable_");
}
public void setInvariable_(String invariable_)
{ getToolParameters().put("invariable_", invariable_);
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
public String getMlsearch_()
{return getToolParameters().get("mlsearch_");
}
public void setMlsearch_(String mlsearch_)
{ getToolParameters().put("mlsearch_", mlsearch_);
}
public String getUse_bootstopping_()
{return getToolParameters().get("use_bootstopping_");
}
public void setUse_bootstopping_(String use_bootstopping_)
{ getToolParameters().put("use_bootstopping_", use_bootstopping_);
}
public String getPrintbrlength_()
{return getToolParameters().get("printbrlength_");
}
public void setPrintbrlength_(String printbrlength_)
{ getToolParameters().put("printbrlength_", printbrlength_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.25");
setDatatype_( "dna" );
setInvariable_( "" );
setProt_matrix_spec_( "JTT" );
setEmpirical_( "" );
setMlsearch_("true");
setUse_bootstopping_("true");
setPrintbrlength_("false");
}
}
