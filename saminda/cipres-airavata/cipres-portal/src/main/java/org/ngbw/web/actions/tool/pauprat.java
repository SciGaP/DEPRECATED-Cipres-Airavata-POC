package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class pauprat extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getMatrix_file_()
{
return getInputDataItemId("matrix_file_");
}
public void setMatrix_file_(Long matrix_file_)
{
setInputDataItem("matrix_file_",matrix_file_);
}
public String getSpecify_nchar_()
{return getToolParameters().get("specify_nchar_");
}
public void setSpecify_nchar_(String specify_nchar_)
{ getToolParameters().put("specify_nchar_", specify_nchar_);
}
public String getSpecify_nreps_()
{return getToolParameters().get("specify_nreps_");
}
public void setSpecify_nreps_(String specify_nreps_)
{ getToolParameters().put("specify_nreps_", specify_nreps_);
}
public String getSpecify_seed_()
{return getToolParameters().get("specify_seed_");
}
public void setSpecify_seed_(String specify_seed_)
{ getToolParameters().put("specify_seed_", specify_seed_);
}
public String getSpecify_pct_()
{return getToolParameters().get("specify_pct_");
}
public void setSpecify_pct_(String specify_pct_)
{ getToolParameters().put("specify_pct_", specify_pct_);
}
public String getSpecify_mod_()
{return getToolParameters().get("specify_mod_");
}
public void setSpecify_mod_(String specify_mod_)
{ getToolParameters().put("specify_mod_", specify_mod_);
}
public String getSpecify_wtmode_()
{return getToolParameters().get("specify_wtmode_");
}
public void setSpecify_wtmode_(String specify_wtmode_)
{ getToolParameters().put("specify_wtmode_", specify_wtmode_);
}
public String getSpecify_verbose_()
{return getToolParameters().get("specify_verbose_");
}
public void setSpecify_verbose_(String specify_verbose_)
{ getToolParameters().put("specify_verbose_", specify_verbose_);
}
public String getSetup_increase_()
{return getToolParameters().get("setup_increase_");
}
public void setSetup_increase_(String setup_increase_)
{ getToolParameters().put("setup_increase_", setup_increase_);
}
public String getSetup_nrep_()
{return getToolParameters().get("setup_nrep_");
}
public void setSetup_nrep_(String setup_nrep_)
{ getToolParameters().put("setup_nrep_", setup_nrep_);
}
public String getSetup_hidden4_()
{return getToolParameters().get("setup_hidden4_");
}
public void setSetup_hidden4_(String setup_hidden4_)
{ getToolParameters().put("setup_hidden4_", setup_hidden4_);
}
public String getPaup_branchalg_()
{return getToolParameters().get("paup_branchalg_");
}
public void setPaup_branchalg_(String paup_branchalg_)
{ getToolParameters().put("paup_branchalg_", paup_branchalg_);
}
public String getSet_multrees_()
{return getToolParameters().get("set_multrees_");
}
public void setSet_multrees_(String set_multrees_)
{ getToolParameters().put("set_multrees_", set_multrees_);
}
public String getSet_rearrlimit_()
{return getToolParameters().get("set_rearrlimit_");
}
public void setSet_rearrlimit_(String set_rearrlimit_)
{ getToolParameters().put("set_rearrlimit_", set_rearrlimit_);
}
public String getSet_timelimit_()
{return getToolParameters().get("set_timelimit_");
}
public void setSet_timelimit_(String set_timelimit_)
{ getToolParameters().put("set_timelimit_", set_timelimit_);
}
public String getSet_reconlimit_()
{return getToolParameters().get("set_reconlimit_");
}
public void setSet_reconlimit_(String set_reconlimit_)
{ getToolParameters().put("set_reconlimit_", set_reconlimit_);
}
public String getSet_maxtrees_()
{return getToolParameters().get("set_maxtrees_");
}
public void setSet_maxtrees_(String set_maxtrees_)
{ getToolParameters().put("set_maxtrees_", set_maxtrees_);
}
public String getSet_autoincrease_()
{return getToolParameters().get("set_autoincrease_");
}
public void setSet_autoincrease_(String set_autoincrease_)
{ getToolParameters().put("set_autoincrease_", set_autoincrease_);
}
public String getSet_increaseval_()
{return getToolParameters().get("set_increaseval_");
}
public void setSet_increaseval_(String set_increaseval_)
{ getToolParameters().put("set_increaseval_", set_increaseval_);
}
public String getSet_outgroup_()
{return getToolParameters().get("set_outgroup_");
}
public void setSet_outgroup_(String set_outgroup_)
{ getToolParameters().put("set_outgroup_", set_outgroup_);
}
public String getSet_outgroupb_()
{return getToolParameters().get("set_outgroupb_");
}
public void setSet_outgroupb_(String set_outgroupb_)
{ getToolParameters().put("set_outgroupb_", set_outgroupb_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setSpecify_nreps_("200");
setSpecify_seed_("0");
setSpecify_pct_("20");
setSpecify_wtmode_( "uniform" );
setSpecify_verbose_( "terse" );
setSetup_increase_( "auto" );
setSetup_nrep_("1");
setSetup_hidden4_("true");
setPaup_branchalg_( "tbr" );
setSet_multrees_( "no" );
setSet_autoincrease_( "no" );
setSet_outgroup_("false");
}
}
