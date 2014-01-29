package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class boxshade extends ToolParameters
{
// file-typed property getters and setters
public Long getAlignment_()
{
return getInputDataItemId("alignment_");
}
public void setAlignment_(Long alignment_)
{
setInputDataItem("alignment_",alignment_);
}
public String getOutput_format_()
{return getToolParameters().get("output_format_");
}
public void setOutput_format_(String output_format_)
{ getToolParameters().put("output_format_", output_format_);
}
public String getPrint_name_()
{return getToolParameters().get("print_name_");
}
public void setPrint_name_(String print_name_)
{ getToolParameters().put("print_name_", print_name_);
}
public String getRuler_()
{return getToolParameters().get("ruler_");
}
public void setRuler_(String ruler_)
{ getToolParameters().put("ruler_", ruler_);
}
public String getSpace_between_name_sequence_()
{return getToolParameters().get("space_between_name_sequence_");
}
public void setSpace_between_name_sequence_(String space_between_name_sequence_)
{ getToolParameters().put("space_between_name_sequence_", space_between_name_sequence_);
}
public String getIgnored_gaps_()
{return getToolParameters().get("ignored_gaps_");
}
public void setIgnored_gaps_(String ignored_gaps_)
{ getToolParameters().put("ignored_gaps_", ignored_gaps_);
}
public String getSequence_characters_()
{return getToolParameters().get("sequence_characters_");
}
public void setSequence_characters_(String sequence_characters_)
{ getToolParameters().put("sequence_characters_", sequence_characters_);
}
public String getLines_()
{return getToolParameters().get("lines_");
}
public void setLines_(String lines_)
{ getToolParameters().put("lines_", lines_);
}
public String getCharacter_size_()
{return getToolParameters().get("character_size_");
}
public void setCharacter_size_(String character_size_)
{ getToolParameters().put("character_size_", character_size_);
}
public String getSave_shading_()
{return getToolParameters().get("save_shading_");
}
public void setSave_shading_(String save_shading_)
{ getToolParameters().put("save_shading_", save_shading_);
}
public String getRotate_()
{return getToolParameters().get("rotate_");
}
public void setRotate_(String rotate_)
{ getToolParameters().put("rotate_", rotate_);
}
public String getLabel_similar_()
{return getToolParameters().get("label_similar_");
}
public void setLabel_similar_(String label_similar_)
{ getToolParameters().put("label_similar_", label_similar_);
}
public String getLabel_identical_()
{return getToolParameters().get("label_identical_");
}
public void setLabel_identical_(String label_identical_)
{ getToolParameters().put("label_identical_", label_identical_);
}
public String getConsensus_()
{return getToolParameters().get("consensus_");
}
public void setConsensus_(String consensus_)
{ getToolParameters().put("consensus_", consensus_);
}
public String getThreshold_()
{return getToolParameters().get("threshold_");
}
public void setThreshold_(String threshold_)
{ getToolParameters().put("threshold_", threshold_);
}
public String getDifferent_background_()
{return getToolParameters().get("different_background_");
}
public void setDifferent_background_(String different_background_)
{ getToolParameters().put("different_background_", different_background_);
}
public String getDifferent_foreground_()
{return getToolParameters().get("different_foreground_");
}
public void setDifferent_foreground_(String different_foreground_)
{ getToolParameters().put("different_foreground_", different_foreground_);
}
public String getIdentical_background_()
{return getToolParameters().get("identical_background_");
}
public void setIdentical_background_(String identical_background_)
{ getToolParameters().put("identical_background_", identical_background_);
}
public String getIdentical_foreground_()
{return getToolParameters().get("identical_foreground_");
}
public void setIdentical_foreground_(String identical_foreground_)
{ getToolParameters().put("identical_foreground_", identical_foreground_);
}
public String getSimilar_background_()
{return getToolParameters().get("similar_background_");
}
public void setSimilar_background_(String similar_background_)
{ getToolParameters().put("similar_background_", similar_background_);
}
public String getSimilar_foreground_()
{return getToolParameters().get("similar_foreground_");
}
public void setSimilar_foreground_(String similar_foreground_)
{ getToolParameters().put("similar_foreground_", similar_foreground_);
}
public String getConserved_background_()
{return getToolParameters().get("conserved_background_");
}
public void setConserved_background_(String conserved_background_)
{ getToolParameters().put("conserved_background_", conserved_background_);
}
public String getConserved_foreground_()
{return getToolParameters().get("conserved_foreground_");
}
public void setConserved_foreground_(String conserved_foreground_)
{ getToolParameters().put("conserved_foreground_", conserved_foreground_);
}
public String getSingle_()
{return getToolParameters().get("single_");
}
public void setSingle_(String single_)
{ getToolParameters().put("single_", single_);
}
public String getSeq_no_()
{return getToolParameters().get("seq_no_");
}
public void setSeq_no_(String seq_no_)
{ getToolParameters().put("seq_no_", seq_no_);
}
public String getHide_()
{return getToolParameters().get("hide_");
}
public void setHide_(String hide_)
{ getToolParameters().put("hide_", hide_);
}
public String getShow_normal_()
{return getToolParameters().get("show_normal_");
}
public void setShow_normal_(String show_normal_)
{ getToolParameters().put("show_normal_", show_normal_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setOutput_format_( "e" );
setPrint_name_("true");
setRuler_("false");
setSpace_between_name_sequence_("1");
setIgnored_gaps_("0");
setSequence_characters_("60");
setLines_("1");
setCharacter_size_("10");
setSave_shading_( "T" );
setRotate_("false");
setLabel_similar_("true");
setLabel_identical_("false");
setConsensus_("false");
setThreshold_("0.50");
setDifferent_background_( "W" );
setDifferent_foreground_( "B" );
setIdentical_background_( "B" );
setIdentical_foreground_( "W" );
setSimilar_background_( "1" );
setSimilar_foreground_( "B" );
setConserved_background_( "1" );
setConserved_foreground_( "B" );
setSingle_("false");
setSeq_no_("1");
setHide_("false");
setShow_normal_("false");
setMatrix_("false");
}
}
