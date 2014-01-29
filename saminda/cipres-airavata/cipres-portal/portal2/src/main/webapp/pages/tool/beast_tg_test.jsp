<%@ taglib prefix="s" uri="/struts-tags" %>
<title>BEAST on TG Test</title>
<h2>BEAST on TG Test: Bayesian Evolutionary Analysis by Sampling Trees - run on teragrid (<a href="#REFERENCE">John P. Huelsenbeck and Fred Ronquist</a>)</h2>
<s:form action="beast_tg_test" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#is_partitioned')">My data set is partitioned</A>
<font color="red" size="3">*</font>
<s:checkbox name="is_partitioned_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nu_partitions')">How many partitions does your data have?</A>
<font color="red" size="3">*</font>
<s:textfield name="nu_partitions_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_beagle')">Do not use Beagle</A>
<s:checkbox name="no_beagle_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#spec_seed')">Specify a seed for this run (by default a random seed is used)</A>
<s:checkbox name="spec_seed_" onclick="resolveParameters()"/>
<br/>
Enter the seed value here
<s:textfield name="seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Set the Beagle Scaling Parameter
<font color="red" size="3">*</font>
<s:select name="beagle_scaling_" list="#{ 'default':'default' , 'always':'always' , 'dynamic':'dynamic' , 'none':'none' }" onchange="resolveParameters()"/>
<br/>
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
<dd>Estimate the maximum time your job will need to run (between 1 - 168hrs, or < 0.5hr for a test run). Your job will be killed if it doesn't finish within
the time you specify, however jobs with shorter maximum run times often run sooner than longer jobs.
</dd>
<dt><a name=is_partitioned><i>My data set is partitioned</i></a></dt>
<dd>This option will help the application determine how to run the job</dd>
<dt><a name=nu_partitions><i>How many partitions does your data have?</i></a></dt>
<dd>This option will help the application determine how to run the job</dd>
<dt><a name=no_beagle><i>Do not use Beagle</i></a></dt>
<dd>This option is offered because sometimes a bug in the interface between BEAST and BEAGLE prevents a run from completing. Use this option if you wish to run a data set that
has failed using the normal BEAST/BEAGLE implementation. Runs made this way are always slower, so use this option as a last resort.</dd>
<dt><a name=spec_seed><i>Specify a seed for this run (by default a random seed is used)</i></a></dt>
<dd>This option allows the user to specify the random seed BEAST uses, so results can be compared between runs.</dd>
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
// is_partitioned
// nu_partitions
if (getValue('is_partitioned_'))
enable('nu_partitions_');
else disable('nu_partitions_');
// no_beagle
// spec_seed
// seed_val
if (getValue('spec_seed_'))
enable('seed_val_');
else disable('seed_val_');
// beagle_scaling
if (!getValue('no_beagle_'))
enable('beagle_scaling_');
else disable('beagle_scaling_');
}
function validateControl() {
// runtime
if (getValue('runtime_') > 168.0) {
alert('The maximum hours to run must be less than 168');
return false;
}
// is_partitioned
// nu_partitions
if (getValue('is_partitioned_')) {
if (getValue('is_partitioned_') && getValue('nu_partitions_') < 2 ) {
alert('Please enter an integer greater than 1 for the number of partitions. If you have just one partition, please uncheck the box that says "My data set is partitioned"');
return false;
}
}
// no_beagle
// spec_seed
// seed_val
// beagle_scaling
return issueWarning();
}
function issueWarning() {
// runtime
if (getValue('runtime_')!=0 )
{
if (!confirm(messageSplit("The job will run on 8 processors as configured. If it runs for the entire configured time, it will consume 8 x getValue('runtime_') cpu hours")))
{
return false;
}
}
// is_partitioned
// nu_partitions
if (getValue('nu_partitions_') >= 16)
{
if (!confirm(messageSplit("You have specified a large number of partitions; we are asking users with this type of data to contact us at customerservice@phylo.org, so we can explore better performance techniques with BEAST.")))
{
return false;
}
}
// no_beagle
if (getValue('no_beagle_') == 1)
{
if (!confirm(messageSplit("The Do not use Beagle option is intended only for cases when runs with Beagle fail. Runs without Beagle are slower and less efficient.")))
{
return false;
}
}
// spec_seed
// seed_val
// beagle_scaling
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
var element = document.forms['beast_tg_test'].elements[parameter];
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
var element = document.forms['beast_tg_test'].elements[parameter];
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
var element = document.forms['beast_tg_test'].elements[parameter];
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