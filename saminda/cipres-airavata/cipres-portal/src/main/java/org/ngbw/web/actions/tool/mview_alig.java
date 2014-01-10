package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class mview_alig extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getAlig_()
{
return getInputDataItemId("alig_");
}
public void setAlig_(Long alig_)
{
setInputDataItem("alig_",alig_);
}
public String getIn_()
{return getToolParameters().get("in_");
}
public void setIn_(String in_)
{ getToolParameters().put("in_", in_);
}
public String getRuler_()
{return getToolParameters().get("ruler_");
}
public void setRuler_(String ruler_)
{ getToolParameters().put("ruler_", ruler_);
}
public String getAlignment_()
{return getToolParameters().get("alignment_");
}
public void setAlignment_(String alignment_)
{ getToolParameters().put("alignment_", alignment_);
}
public String getConsensus_()
{return getToolParameters().get("consensus_");
}
public void setConsensus_(String consensus_)
{ getToolParameters().put("consensus_", consensus_);
}
public String getDna_()
{return getToolParameters().get("dna_");
}
public void setDna_(String dna_)
{ getToolParameters().put("dna_", dna_);
}
public String getColoring_()
{return getToolParameters().get("coloring_");
}
public void setColoring_(String coloring_)
{ getToolParameters().put("coloring_", coloring_);
}
public String getThreshold_()
{return getToolParameters().get("threshold_");
}
public void setThreshold_(String threshold_)
{ getToolParameters().put("threshold_", threshold_);
}
public String getIgnore_()
{return getToolParameters().get("ignore_");
}
public void setIgnore_(String ignore_)
{ getToolParameters().put("ignore_", ignore_);
}
public String getCon_coloring_()
{return getToolParameters().get("con_coloring_");
}
public void setCon_coloring_(String con_coloring_)
{ getToolParameters().put("con_coloring_", con_coloring_);
}
public String getCon_threshold_()
{return getToolParameters().get("con_threshold_");
}
public void setCon_threshold_(String con_threshold_)
{ getToolParameters().put("con_threshold_", con_threshold_);
}
public String getCon_ignore_()
{return getToolParameters().get("con_ignore_");
}
public void setCon_ignore_(String con_ignore_)
{ getToolParameters().put("con_ignore_", con_ignore_);
}
public String getCon_gaps_()
{return getToolParameters().get("con_gaps_");
}
public void setCon_gaps_(String con_gaps_)
{ getToolParameters().put("con_gaps_", con_gaps_);
}
public String getTop_()
{return getToolParameters().get("top_");
}
public void setTop_(String top_)
{ getToolParameters().put("top_", top_);
}
public String getRange_()
{return getToolParameters().get("range_");
}
public void setRange_(String range_)
{ getToolParameters().put("range_", range_);
}
public String getMaxident_()
{return getToolParameters().get("maxident_");
}
public void setMaxident_(String maxident_)
{ getToolParameters().put("maxident_", maxident_);
}
public String getRef_()
{return getToolParameters().get("ref_");
}
public void setRef_(String ref_)
{ getToolParameters().put("ref_", ref_);
}
public String getKeep_only_()
{return getToolParameters().get("keep_only_");
}
public void setKeep_only_(String keep_only_)
{ getToolParameters().put("keep_only_", keep_only_);
}
public String getDisc_()
{return getToolParameters().get("disc_");
}
public void setDisc_(String disc_)
{ getToolParameters().put("disc_", disc_);
}
public String getNops_()
{return getToolParameters().get("nops_");
}
public void setNops_(String nops_)
{ getToolParameters().put("nops_", nops_);
}
public String getWidth_()
{return getToolParameters().get("width_");
}
public void setWidth_(String width_)
{ getToolParameters().put("width_", width_);
}
public String getGap_()
{return getToolParameters().get("gap_");
}
public void setGap_(String gap_)
{ getToolParameters().put("gap_", gap_);
}
public String getLabel0_()
{return getToolParameters().get("label0_");
}
public void setLabel0_(String label0_)
{ getToolParameters().put("label0_", label0_);
}
public String getLabel1_()
{return getToolParameters().get("label1_");
}
public void setLabel1_(String label1_)
{ getToolParameters().put("label1_", label1_);
}
public String getLabel2_()
{return getToolParameters().get("label2_");
}
public void setLabel2_(String label2_)
{ getToolParameters().put("label2_", label2_);
}
public String getLabel3_()
{return getToolParameters().get("label3_");
}
public void setLabel3_(String label3_)
{ getToolParameters().put("label3_", label3_);
}
public String getLabel4_()
{return getToolParameters().get("label4_");
}
public void setLabel4_(String label4_)
{ getToolParameters().put("label4_", label4_);
}
public String getHtml_output_()
{return getToolParameters().get("html_output_");
}
public void setHtml_output_(String html_output_)
{ getToolParameters().put("html_output_", html_output_);
}
public String getPagecolor_()
{return getToolParameters().get("pagecolor_");
}
public void setPagecolor_(String pagecolor_)
{ getToolParameters().put("pagecolor_", pagecolor_);
}
public String getTextcolor_()
{return getToolParameters().get("textcolor_");
}
public void setTextcolor_(String textcolor_)
{ getToolParameters().put("textcolor_", textcolor_);
}
public String getLinkcolor_()
{return getToolParameters().get("linkcolor_");
}
public void setLinkcolor_(String linkcolor_)
{ getToolParameters().put("linkcolor_", linkcolor_);
}
public String getAlinkcolor_()
{return getToolParameters().get("alinkcolor_");
}
public void setAlinkcolor_(String alinkcolor_)
{ getToolParameters().put("alinkcolor_", alinkcolor_);
}
public String getVlinkcolor_()
{return getToolParameters().get("vlinkcolor_");
}
public void setVlinkcolor_(String vlinkcolor_)
{ getToolParameters().put("vlinkcolor_", vlinkcolor_);
}
public String getAlncolor_()
{return getToolParameters().get("alncolor_");
}
public void setAlncolor_(String alncolor_)
{ getToolParameters().put("alncolor_", alncolor_);
}
public String getSymcolor_()
{return getToolParameters().get("symcolor_");
}
public void setSymcolor_(String symcolor_)
{ getToolParameters().put("symcolor_", symcolor_);
}
public String getGapcolor_()
{return getToolParameters().get("gapcolor_");
}
public void setGapcolor_(String gapcolor_)
{ getToolParameters().put("gapcolor_", gapcolor_);
}
public String getBold_()
{return getToolParameters().get("bold_");
}
public void setBold_(String bold_)
{ getToolParameters().put("bold_", bold_);
}
public String getCss_()
{return getToolParameters().get("css_");
}
public void setCss_(String css_)
{ getToolParameters().put("css_", css_);
}
public String getOut_()
{return getToolParameters().get("out_");
}
public void setOut_(String out_)
{ getToolParameters().put("out_", out_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setIn_( "clustal" );
setAlignment_("true");
setDna_("false");
setThreshold_("70.0");
setIgnore_( "none" );
setCon_threshold_( "100,90,80,70" );
setCon_ignore_( "none" );
setCon_gaps_("true");
setMaxident_("100");
setHtml_output_( "full" );
setTextcolor_( "black" );
setLinkcolor_( "blue" );
setAlinkcolor_( "red" );
setVlinkcolor_( "purple" );
setCss_( "off" );
setOut_( "html" );
}
}
