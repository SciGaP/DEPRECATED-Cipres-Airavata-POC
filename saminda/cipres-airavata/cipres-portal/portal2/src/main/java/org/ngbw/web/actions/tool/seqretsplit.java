package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class seqretsplit extends ToolParameters
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
public String getOutseq_sformat_()
{return getToolParameters().get("outseq_sformat_");
}
public void setOutseq_sformat_(String outseq_sformat_)
{ getToolParameters().put("outseq_sformat_", outseq_sformat_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setOutseq_sformat_( "fasta" );
}
}
