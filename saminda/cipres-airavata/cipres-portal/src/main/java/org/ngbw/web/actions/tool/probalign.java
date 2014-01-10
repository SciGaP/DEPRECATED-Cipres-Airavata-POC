package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class probalign extends ToolParameters
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
public String getAlignment_order_()
{return getToolParameters().get("alignment_order_");
}
public void setAlignment_order_(String alignment_order_)
{ getToolParameters().put("alignment_order_", alignment_order_);
}
public String getScoring_matrix_()
{return getToolParameters().get("scoring_matrix_");
}
public void setScoring_matrix_(String scoring_matrix_)
{ getToolParameters().put("scoring_matrix_", scoring_matrix_);
}
public String getOutput_format_()
{return getToolParameters().get("output_format_");
}
public void setOutput_format_(String output_format_)
{ getToolParameters().put("output_format_", output_format_);
}
public String getGapopenn_()
{return getToolParameters().get("gapopenn_");
}
public void setGapopenn_(String gapopenn_)
{ getToolParameters().put("gapopenn_", gapopenn_);
}
public String getGapextn_()
{return getToolParameters().get("gapextn_");
}
public void setGapextn_(String gapextn_)
{ getToolParameters().put("gapextn_", gapextn_);
}
public String getTemp_na_()
{return getToolParameters().get("temp_na_");
}
public void setTemp_na_(String temp_na_)
{ getToolParameters().put("temp_na_", temp_na_);
}
public String getGapopenp_()
{return getToolParameters().get("gapopenp_");
}
public void setGapopenp_(String gapopenp_)
{ getToolParameters().put("gapopenp_", gapopenp_);
}
public String getGapextp_()
{return getToolParameters().get("gapextp_");
}
public void setGapextp_(String gapextp_)
{ getToolParameters().put("gapextp_", gapextp_);
}
public String getTemp_aa_()
{return getToolParameters().get("temp_aa_");
}
public void setTemp_aa_(String temp_aa_)
{ getToolParameters().put("temp_aa_", temp_aa_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setAlignment_order_("false");
setScoring_matrix_( "nuc_simple" );
setOutput_format_("false");
setGapopenn_("4.0");
setGapextn_("0.25");
setTemp_na_("1.0");
setGapopenp_("22.0");
setGapextp_("1.0");
setTemp_aa_("5.0");
}
}
