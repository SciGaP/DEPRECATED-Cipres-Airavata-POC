package org.ngbw.sdk.tool.validation;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import org.ngbw.sdk.api.tool.ParameterValidator2;
import org.ngbw.sdk.api.tool.FieldError;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
import org.ngbw.sdk.common.util.SuperString;
public class garli_conf_creatorValidator implements ParameterValidator2
{
private Set<String> requiredParameters;
private Set<String> requiredInput;
private Set<String> allowedParameters;
private Set<String> allowedInput;
// Map of parameter name to list separator (a single character string) for List parameters.
private Map<String, String> listParameters;
// Maps param name to permitted values for List, Excl, Switch type params
private Map<String, List<String>> listValues;
private Map<String, List<String>> exclValues ;
private Map<String, List<String>> switchValues;
private List<FieldError> errors = new ArrayList<FieldError>();
public garli_conf_creatorValidator() {
requiredParameters = new HashSet<String>();
requiredInput = new HashSet<String>();
allowedParameters = new HashSet<String>();
allowedInput = new HashSet<String>();
listParameters = new HashMap<String, String>();
listValues = new HashMap<String, List<String>>();
exclValues = new HashMap<String, List<String>>();
switchValues = new HashMap<String, List<String>>();
List<String> switchList = new ArrayList<String>(2);
switchList.add("0");
switchList.add("1");
List<String> tmpList;
allowedInput.add("infile_");
requiredInput.add("infile_");
allowedParameters.add("is_partitioned_");
switchValues.put("is_partitioned_", switchList);
allowedParameters.add("linkmodels_");
switchValues.put("linkmodels_", switchList);
allowedParameters.add("configure_partitions_");
switchValues.put("configure_partitions_", switchList);
allowedParameters.add("numparts_");
allowedParameters.add("subsetspecificrates_");
switchValues.put("subsetspecificrates_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("nucleotide");
tmpList.add("aminoacid");
tmpList.add("codon-aminoacid");
tmpList.add("codon");
exclValues.put("datatype_value_", tmpList);
allowedParameters.add("datatype_value_");
tmpList = new ArrayList<String>();
tmpList.add("standard");
tmpList.add("vertmito");
tmpList.add("invertmito");
exclValues.put("geneticcode_value_", tmpList);
allowedParameters.add("geneticcode_value_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom_string");
exclValues.put("d_ratematrix_", tmpList);
allowedParameters.add("d_ratematrix_");
allowedParameters.add("ACsubrates_");
allowedParameters.add("AGsubrates_");
allowedParameters.add("ATsubrates_");
allowedParameters.add("CGsubrates_");
allowedParameters.add("CTsubrates_");
allowedParameters.add("GTsubrates_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
exclValues.put("d_statefrequencies_", tmpList);
allowedParameters.add("d_statefrequencies_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("d_invariantsites_", tmpList);
allowedParameters.add("d_invariantsites_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("d_ratehetmodel_", tmpList);
allowedParameters.add("d_ratehetmodel_");
allowedParameters.add("d_numratecats_");
tmpList = new ArrayList<String>();
tmpList.add("poisson");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_ratematrix_", tmpList);
allowedParameters.add("p_ratematrix_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_statefrequencies_", tmpList);
allowedParameters.add("p_statefrequencies_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("p_invariantsites_", tmpList);
allowedParameters.add("p_invariantsites_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("p_ratehetmodel_", tmpList);
allowedParameters.add("p_ratehetmodel_");
allowedParameters.add("p_numratecats_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom");
tmpList.add("string");
exclValues.put("c_ratematrix_", tmpList);
allowedParameters.add("c_ratematrix_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("f1x4");
tmpList.add("f3x4");
exclValues.put("c_statefrequencies_", tmpList);
allowedParameters.add("c_statefrequencies_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("nonsynonymous");
exclValues.put("c_ratehetmodel_", tmpList);
allowedParameters.add("c_ratehetmodel_");
allowedParameters.add("c_numratecats_");
tmpList = new ArrayList<String>();
tmpList.add("nucleotide");
tmpList.add("aminoacid");
tmpList.add("codon-aminoacid");
tmpList.add("codon");
exclValues.put("datatype_value1_", tmpList);
allowedParameters.add("datatype_value1_");
tmpList = new ArrayList<String>();
tmpList.add("standard");
tmpList.add("vertmito");
tmpList.add("invertmito");
exclValues.put("geneticcode_value1_", tmpList);
allowedParameters.add("geneticcode_value1_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom_string");
exclValues.put("d_ratematrix1_", tmpList);
allowedParameters.add("d_ratematrix1_");
allowedParameters.add("ACsubrates1_");
allowedParameters.add("AGsubrates1_");
allowedParameters.add("ATsubrates1_");
allowedParameters.add("CGsubrates1_");
allowedParameters.add("CTsubrates1_");
allowedParameters.add("GTsubrates1_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
exclValues.put("d_statefrequencies1_", tmpList);
allowedParameters.add("d_statefrequencies1_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("d_invariantsites1_", tmpList);
allowedParameters.add("d_invariantsites1_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("d_ratehetmodel1_", tmpList);
allowedParameters.add("d_ratehetmodel1_");
allowedParameters.add("d_numratecats1_");
tmpList = new ArrayList<String>();
tmpList.add("poisson");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_ratematrix1_", tmpList);
allowedParameters.add("p_ratematrix1_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_statefrequencies1_", tmpList);
allowedParameters.add("p_statefrequencies1_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("p_invariantsites1_", tmpList);
allowedParameters.add("p_invariantsites1_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("p_ratehetmodel1_", tmpList);
allowedParameters.add("p_ratehetmodel1_");
allowedParameters.add("p_numratecats1_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom");
tmpList.add("string");
exclValues.put("c_ratematrix1_", tmpList);
allowedParameters.add("c_ratematrix1_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("f1x4");
tmpList.add("f3x4");
exclValues.put("c_statefrequencies1_", tmpList);
allowedParameters.add("c_statefrequencies1_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("nonsynonymous");
exclValues.put("c_ratehetmodel1_", tmpList);
allowedParameters.add("c_ratehetmodel1_");
allowedParameters.add("c_numratecats1_");
tmpList = new ArrayList<String>();
tmpList.add("nucleotide");
tmpList.add("aminoacid");
tmpList.add("codon-aminoacid");
tmpList.add("codon");
exclValues.put("datatype_value2_", tmpList);
allowedParameters.add("datatype_value2_");
tmpList = new ArrayList<String>();
tmpList.add("standard");
tmpList.add("vertmito");
tmpList.add("invertmito");
exclValues.put("geneticcode_value2_", tmpList);
allowedParameters.add("geneticcode_value2_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom_string");
exclValues.put("d_ratematrix2_", tmpList);
allowedParameters.add("d_ratematrix2_");
allowedParameters.add("ACsubrates2_");
allowedParameters.add("AGsubrates2_");
allowedParameters.add("ATsubrates2_");
allowedParameters.add("CGsubrates2_");
allowedParameters.add("CTsubrates2_");
allowedParameters.add("GTsubrates2_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
exclValues.put("d_statefrequencies2_", tmpList);
allowedParameters.add("d_statefrequencies2_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("d_invariantsites2_", tmpList);
allowedParameters.add("d_invariantsites2_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("d_ratehetmodel2_", tmpList);
allowedParameters.add("d_ratehetmodel2_");
allowedParameters.add("d_numratecats2_");
tmpList = new ArrayList<String>();
tmpList.add("poisson");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_ratematrix2_", tmpList);
allowedParameters.add("p_ratematrix2_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_statefrequencies2_", tmpList);
allowedParameters.add("p_statefrequencies2_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("p_invariantsites2_", tmpList);
allowedParameters.add("p_invariantsites2_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("p_ratehetmodel2_", tmpList);
allowedParameters.add("p_ratehetmodel2_");
allowedParameters.add("p_numratecats2_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom");
tmpList.add("string");
exclValues.put("c_ratematrix2_", tmpList);
allowedParameters.add("c_ratematrix2_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("f1x4");
tmpList.add("f3x4");
exclValues.put("c_statefrequencies2_", tmpList);
allowedParameters.add("c_statefrequencies2_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("nonsynonymous");
exclValues.put("c_ratehetmodel2_", tmpList);
allowedParameters.add("c_ratehetmodel2_");
allowedParameters.add("c_numratecats2_");
tmpList = new ArrayList<String>();
tmpList.add("nucleotide");
tmpList.add("aminoacid");
tmpList.add("codon-aminoacid");
tmpList.add("codon");
exclValues.put("datatype_value3_", tmpList);
allowedParameters.add("datatype_value3_");
tmpList = new ArrayList<String>();
tmpList.add("standard");
tmpList.add("vertmito");
tmpList.add("invertmito");
exclValues.put("geneticcode_value3_", tmpList);
allowedParameters.add("geneticcode_value3_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom_string");
exclValues.put("d_ratematrix3_", tmpList);
allowedParameters.add("d_ratematrix3_");
allowedParameters.add("ACsubrates3_");
allowedParameters.add("AGsubrates3_");
allowedParameters.add("ATsubrates3_");
allowedParameters.add("CGsubrates3_");
allowedParameters.add("CTsubrates3_");
allowedParameters.add("GTsubrates3_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
exclValues.put("d_statefrequencies3_", tmpList);
allowedParameters.add("d_statefrequencies3_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("d_invariantsites3_", tmpList);
allowedParameters.add("d_invariantsites3_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("d_ratehetmodel3_", tmpList);
allowedParameters.add("d_ratehetmodel3_");
allowedParameters.add("d_numratecats3_");
tmpList = new ArrayList<String>();
tmpList.add("poisson");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_ratematrix3_", tmpList);
allowedParameters.add("p_ratematrix3_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_statefrequencies3_", tmpList);
allowedParameters.add("p_statefrequencies3_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("p_invariantsites3_", tmpList);
allowedParameters.add("p_invariantsites3_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("p_ratehetmodel3_", tmpList);
allowedParameters.add("p_ratehetmodel3_");
allowedParameters.add("p_numratecats3_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom");
tmpList.add("string");
exclValues.put("c_ratematrix3_", tmpList);
allowedParameters.add("c_ratematrix3_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("f1x4");
tmpList.add("f3x4");
exclValues.put("c_statefrequencies3_", tmpList);
allowedParameters.add("c_statefrequencies3_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("nonsynonymous");
exclValues.put("c_ratehetmodel3_", tmpList);
allowedParameters.add("c_ratehetmodel3_");
allowedParameters.add("c_numratecats3_");
tmpList = new ArrayList<String>();
tmpList.add("nucleotide");
tmpList.add("aminoacid");
tmpList.add("codon-aminoacid");
tmpList.add("codon");
exclValues.put("datatype_value4_", tmpList);
allowedParameters.add("datatype_value4_");
tmpList = new ArrayList<String>();
tmpList.add("standard");
tmpList.add("vertmito");
tmpList.add("invertmito");
exclValues.put("geneticcode_value4_", tmpList);
allowedParameters.add("geneticcode_value4_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom_string");
exclValues.put("d_ratematrix4_", tmpList);
allowedParameters.add("d_ratematrix4_");
allowedParameters.add("ACsubrates4_");
allowedParameters.add("AGsubrates4_");
allowedParameters.add("ATsubrates4_");
allowedParameters.add("CGsubrates4_");
allowedParameters.add("CTsubrates4_");
allowedParameters.add("GTsubrates4_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
exclValues.put("d_statefrequencies4_", tmpList);
allowedParameters.add("d_statefrequencies4_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("d_invariantsites4_", tmpList);
allowedParameters.add("d_invariantsites4_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("d_ratehetmodel4_", tmpList);
allowedParameters.add("d_ratehetmodel4_");
allowedParameters.add("d_numratecats4_");
tmpList = new ArrayList<String>();
tmpList.add("poisson");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_ratematrix4_", tmpList);
allowedParameters.add("p_ratematrix4_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_statefrequencies4_", tmpList);
allowedParameters.add("p_statefrequencies4_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("p_invariantsites4_", tmpList);
allowedParameters.add("p_invariantsites4_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("p_ratehetmodel4_", tmpList);
allowedParameters.add("p_ratehetmodel4_");
allowedParameters.add("p_numratecats4_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom");
tmpList.add("string");
exclValues.put("c_ratematrix4_", tmpList);
allowedParameters.add("c_ratematrix4_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("f1x4");
tmpList.add("f3x4");
exclValues.put("c_statefrequencies4_", tmpList);
allowedParameters.add("c_statefrequencies4_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("nonsynonymous");
exclValues.put("c_ratehetmodel4_", tmpList);
allowedParameters.add("c_ratehetmodel4_");
allowedParameters.add("c_numratecats4_");
tmpList = new ArrayList<String>();
tmpList.add("nucleotide");
tmpList.add("aminoacid");
tmpList.add("codon-aminoacid");
tmpList.add("codon");
exclValues.put("datatype_value5_", tmpList);
allowedParameters.add("datatype_value5_");
tmpList = new ArrayList<String>();
tmpList.add("standard");
tmpList.add("vertmito");
tmpList.add("invertmito");
exclValues.put("geneticcode_value5_", tmpList);
allowedParameters.add("geneticcode_value5_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom_string");
exclValues.put("d_ratematrix5_", tmpList);
allowedParameters.add("d_ratematrix5_");
allowedParameters.add("ACsubrates5_");
allowedParameters.add("AGsubrates5_");
allowedParameters.add("ATsubrates5_");
allowedParameters.add("CGsubrates5_");
allowedParameters.add("CTsubrates5_");
allowedParameters.add("GTsubrates5_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
exclValues.put("d_statefrequencies5_", tmpList);
allowedParameters.add("d_statefrequencies5_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("d_invariantsites5_", tmpList);
allowedParameters.add("d_invariantsites5_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("d_ratehetmodel5_", tmpList);
allowedParameters.add("d_ratehetmodel5_");
allowedParameters.add("d_numratecats5_");
tmpList = new ArrayList<String>();
tmpList.add("poisson");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_ratematrix5_", tmpList);
allowedParameters.add("p_ratematrix5_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("estimate");
tmpList.add("fixed");
tmpList.add("jones");
tmpList.add("dayhoff");
tmpList.add("wag");
tmpList.add("mtmam");
tmpList.add("mtrev");
exclValues.put("p_statefrequencies5_", tmpList);
allowedParameters.add("p_statefrequencies5_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("estimate");
exclValues.put("p_invariantsites5_", tmpList);
allowedParameters.add("p_invariantsites5_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("gamma");
exclValues.put("p_ratehetmodel5_", tmpList);
allowedParameters.add("p_ratehetmodel5_");
allowedParameters.add("p_numratecats5_");
tmpList = new ArrayList<String>();
tmpList.add("1rate");
tmpList.add("2rate");
tmpList.add("6rate");
tmpList.add("fixed");
tmpList.add("custom");
tmpList.add("string");
exclValues.put("c_ratematrix5_", tmpList);
allowedParameters.add("c_ratematrix5_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("empirical");
tmpList.add("f1x4");
tmpList.add("f3x4");
exclValues.put("c_statefrequencies5_", tmpList);
allowedParameters.add("c_statefrequencies5_");
tmpList = new ArrayList<String>();
tmpList.add("none");
tmpList.add("nonsynonymous");
exclValues.put("c_ratehetmodel5_", tmpList);
allowedParameters.add("c_ratehetmodel5_");
allowedParameters.add("c_numratecats5_");
tmpList = new ArrayList<String>();
tmpList.add("random");
tmpList.add("stepwise");
tmpList.add("upload");
exclValues.put("streefname_choose_", tmpList);
allowedParameters.add("streefname_choose_");
requiredParameters.add("streefname_choose_");
allowedParameters.add("attachments_val_");
allowedParameters.add("searchreps_value_");
requiredParameters.add("searchreps_value_");
allowedParameters.add("bootstrapreps_");
allowedParameters.add("outgroup_tax_");
allowedParameters.add("collapsebranches_g_");
switchValues.put("collapsebranches_g_", switchList);
allowedParameters.add("constraintfile_");
switchValues.put("constraintfile_", switchList);
allowedParameters.add("refinestart_");
switchValues.put("refinestart_", switchList);
allowedParameters.add("randseed_");
allowedParameters.add("selectionintensity_");
allowedParameters.add("nindivs_");
allowedParameters.add("startoptprec_");
allowedParameters.add("minoptprec_");
allowedParameters.add("numberofprecreductions_");
allowedParameters.add("modweight_");
allowedParameters.add("brlenweight_");
allowedParameters.add("topoweight_");
allowedParameters.add("randnniweight_");
allowedParameters.add("randsprweight_");
allowedParameters.add("limsprweight_");
allowedParameters.add("limsprrange_");
allowedParameters.add("uniqueswapbias_");
allowedParameters.add("saveevery_g_");
allowedParameters.add("outputcurrentbesttopology_");
switchValues.put("outputcurrentbesttopology_", switchList);
allowedParameters.add("logevery_g_");
allowedParameters.add("outputeachbettertopology_g_");
switchValues.put("outputeachbettertopology_g_", switchList);
allowedParameters.add("inferinternalstateprobs_g_");
switchValues.put("inferinternalstateprobs_g_", switchList);
allowedParameters.add("outputphyliptree_g_");
switchValues.put("outputphyliptree_g_", switchList);
allowedParameters.add("outputmostlyuselessfiles_g_");
switchValues.put("outputmostlyuselessfiles_g_", switchList);
allowedParameters.add("enforcetermconditions_");
switchValues.put("enforcetermconditions_", switchList);
allowedParameters.add("genthreshfortopoterm_");
allowedParameters.add("significanttopochange_");
allowedParameters.add("scorethreshforterm_");
allowedParameters.add("stopgen_");
allowedParameters.add("stoptime_");
allowedParameters.add("resampleproportion_");
}
public List<FieldError> getErrors()
{
return errors;
}
public Map<String, String> preProcessParameters(Map<String, List<String>> parameters)
{
Map<String, String> preProcessed = new HashMap<String, String>();
for (String param : parameters.keySet())
{
String newValue;
List<String> values = parameters.get(param);
// Is param of type List?
if (listValues.keySet().contains(param))
{
for (String value : values)
{
List<String> permittedValues = listValues.get(param);
if (!permittedValues.contains(value))
{
errors.add(new FieldError(param, "'" + value + "' is not a permitted value."));
}
}
// concatenate the multiple choices.
String separator = listParameters.get(param);
if (separator != null)
{
newValue = SuperString.valueOf(parameters.get(param), separator.charAt(0)).toString();
} else
{
newValue = SuperString.valueOf(parameters.get(param), '@').toString();
}
} else
{
newValue = parameters.get(param).get(0);
if (parameters.get(param).size() > 1)
{
errors.add(new FieldError(param, "multiple values are not permitted."));
}
if (exclValues.keySet().contains(param))
{
if (!exclValues.get(param).contains(newValue))
{
errors.add(new FieldError(param, "'" + newValue + "' is not a permitted value."));
}
} else if (switchValues.keySet().contains(param))
{
if (!switchValues.get(param).contains(newValue))
{
// todo: error
errors.add(new FieldError(param, "'" + newValue + "' is not a permitted value, must be 0 or 1."));
}
}
}
preProcessed.put(param, newValue);
}
return preProcessed;
}
public void validateParameters(Map<String, String> parameters) {
Set<String> missingRequired = validateRequiredParameters(parameters);
for (String missing : missingRequired)
{
errors.add(new FieldError(missing, "Parameter is required."));
}
for (String param : parameters.keySet())
{
if (!allowedParameters.contains(param))
{
errors.add(new FieldError(param, "Does not exist."));
continue;
}
String error = validate(param, parameters.get(param));
if (error != null)
{
errors.add(new FieldError(param, error));
}
}
}
public void validateInput(Set<String> input) {
Set<String> missingRequired = validateRequiredInput(input);
for (String missing : missingRequired)
{
errors.add(new FieldError(missing, "Input file parameter is required."));
}
}
String validate(String parameter, Object value) {
if (parameter.equals("numparts_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("d_numratecats_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("p_numratecats_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("c_numratecats_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("d_numratecats1_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("p_numratecats1_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("c_numratecats1_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("d_numratecats2_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("p_numratecats2_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("c_numratecats2_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("d_numratecats3_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("p_numratecats3_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("c_numratecats3_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("d_numratecats4_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("p_numratecats4_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("c_numratecats4_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("d_numratecats5_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("p_numratecats5_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("c_numratecats5_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("streefname_choose_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("attachments_val_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("searchreps_value_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("bootstrapreps_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("randseed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("selectionintensity_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("nindivs_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("startoptprec_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("minoptprec_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("numberofprecreductions_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("modweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("brlenweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("topoweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("randnniweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("randsprweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("limsprweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("limsprrange_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("uniqueswapbias_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("saveevery_g_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("logevery_g_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("genthreshfortopoterm_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("significanttopochange_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("scorethreshforterm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("stopgen_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("stoptime_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("resampleproportion_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
return null;
}
private Set<String> validateRequiredParameters(Map<String, String> parameters) {
Set<String> required = new HashSet<String>(requiredParameters.size());
required.addAll(requiredParameters);
for (String parameter : parameters.keySet()) {
if (required.contains(parameter))
required.remove(parameter);
}
return required;
}
private Set<String> validateRequiredInput(Map<String, List<TaskInputSourceDocument>> input) {
Set<String> required = new HashSet<String>(requiredInput.size());
required.addAll(requiredInput);
for (String parameter : input.keySet()) {
if (required.contains(parameter))
required.remove(parameter);
}
return required;
}
private Set<String> validateRequiredInput(Set<String> input) {
Set<String> required = new HashSet<String>(requiredInput.size());
required.addAll(requiredInput);
for (String parameter : input) {
if (required.contains(parameter))
required.remove(parameter);
}
return required;
}
}