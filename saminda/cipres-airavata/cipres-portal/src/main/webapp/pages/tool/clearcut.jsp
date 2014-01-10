<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Clearcut</title>
<h2>Clearcut: Fast Implementation of Relaxed Neighbor Joining (<a href="#REFERENCE">Sheneman, L., Evans, J., Foster J.A.</a>)</h2>
<s:form action="clearcut" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
My data is an alignment (no =distance matrix)
<font color="red" size="3">*</font>
<s:checkbox name="alignment_or_" onclick="resolveParameters()"/>
<br/>
Datatype:
<font color="red" size="3">*</font>
<s:radio name="datatype_is_"
list="#{ 'DNA':'DNA' , 'protein':'Protein' }" onclick="resolveParameters()"/>
<br/>
Correction Model for Computing Distance Matrix
<font color="red" size="3">*</font>
<s:radio name="corr_model_"
list="#{ '':'None' , '--jukes':'Jukes-Cantor' , '--kimura':'Kimura' }" onclick="resolveParameters()"/>
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
<A name=adv_opts><h2><A HREF="javascript:help.slidedownandjump('#adv_opts_comment')">Advanced Options</A></H2>
Use traditional Neighbor-Joining algorithm. (-N)
<s:checkbox name="use_trad_" onclick="resolveParameters()"/>
<br/>
Randomly shuffle the distance matrix. (-S)
<s:checkbox name="shuff_matrix_" onclick="resolveParameters()"/>
<br/>
Attempt joins deterministically. (-r)
<s:checkbox name="join_det_" onclick="resolveParameters()"/>
<br/>
Explicitly set the PRNG seed to a specific value. (-s)
<s:checkbox name="spec_seed_" onclick="resolveParameters()"/>
<br/>
<s:textfield name="seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output_opts><h2><A HREF="javascript:help.slidedownandjump('#output_opts_comment')">Output Options</A></H2>
Output a Distance Matrix
<s:checkbox name="matrix_out_" onclick="resolveParameters()"/>
<br/>
Number of trees to write out
<s:textfield name="ntrees_out_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Exponential notation in distance output (-E)
<s:checkbox name="exp_dist_" onclick="resolveParameters()"/>
<br/>
Exponential notation for branch lengths (-e)
<s:checkbox name="exp_brl_" onclick="resolveParameters()"/>
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
<dt><a name=adv_opts_comment><i><b>Advanced Options</b></i></a></dt>
<br></br>
<dt><a name=output_opts_comment><i><b>Output Options</b></i></a></dt>
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
// alignment_or
// datatype_is
if (getValue('alignment_or_'))
enable('datatype_is_');
else disable('datatype_is_');
// corr_model
if (!getValue('alignment_or_'))
enable('corr_model_');
else disable('corr_model_');
// use_trad
// shuff_matrix
// join_det
// spec_seed
// seed_val
if (getValue('spec_seed_'))
enable('seed_val_');
else disable('seed_val_');
// matrix_out
// ntrees_out
// exp_dist
// exp_brl
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// alignment_or
// datatype_is
// corr_model
// use_trad
// shuff_matrix
// join_det
// spec_seed
// seed_val
// matrix_out
// ntrees_out
// exp_dist
// exp_brl
return issueWarning();
}
function issueWarning() {
// runtime
// alignment_or
// datatype_is
// corr_model
// use_trad
// shuff_matrix
// join_det
// spec_seed
// seed_val
// matrix_out
// ntrees_out
// exp_dist
// exp_brl
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
var element = document.forms['clearcut'].elements[parameter];
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
var element = document.forms['clearcut'].elements[parameter];
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
var element = document.forms['clearcut'].elements[parameter];
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