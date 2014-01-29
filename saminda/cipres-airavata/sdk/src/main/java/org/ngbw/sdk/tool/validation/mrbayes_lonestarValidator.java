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
public class mrbayes_lonestarValidator implements ParameterValidator2
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
public mrbayes_lonestarValidator() {
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
allowedParameters.add("mrbayesblockquery_");
switchValues.put("mrbayesblockquery_", switchList);
allowedParameters.add("set_autoclose_confirm_");
switchValues.put("set_autoclose_confirm_", switchList);
allowedParameters.add("nruns_specified_");
allowedParameters.add("nchains_specified_");
allowedParameters.add("runtime_");
requiredParameters.add("runtime_");
allowedParameters.add("usertreesel_");
switchValues.put("usertreesel_", switchList);
allowedInput.add("Usertreeopt_");
allowedParameters.add("deroottreeopt_");
switchValues.put("deroottreeopt_", switchList);
allowedParameters.add("roottreeopts_");
switchValues.put("roottreeopts_", switchList);
allowedParameters.add("outgroupopts_");
allowedParameters.add("applyconstraints_");
switchValues.put("applyconstraints_", switchList);
allowedParameters.add("constraintoptions_");
allowedParameters.add("taxonidconstraint1_");
allowedParameters.add("taxonidconstraint2_");
allowedParameters.add("taxonidconstraint3_");
allowedParameters.add("taxonidconstraint4_");
tmpList = new ArrayList<String>();
tmpList.add("1");
tmpList.add("2");
tmpList.add("6");
exclValues.put("nstopts_", tmpList);
allowedParameters.add("nstopts_");
tmpList = new ArrayList<String>();
tmpList.add("4by4");
tmpList.add("doublet");
tmpList.add("codon");
exclValues.put("nucmodelopts_", tmpList);
allowedParameters.add("nucmodelopts_");
tmpList = new ArrayList<String>();
tmpList.add("Universal");
tmpList.add("Vertmt");
tmpList.add("Mycoplasma");
tmpList.add("Ciliates");
tmpList.add("Metmt");
tmpList.add("Yeast");
exclValues.put("codonopts_", tmpList);
allowedParameters.add("codonopts_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("Ny98");
tmpList.add("M3");
exclValues.put("omegavaropts_", tmpList);
allowedParameters.add("omegavaropts_");
tmpList = new ArrayList<String>();
tmpList.add("equal");
tmpList.add("gamma");
tmpList.add("adgamma");
tmpList.add("propinv");
tmpList.add("invgamma");
exclValues.put("rateopts_", tmpList);
allowedParameters.add("rateopts_");
allowedParameters.add("Ngammacatopts_");
allowedParameters.add("Nbetacatopts_");
allowedParameters.add("Covarionopts_");
switchValues.put("Covarionopts_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("all");
tmpList.add("variable");
tmpList.add("noabsence");
tmpList.add("nopresence");
exclValues.put("codingopts_", tmpList);
allowedParameters.add("codingopts_");
allowedParameters.add("Parsmodelopts_");
switchValues.put("Parsmodelopts_", switchList);
tmpList = new ArrayList<String>();
tmpList.add("beta");
tmpList.add("fixed");
exclValues.put("tratioopts_", tmpList);
allowedParameters.add("tratioopts_");
allowedParameters.add("betameanx_");
allowedParameters.add("betavary_");
allowedParameters.add("tratiofixed_");
tmpList = new ArrayList<String>();
tmpList.add("dirichlet");
tmpList.add("fixed");
exclValues.put("revmatpropts_", tmpList);
allowedParameters.add("revmatpropts_");
allowedParameters.add("atocrate_");
allowedParameters.add("atograte_");
allowedParameters.add("atotrate_");
allowedParameters.add("ctograte_");
allowedParameters.add("ctotrate_");
allowedParameters.add("gtotrate_");
allowedParameters.add("fixedatocrate_");
allowedParameters.add("fixedatograte_");
allowedParameters.add("fixedatotrate_");
allowedParameters.add("fixedctograte_");
allowedParameters.add("fixedctotrate_");
allowedParameters.add("fixedgtotrate_");
tmpList = new ArrayList<String>();
tmpList.add("fixed(blosum)");
tmpList.add("fixed(cprev)");
tmpList.add("fixed(dayhoff)");
tmpList.add("fixed(equalin)");
tmpList.add("fixed(gtr)");
tmpList.add("fixed(jones)");
tmpList.add("mixed");
tmpList.add("fixed(mtmam)");
tmpList.add("fixed(mtrev)");
tmpList.add("fixed(poisson)");
tmpList.add("fixed(rtrev)");
tmpList.add("fixed(vt)");
tmpList.add("fixed(wag)");
exclValues.put("aamodelpropts_", tmpList);
allowedParameters.add("aamodelpropts_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("omegapropts_", tmpList);
allowedParameters.add("omegapropts_");
allowedParameters.add("omegaprdir1_");
allowedParameters.add("omegaprdir2_");
allowedParameters.add("omegaprexponential_");
allowedParameters.add("omegafixed_");
tmpList = new ArrayList<String>();
tmpList.add("beta");
tmpList.add("fixed");
exclValues.put("ny98omega1propts_", tmpList);
allowedParameters.add("ny98omega1propts_");
allowedParameters.add("ny98omega1prbeta1_");
allowedParameters.add("ny98omega1prbeta2_");
allowedParameters.add("ny98omega1prfix1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("ny98omega3propts_", tmpList);
allowedParameters.add("ny98omega3propts_");
allowedParameters.add("ny98omega3pruni1_");
allowedParameters.add("ny98omega3pruni2_");
allowedParameters.add("ny98omega3prexp1_");
allowedParameters.add("ny98omega3prfix1_");
tmpList = new ArrayList<String>();
tmpList.add("dirichlet");
tmpList.add("fixed");
exclValues.put("codoncatfreqsopts_", tmpList);
allowedParameters.add("codoncatfreqsopts_");
allowedParameters.add("codoncatfreqsdir1_");
allowedParameters.add("codoncatfreqsdir2_");
allowedParameters.add("codoncatfreqsdir3_");
allowedParameters.add("codoncatfreqsfix1_");
allowedParameters.add("codoncatfreqsfix2_");
allowedParameters.add("codoncatfreqsfix3_");
tmpList = new ArrayList<String>();
tmpList.add("dirichlet");
tmpList.add("fixed(equal)");
tmpList.add("fixed(empirical)");
exclValues.put("statewfreqpropts_", tmpList);
allowedParameters.add("statewfreqpropts_");
allowedParameters.add("statewfreqprdir1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("shapepropts_", tmpList);
allowedParameters.add("shapepropts_");
allowedParameters.add("shapepruni1_");
allowedParameters.add("shapeprdir2_");
allowedParameters.add("shapeprexp1_");
allowedParameters.add("shapeprfix1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("fixed");
exclValues.put("pinvarpropts_", tmpList);
allowedParameters.add("pinvarpropts_");
allowedParameters.add("pinvarpruni1_");
allowedParameters.add("pinvarpruni2_");
allowedParameters.add("pinvarprfix1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("fixed");
exclValues.put("ratecorrpropts_", tmpList);
allowedParameters.add("ratecorrpropts_");
allowedParameters.add("ratecorrpruni1_");
allowedParameters.add("ratecorrpruni2_");
allowedParameters.add("ratecorrprfix1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("covswitchpropts_", tmpList);
allowedParameters.add("covswitchpropts_");
allowedParameters.add("covswitchuni1_");
allowedParameters.add("covswitchuni2_");
allowedParameters.add("covswitchexp1_");
allowedParameters.add("covswitchfix1_");
allowedParameters.add("covswitchfix2_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
tmpList.add("fixed(infinity)");
exclValues.put("symdirihyperpropts_", tmpList);
allowedParameters.add("symdirihyperpropts_");
allowedParameters.add("symdiruni1_");
allowedParameters.add("symdiruni2_");
allowedParameters.add("symdirexp1_");
allowedParameters.add("symdirfix1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("constraints");
exclValues.put("topologypropts_", tmpList);
allowedParameters.add("topologypropts_");
allowedParameters.add("constraintnames1_");
tmpList = new ArrayList<String>();
tmpList.add("unconstrained:uniform");
tmpList.add("unconstrained:exponential");
tmpList.add("clock:uniform");
tmpList.add("clock:birthdeath");
tmpList.add("clock:coalescence");
exclValues.put("brlenspropts_", tmpList);
allowedParameters.add("brlenspropts_");
allowedParameters.add("brlenspruni2_");
allowedParameters.add("brlensprexp1_");
tmpList = new ArrayList<String>();
tmpList.add("gamma");
tmpList.add("exponential");
exclValues.put("treeheightpropts_", tmpList);
allowedParameters.add("treeheightpropts_");
allowedParameters.add("treeheightsprgamma1_");
allowedParameters.add("treeheightsprgamma2_");
allowedParameters.add("treeheightsprexp1_");
tmpList = new ArrayList<String>();
tmpList.add("fixed");
tmpList.add("variable");
exclValues.put("ratepropts_", tmpList);
allowedParameters.add("ratepropts_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("speciationpropts_", tmpList);
allowedParameters.add("speciationpropts_");
allowedParameters.add("speciationpruni1_");
allowedParameters.add("speciationpruni2_");
allowedParameters.add("speciationprexp1_");
allowedParameters.add("speciationprfix1_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("extinctionpropts_", tmpList);
allowedParameters.add("extinctionpropts_");
allowedParameters.add("extinctionpruni1_");
allowedParameters.add("extinctionpruni2_");
allowedParameters.add("extinctionprexp1_");
allowedParameters.add("extinctionprfix1_");
allowedParameters.add("sampleprobopts_");
tmpList = new ArrayList<String>();
tmpList.add("uniform");
tmpList.add("exponential");
tmpList.add("fixed");
exclValues.put("thetapropts_", tmpList);
allowedParameters.add("thetapropts_");
allowedParameters.add("thetapruni1_");
allowedParameters.add("thetapruni2_");
allowedParameters.add("thetaprexp1_");
allowedParameters.add("thetaprfix1_");
allowedParameters.add("databreaksopts_");
allowedParameters.add("pairsopts_");
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
exclValues.put("nocharsets_", tmpList);
allowedParameters.add("nocharsets_");
allowedParameters.add("charset1_");
allowedParameters.add("charset1range_");
allowedParameters.add("charset2_");
allowedParameters.add("charset2range_");
allowedParameters.add("charset3_");
allowedParameters.add("charset3range_");
allowedParameters.add("charset4_");
allowedParameters.add("charset4range_");
allowedParameters.add("charset5_");
allowedParameters.add("charset5range_");
allowedParameters.add("charset6_");
allowedParameters.add("charset6range_");
allowedParameters.add("charset7_");
allowedParameters.add("charset7range_");
allowedParameters.add("charset8_");
allowedParameters.add("charset8range_");
allowedParameters.add("excludeopts_");
allowedParameters.add("ngenval_");
allowedParameters.add("seed_");
allowedParameters.add("swapseed_");
allowedParameters.add("nrunsval_");
allowedParameters.add("nchainsval_");
allowedParameters.add("tempval_");
allowedParameters.add("swapfreqval_");
allowedParameters.add("nswapsval_");
allowedParameters.add("samplefreqval_");
tmpList = new ArrayList<String>();
tmpList.add("mcmcdiagn=Yes");
tmpList.add("mcmcdiagn=No");
exclValues.put("mcmcdiagnval_", tmpList);
allowedParameters.add("mcmcdiagnval_");
allowedParameters.add("minpartfreqval_");
tmpList = new ArrayList<String>();
tmpList.add("allchains=Yes");
tmpList.add("allchains=No");
exclValues.put("allchainsval_", tmpList);
allowedParameters.add("allchainsval_");
tmpList = new ArrayList<String>();
tmpList.add("relburnin=Yes");
tmpList.add("relburnin=No");
exclValues.put("relburninval_", tmpList);
allowedParameters.add("relburninval_");
allowedParameters.add("burninfracval_");
allowedParameters.add("burninval_");
tmpList = new ArrayList<String>();
tmpList.add("stoprule=Yes");
tmpList.add("stoprule=No");
exclValues.put("stopruleval_", tmpList);
allowedParameters.add("stopruleval_");
allowedParameters.add("stopval_");
allowedParameters.add("npertsval_");
tmpList = new ArrayList<String>();
tmpList.add("Savebrlens=Yes");
tmpList.add("Savebrlens=No");
exclValues.put("sbrlensval_", tmpList);
allowedParameters.add("sbrlensval_");
tmpList = new ArrayList<String>();
tmpList.add("Ordertaxa=Yes");
tmpList.add("Ordertaxa=No");
exclValues.put("ordertaxaval_", tmpList);
allowedParameters.add("ordertaxaval_");
tmpList = new ArrayList<String>();
tmpList.add("ratio");
tmpList.add("dirichlet");
exclValues.put("tratioval_", tmpList);
allowedParameters.add("tratioval_");
tmpList = new ArrayList<String>();
tmpList.add("ratio");
tmpList.add("dirichlet");
exclValues.put("revmatopts_", tmpList);
allowedParameters.add("revmatopts_");
allowedParameters.add("reportancstateopts_");
switchValues.put("reportancstateopts_", switchList);
allowedParameters.add("reportsiterateopts_");
switchValues.put("reportsiterateopts_", switchList);
allowedParameters.add("reportposselopts_");
switchValues.put("reportposselopts_", switchList);
allowedParameters.add("sumtburnin_");
allowedParameters.add("sumtnruns_");
allowedParameters.add("sumtntrees_");
allowedParameters.add("sumtdisplaygeq_");
tmpList = new ArrayList<String>();
tmpList.add("contype=Halfcompat");
tmpList.add("contype=Allcompat");
exclValues.put("sumtcontype_", tmpList);
allowedParameters.add("sumtcontype_");
tmpList = new ArrayList<String>();
tmpList.add("showtreeprobs=Yes");
tmpList.add("showtreeprobs=No");
exclValues.put("sumtshowtreeprobs_", tmpList);
allowedParameters.add("sumtshowtreeprobs_");
allowedParameters.add("sumpburnin_");
allowedParameters.add("sumpnruns_");
tmpList = new ArrayList<String>();
tmpList.add("plot=Yes");
tmpList.add("plot=No");
exclValues.put("sumpplot_", tmpList);
allowedParameters.add("sumpplot_");
tmpList = new ArrayList<String>();
tmpList.add("marglike=Yes");
tmpList.add("marglike=No");
exclValues.put("sumpmarglike_", tmpList);
allowedParameters.add("sumpmarglike_");
tmpList = new ArrayList<String>();
tmpList.add("table=Yes");
tmpList.add("table=No");
exclValues.put("sumptable_", tmpList);
allowedParameters.add("sumptable_");
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
if (parameter.equals("nruns_specified_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("nchains_specified_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("runtime_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
if (BaseValidator.validateString(value) == false)
return "Parameter is required.";
return null;
}
if (parameter.equals("constraintoptions_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("Ngammacatopts_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("Nbetacatopts_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("betameanx_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("betavary_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("tratiofixed_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("atocrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("atograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("atotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ctograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ctotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("gtotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fixedatocrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fixedatograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fixedatotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fixedctograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fixedctotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("fixedgtotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("omegaprdir1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("omegaprdir2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("omegaprexponential_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("omegafixed_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega1prbeta1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega1prbeta2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega1prfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega3pruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega3pruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega3prexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ny98omega3prfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsdir1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsdir2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsdir3_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsfix2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsfix3_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("statewfreqprdir1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("shapepruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("shapeprdir2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("shapeprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("shapeprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("pinvarpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("pinvarpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("pinvarprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ratecorrpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ratecorrpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ratecorrprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("covswitchuni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("covswitchuni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("covswitchexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("covswitchfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("covswitchfix2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("symdiruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("symdiruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("symdirexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("symdirfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("brlenspruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("brlensprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("treeheightsprgamma1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("treeheightsprgamma2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("treeheightsprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("speciationpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("speciationpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("speciationprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("speciationprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extinctionpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extinctionpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extinctionprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("extinctionprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("sampleprobopts_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("thetapruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("thetapruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("thetaprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("thetaprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("ngenval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("seed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("swapseed_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("nrunsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("nchainsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("tempval_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("swapfreqval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("nswapsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("samplefreqval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("minpartfreqval_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("burninfracval_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("burninval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("stopval_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("npertsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sumtburnin_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sumtnruns_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sumtntrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sumtdisplaygeq_")) {
if (BaseValidator.validateDouble(value) == false)
return "Must be a Double.";
return null;
}
if (parameter.equals("sumpburnin_")) {
if (BaseValidator.validateInteger(value) == false)
return "Must be an integer.";
return null;
}
if (parameter.equals("sumpnruns_")) {
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