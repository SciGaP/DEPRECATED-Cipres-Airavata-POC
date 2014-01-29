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
public class drawgramValidator implements ParameterValidator2
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
public drawgramValidator() {
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
allowedInput.add("treefile_");
requiredInput.add("treefile_");
tmpList = new ArrayList<String>();
tmpList.add("L");
tmpList.add("M");
tmpList.add("J");
tmpList.add("W");
tmpList.add("K");
tmpList.add("H");
tmpList.add("D");
tmpList.add("B");
tmpList.add("E");
tmpList.add("C");
tmpList.add("O");
tmpList.add("T");
tmpList.add("P");
tmpList.add("X");
tmpList.add("F");
tmpList.add("A");
tmpList.add("Z");
tmpList.add("V");
tmpList.add("R");
exclValues.put("plotter_", tmpList);
allowedParameters.add("plotter_");
allowedParameters.add("xres_");
allowedParameters.add("yres_");
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
exclValues.put("laserjet_resolution_", tmpList);
allowedParameters.add("laserjet_resolution_");
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
exclValues.put("pcx_resolution_", tmpList);
allowedParameters.add("pcx_resolution_");
tmpList = new ArrayList<String>();
tmpList.add("Vertically");
tmpList.add("Horizontally");
exclValues.put("grows_", tmpList);
allowedParameters.add("grows_");
tmpList = new ArrayList<String>();
tmpList.add("C");
tmpList.add("P");
tmpList.add("V");
tmpList.add("E");
tmpList.add("S");
tmpList.add("O");
exclValues.put("tree_style_", tmpList);
allowedParameters.add("tree_style_");
allowedParameters.add("branch_lengths_");
switchValues.put("branch_lengths_", switchList);
allowedParameters.add("horizontal_margins_");
allowedParameters.add("vertical_margins_");
allowedParameters.add("scale_");
allowedParameters.add("depth_");
allowedParameters.add("stem_");
allowedParameters.add("character_height_");
tmpList = new ArrayList<String>();
tmpList.add("I");
tmpList.add("W");
tmpList.add("C");
tmpList.add("N");
tmpList.add("V");
exclValues.put("ancestral_", tmpList);
allowedParameters.add("ancestral_");
allowedParameters.add("font_");
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
if (parameter.equals("xres_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("yres_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("horizontal_margins_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("vertical_margins_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("scale_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("depth_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("stem_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("character_height_")) {
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