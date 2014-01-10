package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class sixpack extends ToolParameters
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
public String getTable_()
{return getToolParameters().get("table_");
}
public void setTable_(String table_)
{ getToolParameters().put("table_", table_);
}
public String getFirstorf_()
{return getToolParameters().get("firstorf_");
}
public void setFirstorf_(String firstorf_)
{ getToolParameters().put("firstorf_", firstorf_);
}
public String getLastorf_()
{return getToolParameters().get("lastorf_");
}
public void setLastorf_(String lastorf_)
{ getToolParameters().put("lastorf_", lastorf_);
}
public String getMstart_()
{return getToolParameters().get("mstart_");
}
public void setMstart_(String mstart_)
{ getToolParameters().put("mstart_", mstart_);
}
public String getOutseq_sformat_()
{return getToolParameters().get("outseq_sformat_");
}
public void setOutseq_sformat_(String outseq_sformat_)
{ getToolParameters().put("outseq_sformat_", outseq_sformat_);
}
public String getReverse_()
{return getToolParameters().get("reverse_");
}
public void setReverse_(String reverse_)
{ getToolParameters().put("reverse_", reverse_);
}
public String getOrfminsize_()
{return getToolParameters().get("orfminsize_");
}
public void setOrfminsize_(String orfminsize_)
{ getToolParameters().put("orfminsize_", orfminsize_);
}
public String getUppercase_()
{return getToolParameters().get("uppercase_");
}
public void setUppercase_(String uppercase_)
{ getToolParameters().put("uppercase_", uppercase_);
}
public String getNumber_()
{return getToolParameters().get("number_");
}
public void setNumber_(String number_)
{ getToolParameters().put("number_", number_);
}
public String getWidth_()
{return getToolParameters().get("width_");
}
public void setWidth_(String width_)
{ getToolParameters().put("width_", width_);
}
public String getLength_()
{return getToolParameters().get("length_");
}
public void setLength_(String length_)
{ getToolParameters().put("length_", length_);
}
public String getMargin_()
{return getToolParameters().get("margin_");
}
public void setMargin_(String margin_)
{ getToolParameters().put("margin_", margin_);
}
public String getName_()
{return getToolParameters().get("name_");
}
public void setName_(String name_)
{ getToolParameters().put("name_", name_);
}
public String getDescription_()
{return getToolParameters().get("description_");
}
public void setDescription_(String description_)
{ getToolParameters().put("description_", description_);
}
public String getOffset_()
{return getToolParameters().get("offset_");
}
public void setOffset_(String offset_)
{ getToolParameters().put("offset_", offset_);
}
public String getHtml_()
{return getToolParameters().get("html_");
}
public void setHtml_(String html_)
{ getToolParameters().put("html_", html_);
}
public String getHighlight_()
{return getToolParameters().get("highlight_");
}
public void setHighlight_(String highlight_)
{ getToolParameters().put("highlight_", highlight_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setTable_( "0" );
setFirstorf_("true");
setLastorf_("true");
setMstart_("false");
setOutseq_sformat_( "fasta" );
setReverse_("true");
setOrfminsize_("1");
setNumber_("true");
setWidth_("60");
setLength_("0");
setMargin_("10");
setName_("true");
setDescription_("true");
setOffset_("1");
setHtml_("true");
}
}
