package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class contralign extends ToolParameters
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
public String getSequenceType_()
{return getToolParameters().get("sequenceType_");
}
public void setSequenceType_(String sequenceType_)
{ getToolParameters().put("sequenceType_", sequenceType_);
}
public String getOutputMFA_()
{return getToolParameters().get("outputMFA_");
}
public void setOutputMFA_(String outputMFA_)
{ getToolParameters().put("outputMFA_", outputMFA_);
}
public String getOutputClustal_()
{return getToolParameters().get("outputClustal_");
}
public void setOutputClustal_(String outputClustal_)
{ getToolParameters().put("outputClustal_", outputClustal_);
}
public String getGamma_()
{return getToolParameters().get("gamma_");
}
public void setGamma_(String gamma_)
{ getToolParameters().put("gamma_", gamma_);
}
public String getAnnealing_()
{return getToolParameters().get("annealing_");
}
public void setAnnealing_(String annealing_)
{ getToolParameters().put("annealing_", annealing_);
}
public String getPc_iters_()
{return getToolParameters().get("pc_iters_");
}
public void setPc_iters_(String pc_iters_)
{ getToolParameters().put("pc_iters_", pc_iters_);
}
public String getSc_iters_()
{return getToolParameters().get("sc_iters_");
}
public void setSc_iters_(String sc_iters_)
{ getToolParameters().put("sc_iters_", sc_iters_);
}
// file-typed property getters and setters
public Long getParamsFile_()
{
return getInputDataItemId("paramsFile_");
}
public void setParamsFile_(Long paramsFile_)
{
setInputDataItem("paramsFile_",paramsFile_);
}
public String getPartition_()
{return getToolParameters().get("partition_");
}
public void setPartition_(String partition_)
{ getToolParameters().put("partition_", partition_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setSequenceType_( "nucleicAcid" );
setOutputMFA_("true");
setOutputClustal_("false");
setAnnealing_("false");
setPc_iters_("2");
setSc_iters_("0");
setPartition_("false");
}
}
