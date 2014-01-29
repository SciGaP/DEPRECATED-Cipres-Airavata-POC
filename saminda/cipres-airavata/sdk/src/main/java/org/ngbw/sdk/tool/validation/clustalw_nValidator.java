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
public class clustalw_nValidator implements ParameterValidator2
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
public clustalw_nValidator() {
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
tmpList = new ArrayList<String>();
tmpList.add("-align");
tmpList.add("-profile");
tmpList.add("-sequences");
tmpList.add("-tree");
tmpList.add("-bootstrap");
exclValues.put("actions_", tmpList);
allowedParameters.add("actions_");
requiredParameters.add("actions_");
allowedParameters.add("phylip_alig_");
switchValues.put("phylip_alig_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("slow");
tmpList.add("fast");
exclValues.put("quicktree_", tmpList);
allowedParameters.add("quicktree_");
tmpList = new ArrayList<String>();
tmpList.add("dna");
exclValues.put("typeseq_", tmpList);
allowedParameters.add("typeseq_");
tmpList = new ArrayList<String>();
tmpList.add("gonnet");
tmpList.add("blosum");
tmpList.add("pam");
tmpList.add("id");
exclValues.put("matrix_", tmpList);
allowedParameters.add("matrix_");
tmpList = new ArrayList<String>();
tmpList.add("iub");
tmpList.add("clustalw");
exclValues.put("dnamatrix_", tmpList);
allowedParameters.add("dnamatrix_");
allowedParameters.add("gapopen_");
allowedParameters.add("gapext_");
allowedParameters.add("endgaps_");
switchValues.put("endgaps_", switchList);
allowedParameters.add("gapdist_");
allowedParameters.add("pgap_");
switchValues.put("pgap_", switchList);
allowedParameters.add("hgap_");
switchValues.put("hgap_", switchList);
listParameters.put("hgapresidues_", null);
allowedParameters.add("hgapresidues_");
tmpList = new ArrayList<String>();
tmpList.add("A");
tmpList.add("R");
tmpList.add("N");
tmpList.add("D");
tmpList.add("C");
tmpList.add("Q");
tmpList.add("E");
tmpList.add("G");
tmpList.add("H");
tmpList.add("I");
tmpList.add("L");
tmpList.add("K");
tmpList.add("M");
tmpList.add("F");
tmpList.add("P");
tmpList.add("S");
tmpList.add("T");
tmpList.add("W");
tmpList.add("Y");
tmpList.add("V");
listValues.put("hgapresidues_", tmpList);
allowedParameters.add("maxdiv_");
allowedParameters.add("negative_");
switchValues.put("negative_", switchList);
allowedParameters.add("transweight_");
allowedInput.add("usetree_");
allowedParameters.add("ktuple_");
allowedParameters.add("topdiags_");
allowedParameters.add("window_");
allowedParameters.add("pairgap_");
tmpList = new ArrayList<String>();
tmpList.add("percent");
tmpList.add("absolute");
exclValues.put("score_", tmpList);
allowedParameters.add("score_");
tmpList = new ArrayList<String>();
tmpList.add("blosum");
tmpList.add("gonnet");
tmpList.add("pam");
tmpList.add("id");
exclValues.put("pwmatrix_", tmpList);
allowedParameters.add("pwmatrix_");
tmpList = new ArrayList<String>();
tmpList.add("iub");
tmpList.add("clustalw");
exclValues.put("pwdnamatrix_", tmpList);
allowedParameters.add("pwdnamatrix_");
allowedParameters.add("pwgapopen_");
allowedParameters.add("pwgapext_");
allowedParameters.add("kimura_");
switchValues.put("kimura_", switchList);
allowedParameters.add("tossgaps_");
switchValues.put("tossgaps_", switchList);
allowedParameters.add("bootstrap_");
tmpList = new ArrayList<String>();
tmpList.add("node");
tmpList.add("branch");
exclValues.put("bootlabels_", tmpList);
allowedParameters.add("bootlabels_");
allowedParameters.add("seed_");
tmpList = new ArrayList<String>();
tmpList.add("NJ");
tmpList.add("PHYLIP");
tmpList.add("DIST");
tmpList.add("NEXUS");
exclValues.put("outputtree_", tmpList);
allowedParameters.add("outputtree_");
tmpList = new ArrayList<String>();
tmpList.add("");
tmpList.add("GCG");
tmpList.add("GDE");
tmpList.add("PHYLIP");
tmpList.add("PIR");
tmpList.add("NEXUS");
exclValues.put("output_", tmpList);
allowedParameters.add("output_");
allowedParameters.add("gde_lower_");
switchValues.put("gde_lower_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("input");
tmpList.add("aligned");
exclValues.put("outorder_", tmpList);
allowedParameters.add("outorder_");
allowedParameters.add("seqnos_");
switchValues.put("seqnos_", switchList);
allowedInput.add("profile1_");
allowedInput.add("profile2_");
allowedInput.add("usetree1_");
allowedInput.add("usetree2_");
allowedParameters.add("nosecstr1_");
switchValues.put("nosecstr1_", switchList);
allowedParameters.add("nosecstr2_");
switchValues.put("nosecstr2_", switchList);
allowedParameters.add("helixgap_");
allowedParameters.add("strandgap_");
allowedParameters.add("loopgap_");
allowedParameters.add("terminalgap_");
allowedParameters.add("helixendin_");
allowedParameters.add("helixendout_");
allowedParameters.add("strandendin_");
allowedParameters.add("strandendout_");
tmpList = new ArrayList<String>();
tmpList.add("STRUCTURE");
tmpList.add("MASK");
tmpList.add("BOTH");
tmpList.add("NONE");
exclValues.put("secstrout_", tmpList);
allowedParameters.add("secstrout_");
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
if (parameter.equals("actions_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("gapopen_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("gapext_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("gapdist_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxdiv_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("transweight_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ktuple_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("topdiags_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("window_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("pairgap_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("pwgapopen_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("pwgapext_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("bootstrap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("seed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("helixgap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("strandgap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("loopgap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("terminalgap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("helixendin_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("helixendout_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("strandendin_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("strandendout_")) {
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