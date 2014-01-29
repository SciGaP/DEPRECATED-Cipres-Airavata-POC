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
public class muscleValidator implements ParameterValidator2
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
public muscleValidator() {
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
allowedParameters.add("runtime_");
requiredParameters.add("runtime_");
allowedInput.add("infile_");
requiredInput.add("infile_");
tmpList = new ArrayList<String>();
tmpList.add("protein");
tmpList.add("dna");
tmpList.add("rna");
tmpList.add("auto");
exclValues.put("data_type_", tmpList);
allowedParameters.add("data_type_");
requiredParameters.add("data_type_");
allowedParameters.add("stable_");
switchValues.put("stable_", switchList);
allowedParameters.add("make_scorefile_");
switchValues.put("make_scorefile_", switchList);
allowedParameters.add("clusteronly_");
switchValues.put("clusteronly_", switchList);
allowedParameters.add("clusteronlymaxiters_");
allowedParameters.add("maxiterations_");
allowedParameters.add("max_mem_");
requiredParameters.add("max_mem_");
tmpList = new ArrayList<String>();
tmpList.add("-le");
tmpList.add("-sp");
tmpList.add("-sv");
exclValues.put("protprofilefunction_", tmpList);
allowedParameters.add("protprofilefunction_");
allowedParameters.add("hydrowindow_");
allowedParameters.add("hydrofactormultiplier_");
allowedParameters.add("logfile_");
switchValues.put("logfile_", switchList);
allowedParameters.add("verboselogfile_");
switchValues.put("verboselogfile_", switchList);
allowedParameters.add("add_matrix_");
switchValues.put("add_matrix_", switchList);
allowedInput.add("mymatrix_");
allowedParameters.add("gpopen_");
allowedParameters.add("gpextend_");
allowedParameters.add("ctr_");
allowedParameters.add("use_diags_");
switchValues.put("use_diags_", switchList);
listParameters.put("diagfunction_", null);
allowedParameters.add("diagfunction_");
tmpList = new ArrayList<String>();
tmpList.add("-diags1");
tmpList.add("-diags2");
tmpList.add("-diags");
listValues.put("diagfunction_", tmpList);
allowedParameters.add("maxdiagdist_");
allowedParameters.add("mindiaglength_");
allowedParameters.add("diagmarginpos_");
allowedParameters.add("use_guide_tree_");
switchValues.put("use_guide_tree_", switchList);
allowedInput.add("guidetree_");
allowedParameters.add("make_tree1file_");
switchValues.put("make_tree1file_", switchList);
allowedParameters.add("make_tree2file_");
switchValues.put("make_tree2file_", switchList);
allowedParameters.add("use_weights_1_");
switchValues.put("use_weights_1_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("henikoff");
tmpList.add("henikoffpb");
tmpList.add("gsc");
tmpList.add("clustalw");
tmpList.add("threeway");
exclValues.put("weight1_", tmpList);
allowedParameters.add("weight1_");
requiredParameters.add("weight1_");
tmpList = new ArrayList<String>();
tmpList.add("kmer6_6");
tmpList.add("kmer20_3");
tmpList.add("kmer20_4");
tmpList.add("kbit20_3");
tmpList.add("kmer4_6");
exclValues.put("distance1p_", tmpList);
allowedParameters.add("distance1p_");
tmpList = new ArrayList<String>();
tmpList.add("upgma");
tmpList.add("upgmb");
tmpList.add("neighborjoining");
exclValues.put("cluster1_", tmpList);
allowedParameters.add("cluster1_");
requiredParameters.add("cluster1_");
allowedParameters.add("sueff1_");
tmpList = new ArrayList<String>();
tmpList.add("pseudo");
tmpList.add("midlongestspan");
tmpList.add("minavgleafdist");
exclValues.put("root1_", tmpList);
allowedParameters.add("root1_");
requiredParameters.add("root1_");
allowedParameters.add("maxtrees_");
allowedParameters.add("use_weights_2_");
switchValues.put("use_weights_2_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("henikoff");
tmpList.add("henikoffpb");
tmpList.add("gsc");
tmpList.add("clustalw");
tmpList.add("threeway");
exclValues.put("weight2_", tmpList);
allowedParameters.add("weight2_");
tmpList = new ArrayList<String>();
tmpList.add("kmer20_3");
tmpList.add("kmer20_4");
tmpList.add("kbit20_3");
tmpList.add("pctid_kimura");
tmpList.add("pctid_log");
exclValues.put("distance2_", tmpList);
allowedParameters.add("distance2_");
tmpList = new ArrayList<String>();
tmpList.add("upgma");
tmpList.add("upgmb");
tmpList.add("neighborjoining");
exclValues.put("cluster2_", tmpList);
allowedParameters.add("cluster2_");
allowedParameters.add("sueff2_");
tmpList = new ArrayList<String>();
tmpList.add("pseudo");
tmpList.add("midlongestspan");
tmpList.add("minavgleafdist");
exclValues.put("root2_", tmpList);
allowedParameters.add("root2_");
tmpList = new ArrayList<String>();
tmpList.add("sp");
tmpList.add("spf");
tmpList.add("spm");
tmpList.add("ps");
tmpList.add("dp");
tmpList.add("xp");
exclValues.put("objectivescore_", tmpList);
allowedParameters.add("objectivescore_");
allowedParameters.add("anchor_");
switchValues.put("anchor_", switchList);
allowedParameters.add("minanchorcolumnspacing_");
allowedParameters.add("minanchorcolumnscore_");
allowedParameters.add("minsmoothanchorscore_");
allowedParameters.add("anchorsmoothingwindow_");
allowedParameters.add("output_fasta_");
switchValues.put("output_fasta_", switchList);
allowedParameters.add("output_clustal_");
switchValues.put("output_clustal_", switchList);
allowedParameters.add("output_clustals_");
switchValues.put("output_clustals_", switchList);
allowedParameters.add("output_html_");
switchValues.put("output_html_", switchList);
allowedParameters.add("output_gcg_");
switchValues.put("output_gcg_", switchList);
allowedParameters.add("output_phyi_");
switchValues.put("output_phyi_", switchList);
allowedParameters.add("output_phys_");
switchValues.put("output_phys_", switchList);
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
if (parameter.equals("runtime_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("data_type_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("clusteronlymaxiters_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxiterations_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("max_mem_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("hydrowindow_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("hydrofactormultiplier_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("gpopen_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("gpextend_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ctr_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxdiagdist_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("mindiaglength_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("diagmarginpos_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("weight1_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("cluster1_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("sueff1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("root1_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("maxtrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sueff2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("minanchorcolumnspacing_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("minanchorcolumnscore_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("minsmoothanchorscore_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("anchorsmoothingwindow_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
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