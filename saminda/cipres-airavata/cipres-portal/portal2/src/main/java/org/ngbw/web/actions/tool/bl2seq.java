package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class bl2seq extends ToolParameters
{
public String getBl2seq_()
{return getToolParameters().get("bl2seq_");
}
public void setBl2seq_(String bl2seq_)
{ getToolParameters().put("bl2seq_", bl2seq_);
}
// file-typed property getters and setters
public Long getFirst_sequence_()
{
return getInputDataItemId("first_sequence_");
}
public void setFirst_sequence_(Long first_sequence_)
{
setInputDataItem("first_sequence_",first_sequence_);
}
public String getFirst_seq_loc_()
{return getToolParameters().get("first_seq_loc_");
}
public void setFirst_seq_loc_(String first_seq_loc_)
{ getToolParameters().put("first_seq_loc_", first_seq_loc_);
}
// file-typed property getters and setters
public Long getSecond_sequence_()
{
return getInputDataItemId("second_sequence_");
}
public void setSecond_sequence_(Long second_sequence_)
{
setInputDataItem("second_sequence_",second_sequence_);
}
public String getSecond_seq_loc_()
{return getToolParameters().get("second_seq_loc_");
}
public void setSecond_seq_loc_(String second_seq_loc_)
{ getToolParameters().put("second_seq_loc_", second_seq_loc_);
}
public String getExpect_()
{return getToolParameters().get("Expect_");
}
public void setExpect_(String Expect_)
{ getToolParameters().put("Expect_", Expect_);
}
public String getFilter_()
{return getToolParameters().get("filter_");
}
public void setFilter_(String filter_)
{ getToolParameters().put("filter_", filter_);
}
public String getOther_filters_()
{return getToolParameters().get("other_filters_");
}
public void setOther_filters_(String other_filters_)
{ getToolParameters().put("other_filters_", other_filters_);
}
public String getLower_case_()
{return getToolParameters().get("lower_case_");
}
public void setLower_case_(String lower_case_)
{ getToolParameters().put("lower_case_", lower_case_);
}
public String getWord_size_()
{return getToolParameters().get("word_size_");
}
public void setWord_size_(String word_size_)
{ getToolParameters().put("word_size_", word_size_);
}
public String getGapped_alig_()
{return getToolParameters().get("gapped_alig_");
}
public void setGapped_alig_(String gapped_alig_)
{ getToolParameters().put("gapped_alig_", gapped_alig_);
}
public String getDropoff_()
{return getToolParameters().get("dropoff_");
}
public void setDropoff_(String dropoff_)
{ getToolParameters().put("dropoff_", dropoff_);
}
public String getGap_open_()
{return getToolParameters().get("gap_open_");
}
public void setGap_open_(String gap_open_)
{ getToolParameters().put("gap_open_", gap_open_);
}
public String getGap_extend_()
{return getToolParameters().get("gap_extend_");
}
public void setGap_extend_(String gap_extend_)
{ getToolParameters().put("gap_extend_", gap_extend_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
}
public String getMismatch_()
{return getToolParameters().get("mismatch_");
}
public void setMismatch_(String mismatch_)
{ getToolParameters().put("mismatch_", mismatch_);
}
public String getMatch_()
{return getToolParameters().get("match_");
}
public void setMatch_(String match_)
{ getToolParameters().put("match_", match_);
}
public String getStrand_()
{return getToolParameters().get("strand_");
}
public void setStrand_(String strand_)
{ getToolParameters().put("strand_", strand_);
}
public String getDbsize_()
{return getToolParameters().get("dbsize_");
}
public void setDbsize_(String dbsize_)
{ getToolParameters().put("dbsize_", dbsize_);
}
public String getSearchspacesize_()
{return getToolParameters().get("searchspacesize_");
}
public void setSearchspacesize_(String searchspacesize_)
{ getToolParameters().put("searchspacesize_", searchspacesize_);
}
public String getOutformat_()
{return getToolParameters().get("outformat_");
}
public void setOutformat_(String outformat_)
{ getToolParameters().put("outformat_", outformat_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setBl2seq_( "blastp" );
setExpect_("10.0");
setFilter_("true");
setLower_case_("false");
setWord_size_("0");
setGapped_alig_("true");
setMatrix_( "BLOSUM62" );
setMismatch_("-3");
setMatch_("1");
setStrand_( "3" );
setDbsize_("0");
setSearchspacesize_("0");
setOutformat_( "0" );
}
}
