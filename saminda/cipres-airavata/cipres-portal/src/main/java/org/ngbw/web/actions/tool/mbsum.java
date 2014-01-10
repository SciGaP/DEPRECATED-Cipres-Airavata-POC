package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class mbsum extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getMb_infile1_()
{
return getInputDataItemId("mb_infile1_");
}
public void setMb_infile1_(Long mb_infile1_)
{
setInputDataItem("mb_infile1_",mb_infile1_);
}
public String getSkipped_lines_()
{return getToolParameters().get("skipped_lines_");
}
public void setSkipped_lines_(String skipped_lines_)
{ getToolParameters().put("skipped_lines_", skipped_lines_);
}
public String getNum_files_()
{return getToolParameters().get("num_files_");
}
public void setNum_files_(String num_files_)
{ getToolParameters().put("num_files_", num_files_);
}
// file-typed property getters and setters
public Long getMb_infile2_()
{
return getInputDataItemId("mb_infile2_");
}
public void setMb_infile2_(Long mb_infile2_)
{
setInputDataItem("mb_infile2_",mb_infile2_);
}
// file-typed property getters and setters
public Long getMb_infile3_()
{
return getInputDataItemId("mb_infile3_");
}
public void setMb_infile3_(Long mb_infile3_)
{
setInputDataItem("mb_infile3_",mb_infile3_);
}
// file-typed property getters and setters
public Long getMb_infile4_()
{
return getInputDataItemId("mb_infile4_");
}
public void setMb_infile4_(Long mb_infile4_)
{
setInputDataItem("mb_infile4_",mb_infile4_);
}
// file-typed property getters and setters
public Long getMb_infile5_()
{
return getInputDataItemId("mb_infile5_");
}
public void setMb_infile5_(Long mb_infile5_)
{
setInputDataItem("mb_infile5_",mb_infile5_);
}
// file-typed property getters and setters
public Long getMb_infile6_()
{
return getInputDataItemId("mb_infile6_");
}
public void setMb_infile6_(Long mb_infile6_)
{
setInputDataItem("mb_infile6_",mb_infile6_);
}
// file-typed property getters and setters
public Long getMb_infile7_()
{
return getInputDataItemId("mb_infile7_");
}
public void setMb_infile7_(Long mb_infile7_)
{
setInputDataItem("mb_infile7_",mb_infile7_);
}
// file-typed property getters and setters
public Long getMb_infile8_()
{
return getInputDataItemId("mb_infile8_");
}
public void setMb_infile8_(Long mb_infile8_)
{
setInputDataItem("mb_infile8_",mb_infile8_);
}
// file-typed property getters and setters
public Long getMb_infile9_()
{
return getInputDataItemId("mb_infile9_");
}
public void setMb_infile9_(Long mb_infile9_)
{
setInputDataItem("mb_infile9_",mb_infile9_);
}
// file-typed property getters and setters
public Long getMb_infile10_()
{
return getInputDataItemId("mb_infile10_");
}
public void setMb_infile10_(Long mb_infile10_)
{
setInputDataItem("mb_infile10_",mb_infile10_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
}
}
