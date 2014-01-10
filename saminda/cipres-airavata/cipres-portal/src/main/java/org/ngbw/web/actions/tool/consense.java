package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class consense extends ToolParameters
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
public String getType_()
{return getToolParameters().get("type_");
}
public void setType_(String type_)
{ getToolParameters().put("type_", type_);
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
public String getRooted_()
{return getToolParameters().get("rooted_");
}
public void setRooted_(String rooted_)
{ getToolParameters().put("rooted_", rooted_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setType_( "MRE" );
setPrint_tree_("true");
setPrint_treefile_("true");
setPrintdata_("false");
setIndent_tree_("false");
setOutgroup_("1");
setRooted_("false");
}
}
