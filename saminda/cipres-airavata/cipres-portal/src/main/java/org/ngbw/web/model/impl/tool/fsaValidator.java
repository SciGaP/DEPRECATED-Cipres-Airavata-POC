package org.ngbw.web.model.impl.tool;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.ngbw.sdk.api.tool.ParameterValidator;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
public class fsaValidator implements ParameterValidator
{
private Set<String> requiredParameters;
private Set<String> requiredInput;
public fsaValidator() {
requiredParameters = new HashSet<String>();
requiredInput = new HashSet<String>();
requiredParameters.add("runtime_");
requiredParameters.add("data_type_");
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
if (parameter.equals("evtime_param_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("alpha_R_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("alpha_Y_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("TN_beta_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("open_set1_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gap_set1_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("open_set2_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gap_set2_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("reg_gapscale_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("reg_emitscale_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("min_increase_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("max_rounds_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("min_gapdata_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("min_emitdata_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("gap_factor_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("num_iterations_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("min_spantree_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("max_spantree_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("max_palmtree_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("number_degree_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("kmer_length_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("alignment_fraction_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("alignment_number_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("min_anchorlen_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("max_joinlen_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("exon_minscore_")) {
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