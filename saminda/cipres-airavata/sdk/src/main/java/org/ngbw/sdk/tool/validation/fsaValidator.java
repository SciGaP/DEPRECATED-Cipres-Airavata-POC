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
public class fsaValidator implements ParameterValidator2
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
public fsaValidator() {
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
tmpList.add("protein");
tmpList.add("na");
exclValues.put("data_type_", tmpList);
allowedParameters.add("data_type_");
requiredParameters.add("data_type_");
allowedParameters.add("use_anchors_");
switchValues.put("use_anchors_", switchList);
allowedParameters.add("no_anchors_");
switchValues.put("no_anchors_", switchList);
allowedParameters.add("align_in_protspace_");
switchValues.put("align_in_protspace_", switchList);
allowedParameters.add("prot_anchor_");
switchValues.put("prot_anchor_", switchList);
allowedParameters.add("sensitivity_max_");
switchValues.put("sensitivity_max_", switchList);
allowedParameters.add("fast_alignment_");
switchValues.put("fast_alignment_", switchList);
allowedParameters.add("call_exonerate_");
switchValues.put("call_exonerate_", switchList);
allowedParameters.add("make_softmasked_");
switchValues.put("make_softmasked_", switchList);
allowedParameters.add("output_stockholm_");
switchValues.put("output_stockholm_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("0");
exclValues.put("subst_model_", tmpList);
allowedParameters.add("subst_model_");
allowedParameters.add("evtime_param_");
tmpList = new ArrayList<String>();
tmpList.add("indel2");
tmpList.add("noindel2");
exclValues.put("num_indel_states_", tmpList);
allowedParameters.add("num_indel_states_");
allowedParameters.add("alpha_R_");
allowedParameters.add("alpha_Y_");
allowedParameters.add("TN_beta_");
allowedParameters.add("open_set1_of_indelstates_");
allowedParameters.add("gap_set1_of_indelstates_");
allowedParameters.add("open_set2_of_indelstates_");
allowedParameters.add("gap_set2_of_indelstates_");
allowedParameters.add("upload_probfile_");
switchValues.put("upload_probfile_", switchList);
allowedInput.add("posterior_probfile_");
allowedParameters.add("learn_gap_");
switchValues.put("learn_gap_", switchList);
allowedParameters.add("nolearn_gap_");
switchValues.put("nolearn_gap_", switchList);
allowedParameters.add("learnemit_all_");
switchValues.put("learnemit_all_", switchList);
allowedParameters.add("not_learnemitbypair_");
switchValues.put("not_learnemitbypair_", switchList);
allowedParameters.add("learnemit_pair_");
switchValues.put("learnemit_pair_", switchList);
allowedParameters.add("not_learnemitall_");
switchValues.put("not_learnemitall_", switchList);
allowedParameters.add("no_learn_");
switchValues.put("no_learn_", switchList);
allowedParameters.add("no_regularize_");
switchValues.put("no_regularize_", switchList);
allowedParameters.add("reg_gapscale_");
allowedParameters.add("reg_emitscale_");
allowedParameters.add("min_increase_");
allowedParameters.add("max_rounds_");
allowedParameters.add("min_gapdata_");
allowedParameters.add("min_emitdata_");
allowedParameters.add("gap_factor_");
allowedParameters.add("num_iterations_");
allowedParameters.add("no_dynweight_");
switchValues.put("no_dynweight_", switchList);
allowedParameters.add("require_homology_");
switchValues.put("require_homology_", switchList);
allowedParameters.add("ref_alignment_");
switchValues.put("ref_alignment_", switchList);
allowedParameters.add("min_spantree_");
allowedParameters.add("max_spantree_");
allowedParameters.add("max_palmtree_");
allowedParameters.add("number_degree_");
allowedParameters.add("kmer_length_");
allowedParameters.add("alignment_fraction_");
allowedParameters.add("alignment_number_");
allowedParameters.add("min_anchorlen_");
allowedParameters.add("max_joinlen_");
allowedParameters.add("use_hardmask_");
switchValues.put("use_hardmask_", switchList);
allowedParameters.add("exon_minscore_");
allowedInput.add("provide_mercator_");
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
if (parameter.equals("data_type_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("evtime_param_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("alpha_R_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("alpha_Y_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("TN_beta_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("open_set1_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("gap_set1_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("open_set2_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("gap_set2_of_indelstates_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("reg_gapscale_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("reg_emitscale_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("min_increase_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("max_rounds_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("min_gapdata_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("min_emitdata_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("gap_factor_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("num_iterations_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("min_spantree_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("max_spantree_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("max_palmtree_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("number_degree_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("kmer_length_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("alignment_fraction_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("alignment_number_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("min_anchorlen_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("max_joinlen_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("exon_minscore_")) {
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