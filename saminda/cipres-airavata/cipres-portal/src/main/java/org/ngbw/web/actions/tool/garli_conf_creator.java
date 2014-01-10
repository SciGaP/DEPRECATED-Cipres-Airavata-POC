package org.ngbw.web.actions.tool;
import org.ngbw.sdk.common.util.SuperString;
import org.ngbw.web.actions.ToolParameters;
@SuppressWarnings("serial")
public class garli_conf_creator extends ToolParameters
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
public String getIs_partitioned_()
{return getToolParameters().get("is_partitioned_");
}
public void setIs_partitioned_(String is_partitioned_)
{ getToolParameters().put("is_partitioned_", is_partitioned_);
}
public String getLinkmodels_()
{return getToolParameters().get("linkmodels_");
}
public void setLinkmodels_(String linkmodels_)
{ getToolParameters().put("linkmodels_", linkmodels_);
}
public String getConfigure_partitions_()
{return getToolParameters().get("configure_partitions_");
}
public void setConfigure_partitions_(String configure_partitions_)
{ getToolParameters().put("configure_partitions_", configure_partitions_);
}
public String getNumparts_()
{return getToolParameters().get("numparts_");
}
public void setNumparts_(String numparts_)
{ getToolParameters().put("numparts_", numparts_);
}
public String getSubsetspecificrates_()
{return getToolParameters().get("subsetspecificrates_");
}
public void setSubsetspecificrates_(String subsetspecificrates_)
{ getToolParameters().put("subsetspecificrates_", subsetspecificrates_);
}
public String getDatatype_value_()
{return getToolParameters().get("datatype_value_");
}
public void setDatatype_value_(String datatype_value_)
{ getToolParameters().put("datatype_value_", datatype_value_);
}
public String getGeneticcode_value_()
{return getToolParameters().get("geneticcode_value_");
}
public void setGeneticcode_value_(String geneticcode_value_)
{ getToolParameters().put("geneticcode_value_", geneticcode_value_);
}
public String getD_ratematrix_()
{return getToolParameters().get("d_ratematrix_");
}
public void setD_ratematrix_(String d_ratematrix_)
{ getToolParameters().put("d_ratematrix_", d_ratematrix_);
}
public String getACsubrates_()
{return getToolParameters().get("ACsubrates_");
}
public void setACsubrates_(String ACsubrates_)
{ getToolParameters().put("ACsubrates_", ACsubrates_);
}
public String getAGsubrates_()
{return getToolParameters().get("AGsubrates_");
}
public void setAGsubrates_(String AGsubrates_)
{ getToolParameters().put("AGsubrates_", AGsubrates_);
}
public String getATsubrates_()
{return getToolParameters().get("ATsubrates_");
}
public void setATsubrates_(String ATsubrates_)
{ getToolParameters().put("ATsubrates_", ATsubrates_);
}
public String getCGsubrates_()
{return getToolParameters().get("CGsubrates_");
}
public void setCGsubrates_(String CGsubrates_)
{ getToolParameters().put("CGsubrates_", CGsubrates_);
}
public String getCTsubrates_()
{return getToolParameters().get("CTsubrates_");
}
public void setCTsubrates_(String CTsubrates_)
{ getToolParameters().put("CTsubrates_", CTsubrates_);
}
public String getGTsubrates_()
{return getToolParameters().get("GTsubrates_");
}
public void setGTsubrates_(String GTsubrates_)
{ getToolParameters().put("GTsubrates_", GTsubrates_);
}
public String getD_statefrequencies_()
{return getToolParameters().get("d_statefrequencies_");
}
public void setD_statefrequencies_(String d_statefrequencies_)
{ getToolParameters().put("d_statefrequencies_", d_statefrequencies_);
}
public String getD_invariantsites_()
{return getToolParameters().get("d_invariantsites_");
}
public void setD_invariantsites_(String d_invariantsites_)
{ getToolParameters().put("d_invariantsites_", d_invariantsites_);
}
public String getD_ratehetmodel_()
{return getToolParameters().get("d_ratehetmodel_");
}
public void setD_ratehetmodel_(String d_ratehetmodel_)
{ getToolParameters().put("d_ratehetmodel_", d_ratehetmodel_);
}
public String getD_numratecats_()
{return getToolParameters().get("d_numratecats_");
}
public void setD_numratecats_(String d_numratecats_)
{ getToolParameters().put("d_numratecats_", d_numratecats_);
}
public String getP_ratematrix_()
{return getToolParameters().get("p_ratematrix_");
}
public void setP_ratematrix_(String p_ratematrix_)
{ getToolParameters().put("p_ratematrix_", p_ratematrix_);
}
public String getP_statefrequencies_()
{return getToolParameters().get("p_statefrequencies_");
}
public void setP_statefrequencies_(String p_statefrequencies_)
{ getToolParameters().put("p_statefrequencies_", p_statefrequencies_);
}
public String getP_invariantsites_()
{return getToolParameters().get("p_invariantsites_");
}
public void setP_invariantsites_(String p_invariantsites_)
{ getToolParameters().put("p_invariantsites_", p_invariantsites_);
}
public String getP_ratehetmodel_()
{return getToolParameters().get("p_ratehetmodel_");
}
public void setP_ratehetmodel_(String p_ratehetmodel_)
{ getToolParameters().put("p_ratehetmodel_", p_ratehetmodel_);
}
public String getP_numratecats_()
{return getToolParameters().get("p_numratecats_");
}
public void setP_numratecats_(String p_numratecats_)
{ getToolParameters().put("p_numratecats_", p_numratecats_);
}
public String getC_ratematrix_()
{return getToolParameters().get("c_ratematrix_");
}
public void setC_ratematrix_(String c_ratematrix_)
{ getToolParameters().put("c_ratematrix_", c_ratematrix_);
}
public String getC_statefrequencies_()
{return getToolParameters().get("c_statefrequencies_");
}
public void setC_statefrequencies_(String c_statefrequencies_)
{ getToolParameters().put("c_statefrequencies_", c_statefrequencies_);
}
public String getC_ratehetmodel_()
{return getToolParameters().get("c_ratehetmodel_");
}
public void setC_ratehetmodel_(String c_ratehetmodel_)
{ getToolParameters().put("c_ratehetmodel_", c_ratehetmodel_);
}
public String getC_numratecats_()
{return getToolParameters().get("c_numratecats_");
}
public void setC_numratecats_(String c_numratecats_)
{ getToolParameters().put("c_numratecats_", c_numratecats_);
}
public String getDatatype_value1_()
{return getToolParameters().get("datatype_value1_");
}
public void setDatatype_value1_(String datatype_value1_)
{ getToolParameters().put("datatype_value1_", datatype_value1_);
}
public String getGeneticcode_value1_()
{return getToolParameters().get("geneticcode_value1_");
}
public void setGeneticcode_value1_(String geneticcode_value1_)
{ getToolParameters().put("geneticcode_value1_", geneticcode_value1_);
}
public String getD_ratematrix1_()
{return getToolParameters().get("d_ratematrix1_");
}
public void setD_ratematrix1_(String d_ratematrix1_)
{ getToolParameters().put("d_ratematrix1_", d_ratematrix1_);
}
public String getACsubrates1_()
{return getToolParameters().get("ACsubrates1_");
}
public void setACsubrates1_(String ACsubrates1_)
{ getToolParameters().put("ACsubrates1_", ACsubrates1_);
}
public String getAGsubrates1_()
{return getToolParameters().get("AGsubrates1_");
}
public void setAGsubrates1_(String AGsubrates1_)
{ getToolParameters().put("AGsubrates1_", AGsubrates1_);
}
public String getATsubrates1_()
{return getToolParameters().get("ATsubrates1_");
}
public void setATsubrates1_(String ATsubrates1_)
{ getToolParameters().put("ATsubrates1_", ATsubrates1_);
}
public String getCGsubrates1_()
{return getToolParameters().get("CGsubrates1_");
}
public void setCGsubrates1_(String CGsubrates1_)
{ getToolParameters().put("CGsubrates1_", CGsubrates1_);
}
public String getCTsubrates1_()
{return getToolParameters().get("CTsubrates1_");
}
public void setCTsubrates1_(String CTsubrates1_)
{ getToolParameters().put("CTsubrates1_", CTsubrates1_);
}
public String getGTsubrates1_()
{return getToolParameters().get("GTsubrates1_");
}
public void setGTsubrates1_(String GTsubrates1_)
{ getToolParameters().put("GTsubrates1_", GTsubrates1_);
}
public String getD_statefrequencies1_()
{return getToolParameters().get("d_statefrequencies1_");
}
public void setD_statefrequencies1_(String d_statefrequencies1_)
{ getToolParameters().put("d_statefrequencies1_", d_statefrequencies1_);
}
public String getD_invariantsites1_()
{return getToolParameters().get("d_invariantsites1_");
}
public void setD_invariantsites1_(String d_invariantsites1_)
{ getToolParameters().put("d_invariantsites1_", d_invariantsites1_);
}
public String getD_ratehetmodel1_()
{return getToolParameters().get("d_ratehetmodel1_");
}
public void setD_ratehetmodel1_(String d_ratehetmodel1_)
{ getToolParameters().put("d_ratehetmodel1_", d_ratehetmodel1_);
}
public String getD_numratecats1_()
{return getToolParameters().get("d_numratecats1_");
}
public void setD_numratecats1_(String d_numratecats1_)
{ getToolParameters().put("d_numratecats1_", d_numratecats1_);
}
public String getP_ratematrix1_()
{return getToolParameters().get("p_ratematrix1_");
}
public void setP_ratematrix1_(String p_ratematrix1_)
{ getToolParameters().put("p_ratematrix1_", p_ratematrix1_);
}
public String getP_statefrequencies1_()
{return getToolParameters().get("p_statefrequencies1_");
}
public void setP_statefrequencies1_(String p_statefrequencies1_)
{ getToolParameters().put("p_statefrequencies1_", p_statefrequencies1_);
}
public String getP_invariantsites1_()
{return getToolParameters().get("p_invariantsites1_");
}
public void setP_invariantsites1_(String p_invariantsites1_)
{ getToolParameters().put("p_invariantsites1_", p_invariantsites1_);
}
public String getP_ratehetmodel1_()
{return getToolParameters().get("p_ratehetmodel1_");
}
public void setP_ratehetmodel1_(String p_ratehetmodel1_)
{ getToolParameters().put("p_ratehetmodel1_", p_ratehetmodel1_);
}
public String getP_numratecats1_()
{return getToolParameters().get("p_numratecats1_");
}
public void setP_numratecats1_(String p_numratecats1_)
{ getToolParameters().put("p_numratecats1_", p_numratecats1_);
}
public String getC_ratematrix1_()
{return getToolParameters().get("c_ratematrix1_");
}
public void setC_ratematrix1_(String c_ratematrix1_)
{ getToolParameters().put("c_ratematrix1_", c_ratematrix1_);
}
public String getC_statefrequencies1_()
{return getToolParameters().get("c_statefrequencies1_");
}
public void setC_statefrequencies1_(String c_statefrequencies1_)
{ getToolParameters().put("c_statefrequencies1_", c_statefrequencies1_);
}
public String getC_ratehetmodel1_()
{return getToolParameters().get("c_ratehetmodel1_");
}
public void setC_ratehetmodel1_(String c_ratehetmodel1_)
{ getToolParameters().put("c_ratehetmodel1_", c_ratehetmodel1_);
}
public String getC_numratecats1_()
{return getToolParameters().get("c_numratecats1_");
}
public void setC_numratecats1_(String c_numratecats1_)
{ getToolParameters().put("c_numratecats1_", c_numratecats1_);
}
public String getDatatype_value2_()
{return getToolParameters().get("datatype_value2_");
}
public void setDatatype_value2_(String datatype_value2_)
{ getToolParameters().put("datatype_value2_", datatype_value2_);
}
public String getGeneticcode_value2_()
{return getToolParameters().get("geneticcode_value2_");
}
public void setGeneticcode_value2_(String geneticcode_value2_)
{ getToolParameters().put("geneticcode_value2_", geneticcode_value2_);
}
public String getD_ratematrix2_()
{return getToolParameters().get("d_ratematrix2_");
}
public void setD_ratematrix2_(String d_ratematrix2_)
{ getToolParameters().put("d_ratematrix2_", d_ratematrix2_);
}
public String getACsubrates2_()
{return getToolParameters().get("ACsubrates2_");
}
public void setACsubrates2_(String ACsubrates2_)
{ getToolParameters().put("ACsubrates2_", ACsubrates2_);
}
public String getAGsubrates2_()
{return getToolParameters().get("AGsubrates2_");
}
public void setAGsubrates2_(String AGsubrates2_)
{ getToolParameters().put("AGsubrates2_", AGsubrates2_);
}
public String getATsubrates2_()
{return getToolParameters().get("ATsubrates2_");
}
public void setATsubrates2_(String ATsubrates2_)
{ getToolParameters().put("ATsubrates2_", ATsubrates2_);
}
public String getCGsubrates2_()
{return getToolParameters().get("CGsubrates2_");
}
public void setCGsubrates2_(String CGsubrates2_)
{ getToolParameters().put("CGsubrates2_", CGsubrates2_);
}
public String getCTsubrates2_()
{return getToolParameters().get("CTsubrates2_");
}
public void setCTsubrates2_(String CTsubrates2_)
{ getToolParameters().put("CTsubrates2_", CTsubrates2_);
}
public String getGTsubrates2_()
{return getToolParameters().get("GTsubrates2_");
}
public void setGTsubrates2_(String GTsubrates2_)
{ getToolParameters().put("GTsubrates2_", GTsubrates2_);
}
public String getD_statefrequencies2_()
{return getToolParameters().get("d_statefrequencies2_");
}
public void setD_statefrequencies2_(String d_statefrequencies2_)
{ getToolParameters().put("d_statefrequencies2_", d_statefrequencies2_);
}
public String getD_invariantsites2_()
{return getToolParameters().get("d_invariantsites2_");
}
public void setD_invariantsites2_(String d_invariantsites2_)
{ getToolParameters().put("d_invariantsites2_", d_invariantsites2_);
}
public String getD_ratehetmodel2_()
{return getToolParameters().get("d_ratehetmodel2_");
}
public void setD_ratehetmodel2_(String d_ratehetmodel2_)
{ getToolParameters().put("d_ratehetmodel2_", d_ratehetmodel2_);
}
public String getD_numratecats2_()
{return getToolParameters().get("d_numratecats2_");
}
public void setD_numratecats2_(String d_numratecats2_)
{ getToolParameters().put("d_numratecats2_", d_numratecats2_);
}
public String getP_ratematrix2_()
{return getToolParameters().get("p_ratematrix2_");
}
public void setP_ratematrix2_(String p_ratematrix2_)
{ getToolParameters().put("p_ratematrix2_", p_ratematrix2_);
}
public String getP_statefrequencies2_()
{return getToolParameters().get("p_statefrequencies2_");
}
public void setP_statefrequencies2_(String p_statefrequencies2_)
{ getToolParameters().put("p_statefrequencies2_", p_statefrequencies2_);
}
public String getP_invariantsites2_()
{return getToolParameters().get("p_invariantsites2_");
}
public void setP_invariantsites2_(String p_invariantsites2_)
{ getToolParameters().put("p_invariantsites2_", p_invariantsites2_);
}
public String getP_ratehetmodel2_()
{return getToolParameters().get("p_ratehetmodel2_");
}
public void setP_ratehetmodel2_(String p_ratehetmodel2_)
{ getToolParameters().put("p_ratehetmodel2_", p_ratehetmodel2_);
}
public String getP_numratecats2_()
{return getToolParameters().get("p_numratecats2_");
}
public void setP_numratecats2_(String p_numratecats2_)
{ getToolParameters().put("p_numratecats2_", p_numratecats2_);
}
public String getC_ratematrix2_()
{return getToolParameters().get("c_ratematrix2_");
}
public void setC_ratematrix2_(String c_ratematrix2_)
{ getToolParameters().put("c_ratematrix2_", c_ratematrix2_);
}
public String getC_statefrequencies2_()
{return getToolParameters().get("c_statefrequencies2_");
}
public void setC_statefrequencies2_(String c_statefrequencies2_)
{ getToolParameters().put("c_statefrequencies2_", c_statefrequencies2_);
}
public String getC_ratehetmodel2_()
{return getToolParameters().get("c_ratehetmodel2_");
}
public void setC_ratehetmodel2_(String c_ratehetmodel2_)
{ getToolParameters().put("c_ratehetmodel2_", c_ratehetmodel2_);
}
public String getC_numratecats2_()
{return getToolParameters().get("c_numratecats2_");
}
public void setC_numratecats2_(String c_numratecats2_)
{ getToolParameters().put("c_numratecats2_", c_numratecats2_);
}
public String getDatatype_value3_()
{return getToolParameters().get("datatype_value3_");
}
public void setDatatype_value3_(String datatype_value3_)
{ getToolParameters().put("datatype_value3_", datatype_value3_);
}
public String getGeneticcode_value3_()
{return getToolParameters().get("geneticcode_value3_");
}
public void setGeneticcode_value3_(String geneticcode_value3_)
{ getToolParameters().put("geneticcode_value3_", geneticcode_value3_);
}
public String getD_ratematrix3_()
{return getToolParameters().get("d_ratematrix3_");
}
public void setD_ratematrix3_(String d_ratematrix3_)
{ getToolParameters().put("d_ratematrix3_", d_ratematrix3_);
}
public String getACsubrates3_()
{return getToolParameters().get("ACsubrates3_");
}
public void setACsubrates3_(String ACsubrates3_)
{ getToolParameters().put("ACsubrates3_", ACsubrates3_);
}
public String getAGsubrates3_()
{return getToolParameters().get("AGsubrates3_");
}
public void setAGsubrates3_(String AGsubrates3_)
{ getToolParameters().put("AGsubrates3_", AGsubrates3_);
}
public String getATsubrates3_()
{return getToolParameters().get("ATsubrates3_");
}
public void setATsubrates3_(String ATsubrates3_)
{ getToolParameters().put("ATsubrates3_", ATsubrates3_);
}
public String getCGsubrates3_()
{return getToolParameters().get("CGsubrates3_");
}
public void setCGsubrates3_(String CGsubrates3_)
{ getToolParameters().put("CGsubrates3_", CGsubrates3_);
}
public String getCTsubrates3_()
{return getToolParameters().get("CTsubrates3_");
}
public void setCTsubrates3_(String CTsubrates3_)
{ getToolParameters().put("CTsubrates3_", CTsubrates3_);
}
public String getGTsubrates3_()
{return getToolParameters().get("GTsubrates3_");
}
public void setGTsubrates3_(String GTsubrates3_)
{ getToolParameters().put("GTsubrates3_", GTsubrates3_);
}
public String getD_statefrequencies3_()
{return getToolParameters().get("d_statefrequencies3_");
}
public void setD_statefrequencies3_(String d_statefrequencies3_)
{ getToolParameters().put("d_statefrequencies3_", d_statefrequencies3_);
}
public String getD_invariantsites3_()
{return getToolParameters().get("d_invariantsites3_");
}
public void setD_invariantsites3_(String d_invariantsites3_)
{ getToolParameters().put("d_invariantsites3_", d_invariantsites3_);
}
public String getD_ratehetmodel3_()
{return getToolParameters().get("d_ratehetmodel3_");
}
public void setD_ratehetmodel3_(String d_ratehetmodel3_)
{ getToolParameters().put("d_ratehetmodel3_", d_ratehetmodel3_);
}
public String getD_numratecats3_()
{return getToolParameters().get("d_numratecats3_");
}
public void setD_numratecats3_(String d_numratecats3_)
{ getToolParameters().put("d_numratecats3_", d_numratecats3_);
}
public String getP_ratematrix3_()
{return getToolParameters().get("p_ratematrix3_");
}
public void setP_ratematrix3_(String p_ratematrix3_)
{ getToolParameters().put("p_ratematrix3_", p_ratematrix3_);
}
public String getP_statefrequencies3_()
{return getToolParameters().get("p_statefrequencies3_");
}
public void setP_statefrequencies3_(String p_statefrequencies3_)
{ getToolParameters().put("p_statefrequencies3_", p_statefrequencies3_);
}
public String getP_invariantsites3_()
{return getToolParameters().get("p_invariantsites3_");
}
public void setP_invariantsites3_(String p_invariantsites3_)
{ getToolParameters().put("p_invariantsites3_", p_invariantsites3_);
}
public String getP_ratehetmodel3_()
{return getToolParameters().get("p_ratehetmodel3_");
}
public void setP_ratehetmodel3_(String p_ratehetmodel3_)
{ getToolParameters().put("p_ratehetmodel3_", p_ratehetmodel3_);
}
public String getP_numratecats3_()
{return getToolParameters().get("p_numratecats3_");
}
public void setP_numratecats3_(String p_numratecats3_)
{ getToolParameters().put("p_numratecats3_", p_numratecats3_);
}
public String getC_ratematrix3_()
{return getToolParameters().get("c_ratematrix3_");
}
public void setC_ratematrix3_(String c_ratematrix3_)
{ getToolParameters().put("c_ratematrix3_", c_ratematrix3_);
}
public String getC_statefrequencies3_()
{return getToolParameters().get("c_statefrequencies3_");
}
public void setC_statefrequencies3_(String c_statefrequencies3_)
{ getToolParameters().put("c_statefrequencies3_", c_statefrequencies3_);
}
public String getC_ratehetmodel3_()
{return getToolParameters().get("c_ratehetmodel3_");
}
public void setC_ratehetmodel3_(String c_ratehetmodel3_)
{ getToolParameters().put("c_ratehetmodel3_", c_ratehetmodel3_);
}
public String getC_numratecats3_()
{return getToolParameters().get("c_numratecats3_");
}
public void setC_numratecats3_(String c_numratecats3_)
{ getToolParameters().put("c_numratecats3_", c_numratecats3_);
}
public String getDatatype_value4_()
{return getToolParameters().get("datatype_value4_");
}
public void setDatatype_value4_(String datatype_value4_)
{ getToolParameters().put("datatype_value4_", datatype_value4_);
}
public String getGeneticcode_value4_()
{return getToolParameters().get("geneticcode_value4_");
}
public void setGeneticcode_value4_(String geneticcode_value4_)
{ getToolParameters().put("geneticcode_value4_", geneticcode_value4_);
}
public String getD_ratematrix4_()
{return getToolParameters().get("d_ratematrix4_");
}
public void setD_ratematrix4_(String d_ratematrix4_)
{ getToolParameters().put("d_ratematrix4_", d_ratematrix4_);
}
public String getACsubrates4_()
{return getToolParameters().get("ACsubrates4_");
}
public void setACsubrates4_(String ACsubrates4_)
{ getToolParameters().put("ACsubrates4_", ACsubrates4_);
}
public String getAGsubrates4_()
{return getToolParameters().get("AGsubrates4_");
}
public void setAGsubrates4_(String AGsubrates4_)
{ getToolParameters().put("AGsubrates4_", AGsubrates4_);
}
public String getATsubrates4_()
{return getToolParameters().get("ATsubrates4_");
}
public void setATsubrates4_(String ATsubrates4_)
{ getToolParameters().put("ATsubrates4_", ATsubrates4_);
}
public String getCGsubrates4_()
{return getToolParameters().get("CGsubrates4_");
}
public void setCGsubrates4_(String CGsubrates4_)
{ getToolParameters().put("CGsubrates4_", CGsubrates4_);
}
public String getCTsubrates4_()
{return getToolParameters().get("CTsubrates4_");
}
public void setCTsubrates4_(String CTsubrates4_)
{ getToolParameters().put("CTsubrates4_", CTsubrates4_);
}
public String getGTsubrates4_()
{return getToolParameters().get("GTsubrates4_");
}
public void setGTsubrates4_(String GTsubrates4_)
{ getToolParameters().put("GTsubrates4_", GTsubrates4_);
}
public String getD_statefrequencies4_()
{return getToolParameters().get("d_statefrequencies4_");
}
public void setD_statefrequencies4_(String d_statefrequencies4_)
{ getToolParameters().put("d_statefrequencies4_", d_statefrequencies4_);
}
public String getD_invariantsites4_()
{return getToolParameters().get("d_invariantsites4_");
}
public void setD_invariantsites4_(String d_invariantsites4_)
{ getToolParameters().put("d_invariantsites4_", d_invariantsites4_);
}
public String getD_ratehetmodel4_()
{return getToolParameters().get("d_ratehetmodel4_");
}
public void setD_ratehetmodel4_(String d_ratehetmodel4_)
{ getToolParameters().put("d_ratehetmodel4_", d_ratehetmodel4_);
}
public String getD_numratecats4_()
{return getToolParameters().get("d_numratecats4_");
}
public void setD_numratecats4_(String d_numratecats4_)
{ getToolParameters().put("d_numratecats4_", d_numratecats4_);
}
public String getP_ratematrix4_()
{return getToolParameters().get("p_ratematrix4_");
}
public void setP_ratematrix4_(String p_ratematrix4_)
{ getToolParameters().put("p_ratematrix4_", p_ratematrix4_);
}
public String getP_statefrequencies4_()
{return getToolParameters().get("p_statefrequencies4_");
}
public void setP_statefrequencies4_(String p_statefrequencies4_)
{ getToolParameters().put("p_statefrequencies4_", p_statefrequencies4_);
}
public String getP_invariantsites4_()
{return getToolParameters().get("p_invariantsites4_");
}
public void setP_invariantsites4_(String p_invariantsites4_)
{ getToolParameters().put("p_invariantsites4_", p_invariantsites4_);
}
public String getP_ratehetmodel4_()
{return getToolParameters().get("p_ratehetmodel4_");
}
public void setP_ratehetmodel4_(String p_ratehetmodel4_)
{ getToolParameters().put("p_ratehetmodel4_", p_ratehetmodel4_);
}
public String getP_numratecats4_()
{return getToolParameters().get("p_numratecats4_");
}
public void setP_numratecats4_(String p_numratecats4_)
{ getToolParameters().put("p_numratecats4_", p_numratecats4_);
}
public String getC_ratematrix4_()
{return getToolParameters().get("c_ratematrix4_");
}
public void setC_ratematrix4_(String c_ratematrix4_)
{ getToolParameters().put("c_ratematrix4_", c_ratematrix4_);
}
public String getC_statefrequencies4_()
{return getToolParameters().get("c_statefrequencies4_");
}
public void setC_statefrequencies4_(String c_statefrequencies4_)
{ getToolParameters().put("c_statefrequencies4_", c_statefrequencies4_);
}
public String getC_ratehetmodel4_()
{return getToolParameters().get("c_ratehetmodel4_");
}
public void setC_ratehetmodel4_(String c_ratehetmodel4_)
{ getToolParameters().put("c_ratehetmodel4_", c_ratehetmodel4_);
}
public String getC_numratecats4_()
{return getToolParameters().get("c_numratecats4_");
}
public void setC_numratecats4_(String c_numratecats4_)
{ getToolParameters().put("c_numratecats4_", c_numratecats4_);
}
public String getDatatype_value5_()
{return getToolParameters().get("datatype_value5_");
}
public void setDatatype_value5_(String datatype_value5_)
{ getToolParameters().put("datatype_value5_", datatype_value5_);
}
public String getGeneticcode_value5_()
{return getToolParameters().get("geneticcode_value5_");
}
public void setGeneticcode_value5_(String geneticcode_value5_)
{ getToolParameters().put("geneticcode_value5_", geneticcode_value5_);
}
public String getD_ratematrix5_()
{return getToolParameters().get("d_ratematrix5_");
}
public void setD_ratematrix5_(String d_ratematrix5_)
{ getToolParameters().put("d_ratematrix5_", d_ratematrix5_);
}
public String getACsubrates5_()
{return getToolParameters().get("ACsubrates5_");
}
public void setACsubrates5_(String ACsubrates5_)
{ getToolParameters().put("ACsubrates5_", ACsubrates5_);
}
public String getAGsubrates5_()
{return getToolParameters().get("AGsubrates5_");
}
public void setAGsubrates5_(String AGsubrates5_)
{ getToolParameters().put("AGsubrates5_", AGsubrates5_);
}
public String getATsubrates5_()
{return getToolParameters().get("ATsubrates5_");
}
public void setATsubrates5_(String ATsubrates5_)
{ getToolParameters().put("ATsubrates5_", ATsubrates5_);
}
public String getCGsubrates5_()
{return getToolParameters().get("CGsubrates5_");
}
public void setCGsubrates5_(String CGsubrates5_)
{ getToolParameters().put("CGsubrates5_", CGsubrates5_);
}
public String getCTsubrates5_()
{return getToolParameters().get("CTsubrates5_");
}
public void setCTsubrates5_(String CTsubrates5_)
{ getToolParameters().put("CTsubrates5_", CTsubrates5_);
}
public String getGTsubrates5_()
{return getToolParameters().get("GTsubrates5_");
}
public void setGTsubrates5_(String GTsubrates5_)
{ getToolParameters().put("GTsubrates5_", GTsubrates5_);
}
public String getD_statefrequencies5_()
{return getToolParameters().get("d_statefrequencies5_");
}
public void setD_statefrequencies5_(String d_statefrequencies5_)
{ getToolParameters().put("d_statefrequencies5_", d_statefrequencies5_);
}
public String getD_invariantsites5_()
{return getToolParameters().get("d_invariantsites5_");
}
public void setD_invariantsites5_(String d_invariantsites5_)
{ getToolParameters().put("d_invariantsites5_", d_invariantsites5_);
}
public String getD_ratehetmodel5_()
{return getToolParameters().get("d_ratehetmodel5_");
}
public void setD_ratehetmodel5_(String d_ratehetmodel5_)
{ getToolParameters().put("d_ratehetmodel5_", d_ratehetmodel5_);
}
public String getD_numratecats5_()
{return getToolParameters().get("d_numratecats5_");
}
public void setD_numratecats5_(String d_numratecats5_)
{ getToolParameters().put("d_numratecats5_", d_numratecats5_);
}
public String getP_ratematrix5_()
{return getToolParameters().get("p_ratematrix5_");
}
public void setP_ratematrix5_(String p_ratematrix5_)
{ getToolParameters().put("p_ratematrix5_", p_ratematrix5_);
}
public String getP_statefrequencies5_()
{return getToolParameters().get("p_statefrequencies5_");
}
public void setP_statefrequencies5_(String p_statefrequencies5_)
{ getToolParameters().put("p_statefrequencies5_", p_statefrequencies5_);
}
public String getP_invariantsites5_()
{return getToolParameters().get("p_invariantsites5_");
}
public void setP_invariantsites5_(String p_invariantsites5_)
{ getToolParameters().put("p_invariantsites5_", p_invariantsites5_);
}
public String getP_ratehetmodel5_()
{return getToolParameters().get("p_ratehetmodel5_");
}
public void setP_ratehetmodel5_(String p_ratehetmodel5_)
{ getToolParameters().put("p_ratehetmodel5_", p_ratehetmodel5_);
}
public String getP_numratecats5_()
{return getToolParameters().get("p_numratecats5_");
}
public void setP_numratecats5_(String p_numratecats5_)
{ getToolParameters().put("p_numratecats5_", p_numratecats5_);
}
public String getC_ratematrix5_()
{return getToolParameters().get("c_ratematrix5_");
}
public void setC_ratematrix5_(String c_ratematrix5_)
{ getToolParameters().put("c_ratematrix5_", c_ratematrix5_);
}
public String getC_statefrequencies5_()
{return getToolParameters().get("c_statefrequencies5_");
}
public void setC_statefrequencies5_(String c_statefrequencies5_)
{ getToolParameters().put("c_statefrequencies5_", c_statefrequencies5_);
}
public String getC_ratehetmodel5_()
{return getToolParameters().get("c_ratehetmodel5_");
}
public void setC_ratehetmodel5_(String c_ratehetmodel5_)
{ getToolParameters().put("c_ratehetmodel5_", c_ratehetmodel5_);
}
public String getC_numratecats5_()
{return getToolParameters().get("c_numratecats5_");
}
public void setC_numratecats5_(String c_numratecats5_)
{ getToolParameters().put("c_numratecats5_", c_numratecats5_);
}
public String getStreefname_choose_()
{return getToolParameters().get("streefname_choose_");
}
public void setStreefname_choose_(String streefname_choose_)
{ getToolParameters().put("streefname_choose_", streefname_choose_);
}
public String getAttachments_val_()
{return getToolParameters().get("attachments_val_");
}
public void setAttachments_val_(String attachments_val_)
{ getToolParameters().put("attachments_val_", attachments_val_);
}
public String getSearchreps_value_()
{return getToolParameters().get("searchreps_value_");
}
public void setSearchreps_value_(String searchreps_value_)
{ getToolParameters().put("searchreps_value_", searchreps_value_);
}
public String getBootstrapreps_()
{return getToolParameters().get("bootstrapreps_");
}
public void setBootstrapreps_(String bootstrapreps_)
{ getToolParameters().put("bootstrapreps_", bootstrapreps_);
}
public String getOutgroup_tax_()
{return getToolParameters().get("outgroup_tax_");
}
public void setOutgroup_tax_(String outgroup_tax_)
{ getToolParameters().put("outgroup_tax_", outgroup_tax_);
}
public String getCollapsebranches_g_()
{return getToolParameters().get("collapsebranches_g_");
}
public void setCollapsebranches_g_(String collapsebranches_g_)
{ getToolParameters().put("collapsebranches_g_", collapsebranches_g_);
}
public String getConstraintfile_()
{return getToolParameters().get("constraintfile_");
}
public void setConstraintfile_(String constraintfile_)
{ getToolParameters().put("constraintfile_", constraintfile_);
}
public String getRefinestart_()
{return getToolParameters().get("refinestart_");
}
public void setRefinestart_(String refinestart_)
{ getToolParameters().put("refinestart_", refinestart_);
}
public String getRandseed_()
{return getToolParameters().get("randseed_");
}
public void setRandseed_(String randseed_)
{ getToolParameters().put("randseed_", randseed_);
}
public String getSelectionintensity_()
{return getToolParameters().get("selectionintensity_");
}
public void setSelectionintensity_(String selectionintensity_)
{ getToolParameters().put("selectionintensity_", selectionintensity_);
}
public String getNindivs_()
{return getToolParameters().get("nindivs_");
}
public void setNindivs_(String nindivs_)
{ getToolParameters().put("nindivs_", nindivs_);
}
public String getStartoptprec_()
{return getToolParameters().get("startoptprec_");
}
public void setStartoptprec_(String startoptprec_)
{ getToolParameters().put("startoptprec_", startoptprec_);
}
public String getMinoptprec_()
{return getToolParameters().get("minoptprec_");
}
public void setMinoptprec_(String minoptprec_)
{ getToolParameters().put("minoptprec_", minoptprec_);
}
public String getNumberofprecreductions_()
{return getToolParameters().get("numberofprecreductions_");
}
public void setNumberofprecreductions_(String numberofprecreductions_)
{ getToolParameters().put("numberofprecreductions_", numberofprecreductions_);
}
public String getModweight_()
{return getToolParameters().get("modweight_");
}
public void setModweight_(String modweight_)
{ getToolParameters().put("modweight_", modweight_);
}
public String getBrlenweight_()
{return getToolParameters().get("brlenweight_");
}
public void setBrlenweight_(String brlenweight_)
{ getToolParameters().put("brlenweight_", brlenweight_);
}
public String getTopoweight_()
{return getToolParameters().get("topoweight_");
}
public void setTopoweight_(String topoweight_)
{ getToolParameters().put("topoweight_", topoweight_);
}
public String getRandnniweight_()
{return getToolParameters().get("randnniweight_");
}
public void setRandnniweight_(String randnniweight_)
{ getToolParameters().put("randnniweight_", randnniweight_);
}
public String getRandsprweight_()
{return getToolParameters().get("randsprweight_");
}
public void setRandsprweight_(String randsprweight_)
{ getToolParameters().put("randsprweight_", randsprweight_);
}
public String getLimsprweight_()
{return getToolParameters().get("limsprweight_");
}
public void setLimsprweight_(String limsprweight_)
{ getToolParameters().put("limsprweight_", limsprweight_);
}
public String getLimsprrange_()
{return getToolParameters().get("limsprrange_");
}
public void setLimsprrange_(String limsprrange_)
{ getToolParameters().put("limsprrange_", limsprrange_);
}
public String getUniqueswapbias_()
{return getToolParameters().get("uniqueswapbias_");
}
public void setUniqueswapbias_(String uniqueswapbias_)
{ getToolParameters().put("uniqueswapbias_", uniqueswapbias_);
}
public String getSaveevery_g_()
{return getToolParameters().get("saveevery_g_");
}
public void setSaveevery_g_(String saveevery_g_)
{ getToolParameters().put("saveevery_g_", saveevery_g_);
}
public String getOutputcurrentbesttopology_()
{return getToolParameters().get("outputcurrentbesttopology_");
}
public void setOutputcurrentbesttopology_(String outputcurrentbesttopology_)
{ getToolParameters().put("outputcurrentbesttopology_", outputcurrentbesttopology_);
}
public String getLogevery_g_()
{return getToolParameters().get("logevery_g_");
}
public void setLogevery_g_(String logevery_g_)
{ getToolParameters().put("logevery_g_", logevery_g_);
}
public String getOutputeachbettertopology_g_()
{return getToolParameters().get("outputeachbettertopology_g_");
}
public void setOutputeachbettertopology_g_(String outputeachbettertopology_g_)
{ getToolParameters().put("outputeachbettertopology_g_", outputeachbettertopology_g_);
}
public String getInferinternalstateprobs_g_()
{return getToolParameters().get("inferinternalstateprobs_g_");
}
public void setInferinternalstateprobs_g_(String inferinternalstateprobs_g_)
{ getToolParameters().put("inferinternalstateprobs_g_", inferinternalstateprobs_g_);
}
public String getOutputphyliptree_g_()
{return getToolParameters().get("outputphyliptree_g_");
}
public void setOutputphyliptree_g_(String outputphyliptree_g_)
{ getToolParameters().put("outputphyliptree_g_", outputphyliptree_g_);
}
public String getOutputmostlyuselessfiles_g_()
{return getToolParameters().get("outputmostlyuselessfiles_g_");
}
public void setOutputmostlyuselessfiles_g_(String outputmostlyuselessfiles_g_)
{ getToolParameters().put("outputmostlyuselessfiles_g_", outputmostlyuselessfiles_g_);
}
public String getEnforcetermconditions_()
{return getToolParameters().get("enforcetermconditions_");
}
public void setEnforcetermconditions_(String enforcetermconditions_)
{ getToolParameters().put("enforcetermconditions_", enforcetermconditions_);
}
public String getGenthreshfortopoterm_()
{return getToolParameters().get("genthreshfortopoterm_");
}
public void setGenthreshfortopoterm_(String genthreshfortopoterm_)
{ getToolParameters().put("genthreshfortopoterm_", genthreshfortopoterm_);
}
public String getSignificanttopochange_()
{return getToolParameters().get("significanttopochange_");
}
public void setSignificanttopochange_(String significanttopochange_)
{ getToolParameters().put("significanttopochange_", significanttopochange_);
}
public String getScorethreshforterm_()
{return getToolParameters().get("scorethreshforterm_");
}
public void setScorethreshforterm_(String scorethreshforterm_)
{ getToolParameters().put("scorethreshforterm_", scorethreshforterm_);
}
public String getStopgen_()
{return getToolParameters().get("stopgen_");
}
public void setStopgen_(String stopgen_)
{ getToolParameters().put("stopgen_", stopgen_);
}
public String getStoptime_()
{return getToolParameters().get("stoptime_");
}
public void setStoptime_(String stoptime_)
{ getToolParameters().put("stoptime_", stoptime_);
}
public String getResampleproportion_()
{return getToolParameters().get("resampleproportion_");
}
public void setResampleproportion_(String resampleproportion_)
{ getToolParameters().put("resampleproportion_", resampleproportion_);
}
// this method pre-populates the form with default values
public void reset() {
super.reset();
setLinkmodels_("false");
setConfigure_partitions_("false");
setSubsetspecificrates_("false");
setDatatype_value_( "nucleotide" );
setGeneticcode_value_( "standard" );
setD_ratematrix_( "6rate" );
setD_statefrequencies_( "estimate" );
setD_invariantsites_( "estimate" );
setD_ratehetmodel_( "gamma" );
setD_numratecats_("4");
setP_ratematrix_( "wag" );
setP_statefrequencies_( "empirical" );
setP_invariantsites_( "estimate" );
setP_ratehetmodel_( "gamma" );
setP_numratecats_("4");
setC_ratematrix_( "2rate" );
setC_statefrequencies_( "f3x4" );
setC_ratehetmodel_( "none" );
setC_numratecats_("3");
setDatatype_value1_( "nucleotide" );
setGeneticcode_value1_( "standard" );
setD_ratematrix1_( "6rate" );
setD_statefrequencies1_( "estimate" );
setD_invariantsites1_( "estimate" );
setD_ratehetmodel1_( "gamma" );
setD_numratecats1_("4");
setP_ratematrix1_( "wag" );
setP_statefrequencies1_( "empirical" );
setP_invariantsites1_( "estimate" );
setP_ratehetmodel1_( "gamma" );
setP_numratecats1_("4");
setC_ratematrix1_( "2rate" );
setC_statefrequencies1_( "f3x4" );
setC_ratehetmodel1_( "none" );
setC_numratecats1_("3");
setDatatype_value2_( "nucleotide" );
setGeneticcode_value2_( "standard" );
setD_ratematrix2_( "6rate" );
setD_statefrequencies2_( "estimate" );
setD_invariantsites2_( "estimate" );
setD_ratehetmodel2_( "gamma" );
setD_numratecats2_("4");
setP_ratematrix2_( "wag" );
setP_statefrequencies2_( "empirical" );
setP_invariantsites2_( "estimate" );
setP_ratehetmodel2_( "gamma" );
setP_numratecats2_("4");
setC_ratematrix2_( "2rate" );
setC_statefrequencies2_( "f3x4" );
setC_ratehetmodel2_( "none" );
setC_numratecats2_("3");
setDatatype_value3_( "nucleotide" );
setGeneticcode_value3_( "standard" );
setD_ratematrix3_( "6rate" );
setD_statefrequencies3_( "estimate" );
setD_invariantsites3_( "estimate" );
setD_ratehetmodel3_( "gamma" );
setD_numratecats3_("4");
setP_ratematrix3_( "wag" );
setP_statefrequencies3_( "empirical" );
setP_invariantsites3_( "estimate" );
setP_ratehetmodel3_( "gamma" );
setP_numratecats3_("4");
setC_ratematrix3_( "2rate" );
setC_statefrequencies3_( "f3x4" );
setC_ratehetmodel3_( "none" );
setC_numratecats3_("3");
setDatatype_value4_( "nucleotide" );
setGeneticcode_value4_( "standard" );
setD_ratematrix4_( "6rate" );
setD_statefrequencies4_( "estimate" );
setD_invariantsites4_( "estimate" );
setD_ratehetmodel4_( "gamma" );
setD_numratecats4_("4");
setP_ratematrix4_( "wag" );
setP_statefrequencies4_( "empirical" );
setP_invariantsites4_( "estimate" );
setP_ratehetmodel4_( "gamma" );
setP_numratecats4_("4");
setC_ratematrix4_( "2rate" );
setC_statefrequencies4_( "f3x4" );
setC_ratehetmodel4_( "none" );
setC_numratecats4_("3");
setDatatype_value5_( "nucleotide" );
setGeneticcode_value5_( "standard" );
setD_ratematrix5_( "6rate" );
setD_statefrequencies5_( "estimate" );
setD_invariantsites5_( "estimate" );
setD_ratehetmodel5_( "gamma" );
setD_numratecats5_("4");
setP_ratematrix5_( "wag" );
setP_statefrequencies5_( "empirical" );
setP_invariantsites5_( "estimate" );
setP_ratehetmodel5_( "gamma" );
setP_numratecats5_("4");
setC_ratematrix5_( "2rate" );
setC_statefrequencies5_( "f3x4" );
setC_ratehetmodel5_( "none" );
setC_numratecats5_("3");
setStreefname_choose_( "stepwise" );
setAttachments_val_("50");
setSearchreps_value_("2");
setBootstrapreps_("0");
setCollapsebranches_g_("false");
setConstraintfile_("false");
setRefinestart_("true");
setRandseed_("-1");
setSelectionintensity_("0.5");
setNindivs_("4");
setStartoptprec_("0.5");
setMinoptprec_("0.01");
setNumberofprecreductions_("20");
setModweight_("0.05");
setBrlenweight_("0.2");
setTopoweight_("1.0");
setRandnniweight_("0.1");
setRandsprweight_("0.3");
setLimsprweight_("0.6");
setLimsprrange_("6");
setUniqueswapbias_("0.1");
setSaveevery_g_("100");
setLogevery_g_("10");
setOutputeachbettertopology_g_("false");
setInferinternalstateprobs_g_("false");
setOutputphyliptree_g_("false");
setOutputmostlyuselessfiles_g_("false");
setEnforcetermconditions_("true");
setGenthreshfortopoterm_("20000");
setSignificanttopochange_("0.01");
setScorethreshforterm_("0.05");
setStopgen_("214783646");
setStoptime_("214783646");
setResampleproportion_("1.0");
}
}
