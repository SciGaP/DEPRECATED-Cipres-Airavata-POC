package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class phylobayes_xsede_restart extends ToolParameters
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
public Long getChainfile1_()
{
return getInputDataItemId("chainfile1_");
}
public void setChainfile1_(Long chainfile1_)
{
setInputDataItem("chainfile1_",chainfile1_);
}
// file-typed property getters and setters
public Long getChainfile2_()
{
return getInputDataItemId("chainfile2_");
}
public void setChainfile2_(Long chainfile2_)
{
setInputDataItem("chainfile2_",chainfile2_);
}
// file-typed property getters and setters
public Long getChainparamfile1_()
{
return getInputDataItemId("chainparamfile1_");
}
public void setChainparamfile1_(Long chainparamfile1_)
{
setInputDataItem("chainparamfile1_",chainparamfile1_);
}
// file-typed property getters and setters
public Long getChainparamfile2_()
{
return getInputDataItemId("chainparamfile2_");
}
public void setChainparamfile2_(Long chainparamfile2_)
{
setInputDataItem("chainparamfile2_",chainparamfile2_);
}
// file-typed property getters and setters
public Long getChaintreefile1_()
{
return getInputDataItemId("chaintreefile1_");
}
public void setChaintreefile1_(Long chaintreefile1_)
{
setInputDataItem("chaintreefile1_",chaintreefile1_);
}
// file-typed property getters and setters
public Long getChaintreefile2_()
{
return getInputDataItemId("chaintreefile2_");
}
public void setChaintreefile2_(Long chaintreefile2_)
{
setInputDataItem("chaintreefile2_",chaintreefile2_);
}
// file-typed property getters and setters
public Long getChaintracefile1_()
{
return getInputDataItemId("chaintracefile1_");
}
public void setChaintracefile1_(Long chaintracefile1_)
{
setInputDataItem("chaintracefile1_",chaintracefile1_);
}
// file-typed property getters and setters
public Long getChaintracefile2_()
{
return getInputDataItemId("chaintracefile2_");
}
public void setChaintracefile2_(Long chaintracefile2_)
{
setInputDataItem("chaintracefile2_",chaintracefile2_);
}
// file-typed property getters and setters
public Long getChainmonfile1_()
{
return getInputDataItemId("chainmonfile1_");
}
public void setChainmonfile1_(Long chainmonfile1_)
{
setInputDataItem("chainmonfile1_",chainmonfile1_);
}
// file-typed property getters and setters
public Long getChainmonfile2_()
{
return getInputDataItemId("chainmonfile2_");
}
public void setChainmonfile2_(Long chainmonfile2_)
{
setInputDataItem("chainmonfile2_",chainmonfile2_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("0.5");
}
}
