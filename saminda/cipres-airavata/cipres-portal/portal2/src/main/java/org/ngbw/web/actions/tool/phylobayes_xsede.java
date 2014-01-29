package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class phylobayes_xsede extends ToolParameters
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
public String getSet_seed_()
{return getToolParameters().get("set_seed_");
}
public void setSet_seed_(String set_seed_)
{ getToolParameters().put("set_seed_", set_seed_);
}
public String getCheckinterval_()
{return getToolParameters().get("checkinterval_");
}
public void setCheckinterval_(String checkinterval_)
{ getToolParameters().put("checkinterval_", checkinterval_);
}
public String getBurninval_()
{return getToolParameters().get("burninval_");
}
public void setBurninval_(String burninval_)
{ getToolParameters().put("burninval_", burninval_);
}
public String getAcceptdiffval_()
{return getToolParameters().get("acceptdiffval_");
}
public void setAcceptdiffval_(String acceptdiffval_)
{ getToolParameters().put("acceptdiffval_", acceptdiffval_);
}
public String getAcceptsizeval_()
{return getToolParameters().get("acceptsizeval_");
}
public void setAcceptsizeval_(String acceptsizeval_)
{ getToolParameters().put("acceptsizeval_", acceptsizeval_);
}
public String getGiveupval_()
{return getToolParameters().get("giveupval_");
}
public void setGiveupval_(String giveupval_)
{ getToolParameters().put("giveupval_", giveupval_);
}
public String getConstant_sitesr_()
{return getToolParameters().get("constant_sitesr_");
}
public void setConstant_sitesr_(String constant_sitesr_)
{ getToolParameters().put("constant_sitesr_", constant_sitesr_);
}
// file-typed property getters and setters
public Long getStarting_tree_()
{
return getInputDataItemId("starting_tree_");
}
public void setStarting_tree_(Long starting_tree_)
{
setInputDataItem("starting_tree_",starting_tree_);
}
// file-typed property getters and setters
public Long getConstraint_tree_()
{
return getInputDataItemId("constraint_tree_");
}
public void setConstraint_tree_(Long constraint_tree_)
{
setInputDataItem("constraint_tree_",constraint_tree_);
}
public String getSaving_freq_()
{return getToolParameters().get("saving_freq_");
}
public void setSaving_freq_(String saving_freq_)
{ getToolParameters().put("saving_freq_", saving_freq_);
}
public String getStop_at_()
{return getToolParameters().get("stop_at_");
}
public void setStop_at_(String stop_at_)
{ getToolParameters().put("stop_at_", stop_at_);
}
public String getSave_detmodelconf_()
{return getToolParameters().get("save_detmodelconf_");
}
public void setSave_detmodelconf_(String save_detmodelconf_)
{ getToolParameters().put("save_detmodelconf_", save_detmodelconf_);
}
public String getNum_gammacats_()
{return getToolParameters().get("num_gammacats_");
}
public void setNum_gammacats_(String num_gammacats_)
{ getToolParameters().put("num_gammacats_", num_gammacats_);
}
public String getExchange_rates_()
{return getToolParameters().get("exchange_rates_");
}
public void setExchange_rates_(String exchange_rates_)
{ getToolParameters().put("exchange_rates_", exchange_rates_);
}
public String getCustom_exch_()
{return getToolParameters().get("custom_exch_");
}
public void setCustom_exch_(String custom_exch_)
{ getToolParameters().put("custom_exch_", custom_exch_);
}
// file-typed property getters and setters
public Long getCustom_exch_file_()
{
return getInputDataItemId("custom_exch_file_");
}
public void setCustom_exch_file_(Long custom_exch_file_)
{
setInputDataItem("custom_exch_file_",custom_exch_file_);
}
public String getProfile_mixture_()
{return getToolParameters().get("profile_mixture_");
}
public void setProfile_mixture_(String profile_mixture_)
{ getToolParameters().put("profile_mixture_", profile_mixture_);
}
public String getPredefined_profiles_()
{return getToolParameters().get("predefined_profiles_");
}
public void setPredefined_profiles_(String predefined_profiles_)
{ getToolParameters().put("predefined_profiles_", predefined_profiles_);
}
// file-typed property getters and setters
public Long getCustom_profile_()
{
return getInputDataItemId("custom_profile_");
}
public void setCustom_profile_(Long custom_profile_)
{
setInputDataItem("custom_profile_",custom_profile_);
}
public String getMutsel_model_()
{return getToolParameters().get("mutsel_model_");
}
public void setMutsel_model_(String mutsel_model_)
{ getToolParameters().put("mutsel_model_", mutsel_model_);
}
public String getMtvert_codons_()
{return getToolParameters().get("mtvert_codons_");
}
public void setMtvert_codons_(String mtvert_codons_)
{ getToolParameters().put("mtvert_codons_", mtvert_codons_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.5");
setCheckinterval_("1800");
setBurninval_("500");
setAcceptdiffval_("0.1");
setAcceptsizeval_("50");
setGiveupval_("10000");
setConstant_sitesr_("true");
setSaving_freq_("1");
setStop_at_("-1");
setExchange_rates_( "-poisson" );
setProfile_mixture_( "-dp" );
setMutsel_model_("false");
setMtvert_codons_("false");
}
}
