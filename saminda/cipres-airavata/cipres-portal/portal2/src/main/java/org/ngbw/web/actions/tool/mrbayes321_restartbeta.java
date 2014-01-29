package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class mrbayes321_restartbeta extends ToolParameters
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
public String getRun_version_()
{return getToolParameters().get("run_version_");
}
public void setRun_version_(String run_version_)
{ getToolParameters().put("run_version_", run_version_);
}
public String getSet_autoclose_confirm_()
{return getToolParameters().get("set_autoclose_confirm_");
}
public void setSet_autoclose_confirm_(String set_autoclose_confirm_)
{ getToolParameters().put("set_autoclose_confirm_", set_autoclose_confirm_);
}
public String getNruns_specified_()
{return getToolParameters().get("nruns_specified_");
}
public void setNruns_specified_(String nruns_specified_)
{ getToolParameters().put("nruns_specified_", nruns_specified_);
}
public String getNchains_specified_()
{return getToolParameters().get("nchains_specified_");
}
public void setNchains_specified_(String nchains_specified_)
{ getToolParameters().put("nchains_specified_", nchains_specified_);
}
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getUpload_ckpfile_()
{
return getInputDataItemId("upload_ckpfile_");
}
public void setUpload_ckpfile_(Long upload_ckpfile_)
{
setInputDataItem("upload_ckpfile_",upload_ckpfile_);
}
// file-typed property getters and setters
public Long getUpload_mcmcfile_()
{
return getInputDataItemId("upload_mcmcfile_");
}
public void setUpload_mcmcfile_(Long upload_mcmcfile_)
{
setInputDataItem("upload_mcmcfile_",upload_mcmcfile_);
}
public String getNum_ptfiles_()
{return getToolParameters().get("num_ptfiles_");
}
public void setNum_ptfiles_(String num_ptfiles_)
{ getToolParameters().put("num_ptfiles_", num_ptfiles_);
}
// file-typed property getters and setters
public Long getUpload_sumpfile1_()
{
return getInputDataItemId("upload_sumpfile1_");
}
public void setUpload_sumpfile1_(Long upload_sumpfile1_)
{
setInputDataItem("upload_sumpfile1_",upload_sumpfile1_);
}
// file-typed property getters and setters
public Long getUpload_sumpfile2_()
{
return getInputDataItemId("upload_sumpfile2_");
}
public void setUpload_sumpfile2_(Long upload_sumpfile2_)
{
setInputDataItem("upload_sumpfile2_",upload_sumpfile2_);
}
// file-typed property getters and setters
public Long getUpload_sumpfile3_()
{
return getInputDataItemId("upload_sumpfile3_");
}
public void setUpload_sumpfile3_(Long upload_sumpfile3_)
{
setInputDataItem("upload_sumpfile3_",upload_sumpfile3_);
}
// file-typed property getters and setters
public Long getUpload_sumpfile4_()
{
return getInputDataItemId("upload_sumpfile4_");
}
public void setUpload_sumpfile4_(Long upload_sumpfile4_)
{
setInputDataItem("upload_sumpfile4_",upload_sumpfile4_);
}
// file-typed property getters and setters
public Long getUpload_sumtfile1_()
{
return getInputDataItemId("upload_sumtfile1_");
}
public void setUpload_sumtfile1_(Long upload_sumtfile1_)
{
setInputDataItem("upload_sumtfile1_",upload_sumtfile1_);
}
// file-typed property getters and setters
public Long getUpload_sumtfile2_()
{
return getInputDataItemId("upload_sumtfile2_");
}
public void setUpload_sumtfile2_(Long upload_sumtfile2_)
{
setInputDataItem("upload_sumtfile2_",upload_sumtfile2_);
}
// file-typed property getters and setters
public Long getUpload_sumtfile3_()
{
return getInputDataItemId("upload_sumtfile3_");
}
public void setUpload_sumtfile3_(Long upload_sumtfile3_)
{
setInputDataItem("upload_sumtfile3_",upload_sumtfile3_);
}
// file-typed property getters and setters
public Long getUpload_sumtfile4_()
{
return getInputDataItemId("upload_sumtfile4_");
}
public void setUpload_sumtfile4_(Long upload_sumtfile4_)
{
setInputDataItem("upload_sumtfile4_",upload_sumtfile4_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRun_version_( "2" );
setSet_autoclose_confirm_("false");
setNruns_specified_("2");
setNchains_specified_("4");
setRuntime_("0.5");
}
}
