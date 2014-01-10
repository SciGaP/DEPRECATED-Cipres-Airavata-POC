package org.ngbw.web.model.impl.tool;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.ngbw.sdk.api.tool.ParameterValidator;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
public class muscleValidator implements ParameterValidator
{
private Set<String> requiredParameters;
private Set<String> requiredInput;
public muscleValidator() {
requiredParameters = new HashSet<String>();
requiredInput = new HashSet<String>();
requiredParameters.add("runtime_");
requiredParameters.add("data_type_");
requiredParameters.add("max_mem_");
requiredParameters.add("weight1_");
requiredParameters.add("cluster1_");
requiredParameters.add("root1_");
}
public Map<String, String> validateParameters(Map<String, String> parameters) {
Map<String, String> errors = new HashMap<String, String>();
Set<String> missingRequired = validateRequiredParameters(parameters);
for (String missing : missingRequired) {
errors.put(missing, "You must enter a value for \"" + missing + "\"");
}
for (String param : parameters.keySet()) {
String error = validate(param, parameters.get(param));
if (error != null)
errors.put(param, error);
}
return errors;
}
public Map<String, String> validateInput(Map<String, List<TaskInputSourceDocument>> input) {
Map<String, String> errors = new HashMap<String, String>();
Set<String> missingRequired = validateRequiredInput(input);
for (String missing : missingRequired) {
errors.put(missing, "You must enter a value for \"" + missing + "\"");
}
for (String param : input.keySet()) {
String error = validate(param, input.get(param));
if (error != null)
errors.put(param, error);
}
return errors;
}
public String validate(String parameter, Object value) {
if (parameter.equals("runtime_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("data_type_")) {
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("clusteronlymaxiters_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("maxiterations_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("max_mem_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("hydrowindow_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("hydrofactormultiplier_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gpopen_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gpextend_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ctr_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("maxdiagdist_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("mindiaglength_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("diagmarginpos_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("weight1_")) {
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("cluster1_")) {
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("sueff1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("root1_")) {
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("maxtrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sueff2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("minanchorcolumnspacing_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("minanchorcolumnscore_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("minsmoothanchorscore_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("anchorsmoothingwindow_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
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
}