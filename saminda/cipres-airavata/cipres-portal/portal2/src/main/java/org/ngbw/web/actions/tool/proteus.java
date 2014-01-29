package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class proteus extends ToolParameters
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
public String getAnalysis_type_()
{return getToolParameters().get("analysis_type_");
}
public void setAnalysis_type_(String analysis_type_)
{ getToolParameters().put("analysis_type_", analysis_type_);
}
public String getTransmembrane_only_()
{return getToolParameters().get("transmembrane_only_");
}
public void setTransmembrane_only_(String transmembrane_only_)
{ getToolParameters().put("transmembrane_only_", transmembrane_only_);
}
public String getSignalpeptide_org_()
{return getToolParameters().get("signalpeptide_org_");
}
public void setSignalpeptide_org_(String signalpeptide_org_)
{ getToolParameters().put("signalpeptide_org_", signalpeptide_org_);
}
public String getIs_verbose_()
{return getToolParameters().get("is_verbose_");
}
public void setIs_verbose_(String is_verbose_)
{ getToolParameters().put("is_verbose_", is_verbose_);
}
public String getUse_homology_()
{return getToolParameters().get("use_homology_");
}
public void setUse_homology_(String use_homology_)
{ getToolParameters().put("use_homology_", use_homology_);
}
public String getEnergy_min_()
{return getToolParameters().get("energy_min_");
}
public void setEnergy_min_(String energy_min_)
{ getToolParameters().put("energy_min_", energy_min_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setAnalysis_type_( "all" );
setTransmembrane_only_("false");
setSignalpeptide_org_( "1" );
setIs_verbose_("false");
setUse_homology_("false");
setEnergy_min_("false");
}
}
