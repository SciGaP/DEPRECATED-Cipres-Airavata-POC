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
public class phymlValidator implements ParameterValidator2
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
public phymlValidator() {
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
allowedInput.add("alignment_");
requiredInput.add("alignment_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("data_type_", tmpList);
allowedParameters.add("data_type_");
requiredParameters.add("data_type_");
tmpList = new ArrayList<String>();
tmpList.add("i");
tmpList.add("s");
exclValues.put("format_", tmpList);
allowedParameters.add("format_");
requiredParameters.add("format_");
allowedParameters.add("datasets_");
requiredParameters.add("datasets_");
allowedParameters.add("bootstrap_sets_");
requiredParameters.add("bootstrap_sets_");
tmpList = new ArrayList<String>();
tmpList.add("JC69");
tmpList.add("K2P");
tmpList.add("F81");
tmpList.add("HKY");
tmpList.add("F84");
tmpList.add("TN93");
tmpList.add("GTR");
tmpList.add("JTT");
tmpList.add("MtREV");
tmpList.add("Dayhoff");
tmpList.add("WAG");
exclValues.put("model_", tmpList);
allowedParameters.add("model_");
requiredParameters.add("model_");
allowedParameters.add("kappa_");
allowedParameters.add("kappa_e_");
switchValues.put("kappa_e_", switchList);
allowedParameters.add("invar_");
allowedParameters.add("invar_e_");
switchValues.put("invar_e_", switchList);
allowedParameters.add("nb_categ_");
requiredParameters.add("nb_categ_");
allowedParameters.add("alpha_");
allowedParameters.add("alpha_e_");
switchValues.put("alpha_e_", switchList);
allowedParameters.add("opt_topology_");
switchValues.put("opt_topology_", switchList);
allowedParameters.add("opt_lengths_");
switchValues.put("opt_lengths_", switchList);
allowedParameters.add("user_tree_");
switchValues.put("user_tree_", switchList);
allowedInput.add("user_tree_file_");
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
if (parameter.equals("data_type_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("format_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("datasets_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("bootstrap_sets_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("model_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("kappa_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("invar_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("nb_categ_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("alpha_")) {
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