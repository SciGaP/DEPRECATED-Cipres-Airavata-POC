package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class readseq extends ToolParameters
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
public String getInput_type_()
{return getToolParameters().get("input_type_");
}
public void setInput_type_(String input_type_)
{ getToolParameters().put("input_type_", input_type_);
}
public String getOutput_type_()
{return getToolParameters().get("output_type_");
}
public void setOutput_type_(String output_type_)
{ getToolParameters().put("output_type_", output_type_);
}
public String getPretty_seqwidth_()
{return getToolParameters().get("pretty_seqwidth_");
}
public void setPretty_seqwidth_(String pretty_seqwidth_)
{ getToolParameters().put("pretty_seqwidth_", pretty_seqwidth_);
}
public String getPretty_leftindent_()
{return getToolParameters().get("pretty_leftindent_");
}
public void setPretty_leftindent_(String pretty_leftindent_)
{ getToolParameters().put("pretty_leftindent_", pretty_leftindent_);
}
public String getPretty_colspace_()
{return getToolParameters().get("pretty_colspace_");
}
public void setPretty_colspace_(String pretty_colspace_)
{ getToolParameters().put("pretty_colspace_", pretty_colspace_);
}
public String getPretty_countgap_()
{return getToolParameters().get("pretty_countgap_");
}
public void setPretty_countgap_(String pretty_countgap_)
{ getToolParameters().put("pretty_countgap_", pretty_countgap_);
}
public String getPretty_nameright_()
{return getToolParameters().get("pretty_nameright_");
}
public void setPretty_nameright_(String pretty_nameright_)
{ getToolParameters().put("pretty_nameright_", pretty_nameright_);
}
public String getPretty_indexright_()
{return getToolParameters().get("pretty_indexright_");
}
public void setPretty_indexright_(String pretty_indexright_)
{ getToolParameters().put("pretty_indexright_", pretty_indexright_);
}
public String getPretty_interlinet_()
{return getToolParameters().get("pretty_interlinet_");
}
public void setPretty_interlinet_(String pretty_interlinet_)
{ getToolParameters().put("pretty_interlinet_", pretty_interlinet_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setInput_type_( "8" );
setOutput_type_( "17" );
setPretty_seqwidth_("60");
setPretty_leftindent_("2");
setPretty_colspace_("0");
setPretty_countgap_("true");
setPretty_nameright_("false");
setPretty_indexright_("false");
setPretty_interlinet_("1");
}
}
