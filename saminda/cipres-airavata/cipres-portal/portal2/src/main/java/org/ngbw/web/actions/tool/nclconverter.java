package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class nclconverter extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getSequence_()
{
return getInputDataItemId("sequence_");
}
public void setSequence_(Long sequence_)
{
setInputDataItem("sequence_",sequence_);
}
public String getFormat_type_()
{return getToolParameters().get("format_type_");
}
public void setFormat_type_(String format_type_)
{ getToolParameters().put("format_type_", format_type_);
}
public String getData_type_()
{return getToolParameters().get("data_type_");
}
public void setData_type_(String data_type_)
{ getToolParameters().put("data_type_", data_type_);
}
public String getRelaxed_type_()
{return getToolParameters().get("relaxed_type_");
}
public void setRelaxed_type_(String relaxed_type_)
{ getToolParameters().put("relaxed_type_", relaxed_type_);
}
public String getInterleaved_type_()
{return getToolParameters().get("interleaved_type_");
}
public void setInterleaved_type_(String interleaved_type_)
{ getToolParameters().put("interleaved_type_", interleaved_type_);
}
public String getNexus_strictness_()
{return getToolParameters().get("nexus_strictness_");
}
public void setNexus_strictness_(String nexus_strictness_)
{ getToolParameters().put("nexus_strictness_", nexus_strictness_);
}
public String getOutput_type_()
{return getToolParameters().get("output_type_");
}
public void setOutput_type_(String output_type_)
{ getToolParameters().put("output_type_", output_type_);
}
public String getOutfile_nexus_()
{return getToolParameters().get("outfile_nexus_");
}
public void setOutfile_nexus_(String outfile_nexus_)
{ getToolParameters().put("outfile_nexus_", outfile_nexus_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setFormat_type_( "nexus" );
setData_type_( "dna" );
setRelaxed_type_("false");
setInterleaved_type_("false");
setNexus_strictness_("2");
setOutput_type_( "-enexus" );
}
}
