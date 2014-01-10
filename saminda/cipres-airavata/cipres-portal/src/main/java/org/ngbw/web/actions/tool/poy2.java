package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class poy2 extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getInfile1_()
{
return getInputDataItemId("infile1_");
}
public void setInfile1_(Long infile1_)
{
setInputDataItem("infile1_",infile1_);
}
// file-typed property getters and setters
public Long getInfile2_()
{
return getInputDataItemId("infile2_");
}
public void setInfile2_(Long infile2_)
{
setInputDataItem("infile2_",infile2_);
}
// file-typed property getters and setters
public Long getInfile3_()
{
return getInputDataItemId("infile3_");
}
public void setInfile3_(Long infile3_)
{
setInputDataItem("infile3_",infile3_);
}
// file-typed property getters and setters
public Long getInfile4_()
{
return getInputDataItemId("infile4_");
}
public void setInfile4_(Long infile4_)
{
setInputDataItem("infile4_",infile4_);
}
// file-typed property getters and setters
public Long getInfile5_()
{
return getInputDataItemId("infile5_");
}
public void setInfile5_(Long infile5_)
{
setInputDataItem("infile5_",infile5_);
}
// file-typed property getters and setters
public Long getInfile6_()
{
return getInputDataItemId("infile6_");
}
public void setInfile6_(Long infile6_)
{
setInputDataItem("infile6_",infile6_);
}
public String getSubstitutions_()
{return getToolParameters().get("substitutions_");
}
public void setSubstitutions_(String substitutions_)
{ getToolParameters().put("substitutions_", substitutions_);
}
public String getIndels_()
{return getToolParameters().get("indels_");
}
public void setIndels_(String indels_)
{ getToolParameters().put("indels_", indels_);
}
public String getGapopening_()
{return getToolParameters().get("gapopening_");
}
public void setGapopening_(String gapopening_)
{ getToolParameters().put("gapopening_", gapopening_);
}
// file-typed property getters and setters
public Long getTerminalsfile_()
{
return getInputDataItemId("terminalsfile_");
}
public void setTerminalsfile_(Long terminalsfile_)
{
setInputDataItem("terminalsfile_",terminalsfile_);
}
// file-typed property getters and setters
public Long getSynonyms_()
{
return getInputDataItemId("synonyms_");
}
public void setSynonyms_(Long synonyms_)
{
setInputDataItem("synonyms_",synonyms_);
}
public String getOutgroup_()
{return getToolParameters().get("outgroup_");
}
public void setOutgroup_(String outgroup_)
{ getToolParameters().put("outgroup_", outgroup_);
}
// file-typed property getters and setters
public Long getConstraint_()
{
return getInputDataItemId("constraint_");
}
public void setConstraint_(Long constraint_)
{
setInputDataItem("constraint_",constraint_);
}
public String getRandomseed_()
{return getToolParameters().get("randomseed_");
}
public void setRandomseed_(String randomseed_)
{ getToolParameters().put("randomseed_", randomseed_);
}
public String getSupport_()
{return getToolParameters().get("support_");
}
public void setSupport_(String support_)
{ getToolParameters().put("support_", support_);
}
public String getPseudoreplicates_()
{return getToolParameters().get("pseudoreplicates_");
}
public void setPseudoreplicates_(String pseudoreplicates_)
{ getToolParameters().put("pseudoreplicates_", pseudoreplicates_);
}
public String getRemove_()
{return getToolParameters().get("remove_");
}
public void setRemove_(String remove_)
{ getToolParameters().put("remove_", remove_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setSubstitutions_("1");
setIndels_("1");
setGapopening_("0");
}
}
