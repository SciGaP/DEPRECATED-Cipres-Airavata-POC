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
public class rid3raxmlValidator implements ParameterValidator2
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
public rid3raxmlValidator() {
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
allowedParameters.add("maxtaxasubsetsize_");
allowedParameters.add("maxtaxasubsetpercent_");
allowedParameters.add("maxrecursionlevels_");
allowedParameters.add("maxiterations_");
allowedParameters.add("maxanalysistime_");
tmpList = new ArrayList<String>();
tmpList.add("yes");
tmpList.add("no");
exclValues.put("ignorestartedgelen_", tmpList);
allowedParameters.add("ignorestartedgelen_");
requiredParameters.add("ignorestartedgelen_");
tmpList = new ArrayList<String>();
tmpList.add("no");
tmpList.add("yes");
exclValues.put("breakties_", tmpList);
allowedParameters.add("breakties_");
requiredParameters.add("breakties_");
allowedParameters.add("seed_");
allowedParameters.add("numcat_");
requiredParameters.add("numcat_");
tmpList = new ArrayList<String>();
tmpList.add("GTRCAT");
tmpList.add("GTRGAMMA");
tmpList.add("GTRMIX");
tmpList.add("PROTCATDAYHOFF");
tmpList.add("PROTGAMMADAYHOFF");
tmpList.add("PROTMIXDAYHOFF");
tmpList.add("PROTCATDAYHOFFF");
tmpList.add("PROTGAMMADAYHOFFF");
tmpList.add("PROTMIXDAYHOFFF");
tmpList.add("PROTCATDCMUT");
tmpList.add("PROTGAMMADCMUT");
tmpList.add("PROTMIXDCMUT");
tmpList.add("PROTCATDCMUTF");
tmpList.add("PROTGAMMADCMUTF");
tmpList.add("PROTMIXDCMUTF");
tmpList.add("PROTCATJTT");
tmpList.add("PROTGAMMAJTT");
tmpList.add("PROTMIXJTT");
tmpList.add("PROTCATJTTF");
tmpList.add("PROTGAMMAJTTF");
tmpList.add("PROTMIXJTTF");
tmpList.add("PROTCATMTREV");
tmpList.add("PROTGAMMAMTREV");
tmpList.add("PROTMIXMTREV");
tmpList.add("PROTCATMTREVF");
tmpList.add("PROTGAMMAMTREVF");
tmpList.add("PROTMIXMTREVF");
tmpList.add("PROTCATWAG");
tmpList.add("PROTGAMMAWAG");
tmpList.add("PROTMIXWAG");
tmpList.add("PROTCATWAGF");
tmpList.add("PROTGAMMAWAGF");
tmpList.add("PROTMIXWAGF");
tmpList.add("PROTCATRTREV");
tmpList.add("PROTGAMMARTREV");
tmpList.add("PROTMIXRTREV");
tmpList.add("PROTCATRTREVF");
tmpList.add("PROTGAMMARTREVF");
tmpList.add("PROTMIXRTREVF");
tmpList.add("PROTCATCPREV");
tmpList.add("PROTGAMMACPREV");
tmpList.add("PROTMIXCPREV");
tmpList.add("PROTCATCPREVF");
tmpList.add("PROTGAMMACPREVF");
tmpList.add("PROTMIXCPREVF");
tmpList.add("PROTCATVT");
tmpList.add("PROTGAMMAVT");
tmpList.add("PROTMIXVT");
tmpList.add("PROTCATVTF");
tmpList.add("PROTGAMMAVTF");
tmpList.add("PROTMIXVTF");
tmpList.add("PROTCATBLOSUM62");
tmpList.add("PROTGAMMABLOSUM62");
tmpList.add("PROTMIXBLOSUM62");
tmpList.add("PROTCATBLOSUM62F");
tmpList.add("PROTGAMMABLOSUM62F");
tmpList.add("PROTMIXBLOSUM62F");
tmpList.add("PROTCATMTMAM");
tmpList.add("PROTGAMMAMTMAM");
tmpList.add("PROTMIXMTMAM");
tmpList.add("PROTCATMTMAMF");
tmpList.add("PROTGAMMAMTMAMF");
tmpList.add("PROTMIXMTMAMF");
tmpList.add("PROTCATGTR");
tmpList.add("PROTGAMMAGTR");
tmpList.add("PROTMIXGTR");
tmpList.add("PROTCATGTRF");
tmpList.add("PROTGAMMAGTRF");
tmpList.add("PROTMIXGTRF");
exclValues.put("model_", tmpList);
allowedParameters.add("model_");
requiredParameters.add("model_");
allowedParameters.add("initrearrange_");
requiredParameters.add("initrearrange_");
allowedParameters.add("s_numcat_");
requiredParameters.add("s_numcat_");
tmpList = new ArrayList<String>();
tmpList.add("GTRCAT");
tmpList.add("GTRGAMMA");
tmpList.add("GTRMIX");
tmpList.add("PROTCATDAYHOFF");
tmpList.add("PROTGAMMADAYHOFF");
tmpList.add("PROTMIXDAYHOFF");
tmpList.add("PROTCATDAYHOFFF");
tmpList.add("PROTGAMMADAYHOFFF");
tmpList.add("PROTMIXDAYHOFFF");
tmpList.add("PROTCATDCMUT");
tmpList.add("PROTGAMMADCMUT");
tmpList.add("PROTMIXDCMUT");
tmpList.add("PROTCATDCMUTF");
tmpList.add("PROTGAMMADCMUTF");
tmpList.add("PROTMIXDCMUTF");
tmpList.add("PROTCATJTT");
tmpList.add("PROTGAMMAJTT");
tmpList.add("PROTMIXJTT");
tmpList.add("PROTCATJTTF");
tmpList.add("PROTGAMMAJTTF");
tmpList.add("PROTMIXJTTF");
tmpList.add("PROTCATMTREV");
tmpList.add("PROTGAMMAMTREV");
tmpList.add("PROTMIXMTREV");
tmpList.add("PROTCATMTREVF");
tmpList.add("PROTGAMMAMTREVF");
tmpList.add("PROTMIXMTREVF");
tmpList.add("PROTCATWAG");
tmpList.add("PROTGAMMAWAG");
tmpList.add("PROTMIXWAG");
tmpList.add("PROTCATWAGF");
tmpList.add("PROTGAMMAWAGF");
tmpList.add("PROTMIXWAGF");
tmpList.add("PROTCATRTREV");
tmpList.add("PROTGAMMARTREV");
tmpList.add("PROTMIXRTREV");
tmpList.add("PROTCATRTREVF");
tmpList.add("PROTGAMMARTREVF");
tmpList.add("PROTMIXRTREVF");
tmpList.add("PROTCATCPREV");
tmpList.add("PROTGAMMACPREV");
tmpList.add("PROTMIXCPREV");
tmpList.add("PROTCATCPREVF");
tmpList.add("PROTGAMMACPREVF");
tmpList.add("PROTMIXCPREVF");
tmpList.add("PROTCATVT");
tmpList.add("PROTGAMMAVT");
tmpList.add("PROTMIXVT");
tmpList.add("PROTCATVTF");
tmpList.add("PROTGAMMAVTF");
tmpList.add("PROTMIXVTF");
tmpList.add("PROTCATBLOSUM62");
tmpList.add("PROTGAMMABLOSUM62");
tmpList.add("PROTMIXBLOSUM62");
tmpList.add("PROTCATBLOSUM62F");
tmpList.add("PROTGAMMABLOSUM62F");
tmpList.add("PROTMIXBLOSUM62F");
tmpList.add("PROTCATMTMAM");
tmpList.add("PROTGAMMAMTMAM");
tmpList.add("PROTMIXMTMAM");
tmpList.add("PROTCATMTMAMF");
tmpList.add("PROTGAMMAMTMAMF");
tmpList.add("PROTMIXMTMAMF");
tmpList.add("PROTCATGTR");
tmpList.add("PROTGAMMAGTR");
tmpList.add("PROTMIXGTR");
tmpList.add("PROTCATGTRF");
tmpList.add("PROTGAMMAGTRF");
tmpList.add("PROTMIXGTRF");
exclValues.put("s_model_", tmpList);
allowedParameters.add("s_model_");
requiredParameters.add("s_model_");
allowedParameters.add("s_initrearrange_");
requiredParameters.add("s_initrearrange_");
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
if (parameter.equals("maxtaxasubsetsize_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxtaxasubsetpercent_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("maxrecursionlevels_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxiterations_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("maxanalysistime_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("ignorestartedgelen_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("breakties_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("seed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("numcat_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("model_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("initrearrange_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("s_numcat_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("s_model_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("s_initrearrange_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
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