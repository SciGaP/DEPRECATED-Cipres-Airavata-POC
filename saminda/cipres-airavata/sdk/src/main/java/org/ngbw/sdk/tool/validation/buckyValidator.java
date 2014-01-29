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
public class buckyValidator implements ParameterValidator2
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
public buckyValidator() {
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
allowedInput.add("bb_infile1_");
requiredInput.add("bb_infile1_");
allowedParameters.add("num_files_");
allowedInput.add("bb_infile2_");
allowedInput.add("bb_infile3_");
allowedInput.add("bb_infile4_");
allowedInput.add("bb_infile5_");
allowedInput.add("bb_infile6_");
allowedInput.add("bb_infile7_");
allowedInput.add("bb_infile8_");
allowedInput.add("bb_infile9_");
allowedInput.add("bb_infile10_");
allowedParameters.add("set_outfile_name_");
allowedParameters.add("set_nchains_");
allowedParameters.add("set_mcmcmcrate_");
allowedParameters.add("set_alphamult_");
allowedParameters.add("set_ngen_");
allowedParameters.add("set_nanalyses_");
allowedParameters.add("set_alpha_");
allowedParameters.add("set_seed1_");
allowedParameters.add("set_seed2_");
allowedParameters.add("set_cfcutoff_");
allowedInput.add("prune_table_");
allowedParameters.add("calc_pairs_");
switchValues.put("calc_pairs_", switchList);
allowedParameters.add("use_independence_prior_");
switchValues.put("use_independence_prior_", switchList);
allowedParameters.add("do_not_use_update_groups_");
switchValues.put("do_not_use_update_groups_", switchList);
allowedParameters.add("create_sample_file_");
switchValues.put("create_sample_file_", switchList);
allowedParameters.add("set_subsamprate_");
allowedParameters.add("create_joint_file_");
switchValues.put("create_joint_file_", switchList);
allowedParameters.add("create_single_");
switchValues.put("create_single_", switchList);
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
if (parameter.equals("num_files_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_nchains_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_mcmcmcrate_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_alphamult_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("set_ngen_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_nanalyses_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_alpha_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("set_seed1_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_seed2_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_cfcutoff_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("set_subsamprate_")) {
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