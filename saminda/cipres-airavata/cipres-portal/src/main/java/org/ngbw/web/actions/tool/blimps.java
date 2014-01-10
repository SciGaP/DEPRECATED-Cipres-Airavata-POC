package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class blimps extends ToolParameters
{
public String getAction_()
{return getToolParameters().get("action_");
}
public void setAction_(String action_)
{ getToolParameters().put("action_", action_);
}
public String getBlocks_db_()
{return getToolParameters().get("blocks_db_");
}
public void setBlocks_db_(String blocks_db_)
{ getToolParameters().put("blocks_db_", blocks_db_);
}
// file-typed property getters and setters
public Long getSequence_file_()
{
return getInputDataItemId("sequence_file_");
}
public void setSequence_file_(Long sequence_file_)
{
setInputDataItem("sequence_file_",sequence_file_);
}
public String getSequence_db_()
{return getToolParameters().get("sequence_db_");
}
public void setSequence_db_(String sequence_db_)
{ getToolParameters().put("sequence_db_", sequence_db_);
}
// file-typed property getters and setters
public Long getBlock_file_()
{
return getInputDataItemId("block_file_");
}
public void setBlock_file_(Long block_file_)
{
setInputDataItem("block_file_",block_file_);
}
// file-typed property getters and setters
public Long getMatrix_file_()
{
return getInputDataItemId("matrix_file_");
}
public void setMatrix_file_(Long matrix_file_)
{
setInputDataItem("matrix_file_",matrix_file_);
}
public String getConversion_()
{return getToolParameters().get("conversion_");
}
public void setConversion_(String conversion_)
{ getToolParameters().put("conversion_", conversion_);
}
public String getGenetic_code_()
{return getToolParameters().get("genetic_code_");
}
public void setGenetic_code_(String genetic_code_)
{ getToolParameters().put("genetic_code_", genetic_code_);
}
public String getStrand_()
{return getToolParameters().get("strand_");
}
public void setStrand_(String strand_)
{ getToolParameters().put("strand_", strand_);
}
public String getError_()
{return getToolParameters().get("error_");
}
public void setError_(String error_)
{ getToolParameters().put("error_", error_);
}
public String getHistogram_()
{return getToolParameters().get("histogram_");
}
public void setHistogram_(String histogram_)
{ getToolParameters().put("histogram_", histogram_);
}
public String getScores_number_()
{return getToolParameters().get("scores_number_");
}
public void setScores_number_(String scores_number_)
{ getToolParameters().put("scores_number_", scores_number_);
}
public String getRepeats_()
{return getToolParameters().get("repeats_");
}
public void setRepeats_(String repeats_)
{ getToolParameters().put("repeats_", repeats_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setAction_( "block" );
setBlocks_db_( "blocks.dat" );
setSequence_db_( "UNIPROT.fasta" );
setConversion_( "2" );
setGenetic_code_( "0" );
setStrand_("true");
setError_( "2" );
setHistogram_("false");
setScores_number_("0");
setRepeats_("true");
}
}
