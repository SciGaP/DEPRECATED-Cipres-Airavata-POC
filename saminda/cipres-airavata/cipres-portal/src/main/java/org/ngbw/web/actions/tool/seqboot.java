package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class seqboot extends ToolParameters
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
public String getInterleaved_()
{return getToolParameters().get("interleaved_");
}
public void setInterleaved_(String interleaved_)
{ getToolParameters().put("interleaved_", interleaved_);
}
public String getData_type_()
{return getToolParameters().get("data_type_");
}
public void setData_type_(String data_type_)
{ getToolParameters().put("data_type_", data_type_);
}
public String getMethod_()
{return getToolParameters().get("method_");
}
public void setMethod_(String method_)
{ getToolParameters().put("method_", method_);
}
public String getSeed_()
{return getToolParameters().get("seed_");
}
public void setSeed_(String seed_)
{ getToolParameters().put("seed_", seed_);
}
public String getReplicates_()
{return getToolParameters().get("replicates_");
}
public void setReplicates_(String replicates_)
{ getToolParameters().put("replicates_", replicates_);
}
public String getAlleles_()
{return getToolParameters().get("alleles_");
}
public void setAlleles_(String alleles_)
{ getToolParameters().put("alleles_", alleles_);
}
public String getPercentage_()
{return getToolParameters().get("percentage_");
}
public void setPercentage_(String percentage_)
{ getToolParameters().put("percentage_", percentage_);
}
public String getBbootstrap_()
{return getToolParameters().get("Bbootstrap_");
}
public void setBbootstrap_(String Bbootstrap_)
{ getToolParameters().put("Bbootstrap_", Bbootstrap_);
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
public String getCategories_()
{return getToolParameters().get("categories_");
}
public void setCategories_(String categories_)
{ getToolParameters().put("categories_", categories_);
}
// file-typed property getters and setters
public Long getCategories_file_()
{
return getInputDataItemId("categories_file_");
}
public void setCategories_file_(Long categories_file_)
{
setInputDataItem("categories_file_",categories_file_);
}
public String getMultiple_weights_()
{return getToolParameters().get("multiple_weights_");
}
public void setMultiple_weights_(String multiple_weights_)
{ getToolParameters().put("multiple_weights_", multiple_weights_);
}
public String getEnzymes_nb_()
{return getToolParameters().get("enzymes_nb_");
}
public void setEnzymes_nb_(String enzymes_nb_)
{ getToolParameters().put("enzymes_nb_", enzymes_nb_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setInterleaved_("true");
setData_type_( "sequence" );
setMethod_( "bootstrap" );
setReplicates_("100");
setAlleles_("false");
setWeights_("false");
setCategories_("false");
setMultiple_weights_("false");
setEnzymes_nb_("true");
}
}
