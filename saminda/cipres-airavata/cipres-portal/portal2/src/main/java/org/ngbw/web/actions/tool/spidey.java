package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class spidey extends ToolParameters
{
// file-typed property getters and setters
public Long getFirst_sequence_()
{
return getInputDataItemId("first_sequence_");
}
public void setFirst_sequence_(Long first_sequence_)
{
setInputDataItem("first_sequence_",first_sequence_);
}
// file-typed property getters and setters
public Long getQuery2_()
{
return getInputDataItemId("query2_");
}
public void setQuery2_(Long query2_)
{
setInputDataItem("query2_",query2_);
}
public String getSetgmodels_()
{return getToolParameters().get("setgmodels_");
}
public void setSetgmodels_(String setgmodels_)
{ getToolParameters().put("setgmodels_", setgmodels_);
}
public String getSetgorg_()
{return getToolParameters().get("setgorg_");
}
public void setSetgorg_(String setgorg_)
{ getToolParameters().put("setgorg_", setgorg_);
}
public String getSetfirstpass_()
{return getToolParameters().get("setfirstpass_");
}
public void setSetfirstpass_(String setfirstpass_)
{ getToolParameters().put("setfirstpass_", setfirstpass_);
}
public String getSetsecondpass_()
{return getToolParameters().get("setsecondpass_");
}
public void setSetsecondpass_(String setsecondpass_)
{ getToolParameters().put("setsecondpass_", setsecondpass_);
}
public String getSetthirdpass_()
{return getToolParameters().get("setthirdpass_");
}
public void setSetthirdpass_(String setthirdpass_)
{ getToolParameters().put("setthirdpass_", setthirdpass_);
}
public String getSetcutoff_()
{return getToolParameters().get("setcutoff_");
}
public void setSetcutoff_(String setcutoff_)
{ getToolParameters().put("setcutoff_", setcutoff_);
}
public String getLengthcutoff_()
{return getToolParameters().get("lengthcutoff_");
}
public void setLengthcutoff_(String lengthcutoff_)
{ getToolParameters().put("lengthcutoff_", lengthcutoff_);
}
public String getInterspeciesalign_()
{return getToolParameters().get("interspeciesalign_");
}
public void setInterspeciesalign_(String interspeciesalign_)
{ getToolParameters().put("interspeciesalign_", interspeciesalign_);
}
public String getMrnamasked_()
{return getToolParameters().get("mrnamasked_");
}
public void setMrnamasked_(String mrnamasked_)
{ getToolParameters().put("mrnamasked_", mrnamasked_);
}
public String getStartinterval_()
{return getToolParameters().get("startinterval_");
}
public void setStartinterval_(String startinterval_)
{ getToolParameters().put("startinterval_", startinterval_);
}
public String getStopinterval_()
{return getToolParameters().get("stopinterval_");
}
public void setStopinterval_(String stopinterval_)
{ getToolParameters().put("stopinterval_", stopinterval_);
}
public String getMultialign_()
{return getToolParameters().get("multialign_");
}
public void setMultialign_(String multialign_)
{ getToolParameters().put("multialign_", multialign_);
}
public String getLargeintron_()
{return getToolParameters().get("largeintron_");
}
public void setLargeintron_(String largeintron_)
{ getToolParameters().put("largeintron_", largeintron_);
}
public String getPrintalign_()
{return getToolParameters().get("printalign_");
}
public void setPrintalign_(String printalign_)
{ getToolParameters().put("printalign_", printalign_);
}
public String getPrintoutasn_()
{return getToolParameters().get("printoutasn_");
}
public void setPrintoutasn_(String printoutasn_)
{ getToolParameters().put("printoutasn_", printoutasn_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setSetgmodels_("1");
setSetgorg_( "v" );
setSetfirstpass_("0.0000001");
setSetsecondpass_("0.001");
setSetthirdpass_("10");
setSetcutoff_("0");
setLengthcutoff_("0");
setInterspeciesalign_("false");
setMrnamasked_("false");
setStartinterval_("0");
setPrintalign_( "0" );
setPrintoutasn_("false");
}
}
