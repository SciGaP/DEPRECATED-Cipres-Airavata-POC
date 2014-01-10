package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class compass extends ToolParameters
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
// file-typed property getters and setters
public Long getAlignment_number_two_()
{
return getInputDataItemId("alignment_number_two_");
}
public void setAlignment_number_two_(Long alignment_number_two_)
{
setInputDataItem("alignment_number_two_",alignment_number_two_);
}
public String getGap_threshold_()
{return getToolParameters().get("gap_threshold_");
}
public void setGap_threshold_(String gap_threshold_)
{ getToolParameters().put("gap_threshold_", gap_threshold_);
}
public String getGap_threshold_moderate_()
{return getToolParameters().get("gap_threshold_moderate_");
}
public void setGap_threshold_moderate_(String gap_threshold_moderate_)
{ getToolParameters().put("gap_threshold_moderate_", gap_threshold_moderate_);
}
public String getGap_opening_()
{return getToolParameters().get("gap_opening_");
}
public void setGap_opening_(String gap_opening_)
{ getToolParameters().put("gap_opening_", gap_opening_);
}
public String getGap_extension_()
{return getToolParameters().get("gap_extension_");
}
public void setGap_extension_(String gap_extension_)
{ getToolParameters().put("gap_extension_", gap_extension_);
}
public String getUngapped_lambda_()
{return getToolParameters().get("ungapped_lambda_");
}
public void setUngapped_lambda_(String ungapped_lambda_)
{ getToolParameters().put("ungapped_lambda_", ungapped_lambda_);
}
public String getExpect_positional_()
{return getToolParameters().get("expect_positional_");
}
public void setExpect_positional_(String expect_positional_)
{ getToolParameters().put("expect_positional_", expect_positional_);
}
public String getDatabase_length_()
{return getToolParameters().get("database_length_");
}
public void setDatabase_length_(String database_length_)
{ getToolParameters().put("database_length_", database_length_);
}
public String getAlignment_length_()
{return getToolParameters().get("alignment_length_");
}
public void setAlignment_length_(String alignment_length_)
{ getToolParameters().put("alignment_length_", alignment_length_);
}
public String getNumber_sequences_()
{return getToolParameters().get("number_sequences_");
}
public void setNumber_sequences_(String number_sequences_)
{ getToolParameters().put("number_sequences_", number_sequences_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setGap_threshold_("0.5");
setGap_threshold_moderate_("1.0");
setGap_opening_("10");
setGap_extension_("1");
setUngapped_lambda_("0.3176");
setExpect_positional_("-0.5209");
setAlignment_length_("60");
setNumber_sequences_("1");
}
}
