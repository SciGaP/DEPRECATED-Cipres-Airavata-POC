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
public class mview_blastValidator implements ParameterValidator2
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
public mview_blastValidator() {
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
allowedInput.add("blast_output_");
requiredInput.add("blast_output_");
tmpList = new ArrayList<String>();
tmpList.add("blast");
tmpList.add("fasta");
exclValues.put("in_", tmpList);
allowedParameters.add("in_");
requiredParameters.add("in_");
allowedParameters.add("ruler_");
switchValues.put("ruler_", switchList);
allowedParameters.add("alignment_");
switchValues.put("alignment_", switchList);
allowedParameters.add("consensus_");
switchValues.put("consensus_", switchList);
allowedParameters.add("dna_");
switchValues.put("dna_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("any");
tmpList.add("consensus");
tmpList.add("group");
tmpList.add("identity");
tmpList.add("none");
exclValues.put("coloring_", tmpList);
allowedParameters.add("coloring_");
allowedParameters.add("threshold_");
tmpList = new ArrayList<String>();
tmpList.add("class");
tmpList.add("none");
tmpList.add("singleton");
exclValues.put("ignore_", tmpList);
allowedParameters.add("ignore_");
tmpList = new ArrayList<String>();
tmpList.add("any");
tmpList.add("identity");
tmpList.add("none");
exclValues.put("con_coloring_", tmpList);
allowedParameters.add("con_coloring_");
allowedParameters.add("con_threshold_");
tmpList = new ArrayList<String>();
tmpList.add("class");
tmpList.add("none");
tmpList.add("singleton");
exclValues.put("con_ignore_", tmpList);
allowedParameters.add("con_ignore_");
allowedParameters.add("con_gaps_");
switchValues.put("con_gaps_", switchList);
allowedParameters.add("top_");
allowedParameters.add("range_");
allowedParameters.add("maxident_");
allowedParameters.add("ref_");
allowedParameters.add("keep_only_");
allowedParameters.add("disc_");
allowedParameters.add("nops_");
allowedParameters.add("width_");
allowedParameters.add("gap_");
allowedParameters.add("label0_");
switchValues.put("label0_", switchList);
allowedParameters.add("label1_");
switchValues.put("label1_", switchList);
allowedParameters.add("label2_");
switchValues.put("label2_", switchList);
allowedParameters.add("label3_");
switchValues.put("label3_", switchList);
allowedParameters.add("label4_");
switchValues.put("label4_", switchList);
allowedParameters.add("register_");
switchValues.put("register_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("full");
tmpList.add("head");
tmpList.add("body");
tmpList.add("data");
tmpList.add("css");
tmpList.add("off");
exclValues.put("html_output_", tmpList);
allowedParameters.add("html_output_");
allowedParameters.add("pagecolor_");
allowedParameters.add("textcolor_");
allowedParameters.add("linkcolor_");
allowedParameters.add("alinkcolor_");
allowedParameters.add("vlinkcolor_");
allowedParameters.add("alncolor_");
allowedParameters.add("symcolor_");
allowedParameters.add("gapcolor_");
allowedParameters.add("bold_");
switchValues.put("bold_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("off");
tmpList.add("on");
exclValues.put("css_", tmpList);
allowedParameters.add("css_");
allowedParameters.add("srs_");
switchValues.put("srs_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("all");
tmpList.add("discrete");
tmpList.add("ranked");
exclValues.put("hsp_", tmpList);
allowedParameters.add("hsp_");
tmpList = new ArrayList<String>();
tmpList.add("p");
tmpList.add("m");
tmpList.add("*");
exclValues.put("strand_", tmpList);
allowedParameters.add("strand_");
allowedParameters.add("maxpval_");
allowedParameters.add("minscore_");
allowedParameters.add("maxeval_");
allowedParameters.add("minbits_");
allowedParameters.add("cycle_");
allowedParameters.add("minopt_");
tmpList = new ArrayList<String>();
tmpList.add("p");
tmpList.add("m");
tmpList.add("*");
exclValues.put("fasta_strand_", tmpList);
allowedParameters.add("fasta_strand_");
tmpList = new ArrayList<String>();
tmpList.add("html");
tmpList.add("msf");
tmpList.add("pearson");
tmpList.add("pir");
tmpList.add("rdb");
exclValues.put("out_", tmpList);
allowedParameters.add("out_");
requiredParameters.add("out_");
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
if (parameter.equals("in_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("threshold_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("top_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxident_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ref_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("width_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxpval_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("minscore_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxeval_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("minbits_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("minopt_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("out_")) {
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