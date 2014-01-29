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
public class raxmlhpc2_tgbValidator implements ParameterValidator2
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
public raxmlhpc2_tgbValidator() {
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
allowedParameters.add("runtime_");
requiredParameters.add("runtime_");
allowedParameters.add("more_memory_");
switchValues.put("more_memory_", switchList);
allowedParameters.add("nchar_");
allowedParameters.add("ntax_");
tmpList = new ArrayList<String>();
tmpList.add("protein");
tmpList.add("dna");
tmpList.add("rna");
tmpList.add("binary");
tmpList.add("multi");
exclValues.put("datatype_", tmpList);
allowedParameters.add("datatype_");
requiredParameters.add("datatype_");
allowedParameters.add("outgroup_");
allowedParameters.add("number_cats_");
allowedInput.add("treetop_");
allowedParameters.add("provide_parsimony_seed_");
switchValues.put("provide_parsimony_seed_", switchList);
allowedParameters.add("parsimony_seed_val_");
allowedParameters.add("rearrangement_yes_");
switchValues.put("rearrangement_yes_", switchList);
allowedParameters.add("number_rearrange_");
allowedInput.add("constraint_");
allowedInput.add("binary_backbone_");
allowedInput.add("partition_");
allowedParameters.add("estimate_perpartbrlen_");
switchValues.put("estimate_perpartbrlen_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("I");
tmpList.add("");
exclValues.put("invariable_", tmpList);
allowedParameters.add("invariable_");
allowedInput.add("exclude_file_");
allowedParameters.add("dna_gtrcat_");
switchValues.put("dna_gtrcat_", switchList);
allowedParameters.add("dna_gtrgamma_");
switchValues.put("dna_gtrgamma_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("PROTGAMMA");
tmpList.add("PROTCAT");
exclValues.put("prot_sub_model_", tmpList);
allowedParameters.add("prot_sub_model_");
tmpList = new ArrayList<String>();
tmpList.add("DAYHOFF");
tmpList.add("DCMUT");
tmpList.add("JTT");
tmpList.add("MTREV");
tmpList.add("WAG");
tmpList.add("RTREV");
tmpList.add("CPREV");
tmpList.add("VT");
tmpList.add("BLOSUM62");
tmpList.add("MTMAM");
tmpList.add("LG");
tmpList.add("MTART");
tmpList.add("MTZOA");
tmpList.add("PMB");
tmpList.add("HIVB");
tmpList.add("HIVW");
tmpList.add("JTTDCMUT");
tmpList.add("FLU");
tmpList.add("GTR");
exclValues.put("prot_matrix_spec_", tmpList);
allowedParameters.add("prot_matrix_spec_");
allowedInput.add("user_prot_matrix_");
allowedParameters.add("mulcustom_aa_matrices_");
switchValues.put("mulcustom_aa_matrices_", switchList);
allowedInput.add("user_prot_matrixq1_");
allowedInput.add("user_prot_matrixq2_");
allowedInput.add("user_prot_matrixq3_");
allowedInput.add("user_prot_matrixq4_");
allowedInput.add("user_prot_matrixq5_");
tmpList = new ArrayList<String>();
tmpList.add("F");
tmpList.add("");
exclValues.put("use_emp_freqs_", tmpList);
allowedParameters.add("use_emp_freqs_");
allowedInput.add("sec_str_file_");
tmpList = new ArrayList<String>();
tmpList.add("S6A");
tmpList.add("S6B");
tmpList.add("S6C");
tmpList.add("S6D");
tmpList.add("S6E");
tmpList.add("S7A");
tmpList.add("S7B");
tmpList.add("S7C");
tmpList.add("S7D");
tmpList.add("S7E");
tmpList.add("S7F");
tmpList.add("S16A");
tmpList.add("S16B");
exclValues.put("rna_model_", tmpList);
allowedParameters.add("rna_model_");
tmpList = new ArrayList<String>();
tmpList.add("BINCAT");
tmpList.add("BINGAMMA");
exclValues.put("bin_model_", tmpList);
allowedParameters.add("bin_model_");
tmpList = new ArrayList<String>();
tmpList.add("MULTICAT");
tmpList.add("MULTIGAMMA");
exclValues.put("multi_model_", tmpList);
allowedParameters.add("multi_model_");
tmpList = new ArrayList<String>();
tmpList.add("ORDERED");
tmpList.add("MK");
tmpList.add("GTR");
exclValues.put("choose_multi_model_", tmpList);
allowedParameters.add("choose_multi_model_");
allowedParameters.add("startingtreeonly_");
switchValues.put("startingtreeonly_", switchList);
allowedParameters.add("specify_runs_");
switchValues.put("specify_runs_", switchList);
allowedParameters.add("altrun_number_");
allowedParameters.add("bipartitions_");
switchValues.put("bipartitions_", switchList);
allowedParameters.add("ancestral_states_");
switchValues.put("ancestral_states_", switchList);
allowedParameters.add("log_likelihood_");
switchValues.put("log_likelihood_", switchList);
allowedParameters.add("compute_mr_");
switchValues.put("compute_mr_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("MR");
tmpList.add("MRE");
exclValues.put("specify_mr_", tmpList);
allowedParameters.add("specify_mr_");
allowedInput.add("bunchotops_");
allowedParameters.add("compute_ml_distances_");
switchValues.put("compute_ml_distances_", switchList);
allowedParameters.add("fast_tree_");
switchValues.put("fast_tree_", switchList);
allowedParameters.add("mulparambootstrap_seed_");
switchValues.put("mulparambootstrap_seed_", switchList);
allowedParameters.add("mulparambootstrap_seed_val_");
allowedParameters.add("bootstrap_seed_");
switchValues.put("bootstrap_seed_", switchList);
allowedParameters.add("bootstrap_seed_val_");
allowedParameters.add("mlsearch_");
switchValues.put("mlsearch_", switchList);
allowedParameters.add("printbrlength_");
switchValues.put("printbrlength_", switchList);
allowedParameters.add("specify_bootstraps_");
switchValues.put("specify_bootstraps_", switchList);
allowedParameters.add("bootstop_");
allowedParameters.add("use_bootstopping_");
switchValues.put("use_bootstopping_", switchList);
allowedParameters.add("freq_bootstopping_");
switchValues.put("freq_bootstopping_", switchList);
allowedParameters.add("mr_bootstopping_");
switchValues.put("mr_bootstopping_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("autoMR");
tmpList.add("autoMRE");
tmpList.add("autoMRE_IGN");
exclValues.put("mrbootstopping_type_", tmpList);
allowedParameters.add("mrbootstopping_type_");
allowedParameters.add("use_apobootstopping_");
switchValues.put("use_apobootstopping_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("autoFC");
tmpList.add("autoMR");
tmpList.add("autoMRE");
tmpList.add("autoMRE_IGN");
exclValues.put("aposterior_bootstopping_", tmpList);
allowedParameters.add("aposterior_bootstopping_");
allowedInput.add("apo_tops_");
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
if (parameter.equals("nchar_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ntax_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("datatype_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("number_cats_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("parsimony_seed_val_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("number_rearrange_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("altrun_number_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("mulparambootstrap_seed_val_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("bootstrap_seed_val_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("bootstop_")) {
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