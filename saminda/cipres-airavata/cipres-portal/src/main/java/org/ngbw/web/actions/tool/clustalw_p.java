package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class clustalw_p extends ToolParameters
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
public String getActions_()
{return getToolParameters().get("actions_");
}
public void setActions_(String actions_)
{ getToolParameters().put("actions_", actions_);
}
public String getPhylip_alig_()
{return getToolParameters().get("phylip_alig_");
}
public void setPhylip_alig_(String phylip_alig_)
{ getToolParameters().put("phylip_alig_", phylip_alig_);
}
public String getQuicktree_()
{return getToolParameters().get("quicktree_");
}
public void setQuicktree_(String quicktree_)
{ getToolParameters().put("quicktree_", quicktree_);
}
public String getTypeseq_()
{return getToolParameters().get("typeseq_");
}
public void setTypeseq_(String typeseq_)
{ getToolParameters().put("typeseq_", typeseq_);
}
public String getMatrix_()
{return getToolParameters().get("matrix_");
}
public void setMatrix_(String matrix_)
{ getToolParameters().put("matrix_", matrix_);
}
public String getDnamatrix_()
{return getToolParameters().get("dnamatrix_");
}
public void setDnamatrix_(String dnamatrix_)
{ getToolParameters().put("dnamatrix_", dnamatrix_);
}
public String getGapopen_()
{return getToolParameters().get("gapopen_");
}
public void setGapopen_(String gapopen_)
{ getToolParameters().put("gapopen_", gapopen_);
}
public String getGapext_()
{return getToolParameters().get("gapext_");
}
public void setGapext_(String gapext_)
{ getToolParameters().put("gapext_", gapext_);
}
public String getEndgaps_()
{return getToolParameters().get("endgaps_");
}
public void setEndgaps_(String endgaps_)
{ getToolParameters().put("endgaps_", endgaps_);
}
public String getGapdist_()
{return getToolParameters().get("gapdist_");
}
public void setGapdist_(String gapdist_)
{ getToolParameters().put("gapdist_", gapdist_);
}
public String getPgap_()
{return getToolParameters().get("pgap_");
}
public void setPgap_(String pgap_)
{ getToolParameters().put("pgap_", pgap_);
}
public String getHgap_()
{return getToolParameters().get("hgap_");
}
public void setHgap_(String hgap_)
{ getToolParameters().put("hgap_", hgap_);
}
public String [] getHgapresidues_()
{ String value= getToolParameters().get("hgapresidues_");
return SuperString.valueOf(value,'@').toArray();
}
public void setHgapresidues_(String [] hgapresidues_)
{ String value=SuperString.valueOf(hgapresidues_,'@').toString();
getToolParameters().put("hgapresidues_", value);
}
public String getMaxdiv_()
{return getToolParameters().get("maxdiv_");
}
public void setMaxdiv_(String maxdiv_)
{ getToolParameters().put("maxdiv_", maxdiv_);
}
public String getNegative_()
{return getToolParameters().get("negative_");
}
public void setNegative_(String negative_)
{ getToolParameters().put("negative_", negative_);
}
public String getTransweight_()
{return getToolParameters().get("transweight_");
}
public void setTransweight_(String transweight_)
{ getToolParameters().put("transweight_", transweight_);
}
// file-typed property getters and setters
public Long getUsetree_()
{
return getInputDataItemId("usetree_");
}
public void setUsetree_(Long usetree_)
{
setInputDataItem("usetree_",usetree_);
}
public String getKtuple_()
{return getToolParameters().get("ktuple_");
}
public void setKtuple_(String ktuple_)
{ getToolParameters().put("ktuple_", ktuple_);
}
public String getTopdiags_()
{return getToolParameters().get("topdiags_");
}
public void setTopdiags_(String topdiags_)
{ getToolParameters().put("topdiags_", topdiags_);
}
public String getWindow_()
{return getToolParameters().get("window_");
}
public void setWindow_(String window_)
{ getToolParameters().put("window_", window_);
}
public String getPairgap_()
{return getToolParameters().get("pairgap_");
}
public void setPairgap_(String pairgap_)
{ getToolParameters().put("pairgap_", pairgap_);
}
public String getScore_()
{return getToolParameters().get("score_");
}
public void setScore_(String score_)
{ getToolParameters().put("score_", score_);
}
public String getPwmatrix_()
{return getToolParameters().get("pwmatrix_");
}
public void setPwmatrix_(String pwmatrix_)
{ getToolParameters().put("pwmatrix_", pwmatrix_);
}
public String getPwdnamatrix_()
{return getToolParameters().get("pwdnamatrix_");
}
public void setPwdnamatrix_(String pwdnamatrix_)
{ getToolParameters().put("pwdnamatrix_", pwdnamatrix_);
}
public String getPwgapopen_()
{return getToolParameters().get("pwgapopen_");
}
public void setPwgapopen_(String pwgapopen_)
{ getToolParameters().put("pwgapopen_", pwgapopen_);
}
public String getPwgapext_()
{return getToolParameters().get("pwgapext_");
}
public void setPwgapext_(String pwgapext_)
{ getToolParameters().put("pwgapext_", pwgapext_);
}
public String getKimura_()
{return getToolParameters().get("kimura_");
}
public void setKimura_(String kimura_)
{ getToolParameters().put("kimura_", kimura_);
}
public String getTossgaps_()
{return getToolParameters().get("tossgaps_");
}
public void setTossgaps_(String tossgaps_)
{ getToolParameters().put("tossgaps_", tossgaps_);
}
public String getBootstrap_()
{return getToolParameters().get("bootstrap_");
}
public void setBootstrap_(String bootstrap_)
{ getToolParameters().put("bootstrap_", bootstrap_);
}
public String getBootlabels_()
{return getToolParameters().get("bootlabels_");
}
public void setBootlabels_(String bootlabels_)
{ getToolParameters().put("bootlabels_", bootlabels_);
}
public String getSeed_()
{return getToolParameters().get("seed_");
}
public void setSeed_(String seed_)
{ getToolParameters().put("seed_", seed_);
}
public String getOutputtree_()
{return getToolParameters().get("outputtree_");
}
public void setOutputtree_(String outputtree_)
{ getToolParameters().put("outputtree_", outputtree_);
}
public String getOutput_()
{return getToolParameters().get("output_");
}
public void setOutput_(String output_)
{ getToolParameters().put("output_", output_);
}
public String getGde_lower_()
{return getToolParameters().get("gde_lower_");
}
public void setGde_lower_(String gde_lower_)
{ getToolParameters().put("gde_lower_", gde_lower_);
}
public String getOutorder_()
{return getToolParameters().get("outorder_");
}
public void setOutorder_(String outorder_)
{ getToolParameters().put("outorder_", outorder_);
}
public String getSeqnos_()
{return getToolParameters().get("seqnos_");
}
public void setSeqnos_(String seqnos_)
{ getToolParameters().put("seqnos_", seqnos_);
}
// file-typed property getters and setters
public Long getProfile1_()
{
return getInputDataItemId("profile1_");
}
public void setProfile1_(Long profile1_)
{
setInputDataItem("profile1_",profile1_);
}
// file-typed property getters and setters
public Long getProfile2_()
{
return getInputDataItemId("profile2_");
}
public void setProfile2_(Long profile2_)
{
setInputDataItem("profile2_",profile2_);
}
// file-typed property getters and setters
public Long getUsetree1_()
{
return getInputDataItemId("usetree1_");
}
public void setUsetree1_(Long usetree1_)
{
setInputDataItem("usetree1_",usetree1_);
}
// file-typed property getters and setters
public Long getUsetree2_()
{
return getInputDataItemId("usetree2_");
}
public void setUsetree2_(Long usetree2_)
{
setInputDataItem("usetree2_",usetree2_);
}
public String getNosecstr1_()
{return getToolParameters().get("nosecstr1_");
}
public void setNosecstr1_(String nosecstr1_)
{ getToolParameters().put("nosecstr1_", nosecstr1_);
}
public String getNosecstr2_()
{return getToolParameters().get("nosecstr2_");
}
public void setNosecstr2_(String nosecstr2_)
{ getToolParameters().put("nosecstr2_", nosecstr2_);
}
public String getHelixgap_()
{return getToolParameters().get("helixgap_");
}
public void setHelixgap_(String helixgap_)
{ getToolParameters().put("helixgap_", helixgap_);
}
public String getStrandgap_()
{return getToolParameters().get("strandgap_");
}
public void setStrandgap_(String strandgap_)
{ getToolParameters().put("strandgap_", strandgap_);
}
public String getLoopgap_()
{return getToolParameters().get("loopgap_");
}
public void setLoopgap_(String loopgap_)
{ getToolParameters().put("loopgap_", loopgap_);
}
public String getTerminalgap_()
{return getToolParameters().get("terminalgap_");
}
public void setTerminalgap_(String terminalgap_)
{ getToolParameters().put("terminalgap_", terminalgap_);
}
public String getHelixendin_()
{return getToolParameters().get("helixendin_");
}
public void setHelixendin_(String helixendin_)
{ getToolParameters().put("helixendin_", helixendin_);
}
public String getHelixendout_()
{return getToolParameters().get("helixendout_");
}
public void setHelixendout_(String helixendout_)
{ getToolParameters().put("helixendout_", helixendout_);
}
public String getStrandendin_()
{return getToolParameters().get("strandendin_");
}
public void setStrandendin_(String strandendin_)
{ getToolParameters().put("strandendin_", strandendin_);
}
public String getStrandendout_()
{return getToolParameters().get("strandendout_");
}
public void setStrandendout_(String strandendout_)
{ getToolParameters().put("strandendout_", strandendout_);
}
public String getSecstrout_()
{return getToolParameters().get("secstrout_");
}
public void setSecstrout_(String secstrout_)
{ getToolParameters().put("secstrout_", secstrout_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setActions_( "-align" );
setPhylip_alig_("false");
setQuicktree_( "slow" );
setMatrix_( "gonnet" );
setDnamatrix_( "iub" );
setGapopen_("10");
setGapext_("0.20");
setEndgaps_("true");
setGapdist_("8");
setPgap_("true");
setHgap_("true");
setHgapresidues_(new String[]{"G", "P", "S", "N", "D", "Q", "E", "K", "R" });
setMaxdiv_("30");
setNegative_("false");
setTransweight_("0.5");
setKtuple_("1");
setTopdiags_("5");
setWindow_("5");
setPairgap_("3.00");
setPwmatrix_( "gonnet" );
setPwdnamatrix_( "iub" );
setPwgapopen_("10.00");
setPwgapext_("0.10");
setKimura_("false");
setTossgaps_("false");
setBootstrap_("1000");
setBootlabels_( "node" );
setOutputtree_( "PHYLIP" );
setOutput_( "");
setOutorder_( "aligned" );
setSeqnos_("false");
setNosecstr1_("true");
setNosecstr2_("true");
setHelixgap_("4");
setStrandgap_("4");
setLoopgap_("1");
setTerminalgap_("2");
setHelixendin_("3");
setHelixendout_("0");
setStrandendin_("1");
setStrandendout_("1");
setSecstrout_( "STRUCTURE" );
}
}
