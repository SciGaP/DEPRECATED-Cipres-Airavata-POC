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
public class blastnValidator implements ParameterValidator2
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
public blastnValidator() {
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
tmpList = new ArrayList<String>();
tmpList.add("blastn");
exclValues.put("blast2_", tmpList);
allowedParameters.add("blast2_");
requiredParameters.add("blast2_");
allowedInput.add("query_");
requiredInput.add("query_");
allowedParameters.add("start_region_");
allowedParameters.add("end_region_");
tmpList = new ArrayList<String>();
tmpList.add("NCBI_NT");
tmpList.add("GBMAM");
tmpList.add("GBBCT");
tmpList.add("GBENV");
tmpList.add("GBEST");
tmpList.add("GBGSS");
tmpList.add("GBHTC");
tmpList.add("GBHTG");
tmpList.add("GBPAT");
tmpList.add("GBINV");
tmpList.add("GBPHG");
tmpList.add("GBPLN");
tmpList.add("GBPRI");
tmpList.add("GBROD");
tmpList.add("GBSTS");
tmpList.add("GBSYN");
tmpList.add("GBUNA");
tmpList.add("GBVRL");
tmpList.add("GBVRT");
tmpList.add("REFSEQ_FUNGI_GENOMIC");
tmpList.add("REFSEQ_FUNGI_RNA");
tmpList.add("REFSEQ_INV_GENOMIC");
tmpList.add("REFSEQ_INV_RNA");
tmpList.add("REFSEQ_MICRO_GENOMIC");
tmpList.add("REFSEQ_MITO_GENOMIC");
tmpList.add("REFSEQ_PLANT_GENOMIC");
tmpList.add("REFSEQ_PLANT_RNA");
tmpList.add("REFSEQ_PLASM_GENOMIC");
tmpList.add("REFSEQ_PLASM_RNA");
tmpList.add("REFSEQ_PLAST_GENOMIC");
tmpList.add("REFSEQ_PLAST_RNA");
tmpList.add("REFSEQ_PROT_GENOMIC");
tmpList.add("REFSEQ_PROT_RNA");
tmpList.add("REFSEQ_VERTM_GENOMIC");
tmpList.add("REFSEQ_VERTM_RNA");
tmpList.add("REFSEQ_VERTO_GENOMIC");
tmpList.add("REFSEQ_VERTO_RNA");
tmpList.add("REFSEQ_VIRAL_GENOMIC");
tmpList.add("TPA_NUCLEIC");
tmpList.add("ENSEMBL");
exclValues.put("nucleotid_db_", tmpList);
allowedParameters.add("nucleotid_db_");
allowedParameters.add("filter_");
switchValues.put("filter_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("v1");
tmpList.add("v2");
tmpList.add("v3");
tmpList.add("v4");
tmpList.add("v5");
exclValues.put("other_filters_", tmpList);
allowedParameters.add("other_filters_");
allowedParameters.add("lower_case_");
switchValues.put("lower_case_", switchList);
allowedParameters.add("Expect_");
allowedParameters.add("word_size_");
allowedParameters.add("dist_hits_");
allowedParameters.add("extend_hit_");
allowedParameters.add("dropoff_extent_");
allowedParameters.add("keep_hits_");
allowedParameters.add("gapped_alig_");
switchValues.put("gapped_alig_", switchList);
allowedParameters.add("dropoff_");
allowedParameters.add("dropoff_final_");
allowedParameters.add("mismatch_");
allowedParameters.add("match_");
tmpList = new ArrayList<String>();
tmpList.add("BLOSUM62");
tmpList.add("BLOSUM45");
tmpList.add("BLOSUM80");
tmpList.add("PAM30");
tmpList.add("PAM70");
exclValues.put("matrix_", tmpList);
allowedParameters.add("matrix_");
allowedParameters.add("open_a_gap_");
allowedParameters.add("extend_a_gap_");
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("9");
tmpList.add("10");
tmpList.add("11");
tmpList.add("12");
tmpList.add("13");
tmpList.add("14");
tmpList.add("15");
exclValues.put("gc_query_", tmpList);
allowedParameters.add("gc_query_");
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("9");
tmpList.add("10");
tmpList.add("11");
tmpList.add("12");
tmpList.add("13");
tmpList.add("14");
tmpList.add("15");
exclValues.put("gc_db_", tmpList);
allowedParameters.add("gc_db_");
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
exclValues.put("strand_", tmpList);
allowedParameters.add("strand_");
allowedParameters.add("Descriptions_");
allowedParameters.add("Alignments_");
tmpList = new ArrayList<String>();
tmpList.add("0");
tmpList.add("1");
tmpList.add("2");
tmpList.add("3");
tmpList.add("4");
tmpList.add("5");
tmpList.add("6");
tmpList.add("7");
tmpList.add("8");
exclValues.put("view_alignments_", tmpList);
allowedParameters.add("view_alignments_");
allowedParameters.add("show_gi_");
switchValues.put("show_gi_", switchList);
allowedParameters.add("believe_");
switchValues.put("believe_", switchList);
allowedParameters.add("htmloutput_");
switchValues.put("htmloutput_", switchList);
allowedParameters.add("external_links_");
switchValues.put("external_links_", switchList);
allowedParameters.add("one_HSP_per_line_");
switchValues.put("one_HSP_per_line_", switchList);
allowedParameters.add("image_query_");
switchValues.put("image_query_", switchList);
allowedInput.add("restrict_db_");
allowedInput.add("psi_checkpoint_");
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
if (parameter.equals("blast2_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("start_region_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("end_region_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("Expect_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("word_size_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("dist_hits_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("extend_hit_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("dropoff_extent_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("keep_hits_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("dropoff_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("dropoff_final_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("mismatch_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("match_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("open_a_gap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("extend_a_gap_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("Descriptions_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("Alignments_")) {
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