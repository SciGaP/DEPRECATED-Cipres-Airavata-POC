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
public class boxshadeValidator implements ParameterValidator2
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
public boxshadeValidator() {
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
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("6");
tmpList.add("7");
tmpList.add("8");
tmpList.add("9");
tmpList.add("a");
tmpList.add("c");
tmpList.add("d");
tmpList.add("e");
exclValues.put("output_format_", tmpList);
allowedParameters.add("output_format_");
requiredParameters.add("output_format_");
allowedParameters.add("print_name_");
switchValues.put("print_name_", switchList);
allowedParameters.add("ruler_");
switchValues.put("ruler_", switchList);
allowedParameters.add("space_between_name_sequence_");
allowedParameters.add("ignored_gaps_");
allowedParameters.add("sequence_characters_");
allowedParameters.add("lines_");
allowedParameters.add("character_size_");
tmpList = new ArrayList<String>();
tmpList.add("S");
tmpList.add("T");
exclValues.put("save_shading_", tmpList);
allowedParameters.add("save_shading_");
allowedParameters.add("rotate_");
switchValues.put("rotate_", switchList);
allowedParameters.add("label_similar_");
switchValues.put("label_similar_", switchList);
allowedParameters.add("label_identical_");
switchValues.put("label_identical_", switchList);
allowedParameters.add("consensus_");
switchValues.put("consensus_", switchList);
allowedParameters.add("threshold_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("W");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("R");
tmpList.add("G");
tmpList.add("L");
tmpList.add("Y");
tmpList.add("M");
tmpList.add("C");
exclValues.put("different_background_", tmpList);
allowedParameters.add("different_background_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("b");
tmpList.add("W");
tmpList.add("w");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("7");
tmpList.add("8");
tmpList.add("R");
tmpList.add("r");
tmpList.add("G");
tmpList.add("g");
tmpList.add("L");
tmpList.add("l");
tmpList.add("Y");
tmpList.add("y");
tmpList.add("M");
tmpList.add("m");
tmpList.add("C");
tmpList.add("c");
exclValues.put("different_foreground_", tmpList);
allowedParameters.add("different_foreground_");
requiredParameters.add("different_foreground_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("W");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("R");
tmpList.add("G");
tmpList.add("L");
tmpList.add("Y");
tmpList.add("M");
tmpList.add("C");
exclValues.put("identical_background_", tmpList);
allowedParameters.add("identical_background_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("b");
tmpList.add("W");
tmpList.add("w");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("7");
tmpList.add("8");
tmpList.add("R");
tmpList.add("r");
tmpList.add("G");
tmpList.add("g");
tmpList.add("L");
tmpList.add("l");
tmpList.add("Y");
tmpList.add("y");
tmpList.add("M");
tmpList.add("m");
tmpList.add("C");
tmpList.add("c");
exclValues.put("identical_foreground_", tmpList);
allowedParameters.add("identical_foreground_");
requiredParameters.add("identical_foreground_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("W");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("R");
tmpList.add("G");
tmpList.add("L");
tmpList.add("Y");
tmpList.add("M");
tmpList.add("C");
exclValues.put("similar_background_", tmpList);
allowedParameters.add("similar_background_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("b");
tmpList.add("W");
tmpList.add("w");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("7");
tmpList.add("8");
tmpList.add("R");
tmpList.add("r");
tmpList.add("G");
tmpList.add("g");
tmpList.add("L");
tmpList.add("l");
tmpList.add("Y");
tmpList.add("y");
tmpList.add("M");
tmpList.add("m");
tmpList.add("C");
tmpList.add("c");
exclValues.put("similar_foreground_", tmpList);
allowedParameters.add("similar_foreground_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("W");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("R");
tmpList.add("G");
tmpList.add("L");
tmpList.add("Y");
tmpList.add("M");
tmpList.add("C");
exclValues.put("conserved_background_", tmpList);
allowedParameters.add("conserved_background_");
tmpList = new ArrayList<String>();
tmpList.add("B");
tmpList.add("b");
tmpList.add("W");
tmpList.add("w");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("7");
tmpList.add("8");
tmpList.add("R");
tmpList.add("r");
tmpList.add("G");
tmpList.add("g");
tmpList.add("L");
tmpList.add("l");
tmpList.add("Y");
tmpList.add("y");
tmpList.add("M");
tmpList.add("m");
tmpList.add("C");
tmpList.add("c");
exclValues.put("conserved_foreground_", tmpList);
allowedParameters.add("conserved_foreground_");
allowedParameters.add("single_");
switchValues.put("single_", switchList);
allowedParameters.add("seq_no_");
allowedParameters.add("hide_");
switchValues.put("hide_", switchList);
allowedParameters.add("show_normal_");
switchValues.put("show_normal_", switchList);
allowedParameters.add("matrix_");
switchValues.put("matrix_", switchList);
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
if (parameter.equals("output_format_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("space_between_name_sequence_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ignored_gaps_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sequence_characters_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("lines_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("character_size_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("threshold_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("different_foreground_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("identical_foreground_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("seq_no_")) {
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