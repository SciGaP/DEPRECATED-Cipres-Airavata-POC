package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class mfold extends ToolParameters
{
// file-typed property getters and setters
public Long getSEQ_()
{
return getInputDataItemId("SEQ_");
}
public void setSEQ_(Long SEQ_)
{
setInputDataItem("SEQ_",SEQ_);
}
public String getLC_()
{return getToolParameters().get("LC_");
}
public void setLC_(String LC_)
{ getToolParameters().put("LC_", LC_);
}
public String getNA_()
{return getToolParameters().get("NA_");
}
public void setNA_(String NA_)
{ getToolParameters().put("NA_", NA_);
}
public String getT_()
{return getToolParameters().get("T_");
}
public void setT_(String T_)
{ getToolParameters().put("T_", T_);
}
public String getP_()
{return getToolParameters().get("P_");
}
public void setP_(String P_)
{ getToolParameters().put("P_", P_);
}
public String getNA_CONC_()
{return getToolParameters().get("NA_CONC_");
}
public void setNA_CONC_(String NA_CONC_)
{ getToolParameters().put("NA_CONC_", NA_CONC_);
}
public String getMG_CONC_()
{return getToolParameters().get("MG_CONC_");
}
public void setMG_CONC_(String MG_CONC_)
{ getToolParameters().put("MG_CONC_", MG_CONC_);
}
public String getW_()
{return getToolParameters().get("W_");
}
public void setW_(String W_)
{ getToolParameters().put("W_", W_);
}
public String getMAXBP_()
{return getToolParameters().get("MAXBP_");
}
public void setMAXBP_(String MAXBP_)
{ getToolParameters().put("MAXBP_", MAXBP_);
}
public String getMAX_()
{return getToolParameters().get("MAX_");
}
public void setMAX_(String MAX_)
{ getToolParameters().put("MAX_", MAX_);
}
public String getANN_()
{return getToolParameters().get("ANN_");
}
public void setANN_(String ANN_)
{ getToolParameters().put("ANN_", ANN_);
}
public String getMODE_()
{return getToolParameters().get("MODE_");
}
public void setMODE_(String MODE_)
{ getToolParameters().put("MODE_", MODE_);
}
public String getROT_ANG_()
{return getToolParameters().get("ROT_ANG_");
}
public void setROT_ANG_(String ROT_ANG_)
{ getToolParameters().put("ROT_ANG_", ROT_ANG_);
}
public String getSTART_()
{return getToolParameters().get("START_");
}
public void setSTART_(String START_)
{ getToolParameters().put("START_", START_);
}
public String getSTOP_()
{return getToolParameters().get("STOP_");
}
public void setSTOP_(String STOP_)
{ getToolParameters().put("STOP_", STOP_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setLC_( "linear" );
setNA_( "RNA" );
setT_("37");
setP_("5");
setNA_CONC_("1.0");
setMG_CONC_("0.0");
setMAX_("50");
setANN_( "none" );
setMODE_( "auto" );
setROT_ANG_("0");
setSTART_("1");
}
}
