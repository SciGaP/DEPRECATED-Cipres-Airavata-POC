package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class restrict extends ToolParameters
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
public String getSitelen_()
{return getToolParameters().get("sitelen_");
}
public void setSitelen_(String sitelen_)
{ getToolParameters().put("sitelen_", sitelen_);
}
public String getEnzymes_()
{return getToolParameters().get("enzymes_");
}
public void setEnzymes_(String enzymes_)
{ getToolParameters().put("enzymes_", enzymes_);
}
public String getMin_()
{return getToolParameters().get("min_");
}
public void setMin_(String min_)
{ getToolParameters().put("min_", min_);
}
public String getMax_()
{return getToolParameters().get("max_");
}
public void setMax_(String max_)
{ getToolParameters().put("max_", max_);
}
public String getSolofragment_()
{return getToolParameters().get("solofragment_");
}
public void setSolofragment_(String solofragment_)
{ getToolParameters().put("solofragment_", solofragment_);
}
public String getSingle_()
{return getToolParameters().get("single_");
}
public void setSingle_(String single_)
{ getToolParameters().put("single_", single_);
}
public String getBlunt_()
{return getToolParameters().get("blunt_");
}
public void setBlunt_(String blunt_)
{ getToolParameters().put("blunt_", blunt_);
}
public String getSticky_()
{return getToolParameters().get("sticky_");
}
public void setSticky_(String sticky_)
{ getToolParameters().put("sticky_", sticky_);
}
public String getAmbiguity_()
{return getToolParameters().get("ambiguity_");
}
public void setAmbiguity_(String ambiguity_)
{ getToolParameters().put("ambiguity_", ambiguity_);
}
public String getPlasmid_()
{return getToolParameters().get("plasmid_");
}
public void setPlasmid_(String plasmid_)
{ getToolParameters().put("plasmid_", plasmid_);
}
public String getCommercial_()
{return getToolParameters().get("commercial_");
}
public void setCommercial_(String commercial_)
{ getToolParameters().put("commercial_", commercial_);
}
public String getDatafile_()
{return getToolParameters().get("datafile_");
}
public void setDatafile_(String datafile_)
{ getToolParameters().put("datafile_", datafile_);
}
public String getLimit_()
{return getToolParameters().get("limit_");
}
public void setLimit_(String limit_)
{ getToolParameters().put("limit_", limit_);
}
public String getAlphabetic_()
{return getToolParameters().get("alphabetic_");
}
public void setAlphabetic_(String alphabetic_)
{ getToolParameters().put("alphabetic_", alphabetic_);
}
public String getFragments_()
{return getToolParameters().get("fragments_");
}
public void setFragments_(String fragments_)
{ getToolParameters().put("fragments_", fragments_);
}
public String getName_()
{return getToolParameters().get("name_");
}
public void setName_(String name_)
{ getToolParameters().put("name_", name_);
}
public String getRscore_()
{return getToolParameters().get("rscore_");
}
public void setRscore_(String rscore_)
{ getToolParameters().put("rscore_", rscore_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setSitelen_("4");
setEnzymes_( "all" );
setMin_("1");
setMax_("2000000000");
setSolofragment_("false");
setSingle_("false");
setBlunt_("true");
setSticky_("true");
setAmbiguity_("true");
setPlasmid_("false");
setCommercial_("true");
setLimit_("true");
setAlphabetic_("false");
setFragments_("false");
setName_("false");
}
}
