<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Phylobayes MPI on XSEDE</title>
<h2>Phylobayes MPI on XSEDE: Phylogenetic reconstruction using infinite mixtures - run on XSEDE (<a href="#REFERENCE">Nicolas Lartillot, Thomas Lepage, and Samuel Blanquart</a>)</h2>
<s:form action="phylobayes_xsede" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
</div>
</div>
<script type="text/javascript">
var simple=new animatedcollapse("simple", 800, false, "block")
</script>
<!--End Simple Parameters -->
<br/><hr/><br/>
<!--Begin Advanced Parameters -->
<a href="javascript:advanced.slideit()" class="panel">Advanced Parameters</a>
<div id="advanced" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<hr/>
<A name=bryan_script><h2><A HREF="javascript:help.slidedownandjump('#bryan_script_comment')">Convergence Parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#set_seed')">Enter seed value</A>
<font color="red" size="3">*</font>
<s:textfield name="set_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of seconds to wait between checks for convergence.
<s:textfield name="checkinterval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of cycles to exclude from convergence checks.
<s:textfield name="burninval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum \maxdiff" value to accept.
<s:textfield name="acceptdiffval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum Effective Size
<s:textfield name="acceptsizeval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum number of cycles before giving up if "maxdiff" is still 1 (Analysis is stuck)
<s:textfield name="giveupval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=bryan_script><h2><A HREF="javascript:help.slidedownandjump('#bryan_script_comment')">Convergence Parameters</A></H2>
Remove Constant Sites (-dc)
<s:checkbox name="constant_sitesr_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#starting_tree')">Specify a Newick Starting Tree (-tree)</A>
<s:select name="starting_tree_" headerKey='' headerValue='' list="%{ getDataForParameter('starting_tree_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#constraint_tree')">Specify a fixed topology (in the selected file)(-T)</A>
<s:select name="constraint_tree_" headerKey='' headerValue='' list="%{ getDataForParameter('constraint_tree_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#saving_freq')">Save every (-x)</A>
<s:textfield name="saving_freq_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stop_at')">Number of points after which the chain should stop (-1 = forever)</A>
<s:textfield name="stop_at_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#save_detmodelconf')">Save detailed model configuration for each point(-s)</A>
<s:checkbox name="save_detmodelconf_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=evolutionary_models><h2><A HREF="javascript:help.slidedownandjump('#evolutionary_models_comment')">Evolutionary Models</A></H2>
<A HREF="javascript:help.slidedownandjump('#num_gammacats')">Number of Categories for the discrete gamma distribution (-dgam)</A>
<s:textfield name="num_gammacats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#exchange_rates')">Exchange Rates</A>
<font color="red" size="3">*</font>
<s:select name="exchange_rates_" list="#{ '-gtr':'GTR' , '-poisson':'Poisson' , '-lg':'LG' , '-wag':'WAG' , '-jtt':'JTT' , '-mtrev':'MTREV' , '-mtzoa':'MTZOA' , '-mtart':'MTART' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#custom_exch')">Provide a custom exchange rate file</A>
<s:checkbox name="custom_exch_" onclick="resolveParameters()"/>
<br/>
Select the Custom Exchangabilities File
<s:select name="custom_exch_file_" headerKey='' headerValue='' list="%{ getDataForParameter('custom_exch_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#profile_mixture')">Profile Mixture</A>
<font color="red" size="3">*</font>
<s:select name="profile_mixture_" list="#{ '-dp':'CAT (Dirichlet Process)' , 'ncatn':'Mixture of N components' , 'catfix':'Pre-defined profiles' , 'custom':'Custom Profile' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#predefined_profiles')">Choose a Predefined Profile</A>
<s:select name="predefined_profiles_" headerKey='' headerValue='' list="#{ 'WLSR5':'WLSR5' , 'C20':'C20' , 'C30':'C30' , 'C40':'C40' , 'C50':'C50' , 'C60':'C60' }" onchange="resolveParameters()"/>
<br/>
<br/>
Select the Custom Exchangabilities File
<s:select name="custom_profile_" headerKey='' headerValue='' list="%{ getDataForParameter('custom_profile_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mutsel_model')">Use Codon Alignments Only</A>
<s:checkbox name="mutsel_model_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mtvert_codons')">Use Vertebrate Mitochondrial Genetic Code</A>
<s:checkbox name="mtvert_codons_" onclick="resolveParameters()"/>
<br/>
</div>
</div>
<script type="text/javascript">
var advanced=new animatedcollapse("advanced", 800, true)
</script>
<!--End Advanced Parameters -->
<br/><hr/><br/>
<s:submit value="Save Parameters" onclick="return validateControl()"/>
<s:submit value="Reset" method="resetPage"/>
<s:submit value="Cancel" method="cancel"/>
<hr></hr>
<!--Begin Advanced Help -->
<a href="javascript:help.slideit()" class="panel">Advanced Help</a>
<div id="help" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<dt><a name=runtime><i>Maximum Hours to Run (click here for help setting this correctly)</i></a></dt>
<dd>Estimate the maximum time your job will need to run. We recommend testimg initially with a < 0.5hr test run because Jobs set for 0.5 h or less depedendably run immediately in the "debug" queue.
Once you are sure the configuration is correct, you then increase the time. The reason is that jobs > 0.5 h are submitted to the "normal" queue, where jobs configured for 1 or a few hours times may
run sooner than jobs configured for the full 168 hours.
</dd>
<br></br>
<dt><a name=bryan_script_comment><i><b>Convergence Parameters</b></i></a></dt>
<dt><a name=set_seed><i>Enter seed value</i></a></dt>
<dd>Base random seed to use. Each of the N chains will add its
id to that. Setting a seed value allows the user to reproduce specific runs.
</dd>
<br></br>
<dt><a name=bryan_script_comment><i><b>Convergence Parameters</b></i></a></dt>
<dt><a name=starting_tree><i>Specify a Newick Starting Tree (-tree)</i></a></dt>
<dd>The -t (starting tree)option forces the chain to start from the specified tree.</dd>
<dt><a name=constraint_tree><i>Specify a fixed topology (in the selected file)(-T)</i></a></dt>
<dd>This option forces the chain to run under a fixed topology (as specified in the given file). In other words,
the chain only samples from the posterior distribution over all other parameters (branch lengths, alpha parameter,
etc.), conditional on the specified topology. This should be a bifurcating tree (see Input Data Format section of the PB MPI manual).</dd>
<dt><a name=saving_freq><i>Save every (-x)</i></a></dt>
<dd>This option specifies the saving frequency and (optional) the number of points after which the chain
should stop. If this number is not specified, the chain runs \forever". By definition, -x
1 corresponds to the default saving frequency. In some cases, samples may be strongly
correlated, in which case, if disk space or access is limiting, it would make sense to save
points less frequently, say 10 times less often: to do this, you can use the -x 10 option..</dd>
<dt><a name=stop_at><i>Number of points after which the chain should stop (-1 = forever)</i></a></dt>
<dd>This option specifies the number of points after which the chain
should stop. If this number is not specified, the chain runs \forever".</dd>
<dt><a name=save_detmodelconf><i>Save detailed model configuration for each point(-s)</i></a></dt>
<dd>By default, the sampler only saves the trees explored during MCMC in the treelist file
(and the summary statistics in the trace file). This is enough for computing the consensus
tree but insufficient for estimating the continuous parameters of the model (e.g. site-specific
equilibrium frequency profiles) or for conducting posterior predictive tests or cross-validation
analyses. For this, you should save the detailed model configuration for each point visited
during the run using this -s option.</dd>
<br></br>
<dt><a name=evolutionary_models_comment><i><b>Evolutionary Models</b></i></a></dt>
<dt><a name=num_gammacats><i>Number of Categories for the discrete gamma distribution (-dgam)</i></a></dt>
<dd>This specifies n categories for the discrete gamma distribution. Setting n = 1 amounts to a model
without across-site variation in substitution rate</dd>
<dt><a name=exchange_rates><i>Exchange Rates</i></a></dt>
<dd>This specifies n categories for the discrete gamma distribution. Setting n = 1 amounts to a model
without across-site variation in substitution rate</dd>
<dt><a name=custom_exch><i>Provide a custom exchange rate file</i></a></dt>
<dd>This option allows a custom exchange rate file. Exchangabilities are fixed to the values given
in the specified file. The file should be formatted as follows:
[ALPHABET]
rr1_2 rr1_3 ... rr1_20
rr2_3 rr2_4 ... rr2_20
...
rr18_19 rr18_20
rr19_20
You have to specify the order in which amino acids should be considered on the first line
([ALPHABET]), with letters separated by spaces or tabs. This header should then be followed by
the exchangeabilities in the order specified (spaces, tabs or returns are equivalent:
only the order matters).</dd>
<dt><a name=profile_mixture><i>Profile Mixture</i></a></dt>
<dd>-dp (or -cat) activates the Dirichlet process. Mixture of N Componenets (-ncat n)
specifies a mixture of n components; the number of components is fixed whereas the
weights and profiles are treated as random variables. Fixing the number of components of
the mixture most often results in a poor mixing of the MCMC. The Dirichlet process usually
has a much better mixing behavior.</dd>
<dt><a name=predefined_profiles><i>Choose a Predefined Profile</i></a></dt>
<dd>The selected value specifies a mixture of a set of pre-defined profiles (the weights are reestimated).
predef can be either one of the following keywords: C20, C30, C40, C50, C60, which correspond
to empirical profile mixture models (Quang et al., 2008); or WLSR5, which correspond to
the model of Wang et al. (2008). Note that this latter model actually defines 4 empirical
profiles, which are then combined with a fifth component made of the empirical frequencies
of the dataset</dd>
<dt><a name=mutsel_model><i>Use Codon Alignments Only</i></a></dt>
<dd>This option activates the mutation-selection model as described in Rodrigue et al. (2010) (codon align-
ments only.
</dd>
<dt><a name=mtvert_codons><i>Use Vertebrate Mitochondrial Genetic Code</i></a></dt>
<dd>This option activates the mutation-selection model as described in Rodrigue et al. (2010) (codon align-ments only.
</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// runtime
// set_seed
// checkinterval
// burninval
// acceptdiffval
// acceptsizeval
// giveupval
// constant_sitesr
// starting_tree
// constraint_tree
// saving_freq
// stop_at
// save_detmodelconf
// num_gammacats
// exchange_rates
// custom_exch
// custom_exch_file
if (getValue('custom_exch_'))
enable('custom_exch_file_');
else disable('custom_exch_file_');
// profile_mixture
// predefined_profiles
if (getValue('profile_mixture_')=="catfix")
enable('predefined_profiles_');
else disable('predefined_profiles_');
// custom_profile
if (getValue('profile_mixture_')=="custom")
enable('custom_profile_');
else disable('custom_profile_');
// mutsel_model
// mtvert_codons
}
function validateControl() {
// runtime
if (getValue('runtime_') > 168.0) {
alert('The maximum hours to run must be less than 168');
return false;
}
if (getValue('runtime_') < 0) {
alert('Please enter a positive number for the maximum runtime');
return false;
}
if (! getValue('runtime_') ) {
alert('Please specify a maximum runtime');
return false;
}
// set_seed
// checkinterval
if (! getValue('checkinterval_')) {
alert('Please specify the number of seconds to wait between checks for convergence.');
return false;
}
// burninval
if (! getValue('burninval_')) {
alert('Please specify the number of cycles to exclude from convergence checks.');
return false;
}
// acceptdiffval
if (! getValue('acceptdiffval_')) {
alert('Please specify the Maximum "maxdiff" value to accept. The manual says 0.3 is "acceptable" and 0.1 is "very good."');
return false;
}
// acceptsizeval
if (! getValue('acceptsizeval_')) {
alert('Please specify the minimum number of effective samples required before convergence. Default = 50');
return false;
}
// giveupval
if (! getValue('giveupval_')) {
alert('Please specify the minimum number of cycles before giving up if "maxdiff" is still 1 (Analysis is stuck). Default = 10000');
return false;
}
// constant_sitesr
// starting_tree
// constraint_tree
// saving_freq
if (!getValue('saving_freq_')) {
alert('Please specify the saving frequency');
return false;
}
// stop_at
if (!getValue('stop_at_')) {
alert('Please specify the numnber of points after which a chain should stop');
return false;
}
// save_detmodelconf
// num_gammacats
// exchange_rates
// custom_exch
// custom_exch_file
if (getValue('custom_exch_')) {
if (getValue('custom_exch_')) {
alert('Please select a Custom Exchange Rate File');
return false;
}
}
// profile_mixture
// predefined_profiles
if (getValue('profile_mixture_')=="catfix") {
if (getValue('profile_mixture_')=="catfix" && ! getValue('predefined_profiles_')) {
alert('Please select a pre-defined profile');
return false;
}
}
// custom_profile
if (getValue('profile_mixture_')=="custom") {
if (getValue('profile_mixture_')=="custom") {
alert('Please select a Custom Exchange Rate File');
return false;
}
}
// mutsel_model
// mtvert_codons
return issueWarning();
}
function issueWarning() {
// runtime
if ( getValue('runtime_') )
{
if (!confirm(messageSplit("The job will run on 64 cores as configured. If it runs for the entire configured time, it will consume 32 x getValue('runtime_') core (cpu) hours")))
{
return false;
}
}
// set_seed
// checkinterval
// burninval
// acceptdiffval
// acceptsizeval
// giveupval
// constant_sitesr
// starting_tree
// constraint_tree
// saving_freq
// stop_at
// save_detmodelconf
// num_gammacats
// exchange_rates
// custom_exch
// custom_exch_file
// profile_mixture
if (getValue('profile_mixture_')=="ncatn")
{
if (!confirm(messageSplit("Fixing the number of components of the mixture most often results in a poor mixing of the MCMC")))
{
return false;
}
}
// predefined_profiles
// custom_profile
// mutsel_model
// mtvert_codons
return true;
}
function messageSplit(str)
{
var tokens = str.split(" ");
var newStr = ""
var tmp;
for (i = 0; i < tokens.length; i++)
{
if ((tokens[i].indexOf("getValue(") == 0))
{
tmp = tokens[i];
var tmp1, tmp2;
var closeParen = tmp.indexOf(")");
tmp1 = tmp.substring(0, closeParen + 1);
if ((closeParen + 1) == tmp.length)
{
tmp = tmp1 + " + ' '";
} else
{
tmp2=tmp.substring(closeParen + 1);
tmp = tmp1 + " + '" + tmp2 + "'";
tmp = tmp + " + ' '";
}
} else
{
tmp = "'" + tokens[i] + " '";
}
if (newStr.length > 0)
{
newStr = newStr + " + " + tmp;
} else
{
newStr = tmp;
}
}
return eval(newStr);
}
function getValue(parameter) {
var element = document.forms['phylobayes_xsede'].elements[parameter];
if (element == null)
return null;
// if the element has a length, it's either a drop-down list or a radio button
else if (element.length != null) {
// if the element has a value, it's a drop-down list
if (element.value != null)
return element.value;
// otherwise it's a radio button
else for (i=0; element.length>i; i++) {
if (element[i].checked)
return element[i].value;
}
return null;
} else if (element.type == 'checkbox')
return element.checked;
else return element.value;
}
function enable(parameter) {
var element = document.forms['phylobayes_xsede'].elements[parameter];
if (element == null)
return;
// if the element has a length, itss either a drop-down list or a radio button
else if (element.length != null) {
// if the element has a value, it's a drop-down list
if (element.value != null)
element.disabled = false;
// otherwise its a radio button
else for (i=0; element.length>i; i++) {
element[i].disabled = false;
}
} else element.disabled = false;
}
function disable(parameter) {
var element = document.forms['phylobayes_xsede'].elements[parameter];
if (element == null)
return;
// if the element has a length, its either a drop-down list or a radio button
else if (element.length != null) {
// if the element has a value, its a drop-down list
if (element.value != null)
element.disabled = true;
// otherwise its a radio button
else for (i=0; element.length>i; i++) {
element[i].disabled = true;
}
} else element.disabled = true;
}
</script>