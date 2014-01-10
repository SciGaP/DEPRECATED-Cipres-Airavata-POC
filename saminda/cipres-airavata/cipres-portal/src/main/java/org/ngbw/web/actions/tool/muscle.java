package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class muscle extends ToolParameters
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
public String getData_type_()
{return getToolParameters().get("data_type_");
}
public void setData_type_(String data_type_)
{ getToolParameters().put("data_type_", data_type_);
}
public String getStable_()
{return getToolParameters().get("stable_");
}
public void setStable_(String stable_)
{ getToolParameters().put("stable_", stable_);
}
public String getMake_scorefile_()
{return getToolParameters().get("make_scorefile_");
}
public void setMake_scorefile_(String make_scorefile_)
{ getToolParameters().put("make_scorefile_", make_scorefile_);
}
public String getClusteronly_()
{return getToolParameters().get("clusteronly_");
}
public void setClusteronly_(String clusteronly_)
{ getToolParameters().put("clusteronly_", clusteronly_);
}
public String getClusteronlymaxiters_()
{return getToolParameters().get("clusteronlymaxiters_");
}
public void setClusteronlymaxiters_(String clusteronlymaxiters_)
{ getToolParameters().put("clusteronlymaxiters_", clusteronlymaxiters_);
}
public String getMaxiterations_()
{return getToolParameters().get("maxiterations_");
}
public void setMaxiterations_(String maxiterations_)
{ getToolParameters().put("maxiterations_", maxiterations_);
}
public String getMax_mem_()
{return getToolParameters().get("max_mem_");
}
public void setMax_mem_(String max_mem_)
{ getToolParameters().put("max_mem_", max_mem_);
}
public String getProtprofilefunction_()
{return getToolParameters().get("protprofilefunction_");
}
public void setProtprofilefunction_(String protprofilefunction_)
{ getToolParameters().put("protprofilefunction_", protprofilefunction_);
}
public String getHydrowindow_()
{return getToolParameters().get("hydrowindow_");
}
public void setHydrowindow_(String hydrowindow_)
{ getToolParameters().put("hydrowindow_", hydrowindow_);
}
public String getHydrofactormultiplier_()
{return getToolParameters().get("hydrofactormultiplier_");
}
public void setHydrofactormultiplier_(String hydrofactormultiplier_)
{ getToolParameters().put("hydrofactormultiplier_", hydrofactormultiplier_);
}
public String getLogfile_()
{return getToolParameters().get("logfile_");
}
public void setLogfile_(String logfile_)
{ getToolParameters().put("logfile_", logfile_);
}
public String getVerboselogfile_()
{return getToolParameters().get("verboselogfile_");
}
public void setVerboselogfile_(String verboselogfile_)
{ getToolParameters().put("verboselogfile_", verboselogfile_);
}
public String getAdd_matrix_()
{return getToolParameters().get("add_matrix_");
}
public void setAdd_matrix_(String add_matrix_)
{ getToolParameters().put("add_matrix_", add_matrix_);
}
// file-typed property getters and setters
public Long getMymatrix_()
{
return getInputDataItemId("mymatrix_");
}
public void setMymatrix_(Long mymatrix_)
{
setInputDataItem("mymatrix_",mymatrix_);
}
public String getGpopen_()
{return getToolParameters().get("gpopen_");
}
public void setGpopen_(String gpopen_)
{ getToolParameters().put("gpopen_", gpopen_);
}
public String getGpextend_()
{return getToolParameters().get("gpextend_");
}
public void setGpextend_(String gpextend_)
{ getToolParameters().put("gpextend_", gpextend_);
}
public String getCtr_()
{return getToolParameters().get("ctr_");
}
public void setCtr_(String ctr_)
{ getToolParameters().put("ctr_", ctr_);
}
public String getUse_diags_()
{return getToolParameters().get("use_diags_");
}
public void setUse_diags_(String use_diags_)
{ getToolParameters().put("use_diags_", use_diags_);
}
public String [] getDiagfunction_()
{ String value= getToolParameters().get("diagfunction_");
return SuperString.valueOf(value,'@').toArray();
}
public void setDiagfunction_(String [] diagfunction_)
{ String value=SuperString.valueOf(diagfunction_,'@').toString();
getToolParameters().put("diagfunction_", value);
}
public String getMaxdiagdist_()
{return getToolParameters().get("maxdiagdist_");
}
public void setMaxdiagdist_(String maxdiagdist_)
{ getToolParameters().put("maxdiagdist_", maxdiagdist_);
}
public String getMindiaglength_()
{return getToolParameters().get("mindiaglength_");
}
public void setMindiaglength_(String mindiaglength_)
{ getToolParameters().put("mindiaglength_", mindiaglength_);
}
public String getDiagmarginpos_()
{return getToolParameters().get("diagmarginpos_");
}
public void setDiagmarginpos_(String diagmarginpos_)
{ getToolParameters().put("diagmarginpos_", diagmarginpos_);
}
public String getUse_guide_tree_()
{return getToolParameters().get("use_guide_tree_");
}
public void setUse_guide_tree_(String use_guide_tree_)
{ getToolParameters().put("use_guide_tree_", use_guide_tree_);
}
// file-typed property getters and setters
public Long getGuidetree_()
{
return getInputDataItemId("guidetree_");
}
public void setGuidetree_(Long guidetree_)
{
setInputDataItem("guidetree_",guidetree_);
}
public String getMake_tree1file_()
{return getToolParameters().get("make_tree1file_");
}
public void setMake_tree1file_(String make_tree1file_)
{ getToolParameters().put("make_tree1file_", make_tree1file_);
}
public String getMake_tree2file_()
{return getToolParameters().get("make_tree2file_");
}
public void setMake_tree2file_(String make_tree2file_)
{ getToolParameters().put("make_tree2file_", make_tree2file_);
}
public String getUse_weights_1_()
{return getToolParameters().get("use_weights_1_");
}
public void setUse_weights_1_(String use_weights_1_)
{ getToolParameters().put("use_weights_1_", use_weights_1_);
}
public String getWeight1_()
{return getToolParameters().get("weight1_");
}
public void setWeight1_(String weight1_)
{ getToolParameters().put("weight1_", weight1_);
}
public String getDistance1p_()
{return getToolParameters().get("distance1p_");
}
public void setDistance1p_(String distance1p_)
{ getToolParameters().put("distance1p_", distance1p_);
}
public String getCluster1_()
{return getToolParameters().get("cluster1_");
}
public void setCluster1_(String cluster1_)
{ getToolParameters().put("cluster1_", cluster1_);
}
public String getSueff1_()
{return getToolParameters().get("sueff1_");
}
public void setSueff1_(String sueff1_)
{ getToolParameters().put("sueff1_", sueff1_);
}
public String getRoot1_()
{return getToolParameters().get("root1_");
}
public void setRoot1_(String root1_)
{ getToolParameters().put("root1_", root1_);
}
public String getMaxtrees_()
{return getToolParameters().get("maxtrees_");
}
public void setMaxtrees_(String maxtrees_)
{ getToolParameters().put("maxtrees_", maxtrees_);
}
public String getUse_weights_2_()
{return getToolParameters().get("use_weights_2_");
}
public void setUse_weights_2_(String use_weights_2_)
{ getToolParameters().put("use_weights_2_", use_weights_2_);
}
public String getWeight2_()
{return getToolParameters().get("weight2_");
}
public void setWeight2_(String weight2_)
{ getToolParameters().put("weight2_", weight2_);
}
public String getDistance2_()
{return getToolParameters().get("distance2_");
}
public void setDistance2_(String distance2_)
{ getToolParameters().put("distance2_", distance2_);
}
public String getCluster2_()
{return getToolParameters().get("cluster2_");
}
public void setCluster2_(String cluster2_)
{ getToolParameters().put("cluster2_", cluster2_);
}
public String getSueff2_()
{return getToolParameters().get("sueff2_");
}
public void setSueff2_(String sueff2_)
{ getToolParameters().put("sueff2_", sueff2_);
}
public String getRoot2_()
{return getToolParameters().get("root2_");
}
public void setRoot2_(String root2_)
{ getToolParameters().put("root2_", root2_);
}
public String getObjectivescore_()
{return getToolParameters().get("objectivescore_");
}
public void setObjectivescore_(String objectivescore_)
{ getToolParameters().put("objectivescore_", objectivescore_);
}
public String getAnchor_()
{return getToolParameters().get("anchor_");
}
public void setAnchor_(String anchor_)
{ getToolParameters().put("anchor_", anchor_);
}
public String getMinanchorcolumnspacing_()
{return getToolParameters().get("minanchorcolumnspacing_");
}
public void setMinanchorcolumnspacing_(String minanchorcolumnspacing_)
{ getToolParameters().put("minanchorcolumnspacing_", minanchorcolumnspacing_);
}
public String getMinanchorcolumnscore_()
{return getToolParameters().get("minanchorcolumnscore_");
}
public void setMinanchorcolumnscore_(String minanchorcolumnscore_)
{ getToolParameters().put("minanchorcolumnscore_", minanchorcolumnscore_);
}
public String getMinsmoothanchorscore_()
{return getToolParameters().get("minsmoothanchorscore_");
}
public void setMinsmoothanchorscore_(String minsmoothanchorscore_)
{ getToolParameters().put("minsmoothanchorscore_", minsmoothanchorscore_);
}
public String getAnchorsmoothingwindow_()
{return getToolParameters().get("anchorsmoothingwindow_");
}
public void setAnchorsmoothingwindow_(String anchorsmoothingwindow_)
{ getToolParameters().put("anchorsmoothingwindow_", anchorsmoothingwindow_);
}
public String getOutput_fasta_()
{return getToolParameters().get("output_fasta_");
}
public void setOutput_fasta_(String output_fasta_)
{ getToolParameters().put("output_fasta_", output_fasta_);
}
public String getOutput_clustal_()
{return getToolParameters().get("output_clustal_");
}
public void setOutput_clustal_(String output_clustal_)
{ getToolParameters().put("output_clustal_", output_clustal_);
}
public String getOutput_clustals_()
{return getToolParameters().get("output_clustals_");
}
public void setOutput_clustals_(String output_clustals_)
{ getToolParameters().put("output_clustals_", output_clustals_);
}
public String getOutput_html_()
{return getToolParameters().get("output_html_");
}
public void setOutput_html_(String output_html_)
{ getToolParameters().put("output_html_", output_html_);
}
public String getOutput_gcg_()
{return getToolParameters().get("output_gcg_");
}
public void setOutput_gcg_(String output_gcg_)
{ getToolParameters().put("output_gcg_", output_gcg_);
}
public String getOutput_phyi_()
{return getToolParameters().get("output_phyi_");
}
public void setOutput_phyi_(String output_phyi_)
{ getToolParameters().put("output_phyi_", output_phyi_);
}
public String getOutput_phys_()
{return getToolParameters().get("output_phys_");
}
public void setOutput_phys_(String output_phys_)
{ getToolParameters().put("output_phys_", output_phys_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setRuntime_("1.0");
setData_type_( "auto" );
setStable_("false");
setMake_scorefile_("false");
setClusteronly_("false");
setClusteronlymaxiters_("1");
setMaxiterations_("16");
setMax_mem_("30000000");
setHydrowindow_("5");
setHydrofactormultiplier_("1.2");
setLogfile_("true");
setVerboselogfile_("false");
setAdd_matrix_("false");
setCtr_("0");
setUse_diags_("false");
setDiagfunction_(new String[]{"-diags" });
setMaxdiagdist_("1");
setMindiaglength_("24");
setDiagmarginpos_("5");
setUse_weights_1_("false");
setWeight1_( "clustalw" );
setDistance1p_( "kmer6_6 " );
setCluster1_( "upgmb" );
setSueff1_("0.1");
setRoot1_( "pseudo" );
setMaxtrees_("1");
setUse_weights_2_("false");
setWeight2_( "clustalw" );
setDistance2_( "pctid_kimura" );
setCluster2_( "upgmb" );
setSueff2_("0.1");
setRoot2_( "pseudo" );
setObjectivescore_( "sp" );
setAnchor_("false");
setMinanchorcolumnspacing_("32");
setMinanchorcolumnscore_("1");
setMinsmoothanchorscore_("1");
setAnchorsmoothingwindow_("7");
setOutput_fasta_("false");
setOutput_clustal_("true");
setOutput_clustals_("false");
setOutput_html_("false");
setOutput_gcg_("false");
setOutput_phyi_("false");
setOutput_phys_("false");
}
}
