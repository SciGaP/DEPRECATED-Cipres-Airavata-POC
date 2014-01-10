<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Format Validator</title>
<h2>Format Validator: Format Validation Tool (<a href="#REFERENCE">Paul Lewis and Mark Holder</a>)</h2>
<s:form action="formatvalidator" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setnexusformat')">Specify the input file format to validate (-f)</A>
<font color="red" size="3">*</font>
<s:select name="setnexusformat_" list="#{ '-fnexus':'Nexus' , '-faafasta':'Amino Acid Fasta' , '-fdnafasta':'DNA Fasta' , '-frnafasta':'RNA Fasta' , '-fdnaphylip':'DNA Phylip' , '-frnaphylip':'RNA Phylip' , '-faaphylip':'Amino Acid Phylip' , '-fdiscretephylip':'DIscrete Phylip' , '-fdnaphylipinterleaved':'DNA Phylip Interleaved' , '-frnaphylipinterleaved':'RNA Phylip Interleaved' , '-faaphylipinterleaved':'Amino Acid Phylip Interleaved' , '-fdiscretephylipinterleaved':'Discrete Phylip Interleaved' , '-fdnarelaxedphylip':'DNA Relaxed Interleaved' , '-frnarelaxedphylip':'RNA Releaxed Interleaved' , '-faarelaxedphylip':'Amino Acid Interleaved' , '-fdiscreterelaxedphylip':'Discrete Releaxed Phylip' , '-fdnarelaxedphylipinterleaved':'DNA Relaxed Phylip Interleaved' , '-frnarelaxedphylipinterleaved':'RNA Relaxed Phylip Interleaved' , '-faarelaxedphylipinterleaved':'Amino Acid Phylip Interleaved' , '-fdiscreterelaxedphylipinterleaved':'DIscrete Relaxed Phylip Interleaved' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setnexuscontrol')">NEXUS strictness level (-s)</A>
<font color="red" size="3">*</font>
<s:select name="setnexuscontrol_" list="#{ '-s0':'0' , '-s1':'1' , '-s2':'2' , '-s3':'3' , '-s4':'4' }" onchange="resolveParameters()"/>
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
<dd>
Estimate the maximum time your job will need to run (up to 72 hrs). Your job will be killed if it doesn't finish within the time you specify, however jobs with shorter maximum run times are often scheduled sooner than longer jobs.
</dd>
<dt><a name=setnexusformat><i>Specify the input file format to validate (-f)</i></a></dt>
<dd>-f specifies the input file format expected:
The complete list of format names is:
nexus; fasta (dna, rna, amino acid); phylip (dna, rna, amino acid, character), interleaved or not; relaxed or not. A success mesage looks like this:
[Reading infile.nex ]
Executing storing implied block:
TAXA storing read block:
DATA</dd>
<dt><a name=setnexuscontrol><i>NEXUS strictness level (-s)</i></a></dt>
<dd>NEXUS strictness level (-s) is the default level is equivalent to -s2 invoking the program with -s3 or a higher number will convert some warnings into fatal errors. Running with -s1 will cause the parser to accept dangerous constructs, and running with -s0 will cause the parser make every attempt to finish parsing the file (warning about very serious errors). Note that when -s0 strictness level is used, and the parser fails to finish, it will often be the result of an earlier error than the error that is reported in the last message</dd>
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
// setnexusformat
// setnexuscontrol
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// setnexusformat
// setnexuscontrol
return issueWarning();
}
function issueWarning() {
// runtime
// setnexusformat
// setnexuscontrol
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
var element = document.forms['formatvalidator'].elements[parameter];
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
var element = document.forms['formatvalidator'].elements[parameter];
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
var element = document.forms['formatvalidator'].elements[parameter];
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