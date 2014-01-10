package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class extractseq extends ToolParameters
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
public String getRegions_option_()
{return getToolParameters().get("regions_option_");
}
public void setRegions_option_(String regions_option_)
{ getToolParameters().put("regions_option_", regions_option_);
}
public String getUpload_rangefile_()
{return getToolParameters().get("upload_rangefile_");
}
public void setUpload_rangefile_(String upload_rangefile_)
{ getToolParameters().put("upload_rangefile_", upload_rangefile_);
}
// file-typed property getters and setters
public Long getInput_rangefile_()
{
return getInputDataItemId("input_rangefile_");
}
public void setInput_rangefile_(Long input_rangefile_)
{
setInputDataItem("input_rangefile_",input_rangefile_);
}
public String getWrite_separate_()
{return getToolParameters().get("write_separate_");
}
public void setWrite_separate_(String write_separate_)
{ getToolParameters().put("write_separate_", write_separate_);
}
public String getOutseq_sformat_()
{return getToolParameters().get("outseq_sformat_");
}
public void setOutseq_sformat_(String outseq_sformat_)
{ getToolParameters().put("outseq_sformat_", outseq_sformat_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setUpload_rangefile_("false");
setWrite_separate_("false");
setOutseq_sformat_( "fasta" );
}
}
