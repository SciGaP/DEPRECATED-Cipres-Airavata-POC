package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class dnadist extends ToolParameters
{
// file-typed property getters and setters
public Long getInfile_()
{
return getInputDataItemId("infile_");
}
public void setInfile_(Long infile_)
{
setInputDataItem("infile_",infile_);
}
public String getInterleavedinfile_()
{return getToolParameters().get("interleavedinfile_");
}
public void setInterleavedinfile_(String interleavedinfile_)
{ getToolParameters().put("interleavedinfile_", interleavedinfile_);
}
public String getPrintdata_()
{return getToolParameters().get("printdata_");
}
public void setPrintdata_(String printdata_)
{ getToolParameters().put("printdata_", printdata_);
}
public String getDistance_()
{return getToolParameters().get("distance_");
}
public void setDistance_(String distance_)
{ getToolParameters().put("distance_", distance_);
}
public String getRatio_()
{return getToolParameters().get("ratio_");
}
public void setRatio_(String ratio_)
{ getToolParameters().put("ratio_", ratio_);
}
public String getGamma_()
{return getToolParameters().get("gamma_");
}
public void setGamma_(String gamma_)
{ getToolParameters().put("gamma_", gamma_);
}
public String getVariation_coeff_()
{return getToolParameters().get("variation_coeff_");
}
public void setVariation_coeff_(String variation_coeff_)
{ getToolParameters().put("variation_coeff_", variation_coeff_);
}
public String getInvariant_sites_()
{return getToolParameters().get("invariant_sites_");
}
public void setInvariant_sites_(String invariant_sites_)
{ getToolParameters().put("invariant_sites_", invariant_sites_);
}
public String getEmpirical_frequencies_()
{return getToolParameters().get("empirical_frequencies_");
}
public void setEmpirical_frequencies_(String empirical_frequencies_)
{ getToolParameters().put("empirical_frequencies_", empirical_frequencies_);
}
public String getBase_frequencies_()
{return getToolParameters().get("base_frequencies_");
}
public void setBase_frequencies_(String base_frequencies_)
{ getToolParameters().put("base_frequencies_", base_frequencies_);
}
public String getOne_category_()
{return getToolParameters().get("one_category_");
}
public void setOne_category_(String one_category_)
{ getToolParameters().put("one_category_", one_category_);
}
public String getN_categ_()
{return getToolParameters().get("n_categ_");
}
public void setN_categ_(String n_categ_)
{ getToolParameters().put("n_categ_", n_categ_);
}
public String getCateg_rates_()
{return getToolParameters().get("categ_rates_");
}
public void setCateg_rates_(String categ_rates_)
{ getToolParameters().put("categ_rates_", categ_rates_);
}
// file-typed property getters and setters
public Long getCateg_file_()
{
return getInputDataItemId("categ_file_");
}
public void setCateg_file_(Long categ_file_)
{
setInputDataItem("categ_file_",categ_file_);
}
public String getWeights_()
{return getToolParameters().get("weights_");
}
public void setWeights_(String weights_)
{ getToolParameters().put("weights_", weights_);
}
// file-typed property getters and setters
public Long getWeights_file_()
{
return getInputDataItemId("weights_file_");
}
public void setWeights_file_(Long weights_file_)
{
setInputDataItem("weights_file_",weights_file_);
}
public String getMultiple_dataset_()
{return getToolParameters().get("multiple_dataset_");
}
public void setMultiple_dataset_(String multiple_dataset_)
{ getToolParameters().put("multiple_dataset_", multiple_dataset_);
}
public String getWeightsordata_()
{return getToolParameters().get("weightsordata_");
}
public void setWeightsordata_(String weightsordata_)
{ getToolParameters().put("weightsordata_", weightsordata_);
}
public String getDatasets_nb_()
{return getToolParameters().get("datasets_nb_");
}
public void setDatasets_nb_(String datasets_nb_)
{ getToolParameters().put("datasets_nb_", datasets_nb_);
}
public String getMatrix_form_()
{return getToolParameters().get("matrix_form_");
}
public void setMatrix_form_(String matrix_form_)
{ getToolParameters().put("matrix_form_", matrix_form_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setInterleavedinfile_( "yes" );
setPrintdata_("false");
setDistance_( "F84" );
setRatio_("2.0");
setGamma_( "0" );
setEmpirical_frequencies_("true");
setOne_category_("true");
setMultiple_dataset_("false");
setWeightsordata_( "data" );
setMatrix_form_("false");
}
}
