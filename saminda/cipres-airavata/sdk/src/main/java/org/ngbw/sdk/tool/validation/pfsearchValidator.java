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
public class pfsearchValidator implements ParameterValidator2
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
public pfsearchValidator() {
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
tmpList.add("pfsearch");
exclValues.put("pftools_", tmpList);
allowedParameters.add("pftools_");
requiredParameters.add("pftools_");
allowedInput.add("profile_");
requiredInput.add("profile_");
allowedParameters.add("gcg2psa_");
switchValues.put("gcg2psa_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("protein");
tmpList.add("dna");
exclValues.put("aa_or_nuc_db_", tmpList);
allowedParameters.add("aa_or_nuc_db_");
tmpList = new ArrayList<String>();
tmpList.add("UNIPROT.fasta");
tmpList.add("SWISSPROT.fasta");
tmpList.add("TREMBL.fasta");
tmpList.add("PFILTUNIPROT.fasta");
tmpList.add("PFILTTREMBL.fasta");
tmpList.add("PFILTSWISSPROT.fasta");
tmpList.add("PDBSEQ.fasta");
tmpList.add("REFSEQ_FUNGI_PROTEIN.fasta");
tmpList.add("REFSEQ_INV_PROTEIN.fasta");
tmpList.add("REFSEQ_MICRO_PROTEIN.fasta");
tmpList.add("REFSEQ_MITO_PROTEIN.fasta");
tmpList.add("REFSEQ_PLANT_PROTEIN.fasta");
tmpList.add("REFSEQ_PLASM_PROTEIN.fasta");
tmpList.add("REFSEQ_PLAST_PROTEIN.fasta");
tmpList.add("REFSEQ_PROT_PROTEIN.fasta");
tmpList.add("REFSEQ_VERTM_PROTEIN.fasta");
tmpList.add("REFSEQ_VERTO_PROTEIN.fasta");
tmpList.add("REFSEQ_VIRAL_PROTEIN.fasta");
tmpList.add("TPA_PROTEIN.fasta");
tmpList.add("UNIMES.fasta");
tmpList.add("UNIREF100.fasta");
tmpList.add("NCBI_NR.fasta");
exclValues.put("aadb_", tmpList);
allowedParameters.add("aadb_");
tmpList = new ArrayList<String>();
tmpList.add("NCBI_NT.fasta");
tmpList.add("GBMAM.fasta");
tmpList.add("GBBCT.fasta");
tmpList.add("GBENV.fasta");
tmpList.add("GBEST.fasta");
tmpList.add("GBGSS.fasta");
tmpList.add("GBHTC.fasta");
tmpList.add("GBHTG.fasta");
tmpList.add("GBPAT.fasta");
tmpList.add("GBINV.fasta");
tmpList.add("GBPHG.fasta");
tmpList.add("GBPLN.fasta");
tmpList.add("GBPRI.fasta");
tmpList.add("GBROD.fasta");
tmpList.add("GBSTS.fasta");
tmpList.add("GBSYN.fasta");
tmpList.add("GBUNA.fasta");
tmpList.add("GBVRL.fasta");
tmpList.add("GBVRT.fasta");
tmpList.add("REFSEQ_FUNGI_GENOMIC.fasta");
tmpList.add("REFSEQ_FUNGI_RNA.fasta");
tmpList.add("REFSEQ_INV_GENOMIC.fasta");
tmpList.add("REFSEQ_INV_RNA.fasta");
tmpList.add("REFSEQ_MICRO_GENOMIC.fasta");
tmpList.add("REFSEQ_MITO_GENOMIC.fasta");
tmpList.add("REFSEQ_PLANT_GENOMIC.fasta");
tmpList.add("REFSEQ_PLANT_RNA.fasta");
tmpList.add("REFSEQ_PLASM_GENOMIC.fasta");
tmpList.add("REFSEQ_PLASM_RNA.fasta");
tmpList.add("REFSEQ_PLAST_GENOMIC.fasta");
tmpList.add("REFSEQ_PLAST_RNA.fasta");
tmpList.add("REFSEQ_PROT_GENOMIC.fasta");
tmpList.add("REFSEQ_PROT_RNA.fasta");
tmpList.add("REFSEQ_VERTM_GENOMIC.fasta");
tmpList.add("REFSEQ_VERTM_RNA.fasta");
tmpList.add("REFSEQ_VERTO_GENOMIC.fasta");
tmpList.add("REFSEQ_VERTO_RNA.fasta");
tmpList.add("REFSEQ_VIRAL_GENOMIC.fasta");
tmpList.add("TPA_NUCLEIC.fasta");
tmpList.add("ENSEMBL.fasta");
exclValues.put("nucdb_", tmpList);
allowedParameters.add("nucdb_");
allowedParameters.add("pfsearch_cutoff_");
allowedParameters.add("compl_");
switchValues.put("compl_", switchList);
allowedParameters.add("raw_score_");
switchValues.put("raw_score_", switchList);
allowedParameters.add("unique_");
switchValues.put("unique_", switchList);
allowedParameters.add("optimal_");
switchValues.put("optimal_", switchList);
allowedParameters.add("listseq_");
switchValues.put("listseq_", switchList);
allowedParameters.add("psa_format_");
switchValues.put("psa_format_", switchList);
allowedParameters.add("between_");
switchValues.put("between_", switchList);
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
if (parameter.equals("pftools_")) {
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("pfsearch_cutoff_")) {
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