package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class tacg extends ToolParameters
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
public String getBeginning_()
{return getToolParameters().get("beginning_");
}
public void setBeginning_(String beginning_)
{ getToolParameters().put("beginning_", beginning_);
}
public String getEnd_()
{return getToolParameters().get("end_");
}
public void setEnd_(String end_)
{ getToolParameters().put("end_", end_);
}
public String getTopology_()
{return getToolParameters().get("topology_");
}
public void setTopology_(String topology_)
{ getToolParameters().put("topology_", topology_);
}
public String getDegeneracy_()
{return getToolParameters().get("degeneracy_");
}
public void setDegeneracy_(String degeneracy_)
{ getToolParameters().put("degeneracy_", degeneracy_);
}
public String getCodon_()
{return getToolParameters().get("codon_");
}
public void setCodon_(String codon_)
{ getToolParameters().put("codon_", codon_);
}
public String getOrder_by_cut_()
{return getToolParameters().get("order_by_cut_");
}
public void setOrder_by_cut_(String order_by_cut_)
{ getToolParameters().put("order_by_cut_", order_by_cut_);
}
public String getWidth_()
{return getToolParameters().get("width_");
}
public void setWidth_(String width_)
{ getToolParameters().put("width_", width_);
}
public String getGraphic_()
{return getToolParameters().get("graphic_");
}
public void setGraphic_(String graphic_)
{ getToolParameters().put("graphic_", graphic_);
}
public String getBinsize_()
{return getToolParameters().get("binsize_");
}
public void setBinsize_(String binsize_)
{ getToolParameters().put("binsize_", binsize_);
}
public String getEnzymes_()
{return getToolParameters().get("enzymes_");
}
public void setEnzymes_(String enzymes_)
{ getToolParameters().put("enzymes_", enzymes_);
}
public String getMax_cut_()
{return getToolParameters().get("max_cut_");
}
public void setMax_cut_(String max_cut_)
{ getToolParameters().put("max_cut_", max_cut_);
}
public String getMin_cut_()
{return getToolParameters().get("min_cut_");
}
public void setMin_cut_(String min_cut_)
{ getToolParameters().put("min_cut_", min_cut_);
}
public String getMagnitude_()
{return getToolParameters().get("magnitude_");
}
public void setMagnitude_(String magnitude_)
{ getToolParameters().put("magnitude_", magnitude_);
}
public String getOverhang_()
{return getToolParameters().get("overhang_");
}
public void setOverhang_(String overhang_)
{ getToolParameters().put("overhang_", overhang_);
}
public String getSummary_()
{return getToolParameters().get("summary_");
}
public void setSummary_(String summary_)
{ getToolParameters().put("summary_", summary_);
}
public String getPrint_fragments_()
{return getToolParameters().get("print_fragments_");
}
public void setPrint_fragments_(String print_fragments_)
{ getToolParameters().put("print_fragments_", print_fragments_);
}
public String getSites_()
{return getToolParameters().get("sites_");
}
public void setSites_(String sites_)
{ getToolParameters().put("sites_", sites_);
}
public String getLadder_map_()
{return getToolParameters().get("ladder_map_");
}
public void setLadder_map_(String ladder_map_)
{ getToolParameters().put("ladder_map_", ladder_map_);
}
public String getGel_map_()
{return getToolParameters().get("gel_map_");
}
public void setGel_map_(String gel_map_)
{ getToolParameters().put("gel_map_", gel_map_);
}
public String getCutoff_()
{return getToolParameters().get("cutoff_");
}
public void setCutoff_(String cutoff_)
{ getToolParameters().put("cutoff_", cutoff_);
}
public String getLinear_map_()
{return getToolParameters().get("linear_map_");
}
public void setLinear_map_(String linear_map_)
{ getToolParameters().put("linear_map_", linear_map_);
}
public String getTranslation_()
{return getToolParameters().get("translation_");
}
public void setTranslation_(String translation_)
{ getToolParameters().put("translation_", translation_);
}
public String getTranslation_frames_()
{return getToolParameters().get("translation_frames_");
}
public void setTranslation_frames_(String translation_frames_)
{ getToolParameters().put("translation_frames_", translation_frames_);
}
public String getThree_letter_()
{return getToolParameters().get("three_letter_");
}
public void setThree_letter_(String three_letter_)
{ getToolParameters().put("three_letter_", three_letter_);
}
public String getOrf_()
{return getToolParameters().get("orf_");
}
public void setOrf_(String orf_)
{ getToolParameters().put("orf_", orf_);
}
public String [] getFrame_()
{ String value= getToolParameters().get("frame_");
return SuperString.valueOf(value,' ').toArray();
}
public void setFrame_(String [] frame_)
{ String value=SuperString.valueOf(frame_, ' ').toString();
getToolParameters().put("frame_", value);
}
public String getMin_size_()
{return getToolParameters().get("min_size_");
}
public void setMin_size_(String min_size_)
{ getToolParameters().put("min_size_", min_size_);
}
public String getPattern_search_()
{return getToolParameters().get("pattern_search_");
}
public void setPattern_search_(String pattern_search_)
{ getToolParameters().put("pattern_search_", pattern_search_);
}
public String getPattern_()
{return getToolParameters().get("pattern_");
}
public void setPattern_(String pattern_)
{ getToolParameters().put("pattern_", pattern_);
}
public String getErrors_()
{return getToolParameters().get("errors_");
}
public void setErrors_(String errors_)
{ getToolParameters().put("errors_", errors_);
}
public String getName_()
{return getToolParameters().get("name_");
}
public void setName_(String name_)
{ getToolParameters().put("name_", name_);
}
public String getProximity_()
{return getToolParameters().get("proximity_");
}
public void setProximity_(String proximity_)
{ getToolParameters().put("proximity_", proximity_);
}
public String getDistance_()
{return getToolParameters().get("distance_");
}
public void setDistance_(String distance_)
{ getToolParameters().put("distance_", distance_);
}
public String getNameA_()
{return getToolParameters().get("nameA_");
}
public void setNameA_(String nameA_)
{ getToolParameters().put("nameA_", nameA_);
}
public String getNameB_()
{return getToolParameters().get("nameB_");
}
public void setNameB_(String nameB_)
{ getToolParameters().put("nameB_", nameB_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setTopology_( "1" );
setDegeneracy_( "1" );
setCodon_( "0" );
setOrder_by_cut_("false");
setWidth_("60");
setMagnitude_( "3" );
setOverhang_( "1" );
setSummary_("true");
setPrint_fragments_( "0" );
setSites_("false");
setTranslation_frames_( "1" );
setThree_letter_("false");
setFrame_(new String[]{"1" });
setErrors_("0");
setName_( "pattern1" );
}
}
