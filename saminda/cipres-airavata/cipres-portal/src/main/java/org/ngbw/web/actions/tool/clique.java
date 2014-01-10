package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class clique extends ToolParameters
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
public String getUse_ancestral_state_()
{return getToolParameters().get("use_ancestral_state_");
}
public void setUse_ancestral_state_(String use_ancestral_state_)
{ getToolParameters().put("use_ancestral_state_", use_ancestral_state_);
}
// file-typed property getters and setters
public Long getAncestral_state_file_()
{
return getInputDataItemId("ancestral_state_file_");
}
public void setAncestral_state_file_(Long ancestral_state_file_)
{
setInputDataItem("ancestral_state_file_",ancestral_state_file_);
}
public String getSpec_min_clique_size_()
{return getToolParameters().get("spec_min_clique_size_");
}
public void setSpec_min_clique_size_(String spec_min_clique_size_)
{ getToolParameters().put("spec_min_clique_size_", spec_min_clique_size_);
}
public String getMin_clique_size_()
{return getToolParameters().get("min_clique_size_");
}
public void setMin_clique_size_(String min_clique_size_)
{ getToolParameters().put("min_clique_size_", min_clique_size_);
}
public String getMultiple_dataset_()
{return getToolParameters().get("multiple_dataset_");
}
public void setMultiple_dataset_(String multiple_dataset_)
{ getToolParameters().put("multiple_dataset_", multiple_dataset_);
}
public String getDatasets_nb_()
{return getToolParameters().get("datasets_nb_");
}
public void setDatasets_nb_(String datasets_nb_)
{ getToolParameters().put("datasets_nb_", datasets_nb_);
}
public String getConsense_()
{return getToolParameters().get("consense_");
}
public void setConsense_(String consense_)
{ getToolParameters().put("consense_", consense_);
}
public String getPrint_matrix_()
{return getToolParameters().get("print_matrix_");
}
public void setPrint_matrix_(String print_matrix_)
{ getToolParameters().put("print_matrix_", print_matrix_);
}
public String getPrint_tree_()
{return getToolParameters().get("print_tree_");
}
public void setPrint_tree_(String print_tree_)
{ getToolParameters().put("print_tree_", print_tree_);
}
public String getPrint_treefile_()
{return getToolParameters().get("print_treefile_");
}
public void setPrint_treefile_(String print_treefile_)
{ getToolParameters().put("print_treefile_", print_treefile_);
}
public String getPrintdata_()
{return getToolParameters().get("printdata_");
}
public void setPrintdata_(String printdata_)
{ getToolParameters().put("printdata_", printdata_);
}
public String getIndent_tree_()
{return getToolParameters().get("indent_tree_");
}
public void setIndent_tree_(String indent_tree_)
{ getToolParameters().put("indent_tree_", indent_tree_);
}
public String getOutgroup_()
{return getToolParameters().get("outgroup_");
}
public void setOutgroup_(String outgroup_)
{ getToolParameters().put("outgroup_", outgroup_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setSpec_min_clique_size_("false");
setMultiple_dataset_("false");
setConsense_("false");
setPrint_matrix_("true");
setPrint_tree_("true");
setPrint_treefile_("true");
setPrintdata_("false");
setIndent_tree_("false");
setOutgroup_("1");
}
}
