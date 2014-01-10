package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class protpars extends ToolParameters
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
public String getCode_()
{return getToolParameters().get("code_");
}
public void setCode_(String code_)
{ getToolParameters().put("code_", code_);
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
public String getSeqboot_()
{return getToolParameters().get("seqboot_");
}
public void setSeqboot_(String seqboot_)
{ getToolParameters().put("seqboot_", seqboot_);
}
public String getMethod_()
{return getToolParameters().get("method_");
}
public void setMethod_(String method_)
{ getToolParameters().put("method_", method_);
}
public String getSeqboot_seed_()
{return getToolParameters().get("seqboot_seed_");
}
public void setSeqboot_seed_(String seqboot_seed_)
{ getToolParameters().put("seqboot_seed_", seqboot_seed_);
}
public String getReplicates_()
{return getToolParameters().get("replicates_");
}
public void setReplicates_(String replicates_)
{ getToolParameters().put("replicates_", replicates_);
}
public String getConsense_()
{return getToolParameters().get("consense_");
}
public void setConsense_(String consense_)
{ getToolParameters().put("consense_", consense_);
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
public String getPrint_steps_()
{return getToolParameters().get("print_steps_");
}
public void setPrint_steps_(String print_steps_)
{ getToolParameters().put("print_steps_", print_steps_);
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
setUse_threshold_("false");
setCode_( "U" );
setJumble_("false");
setTimes_("1");
setSeqboot_("false");
setMethod_( "bootstrap" );
setReplicates_("100");
setConsense_("false");
setUser_tree_("false");
setPrint_tree_("true");
setPrint_sequences_("false");
setPrint_treefile_("true");
setPrintdata_("false");
setPrint_steps_("false");
setIndent_tree_("false");
setOutgroup_("1");
}
}
