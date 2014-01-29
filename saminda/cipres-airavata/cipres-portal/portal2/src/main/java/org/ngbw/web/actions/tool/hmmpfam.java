package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class hmmpfam extends ToolParameters
{
// file-typed property getters and setters
public Long getSeqfile_()
{
return getInputDataItemId("seqfile_");
}
public void setSeqfile_(Long seqfile_)
{
setInputDataItem("seqfile_",seqfile_);
}
public String getHMMDB_()
{return getToolParameters().get("HMMDB_");
}
public void setHMMDB_(String HMMDB_)
{ getToolParameters().put("HMMDB_", HMMDB_);
}
public String getN_best_()
{return getToolParameters().get("n_best_");
}
public void setN_best_(String n_best_)
{ getToolParameters().put("n_best_", n_best_);
}
public String getE_value_cutoff_()
{return getToolParameters().get("E_value_cutoff_");
}
public void setE_value_cutoff_(String E_value_cutoff_)
{ getToolParameters().put("E_value_cutoff_", E_value_cutoff_);
}
public String getBit_cutoff_()
{return getToolParameters().get("Bit_cutoff_");
}
public void setBit_cutoff_(String Bit_cutoff_)
{ getToolParameters().put("Bit_cutoff_", Bit_cutoff_);
}
public String getE_value_calculation_()
{return getToolParameters().get("E_value_calculation_");
}
public void setE_value_calculation_(String E_value_calculation_)
{ getToolParameters().put("E_value_calculation_", E_value_calculation_);
}
public String getAcc_()
{return getToolParameters().get("acc_");
}
public void setAcc_(String acc_)
{ getToolParameters().put("acc_", acc_);
}
public String getCompat_()
{return getToolParameters().get("compat_");
}
public void setCompat_(String compat_)
{ getToolParameters().put("compat_", compat_);
}
public String getDomE_()
{return getToolParameters().get("domE_");
}
public void setDomE_(String domE_)
{ getToolParameters().put("domE_", domE_);
}
public String getDomT_()
{return getToolParameters().get("domT_");
}
public void setDomT_(String domT_)
{ getToolParameters().put("domT_", domT_);
}
public String getForward_()
{return getToolParameters().get("forward_");
}
public void setForward_(String forward_)
{ getToolParameters().put("forward_", forward_);
}
public String getNull2_()
{return getToolParameters().get("null2_");
}
public void setNull2_(String null2_)
{ getToolParameters().put("null2_", null2_);
}
public String getXnu_()
{return getToolParameters().get("xnu_");
}
public void setXnu_(String xnu_)
{ getToolParameters().put("xnu_", xnu_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setHMMDB_( "Pfam_ls" );
setE_value_cutoff_("10.0");
}
}
