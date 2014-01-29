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
public class mafftnewValidator implements ParameterValidator2
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
public mafftnewValidator() {
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
allowedInput.add("infile_");
requiredInput.add("infile_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("dna");
tmpList.add("protein");
exclValues.put("datatype_", tmpList);
allowedParameters.add("datatype_");
requiredParameters.add("datatype_");
tmpList = new ArrayList<String>();
tmpList.add("accurate");
tmpList.add("fast");
tmpList.add("rna");
exclValues.put("analysis_type_", tmpList);
allowedParameters.add("analysis_type_");
allowedParameters.add("configure_analysis_");
switchValues.put("configure_analysis_", switchList);
allowedParameters.add("auto_analysis_");
switchValues.put("auto_analysis_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("linsi68");
tmpList.add("ginsi68");
tmpList.add("einsi68");
tmpList.add("ftnsi");
exclValues.put("accurate_executable_", tmpList);
allowedParameters.add("accurate_executable_");
tmpList = new ArrayList<String>();
tmpList.add("fftns168");
tmpList.add("fftns268");
tmpList.add("nwnsi68");
tmpList.add("nwns68");
exclValues.put("fast_executables_", tmpList);
allowedParameters.add("fast_executables_");
tmpList = new ArrayList<String>();
tmpList.add("qinsi68");
tmpList.add("xinsi68");
exclValues.put("rna_executable_", tmpList);
allowedParameters.add("rna_executable_");
allowedParameters.add("use_contrafold_");
switchValues.put("use_contrafold_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("larapair");
tmpList.add("foldalignlocalpair");
tmpList.add("--foldalignglobalpair");
tmpList.add("scarnapair");
exclValues.put("xinsi_option_", tmpList);
allowedParameters.add("xinsi_option_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
exclValues.put("distanceMetric_", tmpList);
allowedParameters.add("distanceMetric_");
allowedParameters.add("weighting_factor_");
allowedParameters.add("retrees_");
allowedParameters.add("iterativeRefinements_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("useFFT_", tmpList);
allowedParameters.add("useFFT_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("noScore_", tmpList);
allowedParameters.add("noScore_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("memSave_", tmpList);
allowedParameters.add("memSave_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("usePartTree_", tmpList);
allowedParameters.add("usePartTree_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
tmpList.add("2");
exclValues.put("partTreeMetric_", tmpList);
allowedParameters.add("partTreeMetric_");
allowedParameters.add("partTreePartitions_");
allowedParameters.add("maxAlignment_");
tmpList = new ArrayList<String>();
tmpList.add("200");
tmpList.add("20");
tmpList.add("1");
exclValues.put("dnaMatrix_", tmpList);
allowedParameters.add("dnaMatrix_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
exclValues.put("aaMatrix_", tmpList);
allowedParameters.add("aaMatrix_");
allowedParameters.add("jtt_");
allowedParameters.add("tm_");
allowedInput.add("userMatrix_");
allowedParameters.add("opPenaltyGroupToGroup_");
allowedParameters.add("extendPenaltyGroupToGroup_");
allowedParameters.add("opPenaltyPairwise_");
allowedParameters.add("offsetValuePairwise_");
allowedParameters.add("extendPenaltyPairwise_");
allowedParameters.add("opPenaltySkip_");
allowedParameters.add("extendPenaltySkip_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("fmodel_", tmpList);
allowedParameters.add("fmodel_");
requiredParameters.add("fmodel_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("outputFormat_", tmpList);
allowedParameters.add("outputFormat_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("outputOrder_", tmpList);
allowedParameters.add("outputOrder_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
exclValues.put("outputGuideTree_", tmpList);
allowedParameters.add("outputGuideTree_");
requiredParameters.add("outputGuideTree_");
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
if (parameter.equals("datatype_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("weighting_factor_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("retrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("iterativeRefinements_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("partTreePartitions_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxAlignment_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("jtt_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("tm_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("opPenaltyGroupToGroup_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extendPenaltyGroupToGroup_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("opPenaltyPairwise_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("offsetValuePairwise_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extendPenaltyPairwise_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("opPenaltySkip_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extendPenaltySkip_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fmodel_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("outputGuideTree_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
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