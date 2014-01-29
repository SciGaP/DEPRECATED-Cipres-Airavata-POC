package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class dppdiv extends ToolParameters
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
// file-typed property getters and setters
public Long getUpload_treefile_()
{
return getInputDataItemId("upload_treefile_");
}
public void setUpload_treefile_(Long upload_treefile_)
{
setInputDataItem("upload_treefile_",upload_treefile_);
}
public String getMcmc_cycles_()
{return getToolParameters().get("mcmc_cycles_");
}
public void setMcmc_cycles_(String mcmc_cycles_)
{ getToolParameters().put("mcmc_cycles_", mcmc_cycles_);
}
public String getPrint_freq_()
{return getToolParameters().get("print_freq_");
}
public void setPrint_freq_(String print_freq_)
{ getToolParameters().put("print_freq_", print_freq_);
}
public String getSample_frequency_()
{return getToolParameters().get("sample_frequency_");
}
public void setSample_frequency_(String sample_frequency_)
{ getToolParameters().put("sample_frequency_", sample_frequency_);
}
public String getOutfile_prefix_()
{return getToolParameters().get("outfile_prefix_");
}
public void setOutfile_prefix_(String outfile_prefix_)
{ getToolParameters().put("outfile_prefix_", outfile_prefix_);
}
public String getPrior_mean_()
{return getToolParameters().get("prior_mean_");
}
public void setPrior_mean_(String prior_mean_)
{ getToolParameters().put("prior_mean_", prior_mean_);
}
public String getGamma_shape_()
{return getToolParameters().get("gamma_shape_");
}
public void setGamma_shape_(String gamma_shape_)
{ getToolParameters().put("gamma_shape_", gamma_shape_);
}
public String getGamma_omrates_()
{return getToolParameters().get("gamma_omrates_");
}
public void setGamma_omrates_(String gamma_omrates_)
{ getToolParameters().put("gamma_omrates_", gamma_omrates_);
}
public String getGamma_hyperpriorshape_()
{return getToolParameters().get("gamma_hyperpriorshape_");
}
public void setGamma_hyperpriorshape_(String gamma_hyperpriorshape_)
{ getToolParameters().put("gamma_hyperpriorshape_", gamma_hyperpriorshape_);
}
public String getGamma_hyperpriorscale_()
{return getToolParameters().get("gamma_hyperpriorscale_");
}
public void setGamma_hyperpriorscale_(String gamma_hyperpriorscale_)
{ getToolParameters().put("gamma_hyperpriorscale_", gamma_hyperpriorscale_);
}
public String getSeed1_()
{return getToolParameters().get("seed1_");
}
public void setSeed1_(String seed1_)
{ getToolParameters().put("seed1_", seed1_);
}
public String getSeed2_()
{return getToolParameters().get("seed2_");
}
public void setSeed2_(String seed2_)
{ getToolParameters().put("seed2_", seed2_);
}
public String getInput_branchlengths_()
{return getToolParameters().get("input_branchlengths_");
}
public void setInput_branchlengths_(String input_branchlengths_)
{ getToolParameters().put("input_branchlengths_", input_branchlengths_);
}
public String getSingle_nodemove_()
{return getToolParameters().get("single_nodemove_");
}
public void setSingle_nodemove_(String single_nodemove_)
{ getToolParameters().put("single_nodemove_", single_nodemove_);
}
public String getRo_nodemove_()
{return getToolParameters().get("ro_nodemove_");
}
public void setRo_nodemove_(String ro_nodemove_)
{ getToolParameters().put("ro_nodemove_", ro_nodemove_);
}
public String getTurnoff_move_()
{return getToolParameters().get("turnoff_move_");
}
public void setTurnoff_move_(String turnoff_move_)
{ getToolParameters().put("turnoff_move_", turnoff_move_);
}
public String getPrint_moves_()
{return getToolParameters().get("print_moves_");
}
public void setPrint_moves_(String print_moves_)
{ getToolParameters().put("print_moves_", print_moves_);
}
public String getNpr_value_()
{return getToolParameters().get("npr_value_");
}
public void setNpr_value_(String npr_value_)
{ getToolParameters().put("npr_value_", npr_value_);
}
public String getStarting_val_diverserate_()
{return getToolParameters().get("starting_val_diverserate_");
}
public void setStarting_val_diverserate_(String starting_val_diverserate_)
{ getToolParameters().put("starting_val_diverserate_", starting_val_diverserate_);
}
public String getRelative_ext_()
{return getToolParameters().get("relative_ext_");
}
public void setRelative_ext_(String relative_ext_)
{ getToolParameters().put("relative_ext_", relative_ext_);
}
public String getStrict_clock_()
{return getToolParameters().get("strict_clock_");
}
public void setStrict_clock_(String strict_clock_)
{ getToolParameters().put("strict_clock_", strict_clock_);
}
public String getRun_uncorrelated_()
{return getToolParameters().get("run_uncorrelated_");
}
public void setRun_uncorrelated_(String run_uncorrelated_)
{ getToolParameters().put("run_uncorrelated_", run_uncorrelated_);
}
// file-typed property getters and setters
public Long getUpload_calfile_()
{
return getInputDataItemId("upload_calfile_");
}
public void setUpload_calfile_(Long upload_calfile_)
{
setInputDataItem("upload_calfile_",upload_calfile_);
}
public String getSoft_bounds_()
{return getToolParameters().get("soft_bounds_");
}
public void setSoft_bounds_(String soft_bounds_)
{ getToolParameters().put("soft_bounds_", soft_bounds_);
}
public String getOffset_exponential_()
{return getToolParameters().get("offset_exponential_");
}
public void setOffset_exponential_(String offset_exponential_)
{ getToolParameters().put("offset_exponential_", offset_exponential_);
}
public String getDpm_hyperprior_()
{return getToolParameters().get("dpm_hyperprior_");
}
public void setDpm_hyperprior_(String dpm_hyperprior_)
{ getToolParameters().put("dpm_hyperprior_", dpm_hyperprior_);
}
public String getHyperprior_oncal_()
{return getToolParameters().get("hyperprior_oncal_");
}
public void setHyperprior_oncal_(String hyperprior_oncal_)
{ getToolParameters().put("hyperprior_oncal_", hyperprior_oncal_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.25");
setMcmc_cycles_("1000000");
setPrint_freq_("100");
setSample_frequency_("100");
setPrior_mean_("3.0");
setGamma_shape_("2.0");
setGamma_omrates_("4.0");
setGamma_hyperpriorshape_("2.0");
setSeed1_("12345");
setSeed2_("12345");
setInput_branchlengths_("false");
setSingle_nodemove_("false");
setRo_nodemove_("false");
setPrint_moves_("false");
setNpr_value_( "3" );
setStrict_clock_("false");
setRun_uncorrelated_("false");
setSoft_bounds_("false");
setOffset_exponential_("false");
setDpm_hyperprior_("false");
setHyperprior_oncal_("false");
}
}
