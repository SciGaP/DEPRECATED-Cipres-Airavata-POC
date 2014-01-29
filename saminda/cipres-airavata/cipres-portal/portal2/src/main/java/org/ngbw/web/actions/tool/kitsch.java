package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class kitsch extends ToolParameters
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
public String getMethod_()
{return getToolParameters().get("method_");
}
public void setMethod_(String method_)
{ getToolParameters().put("method_", method_);
}
public String getNegative_branch_()
{return getToolParameters().get("negative_branch_");
}
public void setNegative_branch_(String negative_branch_)
{ getToolParameters().put("negative_branch_", negative_branch_);
}
public String getPower_()
{return getToolParameters().get("power_");
}
public void setPower_(String power_)
{ getToolParameters().put("power_", power_);
}
public String getJumble_()
{return getToolParameters().get("jumble_");
}
public void setJumble_(String jumble_)
{ getToolParameters().put("jumble_", jumble_);
}
public String getJumble_seed_()
{return getToolParameters().get("jumble_seed_");
}
public void setJumble_seed_(String jumble_seed_)
{ getToolParameters().put("jumble_seed_", jumble_seed_);
}
public String getTimes_()
{return getToolParameters().get("times_");
}
public void setTimes_(String times_)
{ getToolParameters().put("times_", times_);
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
public String getMultiple_seed_()
{return getToolParameters().get("multiple_seed_");
}
public void setMultiple_seed_(String multiple_seed_)
{ getToolParameters().put("multiple_seed_", multiple_seed_);
}
public String getUser_tree_()
{return getToolParameters().get("user_tree_");
}
public void setUser_tree_(String user_tree_)
{ getToolParameters().put("user_tree_", user_tree_);
}
// file-typed property getters and setters
public Long getTree_file_()
{
return getInputDataItemId("tree_file_");
}
public void setTree_file_(Long tree_file_)
{
setInputDataItem("tree_file_",tree_file_);
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
public String getTriangular_()
{return getToolParameters().get("triangular_");
}
public void setTriangular_(String triangular_)
{ getToolParameters().put("triangular_", triangular_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setMethod_( "F" );
setNegative_branch_("false");
setPower_("2");
setJumble_("false");
setTimes_("1");
setMultiple_dataset_("false");
setUser_tree_("false");
setPrint_tree_("true");
setPrint_treefile_("true");
setPrintdata_("false");
setIndent_tree_("true");
setTriangular_( "square" );
}
}
