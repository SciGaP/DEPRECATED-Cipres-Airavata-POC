<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MrBayes 3.2.1 Restart (BETA) on XSEDE</title>
<h2>MrBayes 3.2.1 Restart (BETA) on XSEDE: Tree Inference Using Bayesian Analysis - run on XSEDE (<a href="#REFERENCE">John P. Huelsenbeck and Fred Ronquist</a>)</h2>
<s:form action="mrbayes321_restartbeta" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
I am restarting a checkpoint from
<font color="red" size="3">*</font>
<s:radio name="run_version_"
list="#{ '1':'MrBayes 3.2.1' , '2':'MrByes 3.2.2' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_autoclose_confirm')">I confirm that there is not an "autoclose = no" statement in my MrBayes block</A>
<font color="red" size="3">*</font>
<s:checkbox name="set_autoclose_confirm_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nruns_specified')">My MrBayes Block specifies nruns=</A>
<s:textfield name="nruns_specified_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nchains_specified')">My MrBayes Block specifies nchains=</A>
<s:textfield name="nchains_specified_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Upload Checkpoint File (.ckp)
<font color="red" size="3">*</font>
<s:select name="upload_ckpfile_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_ckpfile_')}" onchange="resolveParameters()"/>
<br/>
Upload mcmc File (.mcmc)
<font color="red" size="3">*</font>
<s:select name="upload_mcmcfile_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_mcmcfile_')}" onchange="resolveParameters()"/>
<br/>
How many Sump/Sumt files do you wish to upload?
<font color="red" size="3">*</font>
<s:select name="num_ptfiles_" list="#{ '1':'1' , '2':'2' , '3':'3' , '4':'4' }" onchange="resolveParameters()"/>
<br/>
<br/>
Upload Sump File 1 (.p)
<font color="red" size="3">*</font>
<s:select name="upload_sumpfile1_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumpfile1_')}" onchange="resolveParameters()"/>
<br/>
Upload Sump File 2 (.p)
<font color="red" size="3">*</font>
<s:select name="upload_sumpfile2_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumpfile2_')}" onchange="resolveParameters()"/>
<br/>
Upload Sump File 3 (.p)
<font color="red" size="3">*</font>
<s:select name="upload_sumpfile3_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumpfile3_')}" onchange="resolveParameters()"/>
<br/>
Upload Sump File 4 (.p)
<font color="red" size="3">*</font>
<s:select name="upload_sumpfile4_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumpfile4_')}" onchange="resolveParameters()"/>
<br/>
Upload Sumt File 1 (.t)
<font color="red" size="3">*</font>
<s:select name="upload_sumtfile1_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumtfile1_')}" onchange="resolveParameters()"/>
<br/>
Upload Sumt File 2 (.t)
<font color="red" size="3">*</font>
<s:select name="upload_sumtfile2_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumtfile2_')}" onchange="resolveParameters()"/>
<br/>
Upload Sumt File 3 (.t)
<font color="red" size="3">*</font>
<s:select name="upload_sumtfile3_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumtfile3_')}" onchange="resolveParameters()"/>
<br/>
Upload Sumt File 4 (.t)
<font color="red" size="3">*</font>
<s:select name="upload_sumtfile4_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_sumtfile4_')}" onchange="resolveParameters()"/>
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
<dt><a name=set_autoclose_confirm><i>I confirm that there is not an "autoclose = no" statement in my MrBayes block</i></a></dt>
<dd>Putting an "autoclose = no" statement in your MrBayes block will cause catastrophic failure of the job, and may impact others. Please be careful.
</dd>
<dt><a name=nruns_specified><i>My MrBayes Block specifies nruns=</i></a></dt>
<dd>The values entered for nruns and nchains influence the number of cpu's that can be used in parallel. Please enter the value you specified for
nruns in the MrBayes block of the Nexus file. If you didn't specify a value for nruns, please leave this field at its default value of 2.
</dd>
<dt><a name=nchains_specified><i>My MrBayes Block specifies nchains=</i></a></dt>
<dd>The value entered for nruns and nchains influences the number of cpu's that can be used in parallel. Enter the value you specified
for nchains in the MrBayes block of the nexus file. If you didn't specify a value for nchains, please leave this field at its default value of 4.
</dd>
<dt><a name=runtime><i>Maximum Hours to Run (click here for help setting this correctly)</i></a></dt>
<dd>Estimate the maximum time your job will need to run. We recommend testing initially with a < 0.5hr test run because Jobs set for 0.5 h or less depedendably run immediately in the "debug" queue.
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
// run_version
// set_autoclose_confirm
// nruns_specified
// nchains_specified
// runtime
// upload_ckpfile
// upload_mcmcfile
// num_ptfiles
// upload_sumpfile1
// upload_sumpfile2
if (getValue('num_ptfiles_') > 1)
enable('upload_sumpfile2_');
else disable('upload_sumpfile2_');
// upload_sumpfile3
if (getValue('num_ptfiles_') > 2)
enable('upload_sumpfile3_');
else disable('upload_sumpfile3_');
// upload_sumpfile4
if (getValue('num_ptfiles_') > 3)
enable('upload_sumpfile4_');
else disable('upload_sumpfile4_');
// upload_sumtfile1
// upload_sumtfile2
if (getValue('num_ptfiles_') > 1)
enable('upload_sumtfile2_');
else disable('upload_sumtfile2_');
// upload_sumtfile3
if (getValue('num_ptfiles_') > 2)
enable('upload_sumtfile3_');
else disable('upload_sumtfile3_');
// upload_sumtfile4
if (getValue('num_ptfiles_') > 3)
enable('upload_sumtfile4_');
else disable('upload_sumtfile4_');
}
function validateControl() {
// run_version
// set_autoclose_confirm
if (!getValue('set_autoclose_confirm_')) {
alert('Please acknowledge that there is not a "set autoclose = no" statement in the MrBayes block of your Nexus file');
return false;
}
// nruns_specified
if (!getValue('nruns_specified_')) {
alert('Please enter a value for nruns');
return false;
}
if (getValue('nruns_specified_') < 1) {
alert('The value of nruns must be greater than 0');
return false;
}
if ((((getValue('nruns_specified_') * getValue('nchains_specified_')) % 2) != 0)) {
alert('nruns x nchains must be a multiple of 2');
return false;
}
if ((getValue('nruns_specified_') * getValue('nchains_specified_') > 17) ) {
alert('nruns x nchains must be less than or equal to 16.');
return false;
}
// nchains_specified
if (!getValue('nchains_specified_')) {
alert('Please enter value for nchains');
return false;
}
if (getValue('nchains_specified_') < 1) {
alert('The value of nchains must be greater than 0');
return false;
}
if (getValue('nchains_specified_') < 1) {
alert('The value for nchains must be 1 or greater. The recommended value is at least 4.');
return false;
}
if ((getValue('nruns_specified_') * getValue('nchains_specified_') > 17) ) {
alert('nruns x nchains must be less than or equal to 16.');
return false;
}
if ((((getValue('nruns_specified_') * getValue('nchains_specified_')) % 2) != 0)) {
alert('nruns x nchains must be a multiple of 2');
return false;
}
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
// upload_ckpfile
if (! getValue('upload_ckpfile_')) {
alert('Please select the Checkpoint file to upload');
return false;
}
// upload_mcmcfile
if (! getValue('upload_mcmcfile_')) {
alert('Please select the mcmc file to upload');
return false;
}
// num_ptfiles
// upload_sumpfile1
if (! getValue('upload_sumpfile1_')) {
alert('Please select the first Sump file to upload');
return false;
}
// upload_sumpfile2
if (getValue('num_ptfiles_') > 1) {
if (! getValue('upload_sumpfile2_')) {
alert('Please select the second Sump file to upload');
return false;
}
}
// upload_sumpfile3
if (getValue('num_ptfiles_') > 2) {
if (! getValue('upload_sumpfile3_')) {
alert('Please select the third Sump file to upload');
return false;
}
}
// upload_sumpfile4
if (getValue('num_ptfiles_') > 3) {
if (! getValue('upload_sumpfile4_')) {
alert('Please select the fourth Sump file to upload');
return false;
}
}
// upload_sumtfile1
if (! getValue('upload_sumtfile1_')) {
alert('Please select the first Sumt file to upload');
return false;
}
// upload_sumtfile2
if (getValue('num_ptfiles_') > 1) {
if (! getValue('upload_sumtfile2_')) {
alert('Please select the second Sumt file to upload');
return false;
}
}
// upload_sumtfile3
if (getValue('num_ptfiles_') > 2) {
if (! getValue('upload_sumtfile3_')) {
alert('Please select the third Sumt file to upload');
return false;
}
}
// upload_sumtfile4
if (getValue('num_ptfiles_') > 3) {
if (! getValue('upload_sumtfile4_')) {
alert('Please select the fourth Sumt file to upload');
return false;
}
}
return issueWarning();
}
function issueWarning() {
// run_version
// set_autoclose_confirm
// nruns_specified
// nchains_specified
// runtime
if (getValue('nchains_specified_') * getValue('nruns_specified_') == 2)
{
if (!confirm(messageSplit("The job will run on 2 processors as configured. If it runs for the entire configured time, it will consume 2 x getValue('runtime_') cpu hours")))
{
return false;
}
}
if (getValue('nchains_specified_') * getValue('nruns_specified_') == 4)
{
if (!confirm(messageSplit("The job will run on 4 processors as configured. If it runs for the entire configured time, it will consume 4 x getValue('runtime_') cpu hours")))
{
return false;
}
}
if (getValue('nchains_specified_') * getValue('nruns_specified_') == 6)
{
if (!confirm(messageSplit("The job will run on 6 processors as configured. If it runs for the entire configured time, it will consume 6 x getValue('runtime_') cpu hours")))
{
return false;
}
}
if (getValue('nchains_specified_') * getValue('nruns_specified_') == 8)
{
if (!confirm(messageSplit("The job will run on 8 processors as configured. If it runs for the entire configured time, it will consume 8 x getValue('runtime_') cpu hours")))
{
return false;
}
}
if (getValue('nchains_specified_') * getValue('nruns_specified_') > 8 )
{
if (!confirm(messageSplit("The job will run on 16 processors as configured. If it runs for the entire configured time, it will consume 16 x getValue('runtime_') cpu hours")))
{
return false;
}
}
// upload_ckpfile
// upload_mcmcfile
// num_ptfiles
// upload_sumpfile1
// upload_sumpfile2
// upload_sumpfile3
// upload_sumpfile4
// upload_sumtfile1
// upload_sumtfile2
// upload_sumtfile3
// upload_sumtfile4
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
var element = document.forms['mrbayes321_restartbeta'].elements[parameter];
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
var element = document.forms['mrbayes321_restartbeta'].elements[parameter];
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
var element = document.forms['mrbayes321_restartbeta'].elements[parameter];
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