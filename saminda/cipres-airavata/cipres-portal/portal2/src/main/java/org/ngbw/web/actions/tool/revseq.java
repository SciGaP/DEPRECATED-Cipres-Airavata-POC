package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class revseq extends ToolParameters
{
// file-typed property getters and setters
public Long getSequence_()
{
return getInputDataItemId("sequence_");
}
public void setSequence_(Long sequence_)
{
setInputDataItem("sequence_",sequence_);
}
public String getReverse_()
{return getToolParameters().get("reverse_");
}
public void setReverse_(String reverse_)
{ getToolParameters().put("reverse_", reverse_);
}
public String getComplement_()
{return getToolParameters().get("complement_");
}
public void setComplement_(String complement_)
{ getToolParameters().put("complement_", complement_);
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
setReverse_("true");
setComplement_("true");
setOutseq_sformat_( "fasta" );
}
}
