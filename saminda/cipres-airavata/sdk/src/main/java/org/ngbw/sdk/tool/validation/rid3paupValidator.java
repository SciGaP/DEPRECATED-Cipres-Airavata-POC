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
public class rid3paupValidator implements ParameterValidator2
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
public rid3paupValidator() {
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
allowedParameters.add("maxtaxasubsetsize_");
allowedParameters.add("maxtaxasubsetpercent_");
allowedParameters.add("maxrecursionlevels_");
allowedParameters.add("maxiterations_");
allowedParameters.add("maxanalysistime_");
tmpList = new ArrayList<String>();
tmpList.add("yes");
tmpList.add("no");
exclValues.put("ignorestartedgelen_", tmpList);
allowedParameters.add("ignorestartedgelen_");
requiredParameters.add("ignorestartedgelen_");
tmpList = new ArrayList<String>();
tmpList.add("no");
tmpList.add("yes");
exclValues.put("breakties_", tmpList);
allowedParameters.add("breakties_");
requiredParameters.add("breakties_");
allowedParameters.add("seed_");
allowedParameters.add("maxtrees_");
tmpList = new ArrayList<String>();
tmpList.add("no");
tmpList.add("auto");
exclValues.put("increase_", tmpList);
allowedParameters.add("increase_");
allowedParameters.add("autoincrease_");
tmpList = new ArrayList<String>();
tmpList.add("tbr");
tmpList.add("spr");
tmpList.add("nni");
exclValues.put("swap_", tmpList);
allowedParameters.add("swap_");
requiredParameters.add("swap_");
tmpList = new ArrayList<String>();
tmpList.add("yes");
tmpList.add("no");
exclValues.put("multrees_", tmpList);
allowedParameters.add("multrees_");
requiredParameters.add("multrees_");
allowedParameters.add("rearrlimit_");
allowedParameters.add("timelimit_");
allowedParameters.add("reconlimit_");
allowedParameters.add("ratchetreps_");
allowedParameters.add("ratchetprop_");
allowedParameters.add("ratchetseed_");
allowedParameters.add("s_maxtrees_");
tmpList = new ArrayList<String>();
tmpList.add("no");
tmpList.add("auto");
exclValues.put("s_increase_", tmpList);
allowedParameters.add("s_increase_");
allowedParameters.add("s_autoincrease_");
tmpList = new ArrayList<String>();
tmpList.add("tbr");
tmpList.add("spr");
tmpList.add("nni");
exclValues.put("s_swap_", tmpList);
allowedParameters.add("s_swap_");
requiredParameters.add("s_swap_");
tmpList = new ArrayList<String>();
tmpList.add("yes");
tmpList.add("no");
exclValues.put("s_multrees_", tmpList);
allowedParameters.add("s_multrees_");
requiredParameters.add("s_multrees_");
allowedParameters.add("s_rearrlimit_");
allowedParameters.add("s_timelimit_");
allowedParameters.add("s_reconlimit_");
allowedParameters.add("s_ratchetreps_");
allowedParameters.add("s_ratchetprop_");
allowedParameters.add("s_ratchetseed_");
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
if (parameter.equals("maxtaxasubsetsize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxtaxasubsetpercent_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxrecursionlevels_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxiterations_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxanalysistime_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ignorestartedgelen_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("breakties_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("seed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxtrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("autoincrease_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("swap_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("multrees_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("rearrlimit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("timelimit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("reconlimit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ratchetreps_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ratchetprop_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ratchetseed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_maxtrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_autoincrease_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_swap_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("s_multrees_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("s_rearrlimit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_timelimit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_reconlimit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_ratchetreps_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("s_ratchetprop_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("s_ratchetseed_")) {
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