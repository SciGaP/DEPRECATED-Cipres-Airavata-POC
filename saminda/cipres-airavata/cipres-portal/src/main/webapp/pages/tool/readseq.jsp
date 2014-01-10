<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Readseq</title>
<h2>Readseq: Readseq: biological sequence format interconversion utility (<a href="#REFERENCE">Don Gilbert</a>)</h2>
<s:form action="readseq" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#input_type')">Choose the Input Format</A>
<font color="red" size="3">*</font>
<s:select name="input_type_" list="#{ '8':'FASTA' , '22':'Clustal' , '12':'Phylip' , '17':'NEXUS' , '15':'MSF' , '5':'GCG' , '13':'Plain/Raw' , '11':'Phylip 3.2' , '6':'DNA Strider' , '14':'PIR | CODATA' , '20':'BLAST' , '21':'SCF' , '23':'FlatFeat' , '24':'GFF' , '25':'ACEDB' , '1':'IG|Stanford' , '2':'GenBank' , '3':'NBRF' , '4':'EMBL' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#output_type')">Choose the Output format</A>
<font color="red" size="3">*</font>
<s:select name="output_type_" list="#{ '8':'FASTA' , '22':'Clustal' , '12':'Phylip' , '17':'NEXUS' , '15':'MSF' , '5':'GCG' , '13':'Plain/Raw' , '11':'Phylip 3.2' , '6':'DNA Strider' , '14':'PIR | CODATA' , '18':'Pretty' , '23':'FlatFeat' , '24':'GFF' , '25':'ACEDB' , '1':'IG|Stanford' , '2':'GenBank' , '3':'NBRF' , '4':'EMBL' }" onchange="resolveParameters()"/>
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
Sequence Line Width
<s:textfield name="pretty_seqwidth_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Left Indent
<s:textfield name="pretty_leftindent_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Column space within sequence line on output
<s:textfield name="pretty_colspace_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Count gap characters in sequence width
<s:checkbox name="pretty_countgap_" onclick="resolveParameters()"/>
<br/>
Put sequence name on right
<s:checkbox name="pretty_nameright_" onclick="resolveParameters()"/>
<br/>
Put index on right
<s:checkbox name="pretty_indexright_" onclick="resolveParameters()"/>
<br/>
How many lines between blocks
<s:textfield name="pretty_interlinet_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=sequence><i>Entry sequence file:</i></a></dt>
<dd></dd>
<dt><a name=input_type><i>Choose the Input Format</i></a></dt>
<dd></dd>
<dt><a name=output_type><i>Choose the Output format</i></a></dt>
<dd></dd>
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
// input_type
// output_type
// pretty_seqwidth
if (getValue('output_type_')=="18")
enable('pretty_seqwidth_');
else disable('pretty_seqwidth_');
// pretty_leftindent
if (getValue('output_type_')=="18")
enable('pretty_leftindent_');
else disable('pretty_leftindent_');
// pretty_colspace
if (getValue('output_type_')=="18")
enable('pretty_colspace_');
else disable('pretty_colspace_');
// pretty_countgap
if (getValue('output_type_')=="18")
enable('pretty_countgap_');
else disable('pretty_countgap_');
// pretty_nameright
if (getValue('output_type_')=="18")
enable('pretty_nameright_');
else disable('pretty_nameright_');
// pretty_indexright
if (getValue('output_type_')=="18")
enable('pretty_indexright_');
else disable('pretty_indexright_');
// pretty_interlinet
if (getValue('output_type_')=="18")
enable('pretty_interlinet_');
else disable('pretty_interlinet_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// input_type
// output_type
// pretty_seqwidth
// pretty_leftindent
// pretty_colspace
// pretty_countgap
// pretty_nameright
// pretty_indexright
// pretty_interlinet
return issueWarning();
}
function issueWarning() {
// runtime
// input_type
// output_type
// pretty_seqwidth
// pretty_leftindent
// pretty_colspace
// pretty_countgap
// pretty_nameright
// pretty_indexright
// pretty_interlinet
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
var element = document.forms['readseq'].elements[parameter];
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
var element = document.forms['readseq'].elements[parameter];
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
var element = document.forms['readseq'].elements[parameter];
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