package org.ngbw.web.model.impl.tool;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.ngbw.sdk.api.tool.ParameterValidator;
import org.ngbw.sdk.common.util.BaseValidator;
import org.ngbw.sdk.database.TaskInputSourceDocument;
public class oldmrbayeshybrid_tgValidator implements ParameterValidator
{
private Set<String> requiredParameters;
private Set<String> requiredInput;
public oldmrbayeshybrid_tgValidator() {
requiredParameters = new HashSet<String>();
requiredInput = new HashSet<String>();
requiredParameters.add("runtime_");
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
if (parameter.equals("nruns_specified_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("nchains_specified_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("ngen_specified_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sample_freq_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("runtime_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
if (BaseValidator.validateString(value) == false)
return "You must enter a value for \"" + parameter + "\"";
return null;
}
if (parameter.equals("constraintoptions_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("Ngammacatopts_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("Nbetacatopts_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("betameanx_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("betavary_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("tratiofixed_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("atocrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("atograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("atotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ctograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ctotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("gtotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("fixedatocrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("fixedatograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("fixedatotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("fixedctograte_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("fixedctotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("fixedgtotrate_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("omegaprdir1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("omegaprdir2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("omegaprexponential_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("omegafixed_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega1prbeta1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega1prbeta2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega1prfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega3pruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega3pruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega3prexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ny98omega3prfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsdir1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsdir2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsdir3_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsfix2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("codoncatfreqsfix3_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("statewfreqprdir1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("shapepruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("shapeprdir2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("shapeprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("shapeprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("pinvarpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("pinvarpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("pinvarprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ratecorrpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ratecorrpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ratecorrprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("covswitchuni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("covswitchuni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("covswitchexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("covswitchfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("covswitchfix2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("symdiruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("symdiruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("symdirexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("symdirfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("brlenspruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("brlensprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("treeheightsprgamma1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("treeheightsprgamma2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("treeheightsprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("speciationpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("speciationpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("speciationprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("speciationprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("extinctionpruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("extinctionpruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("extinctionprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("extinctionprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("sampleprobopts_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("thetapruni1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("thetapruni2_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("thetaprexp1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("thetaprfix1_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("ngenval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("seed_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("swapseed_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("nrunsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("nchainsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("tempval_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("swapfreqval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("nswapsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("samplefreqval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("minpartfreqval_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("burninfracval_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("burninval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("stopval_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("npertsval_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sumtburnin_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sumtnruns_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sumtntrees_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sumtdisplaygeq_")) {
if (BaseValidator.validateDouble(value) == false)
return "\"" + parameter + "\" must be a Double.";
return null;
}
if (parameter.equals("sumpburnin_")) {
if (BaseValidator.validateInteger(value) == false)
return "\"" + parameter + "\" must be an integer.";
return null;
}
if (parameter.equals("sumpnruns_")) {
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