<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PAUPRat exp</title>
<h2>PAUPRat exp: Parsimony ratchet searches using PAUP* (<a href="#REFERENCE">Derek Sikes and Paul O. Lewis; David Swofford is the author of PAUP; Kevin Nixon is author of the Ratchet</a>)</h2>
<s:form action="pauprat_exp" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
How many characters in your matrix?
<s:textfield name="specify_nchar_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=ratchet_params><h2><A HREF="javascript:help.slidedownandjump('#ratchet_params_comment')">Ratchet Parameters</A></H2>
How many ratchet reps should be run?
<s:textfield name="specify_nreps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_seed')">Set seed value</A>
<s:textfield name="specify_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_pct')">Specify the percentage of characters to perturb (-pct)</A>
<s:textfield name="specify_pct_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_mod')">Specify the absolute number of characters to perturb (-nmod)</A>
<s:textfield name="specify_mod_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_wtmode')">Set the weighting mode (-wtmode)</A>
<font color="red" size="3">*</font>
<s:radio name="specify_wtmode_"
list="#{ 'uniform':'uniform' , 'add':'additive' , 'mult':'multiplicative' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_verbose')">Verbose or Terse output?</A>
<font color="red" size="3">*</font>
<s:radio name="specify_verbose_"
list="#{ 'verbose':'Verbose' , 'terse':'Terse' }" onclick="resolveParameters()"/>
<br/>
Increase
<font color="red" size="3">*</font>
<s:radio name="setup_increase_"
list="#{ 'auto':'auto' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setup_nrep')">How Many Reps (nrep=)</A>
<s:textfield name="setup_nrep_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=paup_params><h2><A HREF="javascript:help.slidedownandjump('#paup_params_comment')">Paup Parameters</A></H2>
Treat multistate taxa as uncertain
<s:checkbox name="setup_hidden4_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#paup_branchalg')">Branch Swapping Algorithm (swap)</A>
<font color="red" size="3">*</font>
<s:radio name="paup_branchalg_"
list="#{ 'tbr':'TBR' , 'spr':'SPR' , 'nni':'NNI' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_multrees')">Save all optimal trees? (multrees)</A>
<font color="red" size="3">*</font>
<s:radio name="set_multrees_"
list="#{ 'yes':'yes' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_rearrlimit')">Specify a rearrangement limit</A>
<s:textfield name="set_rearrlimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_timelimit')">Specify a time limit (in seconds)</A>
<s:textfield name="set_timelimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_reconlimit')">Specify a reconnection limit for PAUP</A>
<s:textfield name="set_reconlimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of trees saved (maxtrees)
<font color="red" size="3">+</font>
<s:textfield name="set_maxtrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Automatically increase the number of trees in memory
<font color="red" size="3">+</font>
<s:radio name="set_autoincrease_"
list="#{ 'auto':'auto' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
Auto-increase amount (AutoInc).
<font color="red" size="3">+</font>
<s:textfield name="set_increaseval_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dd>
Estimate the maximum time your job will need to run (up to 72 hrs). Your job will be killed if it doesn't finish within the time you specify, however jobs with shorter maximum run times are often scheduled sooner than longer jobs.
</dd>
<br></br>
<dt><a name=ratchet_params_comment><i><b>Ratchet Parameters</b></i></a></dt>
<dt><a name=specify_seed><i>Set seed value</i></a></dt>
<dd>If the seed value is set to 0, it tells PAUPRat to generate a random number seed for you. Otherwise, you may set to your preferred random number seed.
The seed you choose determines the sequence of random numbers used in choosing characters to perturb for each iteration running PAUPRat twice with the same random number seed (other than 0) will result in exactly the same
characters being perturbed each iteration the safest thing to do is let PAUPRat choose a new seed each time you run it.</dd>
<dt><a name=specify_pct><i>Specify the percentage of characters to perturb (-pct)</i></a></dt>
<dd>PAUPrat can perturb either a percentage of the informative characters, or a specified number of the paramters. These are mutually exclusive parameters. Use -pct to specify a percentage of characters to perturb each
iteration; use nmod to specify absolute number of characters to perturb each iteration; you cannot use both nmod and pct simultaneously. Nixon (1999b) states that perturbing between 5% and 25% of the total number of informative characters usually works well. </dd>
<dt><a name=specify_mod><i>Specify the absolute number of characters to perturb (-nmod)</i></a></dt>
<dd>PAUPrat can perturb either a percentage of the informative characters, or a specified number of the paramters. These are mutually exclusive parameters. Use -pct to specify a percentage of characters to perturb each
iteration; use nmod to specify absolute number of characters to perturb each iteration; you cannot use both nmod and pct simultaneously. Nixon (1999b) states that perturbing between 5% and 25% of the total number of informative characters usually works well. </dd>
<dt><a name=specify_wtmode><i>Set the weighting mode (-wtmode)</i></a></dt>
<dd>Set weigthing mode to uniform to ensure that original weights are always 1 for all characters. Set weighting mode to additive to handle the case of unequal original weights in an additive way. Additive means a character
originally weighted 10 will act just like 10 separate characters each weighted 1: it will be 10 times more likely to be chosen for perturbation than a character whose original weight was 1, but each time it is chosen,
its weight will be incremented by just 1. Set weighting mode to multiplicative to handle the case of unequal original weights in a multiplicative way. If multiplicative mode is chosen, a character originally weighted 10 will
increase its weight by 10 each time it is selected for perturbation, but it will not be any more likely to be chosen than a character whose original weight was 1.</dd>
<dt><a name=specify_verbose><i>Verbose or Terse output?</i></a></dt>
<dd>Specify verbose if you want comments in the output indicating which characters were perturbed and how much their weights changed for each iteration.
Normally, you want to specify terse because these comments add a lot of bytes to the file and don't change the analysis at all </dd>
<dt><a name=setup_nrep><i>How Many Reps (nrep=)</i></a></dt>
<dd>nreps specifies the number of Ratchet iterations to have PAUP* perform. Each iteration consists of a search under perturbed character weights followed by a second search under the original weights.</dd>
<br></br>
<dt><a name=paup_params_comment><i><b>Paup Parameters</b></i></a></dt>
<dt><a name=paup_branchalg><i>Branch Swapping Algorithm (swap)</i></a></dt>
<dd>PAUP uses three branch-swapping algorithms. In order of increasing effectiveness, these are (1) nearest neighbor interchanges (NNI, equivalent to the "local" procedure used in Versions 1 and 2 of PAUP);
(2) subtree pruning-regrafting (SPR, approximately, but not exactly, equivalent to the "global" procedure used in earlier versions of PAUP); and (3) tree bisection-reconnection (TBR, a new procedure). </dd>
<dt><a name=set_multrees><i>Save all optimal trees? (multrees)</i></a></dt>
<dd>For PAUPRat, use multrees = no</dd>
<dt><a name=set_rearrlimit><i>Specify a rearrangement limit</i></a></dt>
<dd>The search will be limited to the specified number of tree rearrangements (branch swaps).</dd>
<dt><a name=set_timelimit><i>Specify a time limit (in seconds)</i></a></dt>
<dd>The search will be limited to the specified number of tree rearrangements (branch swaps).</dd>
<dt><a name=set_reconlimit><i>Specify a reconnection limit for PAUP</i></a></dt>
<dd>The reconnection limit option limits the scope of SPR and TBR rearrangements. If an integer-value is specified, the value corresponds to the sum of the number
of nodes between each reconnected branch and the nodes incident to the branch that was cut for pruning (SPR) or bisection (TBR). A rearrangement limit of 1 corresponds
to nearest-neighbor interchanges. No entry sets the value to infinity.</dd>
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
// specify_nchar
// specify_nreps
// specify_seed
// specify_pct
if (! getValue('specify_mod_'))
enable('specify_pct_');
else disable('specify_pct_');
// specify_mod
if (! getValue('specify_pct_'))
enable('specify_mod_');
else disable('specify_mod_');
// specify_wtmode
// specify_verbose
// setup_increase
// setup_nrep
// setup_hidden4
// paup_branchalg
// set_multrees
// set_rearrlimit
// set_timelimit
// set_reconlimit
// set_maxtrees
if (getValue('set_multrees_')=="yes")
enable('set_maxtrees_');
else disable('set_maxtrees_');
// set_autoincrease
if (getValue('set_multrees_')=="yes")
enable('set_autoincrease_');
else disable('set_autoincrease_');
// set_increaseval
if (getValue('set_autoincrease_')=="auto")
enable('set_increaseval_');
else disable('set_increaseval_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// specify_nchar
if (! getValue('specify_nchar_')) {
alert('Please enter the number of characters in your matrix');
return false;
}
// specify_nreps
if (! getValue('specify_nreps_')) {
alert('Please enter the number of ratchet reps');
return false;
}
// specify_seed
if (! getValue('specify_seed_')) {
alert('Please enter a seed value');
return false;
}
// specify_pct
if (! getValue('specify_mod_')) {
if ( getValue('specify_pct_') && getValue('specify_mod_')) {
alert('Sorry, you cannot specify both a fixed number (-nmod) and a percentage (-pct) of characters to modify');
return false;
}
}
if (! getValue('specify_mod_')) {
if (! getValue('specify_pct_') && ! getValue('specify_mod_')) {
alert('Please specify either a fixed number (-nmod) or a percentage (-pct) of characters to modify');
return false;
}
}
// specify_mod
if (! getValue('specify_pct_')) {
if ( getValue('specify_pct_') && getValue('specify_mod_')) {
alert('Sorry, you cannot specify both a fixed number (-nmod) and a percentage (-pct) of characters to modify');
return false;
}
}
// specify_wtmode
// specify_verbose
// setup_increase
// setup_nrep
// setup_hidden4
// paup_branchalg
// set_multrees
// set_rearrlimit
// set_timelimit
// set_reconlimit
// set_maxtrees
// set_autoincrease
// set_increaseval
return issueWarning();
}
function issueWarning() {
// runtime
// specify_nchar
// specify_nreps
// specify_seed
// specify_pct
// specify_mod
// specify_wtmode
// specify_verbose
// setup_increase
// setup_nrep
// setup_hidden4
// paup_branchalg
// set_multrees
// set_rearrlimit
// set_timelimit
// set_reconlimit
// set_maxtrees
// set_autoincrease
// set_increaseval
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
var element = document.forms['pauprat_exp'].elements[parameter];
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
var element = document.forms['pauprat_exp'].elements[parameter];
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
var element = document.forms['pauprat_exp'].elements[parameter];
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