package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class dnapars extends ToolParameters
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
public String getInterleavedinfile_()
{return getToolParameters().get("interleavedinfile_");
}
public void setInterleavedinfile_(String interleavedinfile_)
{ getToolParameters().put("interleavedinfile_", interleavedinfile_);
}
public String getNumtrees_()
{return getToolParameters().get("numtrees_");
}
public void setNumtrees_(String numtrees_)
{ getToolParameters().put("numtrees_", numtrees_);
}
public String getSearch_opt_()
{return getToolParameters().get("search_opt_");
}
public void setSearch_opt_(String search_opt_)
{ getToolParameters().put("search_opt_", search_opt_);
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
public String getUse_transversion_()
{return getToolParameters().get("use_transversion_");
}
public void setUse_transversion_(String use_transversion_)
{ getToolParameters().put("use_transversion_", use_transversion_);
}
public String getMultiple_dataset_()
{return getToolParameters().get("multiple_dataset_");
}
public void setMultiple_dataset_(String multiple_dataset_)
{ getToolParameters().put("multiple_dataset_", multiple_dataset_);
}
public String getWeightsordata_()
{return getToolParameters().get("weightsordata_");
}
public void setWeightsordata_(String weightsordata_)
{ getToolParameters().put("weightsordata_", weightsordata_);
}
public String getDatasets_nb_()
{return getToolParameters().get("datasets_nb_");
}
public void setDatasets_nb_(String datasets_nb_)
{ getToolParameters().put("datasets_nb_", datasets_nb_);
}
public String getMulti_seed_()
{return getToolParameters().get("multi_seed_");
}
public void setMulti_seed_(String multi_seed_)
{ getToolParameters().put("multi_seed_", multi_seed_);
}
public String getMulti_times_()
{return getToolParameters().get("multi_times_");
}
public void setMulti_times_(String multi_times_)
{ getToolParameters().put("multi_times_", multi_times_);
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
public String getWeights_()
{return getToolParameters().get("weights_");
}
public void setWeights_(String weights_)
{ getToolParameters().put("weights_", weights_);
}
// file-typed property getters and setters
public Long getWeights_file_()
{
return getInputDataItemId("weights_file_");
}
public void setWeights_file_(Long weights_file_)
{
setInputDataItem("weights_file_",weights_file_);
}
public String getPrint_tree_()
{return getToolParameters().get("print_tree_");
}
public void setPrint_tree_(String print_tree_)
{ getToolParameters().put("print_tree_", print_tree_);
}
public String getPrint_steps_()
{return getToolParameters().get("print_steps_");
}
public void setPrint_steps_(String print_steps_)
{ getToolParameters().put("print_steps_", print_steps_);
}
public String getPrint_sequences_()
{return getToolParameters().get("print_sequences_");
}
public void setPrint_sequences_(String print_sequences_)
{ getToolParameters().put("print_sequences_", print_sequences_);
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
setInterleavedinfile_( "yes" );
setNumtrees_("1000");
setSearch_opt_( "0" );
setUse_threshold_("false");
setUse_transversion_("false");
setMultiple_dataset_("false");
setWeightsordata_( "data" );
setMulti_times_("1");
setJumble_("false");
setTimes_("1");
setUser_tree_("false");
setPrint_tree_("true");
setPrint_steps_("false");
setPrint_sequences_("false");
setPrint_treefile_("true");
setPrintdata_("false");
setIndent_tree_("false");
setOutgroup_("1");
}
}
