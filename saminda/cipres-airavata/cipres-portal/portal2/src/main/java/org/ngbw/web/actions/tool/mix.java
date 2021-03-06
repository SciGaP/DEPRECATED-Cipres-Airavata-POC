package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class mix extends ToolParameters
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
public String getUse_mixed_()
{return getToolParameters().get("use_mixed_");
}
public void setUse_mixed_(String use_mixed_)
{ getToolParameters().put("use_mixed_", use_mixed_);
}
// file-typed property getters and setters
public Long getMixture_file_()
{
return getInputDataItemId("mixture_file_");
}
public void setMixture_file_(Long mixture_file_)
{
setInputDataItem("mixture_file_",mixture_file_);
}
public String getParsimony_method_()
{return getToolParameters().get("parsimony_method_");
}
public void setParsimony_method_(String parsimony_method_)
{ getToolParameters().put("parsimony_method_", parsimony_method_);
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
public String getPrint_tree_()
{return getToolParameters().get("print_tree_");
}
public void setPrint_tree_(String print_tree_)
{ getToolParameters().put("print_tree_", print_tree_);
}
public String getPrint_step_()
{return getToolParameters().get("print_step_");
}
public void setPrint_step_(String print_step_)
{ getToolParameters().put("print_step_", print_step_);
}
public String getPrint_states_()
{return getToolParameters().get("print_states_");
}
public void setPrint_states_(String print_states_)
{ getToolParameters().put("print_states_", print_states_);
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
public String getUse_threshold_()
{return getToolParameters().get("use_threshold_");
}
public void setUse_threshold_(String use_threshold_)
{ getToolParameters().put("use_threshold_", use_threshold_);
}
public String getThreshold_()
{return getToolParameters().get("threshold_");
}
public void setThreshold_(String threshold_)
{ getToolParameters().put("threshold_", threshold_);
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
setUse_mixed_("false");
setParsimony_method_( "neighbor" );
setJumble_("false");
setTimes_("1");
setUser_tree_("false");
setMultiple_dataset_("false");
setConsense_("false");
setPrint_tree_("true");
setPrint_step_("false");
setPrint_states_("false");
setPrint_treefile_("true");
setPrintdata_("false");
setIndent_tree_("false");
setUse_threshold_("false");
setOutgroup_("1");
}
}
