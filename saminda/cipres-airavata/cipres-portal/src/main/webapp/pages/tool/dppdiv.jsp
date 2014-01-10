<%@ taglib prefix="s" uri="/struts-tags" %>
<title>DPPDIV on XSEDE</title>
<h2>DPPDIV on XSEDE: Estimating species divergence times and lineage-specific substitution rates on a fixed topology run on XSEDE (<a href="#REFERENCE">Tracy Heath, Tomás Flouri, Alexandros Stamatakis</a>)</h2>
<s:form action="dppdiv" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#upload_treefile')">Tree file</A>
<font color="red" size="3">*</font>
<s:select name="upload_treefile_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_treefile_')}" onchange="resolveParameters()"/>
<br/>
Number of mcmc cycles
<s:textfield name="mcmc_cycles_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Print frequency
<s:textfield name="print_freq_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Sample frequency
<s:textfield name="sample_frequency_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Output file prefix
<s:textfield name="outfile_prefix_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=configure_run><h2><A HREF="javascript:help.slidedownandjump('#configure_run_comment')">Configure Run</A></H2>
Prior mean of number of rate categories (-pm)
<s:textfield name="prior_mean_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Shape for gamma on rates (-ra)
<s:textfield name="gamma_shape_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Scale for gamma om rates (-rb)
<s:textfield name="gamma_omrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Shape for gamma hyper prior on alpha concentration parameter(-hsh)
<s:textfield name="gamma_hyperpriorshape_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Scale for gamma hyper prior on alpha concentration parameter (-hsc)
<s:textfield name="gamma_hyperpriorscale_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Seed 1 (-s1; use this if you only pass in one seed)
<s:textfield name="seed1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Seed 2 (-s2)
<s:textfield name="seed2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use input branch lengths (-ubl)
<s:checkbox name="input_branchlengths_" onclick="resolveParameters()"/>
<br/>
Use single node move (-snm)
<s:checkbox name="single_nodemove_" onclick="resolveParameters()"/>
<br/>
Use random-order node moves (-rdn)
<s:checkbox name="ro_nodemove_" onclick="resolveParameters()"/>
<br/>
Turn off this move:
<font color="red" size="3">*</font>
<s:select name="turnoff_move_" list="#{ '0':'None' , '1':'1' , '2':'2' , '3':'3' , '4':'4' , '5':'5' , '6':'6' }" onchange="resolveParameters()"/>
<br/>
<br/>
Print moves to .info.out file (-vb)
<s:checkbox name="print_moves_" onclick="resolveParameters()"/>
<br/>
Set the tree prior (-npr)
<font color="red" size="3">*</font>
<s:select name="npr_value_" list="#{ '1':'Uniform' , '2':'Yule' , '3':'cbd' , '4':'cbd fix' }" onchange="resolveParameters()"/>
<br/>
<br/>
Starting value of the diversification rate (-bdr)
<s:textfield name="starting_val_diverserate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Relative Extinction Rate (-bda)
<s:textfield name="relative_ext_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Run under strict clock (and estimate substitution rate) (-clok)
<s:checkbox name="strict_clock_" onclick="resolveParameters()"/>
<br/>
Run under uncorrelated gamma-distributed rates (-urg)
<s:checkbox name="run_uncorrelated_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=configure_calibrations><h2><A HREF="javascript:help.slidedownandjump('#configure_calibrations_comment')">Configure Calibrations</A></H2>
<A HREF="javascript:help.slidedownandjump('#upload_calfile')">Upload node calibrations file (optional)</A>
<font color="red" size="3">*</font>
<s:select name="upload_calfile_" headerKey='' headerValue='' list="%{ getDataForParameter('upload_calfile_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#soft_bounds')">Turn on soft bounds on calibrated nodes (-soft)</A>
<s:checkbox name="soft_bounds_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#offset_exponential')">All calibrated nodes are offset exponential (-exhp)</A>
<s:checkbox name="offset_exponential_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dpm_hyperprior')">All calibrated nodes have a DPM hyperprior (-dphp)</A>
<s:checkbox name="dpm_hyperprior_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#hyperprior_oncal')">Hyperprior on calibrations from a gamma- (-ghp)</A>
<s:checkbox name="hyperprior_oncal_" onclick="resolveParameters()"/>
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
<dt><a name=upload_treefile><i>Tree file</i></a></dt>
<dd>
The Newick tree must contain confidence values.
</dd>
<br></br>
<dt><a name=configure_run_comment><i><b>Configure Run</b></i></a></dt>
<br></br>
<dt><a name=configure_calibrations_comment><i><b>Configure Calibrations</b></i></a></dt>
<dt><a name=upload_calfile><i>Upload node calibrations file (optional)</i></a></dt>
<dd>
Need information on cal file format.
</dd>
<dt><a name=soft_bounds><i>Turn on soft bounds on calibrated nodes (-soft)</i></a></dt>
<dd>-soft" is only for calibrations specified with uniform densities. </dd>
<dt><a name=offset_exponential><i>All calibrated nodes are offset exponential (-exhp)</i></a></dt>
<dd>The -exhp option also turns on the hyperprior on the exp rates. Please see Heath (2012)http://sysbio.oxfordjournals.org/content/61/5/793 </dd>
<dt><a name=dpm_hyperprior><i>All calibrated nodes have a DPM hyperprior (-dphp)</i></a></dt>
<dd>This also gets a value for the expected # of calibration clusters . Please see Heath (2012)http://sysbio.oxfordjournals.org/content/61/5/793</dd>
<dt><a name=hyperprior_oncal><i>Hyperprior on calibrations from a gamma- (-ghp)</i></a></dt>
<dd>For details, please see the article Heath (2012) http://sysbio.oxfordjournals.org/content/61/5/793</dd>
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
// upload_treefile
// mcmc_cycles
// print_freq
// sample_frequency
// outfile_prefix
// prior_mean
// gamma_shape
// gamma_omrates
// gamma_hyperpriorshape
// gamma_hyperpriorscale
// seed1
// seed2
if (getValue('seed1_'))
enable('seed2_');
else disable('seed2_');
// input_branchlengths
// single_nodemove
// ro_nodemove
// turnoff_move
// print_moves
// npr_value
// starting_val_diverserate
// relative_ext
// strict_clock
// run_uncorrelated
// upload_calfile
// soft_bounds
if ( getValue('upload_calfile_'))
enable('soft_bounds_');
else disable('soft_bounds_');
// offset_exponential
if ( getValue('upload_calfile_'))
enable('offset_exponential_');
else disable('offset_exponential_');
// dpm_hyperprior
if ( getValue('upload_calfile_'))
enable('dpm_hyperprior_');
else disable('dpm_hyperprior_');
// hyperprior_oncal
if ( getValue('upload_calfile_'))
enable('hyperprior_oncal_');
else disable('hyperprior_oncal_');
}
function validateControl() {
// runtime
if (getValue('runtime_') > 168) {
alert('Maximum Hours to Run must be less than 168');
return false;
}
if (getValue('runtime_') < 0) {
alert('Maximum Hours to Run must be greater than 0');
return false;
}
if (! getValue('runtime_') ) {
alert('Please Enter a Value for Maximum Hours to Run');
return false;
}
// upload_treefile
if (! getValue('upload_treefile_')) {
alert('Please select a Newick Tree file for your run');
return false;
}
// mcmc_cycles
// print_freq
// sample_frequency
// outfile_prefix
// prior_mean
// gamma_shape
// gamma_omrates
// gamma_hyperpriorshape
// gamma_hyperpriorscale
// seed1
// seed2
// input_branchlengths
// single_nodemove
// ro_nodemove
// turnoff_move
// print_moves
// npr_value
// starting_val_diverserate
// relative_ext
if (getValue('relative_ext_') > 1) {
alert('Please set the relative extinction to a value less than or equal to 1');
return false;
}
// strict_clock
// run_uncorrelated
// upload_calfile
// soft_bounds
// offset_exponential
// dpm_hyperprior
// hyperprior_oncal
return issueWarning();
}
function issueWarning() {
// runtime
if (getValue('runtime_') > 0)
{
if (!confirm(messageSplit("The job will run on 16 processors as configured. If it runs for the entire configured time, it will consume 16 x getValue('runtime_') cpu hours")))
{
return false;
}
}
// upload_treefile
// mcmc_cycles
// print_freq
// sample_frequency
// outfile_prefix
// prior_mean
// gamma_shape
// gamma_omrates
// gamma_hyperpriorshape
// gamma_hyperpriorscale
// seed1
// seed2
// input_branchlengths
// single_nodemove
// ro_nodemove
// turnoff_move
// print_moves
// npr_value
// starting_val_diverserate
// relative_ext
// strict_clock
// run_uncorrelated
// upload_calfile
// soft_bounds
// offset_exponential
// dpm_hyperprior
// hyperprior_oncal
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
var element = document.forms['dppdiv'].elements[parameter];
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
var element = document.forms['dppdiv'].elements[parameter];
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
var element = document.forms['dppdiv'].elements[parameter];
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