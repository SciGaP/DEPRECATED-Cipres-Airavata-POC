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
public class raxml_light2Validator implements ParameterValidator2
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
public raxml_light2Validator() {
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
allowedInput.add("partition_");
allowedParameters.add("estimate_branch_");
switchValues.put("estimate_branch_", switchList);
allowedParameters.add("outgroup_");
tmpList = new ArrayList<String>();
tmpList.add("dna");
tmpList.add("protein");
exclValues.put("datatype_", tmpList);
allowedParameters.add("datatype_");
requiredParameters.add("datatype_");
tmpList = new ArrayList<String>();
tmpList.add("GTRCAT");
tmpList.add("GTRGAMMA");
exclValues.put("dna_model_", tmpList);
allowedParameters.add("dna_model_");
tmpList = new ArrayList<String>();
tmpList.add("PROTCAT");
tmpList.add("PROTGAMMA");
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
tmpList.add("AUTO");
tmpList.add("GTR");
exclValues.put("prot_matrix_spec_", tmpList);
allowedParameters.add("prot_matrix_spec_");
tmpList = new ArrayList<String>();
tmpList.add("F");
tmpList.add("");
exclValues.put("empirical_", tmpList);
allowedParameters.add("empirical_");
allowedParameters.add("number_cats_");
allowedParameters.add("pars_hours_");
requiredParameters.add("pars_hours_");
allowedParameters.add("rsearch_seed_");
requiredParameters.add("rsearch_seed_");
allowedParameters.add("num_rsearches_");
requiredParameters.add("num_rsearches_");
allowedParameters.add("search_hours_");
requiredParameters.add("search_hours_");
allowedParameters.add("use_mlsearchcc_");
switchValues.put("use_mlsearchcc_", switchList);
allowedParameters.add("num_bsearches_");
allowedParameters.add("bootstrap_seed_");
requiredParameters.add("bootstrap_seed_");
tmpList = new ArrayList<String>();
tmpList.add("autoFC");
tmpList.add("autoMR");
tmpList.add("autoMRE");
tmpList.add("autoMRE_IGN");
exclValues.put("aposterior_bootstopping_", tmpList);
allowedParameters.add("aposterior_bootstopping_");
requiredParameters.add("aposterior_bootstopping_");
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
if (parameter.equals("pars_hours_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("rsearch_seed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("num_rsearches_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("search_hours_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("bootstrap_seed_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("aposterior_bootstopping_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
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