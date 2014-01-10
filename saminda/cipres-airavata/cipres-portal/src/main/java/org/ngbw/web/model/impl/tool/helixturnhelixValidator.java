package org.ngbw.web.model.impl.tool;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.ngbw.sdk.api.tool.ParameterValidator;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
public class helixturnhelixValidator implements ParameterValidator
{
private Set<String> requiredParameters;
private Set<String> requiredInput;
public helixturnhelixValidator() {
requiredParameters = new HashSet<String>();
requiredInput = new HashSet<String>();
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
if (parameter.equals("mean_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
if (BaseValidator.validateDoubleValueRange(value, 1., 10000.) == false)
return "\"" + parameter + "\" must be a Double within the range " +
"1. to 10000.";
if (BaseValidator.validateDoubleMaxValue(value, 10000.) == false)
return "\"" + parameter + "\" must be a Double less than " +
"or equal to 10000.";
return null;
}
if (parameter.equals("sd_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
if (BaseValidator.validateDoubleValueRange(value, 1., 10000.) == false)
return "\"" + parameter + "\" must be a Double within the range " +
"1. to 10000.";
if (BaseValidator.validateDoubleMaxValue(value, 10000.) == false)
return "\"" + parameter + "\" must be a Double less than " +
"or equal to 10000.";
return null;
}
if (parameter.equals("minsd_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
if (BaseValidator.validateDoubleValueRange(value, 0., 100.) == false)
return "\"" + parameter + "\" must be a Double within the range " +
"0. to 100.";
if (BaseValidator.validateDoubleMaxValue(value, 100.) == false)
return "\"" + parameter + "\" must be a Double less than " +
"or equal to 100.";
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