<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RID3Paup</title>
<h2>RID3Paup: Recursive-Iterative-DCM3 algorithm with Paup parsimony search. (<a href="#REFERENCE">Terri Liebowitz, Mark Holder, Usman Roshan. David Swofford is the author of PAUP.</a>)</h2>
<s:form action="rid3paup" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
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
<A HREF="javascript:help.slidedownandjump('#maxtaxasubsetsize')">Subset size (do inference when subset is this size or smaller)</A>
<s:textfield name="maxtaxasubsetsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#maxtaxasubsetpercent')">Subset Percent (do inference when subset contains specified percent of the total number of taxa, or less).</A>
<s:textfield name="maxtaxasubsetpercent_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum recursion depth, before doing inference. Leave blank if not using depth as limit.
<s:textfield name="maxrecursionlevels_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of iterations. Leave blank if no iteration limit.
<s:textfield name="maxiterations_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of hours to run.
<s:textfield name="maxanalysistime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ignore branch lengths in starting tree.
<font color="red" size="3">*</font>
<s:radio name="ignorestartedgelen_"
list="#{ 'yes':'yes' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=decompose_paragraph><h2><A HREF="javascript:help.slidedownandjump('#decompose_paragraph_comment')">Decomposition Settings</A></H2>
Break ties randomly?
<font color="red" size="3">*</font>
<s:radio name="breakties_"
list="#{ 'no':'no' , 'yes':'yes' }" onclick="resolveParameters()"/>
<br/>
Seed for random number generator.
<s:textfield name="seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=large_tree_inference_paragraph><h2><A HREF="javascript:help.slidedownandjump('#large_tree_inference_paragraph_comment')">Paup Settings for Large Tree Search</A></H2>
Maximum number of trees saved (maxtrees).
<s:textfield name="maxtrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Automatically increase the number of trees in memory.
<font color="red" size="3">+</font>
<s:radio name="increase_"
list="#{ 'no':'no' , 'auto':'yes' }" onclick="resolveParameters()"/>
<br/>
Auto-increase amount (AutoInc).
<s:textfield name="autoincrease_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=hsearch_paragraph><h2><A HREF="javascript:help.slidedownandjump('#hsearch_paragraph_comment')">Paup Settings for Large Tree Search - HSearch Parameters</A></H2>
Branch Swapping Algorithm (swap)
<font color="red" size="3">*</font>
<s:radio name="swap_"
list="#{ 'tbr':'TBR' , 'spr':'SPR' , 'nni':'NNI' }" onclick="resolveParameters()"/>
<br/>
Save all optimal trees? (multrees)
<font color="red" size="3">*</font>
<s:radio name="multrees_"
list="#{ 'yes':'yes' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
Maximum number of rearrangements (rearrlimit). Blank means unlimited.
<s:textfield name="rearrlimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of seconds to search (timelimit). Blank means unlimited.
<s:textfield name="timelimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Reconnection limit (reconlimit). Blank means unlimited.
<s:textfield name="reconlimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of ratchet iterations (or blank if not ratcheting)
<s:textfield name="ratchetreps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Proportion of characters to reweight in ratchet
<font color="red" size="3">+</font>
<s:textfield name="ratchetprop_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Pseudo-random number generator seed for ratchet.
<font color="red" size="3">+</font>
<s:textfield name="ratchetseed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=small_tree_inference_paragraph><h2><A HREF="javascript:help.slidedownandjump('#small_tree_inference_paragraph_comment')">Paup Settings for Small Tree Search</A></H2>
Maximum number of trees saved (maxtrees).
<s:textfield name="s_maxtrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Automatically increase the number of trees in memory.
<font color="red" size="3">+</font>
<s:radio name="s_increase_"
list="#{ 'no':'no' , 'auto':'yes' }" onclick="resolveParameters()"/>
<br/>
Auto-increase amount (AutoInc).
<s:textfield name="s_autoincrease_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=s_hsearch_paragraph><h2><A HREF="javascript:help.slidedownandjump('#s_hsearch_paragraph_comment')">Paup Settings for Small Tree Search - HSearch Parameters</A></H2>
Branch Swapping Algorithm (swap)
<font color="red" size="3">*</font>
<s:radio name="s_swap_"
list="#{ 'tbr':'TBR' , 'spr':'SPR' , 'nni':'NNI' }" onclick="resolveParameters()"/>
<br/>
Save all optimal trees? (multrees)
<font color="red" size="3">*</font>
<s:radio name="s_multrees_"
list="#{ 'yes':'yes' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
Maximum number of rearrangements (rearrlimit). Blank means unlimited.
<s:textfield name="s_rearrlimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of seconds to search (timelimit). Blank means unlimited.
<s:textfield name="s_timelimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Reconnection limit (reconlimit). Blank means unlimited.
<s:textfield name="s_reconlimit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of ratchet iterations (or blank if not ratcheting)
<s:textfield name="s_ratchetreps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Proportion of characters to reweight in ratchet
<font color="red" size="3">+</font>
<s:textfield name="s_ratchetprop_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Pseudo-random number generator seed for ratchet.
<font color="red" size="3">+</font>
<s:textfield name="s_ratchetseed_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=maxtaxasubsetsize><i>Subset size (do inference when subset is this size or smaller)</i></a></dt>
<dd>
It is normally recommended that you use Subset Percent instead of Subset Size.
</dd>
<dt><a name=maxtaxasubsetpercent><i>Subset Percent (do inference when subset contains specified percent of the total number of taxa, or less).</i></a></dt>
<dd>
The recommended Subset Percent depends on the number of taxa in the dataset. For datasets with
100 - 500 taxa, use 50%. For 501 - 1000 taxa, use 25 %, and for more than 1001 taxa, use 12 %.
Rec-i-dcm3 with paup is not recommended for use on datasets smaller than 100 taxa.
</dd>
<br></br>
<dt><a name=decompose_paragraph_comment><i><b>Decomposition Settings</b></i></a></dt>
<br></br>
<dt><a name=large_tree_inference_paragraph_comment><i><b>Paup Settings for Large Tree Search</b></i></a></dt>
<br></br>
<dt><a name=hsearch_paragraph_comment><i><b>Paup Settings for Large Tree Search - HSearch Parameters</b></i></a></dt>
<br></br>
<dt><a name=small_tree_inference_paragraph_comment><i><b>Paup Settings for Small Tree Search</b></i></a></dt>
<br></br>
<dt><a name=s_hsearch_paragraph_comment><i><b>Paup Settings for Small Tree Search - HSearch Parameters</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// maxtaxasubsetsize
if (! getValue('maxtaxasubsetpercent_'))
enable('maxtaxasubsetsize_');
else disable('maxtaxasubsetsize_');
// maxtaxasubsetpercent
if (! getValue('maxtaxasubsetsize_'))
enable('maxtaxasubsetpercent_');
else disable('maxtaxasubsetpercent_');
// maxrecursionlevels
// maxiterations
// maxanalysistime
// ignorestartedgelen
// breakties
// seed
if ( getValue('breakties_') && getValue('breakties_')=="yes")
enable('seed_');
else disable('seed_');
// maxtrees
if ( getValue('multrees_') && getValue('multrees_')=="yes")
enable('maxtrees_');
else disable('maxtrees_');
// increase
if ( getValue('multrees_') && getValue('multrees_')=="yes")
enable('increase_');
else disable('increase_');
// autoincrease
if ( getValue('multrees_') && getValue('multrees_')=="yes" && getValue('increase_')
&& getValue('increase_')=="auto"
)
enable('autoincrease_');
else disable('autoincrease_');
// swap
// multrees
// rearrlimit
// timelimit
// reconlimit
// ratchetreps
// ratchetprop
if ( getValue('ratchetreps_') && getValue('ratchetreps_') > 0)
enable('ratchetprop_');
else disable('ratchetprop_');
// ratchetseed
if ( getValue('ratchetreps_') && getValue('ratchetreps_') > 0)
enable('ratchetseed_');
else disable('ratchetseed_');
// s_maxtrees
if ( getValue('s_multrees_') && getValue('s_multrees_')=="yes")
enable('s_maxtrees_');
else disable('s_maxtrees_');
// s_increase
if ( getValue('s_multrees_') && getValue('s_multrees_')=="yes")
enable('s_increase_');
else disable('s_increase_');
// s_autoincrease
if ( getValue('s_multrees_') && getValue('s_multrees_')=="yes" && getValue('s_increase_')
&& getValue('s_increase_')=="auto"
)
enable('s_autoincrease_');
else disable('s_autoincrease_');
// s_swap
// s_multrees
// s_rearrlimit
// s_timelimit
// s_reconlimit
// s_ratchetreps
// s_ratchetprop
if ( getValue('s_ratchetreps_') && getValue('s_ratchetreps_') > 0)
enable('s_ratchetprop_');
else disable('s_ratchetprop_');
// s_ratchetseed
if ( getValue('s_ratchetreps_') && getValue('s_ratchetreps_') > 0)
enable('s_ratchetseed_');
else disable('s_ratchetseed_');
}
function validateControl() {
// maxtaxasubsetsize
if (! getValue('maxtaxasubsetpercent_')) {
if (getValue('maxtaxasubsetsize_') != "" && getValue('maxtaxasubsetsize_') <= 0) {
alert('Subset size must be greater than 0 or blank.');
return false;
}
}
// maxtaxasubsetpercent
if (! getValue('maxtaxasubsetsize_')) {
if (getValue('maxtaxasubsetpercent_') != "" && getValue('maxtaxasubsetpercent_') <= 0) {
alert('Subset percent must be a decimal number greater than 0. For example, 25.5, means stop recursing when a subset contains 25.5% of the total number of taxa.');
return false;
}
}
// maxrecursionlevels
if (getValue('maxrecursionlevels_') != "" && getValue('maxrecursionlevels_') <= 0) {
alert('Maximum recursion depth must be blank or an integer greater than zero.');
return false;
}
// maxiterations
if (getValue('maxiterations_') != "" && getValue('maxiterations_') <= 0) {
alert('Maximum iterations must be blank or an integer greater than zero.');
return false;
}
// maxanalysistime
if (getValue('maxanalysistime_') != "" && getValue('maxanalysistime_') <= 0) {
alert('Maximum analysis time must be blank or an integer greater than zero.');
return false;
}
// ignorestartedgelen
// breakties
// seed
if ( getValue('breakties_') && getValue('breakties_')=="yes") {
if (getValue('seed_') < 0) {
alert('Seed must be greater than or equal to 0.');
return false;
}
}
// maxtrees
if ( getValue('multrees_') && getValue('multrees_')=="yes") {
if (getValue('maxtrees_') < 0) {
alert('maxtrees must be a greater than 0.');
return false;
}
}
// increase
// autoincrease
if ( getValue('multrees_') && getValue('multrees_')=="yes" && getValue('increase_')
&& getValue('increase_')=="auto"
) {
if (getValue('autoincrease_') <= 0) {
alert('Auto-increase amount must be greater than 0.');
return false;
}
}
// swap
// multrees
// rearrlimit
if (getValue('rearrlimit_') < 0) {
alert('rearrlimit must be a positive integer (or blank if unlimited).');
return false;
}
// timelimit
if (getValue('timelimit_') < 0) {
alert('timelimit must be a positive integer (or blank if unlimited).');
return false;
}
// reconlimit
if (getValue('reconlimit_') < 0) {
alert('reconlimit must be a positive integer (or blank if unlimited).');
return false;
}
// ratchetreps
if (getValue('ratchetreps_') < 0) {
alert('Ratchet iterations must be a positive integer (or blank if no ratchet).');
return false;
}
// ratchetprop
if ( getValue('ratchetreps_') && getValue('ratchetreps_') > 0) {
if (getValue('ratchetprop_') < 0) {
alert('Proportion to reweight must be greater than or equal to 0.');
return false;
}
}
// ratchetseed
if ( getValue('ratchetreps_') && getValue('ratchetreps_') > 0) {
if (getValue('ratchetseed_') < 0) {
alert('Proportion to reweight must be greater than or equal to 0.');
return false;
}
}
// s_maxtrees
if ( getValue('s_multrees_') && getValue('s_multrees_')=="yes") {
if (getValue('s_maxtrees_') < 0) {
alert('maxtrees must be a greater than 0.');
return false;
}
}
// s_increase
// s_autoincrease
if ( getValue('s_multrees_') && getValue('s_multrees_')=="yes" && getValue('s_increase_')
&& getValue('s_increase_')=="auto"
) {
if (getValue('s_autoincrease_') <= 0) {
alert('Auto-increase amount must greater be than 0.');
return false;
}
}
// s_swap
// s_multrees
// s_rearrlimit
if (getValue('s_rearrlimit_') < 0) {
alert('rearrlimit must be a positive integer (or blank if unlimited).');
return false;
}
// s_timelimit
if (getValue('s_timelimit_') < 0) {
alert('timelimit must be a positive integer (or blank if unlimited).');
return false;
}
// s_reconlimit
if (getValue('s_reconlimit_') < 0) {
alert('reconlimit must be a positive integer (or blank if unlimited).');
return false;
}
// s_ratchetreps
if (getValue('s_ratchetreps_') < 0) {
alert('Ratchet iterations must be a positive integer (or blank if no ratchet).');
return false;
}
// s_ratchetprop
if ( getValue('s_ratchetreps_') && getValue('s_ratchetreps_') > 0) {
if (getValue('s_ratchetprop_') < 0) {
alert('Proportion to reweight must be greater than or equal to 0.');
return false;
}
}
// s_ratchetseed
if ( getValue('s_ratchetreps_') && getValue('s_ratchetreps_') > 0) {
if (getValue('s_ratchetseed_') < 0) {
alert('Proportion to reweight must be greater than or equal to 0.');
return false;
}
}
return issueWarning();
}
function issueWarning() {
// maxtaxasubsetsize
// maxtaxasubsetpercent
// maxrecursionlevels
// maxiterations
// maxanalysistime
// ignorestartedgelen
// breakties
// seed
// maxtrees
// increase
// autoincrease
// swap
// multrees
// rearrlimit
// timelimit
// reconlimit
// ratchetreps
// ratchetprop
// ratchetseed
// s_maxtrees
// s_increase
// s_autoincrease
// s_swap
// s_multrees
// s_rearrlimit
// s_timelimit
// s_reconlimit
// s_ratchetreps
// s_ratchetprop
// s_ratchetseed
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
var element = document.forms['rid3paup'].elements[parameter];
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
var element = document.forms['rid3paup'].elements[parameter];
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
var element = document.forms['rid3paup'].elements[parameter];
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