<%@ taglib prefix="s" uri="/struts-tags" %>
<title>NCLconverter</title>
<h2>NCLconverter: A file format transformation tool (<a href="#REFERENCE">Paul Lewis, Mark Holder, Brian O'Meara</a>)</h2>
<s:form action="nclconverter" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#format_type')">Choose the Input Format</A>
<font color="red" size="3">*</font>
<s:select name="format_type_" list="#{ 'nexus':'Nexus' , 'fasta':'Fasta' , 'phylip':'Phylip' , 'phylipt':'Phylip Tree (.tre, .dnd)' , 'clustal':'Clustal (.aln)' , 'nexml':'NEXML' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#data_type')">Specify the Data Type (Mixed data types are not supported)</A>
<font color="red" size="3">*</font>
<s:select name="data_type_" list="#{ 'dna':'DNA' , 'rna':'RNA' , 'protein':'Protein' , 'discrete':'Discrete' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#relaxed_type')">My data is in a relaxed Phylip format</A>
<font color="red" size="3">*</font>
<s:checkbox name="relaxed_type_" onclick="resolveParameters()"/>
<br/>
My data is interleaved
<font color="red" size="3">*</font>
<s:checkbox name="interleaved_type_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nexus_strictness')">Set the NEXUS strictness level (-s)</A>
<font color="red" size="3">*</font>
<s:textfield name="nexus_strictness_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#output_type')">Choose the Output format (* values could produce multiple output files)</A>
<font color="red" size="3">*</font>
<s:select name="output_type_" list="#{ '-enexus':'Normalized NEXUS' , '-efasta':'Fasta*' , '-ephylip':'Phylip*' , '-erelaxedphylip':'Relaxed Phylip' , '-enexml':'NEXML' }" onchange="resolveParameters()"/>
<br/>
<br/>
Please enter a prefix for your output file (default is "out")
<s:textfield name="outfile_nexus_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=format_type><i>Choose the Input Format</i></a></dt>
<dd> Clustal files must begin with the text Clustal on the first line. If you create .aln files using other programs,
you may need to edit them manually, or (as with Muscle) you might be able to use a command line option to print Clustal on the first line. Depending on its composition,
the input may be converted to multiple output files. This is because NEXUS can have multiple characters blocks; NCLconverter
currently writes each one to a separate file in the chosen format.
</dd>
<dt><a name=data_type><i>Specify the Data Type (Mixed data types are not supported)</i></a></dt>
<dd>
</dd>
<dt><a name=relaxed_type><i>My data is in a relaxed Phylip format</i></a></dt>
<dd>Relaxed Phylip format is used by progams such as RAxML. It differs from strict Phlylip in allowing taxon names more than 10 characters long.</dd>
<dt><a name=nexus_strictness><i>Set the NEXUS strictness level (-s)</i></a></dt>
<dd>The default level is 2. Invoking the program with 3 or a higher number will convert some warnings into fatal errors. Running with 1 will cause the parser to accept dangerous constructs, and running with 0 will cause the parser make every attempt to finish parsing the file (warning about very serious errors). Note that when 0 strictness level is used, and the parser fails to finish, it is often the result of an earlier error that occurred prior to the error reported in the last message.</dd>
<dt><a name=output_type><i>Choose the Output format (* values could produce multiple output files)</i></a></dt>
<dd>WE MAY HAVE TO MODIFY YOUR TAXON NAMES TO SATISFY THE FORMAT REQUIREMENTS! If taxon names had to be translated, then a NameTranslationFile (in a somewhat ad-hoc xml format) will also be produced. This file shows how the names are remapped. A back-translation service is planned. Mixed data are not supported for NEXML output.</dd>
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
// format_type
// data_type
if (getValue('format_type_')=="fasta" || getValue('format_type_')=="clustal" || getValue('format_type_')=="phylip" || getValue('format_type_')=="rphylip" )
enable('data_type_');
else disable('data_type_');
// relaxed_type
if (getValue('format_type_')=="phylip")
enable('relaxed_type_');
else disable('relaxed_type_');
// interleaved_type
if (getValue('format_type_')=="phylip")
enable('interleaved_type_');
else disable('interleaved_type_');
// nexus_strictness
if (getValue('format_type_')=="nexus")
enable('nexus_strictness_');
else disable('nexus_strictness_');
// output_type
// outfile_nexus
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// format_type
// data_type
if (getValue('format_type_')=="fasta" || getValue('format_type_')=="clustal" || getValue('format_type_')=="phylip" || getValue('format_type_')=="rphylip" ) {
if (getValue('data_type_')=="discrete" & getValue('format_type_')=="clustal" ) {
alert('Sorry, Clustal format does not use discrete characters');
return false;
}
}
if (getValue('format_type_')=="fasta" || getValue('format_type_')=="clustal" || getValue('format_type_')=="phylip" || getValue('format_type_')=="rphylip" ) {
if (getValue('data_type_')=="discrete" & getValue('format_type_')=="fasta" ) {
alert('Sorry, Fasta format does not use discrete characters');
return false;
}
}
// relaxed_type
// interleaved_type
// nexus_strictness
// output_type
// outfile_nexus
return issueWarning();
}
function issueWarning() {
// runtime
// format_type
// data_type
// relaxed_type
// interleaved_type
// nexus_strictness
// output_type
// outfile_nexus
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
var element = document.forms['nclconverter'].elements[parameter];
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
var element = document.forms['nclconverter'].elements[parameter];
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
var element = document.forms['nclconverter'].elements[parameter];
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