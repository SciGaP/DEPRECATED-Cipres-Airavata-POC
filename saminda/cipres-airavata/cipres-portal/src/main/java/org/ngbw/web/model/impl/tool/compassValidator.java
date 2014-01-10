package org.ngbw.web.model.impl.tool;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.ngbw.sdk.api.tool.ParameterValidator;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
public class compassValidator implements ParameterValidator
{
private Set<String> requiredParameters;
private Set<String> requiredInput;
public compassValidator() {
requiredParameters = new HashSet<String>();
requiredInput = new HashSet<String>();
requiredInput.add("alignment_number_two_");
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
if (parameter.equals("gap_threshold_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gap_threshold_moderate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gap_opening_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("gap_extension_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("ungapped_lambda_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("expect_positional_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("database_length_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("alignment_length_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("number_sequences_")) {
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