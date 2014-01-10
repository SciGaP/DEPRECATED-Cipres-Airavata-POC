package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class saps extends ToolParameters
{
// file-typed property getters and setters
public Long getSeq_()
{
return getInputDataItemId("seq_");
}
public void setSeq_(Long seq_)
{
setInputDataItem("seq_",seq_);
}
public String getDocumented_()
{return getToolParameters().get("documented_");
}
public void setDocumented_(String documented_)
{ getToolParameters().put("documented_", documented_);
}
public String getTerse_()
{return getToolParameters().get("terse_");
}
public void setTerse_(String terse_)
{ getToolParameters().put("terse_", terse_);
}
public String getVerbose_()
{return getToolParameters().get("verbose_");
}
public void setVerbose_(String verbose_)
{ getToolParameters().put("verbose_", verbose_);
}
public String getTable_()
{return getToolParameters().get("table_");
}
public void setTable_(String table_)
{ getToolParameters().put("table_", table_);
}
public String getSpecie_()
{return getToolParameters().get("specie_");
}
public void setSpecie_(String specie_)
{ getToolParameters().put("specie_", specie_);
}
public String getH_positive_()
{return getToolParameters().get("H_positive_");
}
public void setH_positive_(String H_positive_)
{ getToolParameters().put("H_positive_", H_positive_);
}
public String getAnalyze_()
{return getToolParameters().get("analyze_");
}
public void setAnalyze_(String analyze_)
{ getToolParameters().put("analyze_", analyze_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setDocumented_("false");
setTerse_("false");
setVerbose_("false");
setTable_("false");
setSpecie_( "swp23s" );
setH_positive_("false");
}
}
