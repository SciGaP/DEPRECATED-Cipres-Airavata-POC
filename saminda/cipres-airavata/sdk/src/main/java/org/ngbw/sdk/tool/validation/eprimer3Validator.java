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
public class eprimer3Validator implements ParameterValidator2
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
public eprimer3Validator() {
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
allowedInput.add("sequence_");
requiredInput.add("sequence_");
allowedParameters.add("explainflag_");
switchValues.put("explainflag_", switchList);
allowedParameters.add("fileflag_");
switchValues.put("fileflag_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
exclValues.put("task_", tmpList);
allowedParameters.add("task_");
allowedParameters.add("noprimer_");
switchValues.put("noprimer_", switchList);
allowedParameters.add("hybridprobe_");
switchValues.put("hybridprobe_", switchList);
allowedParameters.add("numreturn_");
allowedParameters.add("firstbaseindex_");
allowedParameters.add("includedregion_");
allowedParameters.add("target_");
allowedParameters.add("excludedregion_");
allowedParameters.add("forwardinput_");
allowedParameters.add("reverseinput_");
allowedParameters.add("pickanyway_");
switchValues.put("pickanyway_", switchList);
allowedInput.add("mispriminglibrary_");
allowedParameters.add("maxmispriming_");
allowedParameters.add("pairmaxmispriming_");
allowedParameters.add("gcclamp_");
allowedParameters.add("osize_");
allowedParameters.add("minsize_");
allowedParameters.add("maxsize_");
allowedParameters.add("otm_");
allowedParameters.add("mintm_");
allowedParameters.add("maxtm_");
allowedParameters.add("maxdifftm_");
allowedParameters.add("ogcpercent_");
allowedParameters.add("mingc_");
allowedParameters.add("maxgc_");
allowedParameters.add("saltconc_");
allowedParameters.add("dnaconc_");
allowedParameters.add("numnsaccepted_");
allowedParameters.add("selfany_");
allowedParameters.add("selfend_");
allowedParameters.add("maxpolyx_");
allowedParameters.add("productosize_");
allowedParameters.add("productsizerange_");
allowedParameters.add("productotm_");
allowedParameters.add("productmintm_");
allowedParameters.add("productmaxtm_");
allowedParameters.add("maxendstability_");
allowedParameters.add("oligoexcludedregion_");
allowedParameters.add("oligoinput_");
allowedParameters.add("oligoosize_");
allowedParameters.add("oligominsize_");
allowedParameters.add("oligomaxsize_");
allowedParameters.add("oligootm_");
allowedParameters.add("oligomintm_");
allowedParameters.add("oligomaxtm_");
allowedParameters.add("oligoogcpercent_");
allowedParameters.add("oligomingc_");
allowedParameters.add("oligomaxgc_");
allowedParameters.add("oligosaltconc_");
allowedParameters.add("oligodnaconc_");
allowedParameters.add("oligoselfany_");
allowedParameters.add("oligoselfend_");
allowedParameters.add("oligomaxpolyx_");
allowedInput.add("oligomishyblibrary_");
allowedParameters.add("oligomaxmishyb_");
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
if (parameter.equals("numreturn_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("firstbaseindex_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxmispriming_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleMaxValue(value, 9999.99) == false)
return "Must be a Double less than " + "or equal to 9999.99";
return null;
}
if (parameter.equals("pairmaxmispriming_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleMaxValue(value, 9999.99) == false)
return "Must be a Double less than " + "or equal to 9999.99";
return null;
}
if (parameter.equals("gcclamp_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("osize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateIntegerMinValue(value, 1) == false)
return "Must be an integer greater than " + "or equal to 1";
return null;
}
if (parameter.equals("minsize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateIntegerMinValue(value, 1) == false)
return "Must be an integer greater than " + "or equal to 1";
return null;
}
if (parameter.equals("maxsize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateIntegerMaxValue(value, 35) == false)
return "Must be an integer less than " + "or equal to 35";
return null;
}
if (parameter.equals("otm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("mintm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxtm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxdifftm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ogcpercent_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("mingc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxgc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("saltconc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("dnaconc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("numnsaccepted_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("selfany_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleValueRange(value, 0.00, 9999.99) == false)
return "Must be a Double within the range " + "0.00 to 9999.99";
if (BaseValidator.validateDoubleMaxValue(value, 9999.99) == false)
return "Must be a Double less than " + "or equal to 9999.99";
return null;
}
if (parameter.equals("selfend_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxpolyx_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("productosize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("productotm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("productmintm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("productmaxtm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxendstability_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleMaxValue(value, 999.9999) == false)
return "Must be a Double less than " + "or equal to 999.9999";
return null;
}
if (parameter.equals("oligoexcludedregion_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("oligoosize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("oligominsize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("oligomaxsize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateIntegerMaxValue(value, 35) == false)
return "Must be an integer less than " + "or equal to 35";
return null;
}
if (parameter.equals("oligootm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligomintm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligomaxtm_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligoogcpercent_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligomingc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligomaxgc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligosaltconc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligodnaconc_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("oligoselfany_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleMaxValue(value, 9999.99) == false)
return "Must be a Double less than " + "or equal to 9999.99";
return null;
}
if (parameter.equals("oligoselfend_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleMaxValue(value, 9999.99) == false)
return "Must be a Double less than " + "or equal to 9999.99";
return null;
}
if (parameter.equals("oligomaxpolyx_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("oligomaxmishyb_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateDoubleMaxValue(value, 9999.99) == false)
return "Must be a Double less than " + "or equal to 9999.99";
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