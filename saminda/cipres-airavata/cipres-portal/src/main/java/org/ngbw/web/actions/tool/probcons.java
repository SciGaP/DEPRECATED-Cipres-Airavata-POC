package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class probcons extends ToolParameters
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
public String getOutputFormat_()
{return getToolParameters().get("outputFormat_");
}
public void setOutputFormat_(String outputFormat_)
{ getToolParameters().put("outputFormat_", outputFormat_);
}
public String getNumConsistencyReps_()
{return getToolParameters().get("numConsistencyReps_");
}
public void setNumConsistencyReps_(String numConsistencyReps_)
{ getToolParameters().put("numConsistencyReps_", numConsistencyReps_);
}
public String getNumRefinementReps_()
{return getToolParameters().get("numRefinementReps_");
}
public void setNumRefinementReps_(String numRefinementReps_)
{ getToolParameters().put("numRefinementReps_", numRefinementReps_);
}
public String getNumPretrainingReps_()
{return getToolParameters().get("numPretrainingReps_");
}
public void setNumPretrainingReps_(String numPretrainingReps_)
{ getToolParameters().put("numPretrainingReps_", numPretrainingReps_);
}
public String getPairwise_()
{return getToolParameters().get("pairwise_");
}
public void setPairwise_(String pairwise_)
{ getToolParameters().put("pairwise_", pairwise_);
}
public String getViterbi_()
{return getToolParameters().get("viterbi_");
}
public void setViterbi_(String viterbi_)
{ getToolParameters().put("viterbi_", viterbi_);
}
public String getWriteAnnotation_()
{return getToolParameters().get("writeAnnotation_");
}
public void setWriteAnnotation_(String writeAnnotation_)
{ getToolParameters().put("writeAnnotation_", writeAnnotation_);
}
public String getWriteTraining_()
{return getToolParameters().get("writeTraining_");
}
public void setWriteTraining_(String writeTraining_)
{ getToolParameters().put("writeTraining_", writeTraining_);
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
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setSequenceType_( "nucleicAcid" );
setOutputFormat_( "MFA" );
setNumConsistencyReps_( "2" );
setNumRefinementReps_("100");
setNumPretrainingReps_("0");
setPairwise_("false");
setViterbi_("false");
setWriteAnnotation_("false");
setWriteTraining_("false");
}
}
