package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class clearcut extends ToolParameters
{
public String getRuntime_()
{return getToolParameters().get("runtime_");
}
public void setRuntime_(String runtime_)
{ getToolParameters().put("runtime_", runtime_);
}
// file-typed property getters and setters
public Long getInfile_()
{
return getInputDataItemId("infile_");
}
public void setInfile_(Long infile_)
{
setInputDataItem("infile_",infile_);
}
public String getAlignment_or_()
{return getToolParameters().get("alignment_or_");
}
public void setAlignment_or_(String alignment_or_)
{ getToolParameters().put("alignment_or_", alignment_or_);
}
public String getDatatype_is_()
{return getToolParameters().get("datatype_is_");
}
public void setDatatype_is_(String datatype_is_)
{ getToolParameters().put("datatype_is_", datatype_is_);
}
public String getCorr_model_()
{return getToolParameters().get("corr_model_");
}
public void setCorr_model_(String corr_model_)
{ getToolParameters().put("corr_model_", corr_model_);
}
public String getUse_trad_()
{return getToolParameters().get("use_trad_");
}
public void setUse_trad_(String use_trad_)
{ getToolParameters().put("use_trad_", use_trad_);
}
public String getShuff_matrix_()
{return getToolParameters().get("shuff_matrix_");
}
public void setShuff_matrix_(String shuff_matrix_)
{ getToolParameters().put("shuff_matrix_", shuff_matrix_);
}
public String getJoin_det_()
{return getToolParameters().get("join_det_");
}
public void setJoin_det_(String join_det_)
{ getToolParameters().put("join_det_", join_det_);
}
public String getSpec_seed_()
{return getToolParameters().get("spec_seed_");
}
public void setSpec_seed_(String spec_seed_)
{ getToolParameters().put("spec_seed_", spec_seed_);
}
public String getSeed_val_()
{return getToolParameters().get("seed_val_");
}
public void setSeed_val_(String seed_val_)
{ getToolParameters().put("seed_val_", seed_val_);
}
public String getMatrix_out_()
{return getToolParameters().get("matrix_out_");
}
public void setMatrix_out_(String matrix_out_)
{ getToolParameters().put("matrix_out_", matrix_out_);
}
public String getNtrees_out_()
{return getToolParameters().get("ntrees_out_");
}
public void setNtrees_out_(String ntrees_out_)
{ getToolParameters().put("ntrees_out_", ntrees_out_);
}
public String getExp_dist_()
{return getToolParameters().get("exp_dist_");
}
public void setExp_dist_(String exp_dist_)
{ getToolParameters().put("exp_dist_", exp_dist_);
}
public String getExp_brl_()
{return getToolParameters().get("exp_brl_");
}
public void setExp_brl_(String exp_brl_)
{ getToolParameters().put("exp_brl_", exp_brl_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setAlignment_or_("true");
setDatatype_is_( "DNA" );
setCorr_model_( "" );
setUse_trad_("false");
setShuff_matrix_("false");
setJoin_det_("false");
setSpec_seed_("false");
setMatrix_out_("false");
setNtrees_out_("1");
setExp_dist_("false");
setExp_brl_("false");
}
}
