<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PAUP</title>
<h2>PAUP: CIPRES wrapper around PAUP's HSearch command (using parsimony). (<a href="#REFERENCE">David Swofford is the author of PAUP</a>)</h2>
<s:form action="paup" theme="simple">
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
<A name=hsearch_paragraph><h2><A HREF="javascript:help.slidedownandjump('#hsearch_paragraph_comment')">Heuristic Search Parameters</A></H2>
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
<br></br>
<dt><a name=hsearch_paragraph_comment><i><b>Heuristic Search Parameters</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
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
}
function validateControl() {
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
alert('Auto-increase amount must be than 0.');
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
return issueWarning();
}
function issueWarning() {
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
var element = document.forms['paup'].elements[parameter];
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
var element = document.forms['paup'].elements[parameter];
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
var element = document.forms['paup'].elements[parameter];
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