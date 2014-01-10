package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class phyml extends ToolParameters
{
// file-typed property getters and setters
public Long getAlignment_()
{
return getInputDataItemId("alignment_");
}
public void setAlignment_(Long alignment_)
{
setInputDataItem("alignment_",alignment_);
}
public String getData_type_()
{return getToolParameters().get("data_type_");
}
public void setData_type_(String data_type_)
{ getToolParameters().put("data_type_", data_type_);
}
public String getFormat_()
{return getToolParameters().get("format_");
}
public void setFormat_(String format_)
{ getToolParameters().put("format_", format_);
}
public String getDatasets_()
{return getToolParameters().get("datasets_");
}
public void setDatasets_(String datasets_)
{ getToolParameters().put("datasets_", datasets_);
}
public String getBootstrap_sets_()
{return getToolParameters().get("bootstrap_sets_");
}
public void setBootstrap_sets_(String bootstrap_sets_)
{ getToolParameters().put("bootstrap_sets_", bootstrap_sets_);
}
public String getModel_()
{return getToolParameters().get("model_");
}
public void setModel_(String model_)
{ getToolParameters().put("model_", model_);
}
public String getKappa_()
{return getToolParameters().get("kappa_");
}
public void setKappa_(String kappa_)
{ getToolParameters().put("kappa_", kappa_);
}
public String getKappa_e_()
{return getToolParameters().get("kappa_e_");
}
public void setKappa_e_(String kappa_e_)
{ getToolParameters().put("kappa_e_", kappa_e_);
}
public String getInvar_()
{return getToolParameters().get("invar_");
}
public void setInvar_(String invar_)
{ getToolParameters().put("invar_", invar_);
}
public String getInvar_e_()
{return getToolParameters().get("invar_e_");
}
public void setInvar_e_(String invar_e_)
{ getToolParameters().put("invar_e_", invar_e_);
}
public String getNb_categ_()
{return getToolParameters().get("nb_categ_");
}
public void setNb_categ_(String nb_categ_)
{ getToolParameters().put("nb_categ_", nb_categ_);
}
public String getAlpha_()
{return getToolParameters().get("alpha_");
}
public void setAlpha_(String alpha_)
{ getToolParameters().put("alpha_", alpha_);
}
public String getAlpha_e_()
{return getToolParameters().get("alpha_e_");
}
public void setAlpha_e_(String alpha_e_)
{ getToolParameters().put("alpha_e_", alpha_e_);
}
public String getOpt_topology_()
{return getToolParameters().get("opt_topology_");
}
public void setOpt_topology_(String opt_topology_)
{ getToolParameters().put("opt_topology_", opt_topology_);
}
public String getOpt_lengths_()
{return getToolParameters().get("opt_lengths_");
}
public void setOpt_lengths_(String opt_lengths_)
{ getToolParameters().put("opt_lengths_", opt_lengths_);
}
public String getUser_tree_()
{return getToolParameters().get("user_tree_");
}
public void setUser_tree_(String user_tree_)
{ getToolParameters().put("user_tree_", user_tree_);
}
// file-typed property getters and setters
public Long getUser_tree_file_()
{
return getInputDataItemId("user_tree_file_");
}
public void setUser_tree_file_(Long user_tree_file_)
{
setInputDataItem("user_tree_file_",user_tree_file_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setData_type_( "0" );
setFormat_( "i" );
setDatasets_("1");
setBootstrap_sets_("2");
setModel_( "HKY" );
setKappa_("4");
setKappa_e_("true");
setInvar_("0.0");
setInvar_e_("true");
setNb_categ_("1");
setAlpha_("1.0");
setAlpha_e_("true");
setOpt_topology_("true");
setOpt_lengths_("true");
setUser_tree_("false");
}
}
