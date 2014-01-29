package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class rpsblast extends ToolParameters
{
// file-typed property getters and setters
public Long getQuery_()
{
return getInputDataItemId("query_");
}
public void setQuery_(Long query_)
{
setInputDataItem("query_",query_);
}
public String getProtein_db_()
{return getToolParameters().get("protein_db_");
}
public void setProtein_db_(String protein_db_)
{ getToolParameters().put("protein_db_", protein_db_);
}
public String getExpect_()
{return getToolParameters().get("Expect_");
}
public void setExpect_(String Expect_)
{ getToolParameters().put("Expect_", Expect_);
}
public String getView_alignments_()
{return getToolParameters().get("view_alignments_");
}
public void setView_alignments_(String view_alignments_)
{ getToolParameters().put("view_alignments_", view_alignments_);
}
public String getDropoff_y_()
{return getToolParameters().get("dropoff_y_");
}
public void setDropoff_y_(String dropoff_y_)
{ getToolParameters().put("dropoff_y_", dropoff_y_);
}
public String getDropoff_()
{return getToolParameters().get("dropoff_");
}
public void setDropoff_(String dropoff_)
{ getToolParameters().put("dropoff_", dropoff_);
}
public String getFilter_()
{return getToolParameters().get("filter_");
}
public void setFilter_(String filter_)
{ getToolParameters().put("filter_", filter_);
}
public String getTrigger_()
{return getToolParameters().get("trigger_");
}
public void setTrigger_(String trigger_)
{ getToolParameters().put("trigger_", trigger_);
}
public String getBelieve_()
{return getToolParameters().get("believe_");
}
public void setBelieve_(String believe_)
{ getToolParameters().put("believe_", believe_);
}
public String getDropoff_z_()
{return getToolParameters().get("dropoff_z_");
}
public void setDropoff_z_(String dropoff_z_)
{ getToolParameters().put("dropoff_z_", dropoff_z_);
}
public String getAlignments_()
{return getToolParameters().get("Alignments_");
}
public void setAlignments_(String Alignments_)
{ getToolParameters().put("Alignments_", Alignments_);
}
public String getDescriptions_()
{return getToolParameters().get("Descriptions_");
}
public void setDescriptions_(String Descriptions_)
{ getToolParameters().put("Descriptions_", Descriptions_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setProtein_db_( "Smart" );
setExpect_("10.0");
setView_alignments_( "0" );
setDropoff_y_("7.0");
setDropoff_("15");
setFilter_("false");
setTrigger_("22.0");
setBelieve_("false");
setDropoff_z_("25");
setAlignments_("250");
setDescriptions_("500");
}
}
