<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Probalign</title>
<h2>Probalign: Multiple sequence alignment using partition function posterior probabilities. (<a href="#REFERENCE">Satish Chikkagoudar, Usman Roshan</a>)</h2>
<s:form action="probalign" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Print sequences in alignment order rather than input order (-a)
<s:checkbox name="alignment_order_" onclick="resolveParameters()"/>
<br/>
Sequence Type (Protein specifies gonnet 160; Nucleic acid specifies simple)
<font color="red" size="3">*</font>
<s:radio name="scoring_matrix_"
list="#{ 'gonnet_160':'Protein' , 'nuc_simple':'Nucleic acid' }" onclick="resolveParameters()"/>
<br/>
ClustalW output format (-clustalw)?
<s:checkbox name="output_format_" onclick="resolveParameters()"/>
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
<A name=dna_params><h2><A HREF="javascript:help.slidedownandjump('#dna_params_comment')">Set DNA Parameters</A></H2>
Gap Open Penalty (-go, recommended = 4.0)
<font color="red" size="3">+</font>
<s:textfield name="gapopenn_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap Extension Penalty (-ge, recommended = 0.25)
<font color="red" size="3">+</font>
<s:textfield name="gapextn_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Temperature for Nucleic Acid (-T, recommended = 1.0)
<font color="red" size="3">+</font>
<s:textfield name="temp_na_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=prot_params><h2><A HREF="javascript:help.slidedownandjump('#prot_params_comment')">Set Protein Parameters</A></H2>
Protein Gap Open Penalty (-go, recommended = 22)
<font color="red" size="3">+</font>
<s:textfield name="gapopenp_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap Extension Penalty (-ge, recommended = 1)
<font color="red" size="3">+</font>
<s:textfield name="gapextp_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Temperature for Amino Acids (-T, recommended = 5)
<font color="red" size="3">+</font>
<s:textfield name="temp_aa_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=dna_params_comment><i><b>Set DNA Parameters</b></i></a></dt>
<br></br>
<dt><a name=prot_params_comment><i><b>Set Protein Parameters</b></i></a></dt>
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
// alignment_order
// scoring_matrix
// output_format
// gapopenn
if (getValue('scoring_matrix_')=="nuc_simple")
enable('gapopenn_');
else disable('gapopenn_');
// gapextn
if (getValue('scoring_matrix_')=="nuc_simple")
enable('gapextn_');
else disable('gapextn_');
// temp_na
if (getValue('scoring_matrix_')=="nuc_simple")
enable('temp_na_');
else disable('temp_na_');
// gapopenp
if (getValue('scoring_matrix_')=="gonnet_160")
enable('gapopenp_');
else disable('gapopenp_');
// gapextp
if (getValue('scoring_matrix_')=="gonnet_160")
enable('gapextp_');
else disable('gapextp_');
// temp_aa
if (getValue('scoring_matrix_')=="gonnet_160")
enable('temp_aa_');
else disable('temp_aa_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// alignment_order
// scoring_matrix
// output_format
// gapopenn
if (getValue('scoring_matrix_')=="nuc_simple") {
if (! getValue('gapopenn_')) {
alert('Please enter a value for Gap Open penalty (recommended = 4)');
return false;
}
}
if (getValue('scoring_matrix_')=="nuc_simple") {
if (getValue('gapopenn_') < 0) {
alert('Gap Open penalty must be positive');
return false;
}
}
// gapextn
if (getValue('scoring_matrix_')=="nuc_simple") {
if (! getValue('gapextn_')) {
alert('Please enter a value for Gap extension penalty (recommended = 0.25)');
return false;
}
}
if (getValue('scoring_matrix_')=="nuc_simple") {
if (getValue('gapextn_') < 0) {
alert('Gap extension penalty should be positive');
return false;
}
}
// temp_na
if (getValue('scoring_matrix_')=="nuc_simple") {
if (! getValue('temp_na_')) {
alert('Please enter a value for Temperature (recommended = 1)');
return false;
}
}
if (getValue('scoring_matrix_')=="nuc_simple") {
if (getValue('temp_na_') < 0) {
alert('Temperature value should be positive');
return false;
}
}
// gapopenp
if (getValue('scoring_matrix_')=="gonnet_160") {
if (! getValue('gapopenp_')) {
alert('Please enter a value for Gap Open penalty (recommended = 22)');
return false;
}
}
if (getValue('scoring_matrix_')=="gonnet_160") {
if (getValue('gapopenp_') < 0) {
alert('Gap Open penalty must be positive');
return false;
}
}
// gapextp
if (getValue('scoring_matrix_')=="gonnet_160") {
if (! getValue('gapextp_')) {
alert('Please enter a value for Gap extension penalty (recommended = 1)');
return false;
}
}
if (getValue('scoring_matrix_')=="gonnet_160") {
if (getValue('gapextp_') < 0) {
alert('Gap extension penalty should be positive');
return false;
}
}
// temp_aa
if (getValue('scoring_matrix_')=="gonnet_160") {
if (! getValue('temp_aa_')) {
alert('Please enter a value for Temperature (recommended = 5)');
return false;
}
}
if (getValue('scoring_matrix_')=="gonnet_160") {
if (getValue('temp_aa_') < 0) {
alert('Temperature value should be positive');
return false;
}
}
return issueWarning();
}
function issueWarning() {
// runtime
// alignment_order
// scoring_matrix
// output_format
// gapopenn
// gapextn
// temp_na
// gapopenp
// gapextp
// temp_aa
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
var element = document.forms['probalign'].elements[parameter];
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
var element = document.forms['probalign'].elements[parameter];
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
var element = document.forms['probalign'].elements[parameter];
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