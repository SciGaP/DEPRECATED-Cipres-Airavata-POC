<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Phylobayes MPI on XSEDE (Restart)</title>
<h2>Phylobayes MPI on XSEDE (Restart): Restart a PhyloBayes MPI run on XSEDE (<a href="#REFERENCE">Nicolas Lartillot, Thomas Lepage, and Samuel Blanquart</a>)</h2>
<s:form action="phylobayes_xsede_restart" theme="simple">
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
Select the first chain file to restart
<font color="red" size="3">*</font>
<s:select name="chainfile1_" headerKey='' headerValue='' list="%{ getDataForParameter('chainfile1_')}" onchange="resolveParameters()"/>
<br/>
Select the second chain file to restart
<font color="red" size="3">*</font>
<s:select name="chainfile2_" headerKey='' headerValue='' list="%{ getDataForParameter('chainfile2_')}" onchange="resolveParameters()"/>
<br/>
Select the first chain.param file to restart
<font color="red" size="3">*</font>
<s:select name="chainparamfile1_" headerKey='' headerValue='' list="%{ getDataForParameter('chainparamfile1_')}" onchange="resolveParameters()"/>
<br/>
Select the second chain.param file
<font color="red" size="3">*</font>
<s:select name="chainparamfile2_" headerKey='' headerValue='' list="%{ getDataForParameter('chainparamfile2_')}" onchange="resolveParameters()"/>
<br/>
Select the first chain.treelist file to restart
<font color="red" size="3">*</font>
<s:select name="chaintreefile1_" headerKey='' headerValue='' list="%{ getDataForParameter('chaintreefile1_')}" onchange="resolveParameters()"/>
<br/>
Select the second chain.treelist file
<font color="red" size="3">*</font>
<s:select name="chaintreefile2_" headerKey='' headerValue='' list="%{ getDataForParameter('chaintreefile2_')}" onchange="resolveParameters()"/>
<br/>
Select the first chain.trace file to restart
<font color="red" size="3">*</font>
<s:select name="chaintracefile1_" headerKey='' headerValue='' list="%{ getDataForParameter('chaintracefile1_')}" onchange="resolveParameters()"/>
<br/>
Select the second chain.trace file
<font color="red" size="3">*</font>
<s:select name="chaintracefile2_" headerKey='' headerValue='' list="%{ getDataForParameter('chaintracefile2_')}" onchange="resolveParameters()"/>
<br/>
Select the first chain.monitor file to restart
<font color="red" size="3">*</font>
<s:select name="chainmonfile1_" headerKey='' headerValue='' list="%{ getDataForParameter('chainmonfile1_')}" onchange="resolveParameters()"/>
<br/>
Select the second chain.monitor file
<font color="red" size="3">*</font>
<s:select name="chainmonfile2_" headerKey='' headerValue='' list="%{ getDataForParameter('chainmonfile2_')}" onchange="resolveParameters()"/>
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
// chainfile1
// chainfile2
// chainparamfile1
// chainparamfile2
// chaintreefile1
// chaintreefile2
// chaintracefile1
// chaintracefile2
// chainmonfile1
// chainmonfile2
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
// chainfile1
if (! getValue('chainfile1_')) {
alert('Please select a chain file');
return false;
}
// chainfile2
if (! getValue('chainfile2_')) {
alert('Please select a second chain file');
return false;
}
// chainparamfile1
if (! getValue('chainparamfile1_')) {
alert('Please select the first chain.param file');
return false;
}
// chainparamfile2
if (! getValue('chainparamfile2_')) {
alert('Please select the second chain.param file');
return false;
}
// chaintreefile1
if (! getValue('chaintreefile1_')) {
alert('Please select the first chain.treelist file');
return false;
}
// chaintreefile2
if (! getValue('chaintreefile2_')) {
alert('Please select the second chain.treelist file');
return false;
}
// chaintracefile1
if (! getValue('chaintracefile1_')) {
alert('Please select the first chain.trace file');
return false;
}
// chaintracefile2
if (! getValue('chaintracefile2_')) {
alert('Please select the second chain.trace file');
return false;
}
// chainmonfile1
if (! getValue('chainmonfile1_')) {
alert('Please select the first chain.monitor file');
return false;
}
// chainmonfile2
if (! getValue('chainmonfile2_')) {
alert('Please select the second chain.monitor file');
return false;
}
return issueWarning();
}
function issueWarning() {
// runtime
if ( getValue('runtime_'))
{
if (!confirm(messageSplit("The job will run on 64 cores as configured. If it runs for the entire configured time, it will consume 32 x getValue('runtime_') core (cpu) hours")))
{
return false;
}
}
// chainfile1
// chainfile2
// chainparamfile1
// chainparamfile2
// chaintreefile1
// chaintreefile2
// chaintracefile1
// chaintracefile2
// chainmonfile1
// chainmonfile2
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
var element = document.forms['phylobayes_xsede_restart'].elements[parameter];
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
var element = document.forms['phylobayes_xsede_restart'].elements[parameter];
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
var element = document.forms['phylobayes_xsede_restart'].elements[parameter];
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