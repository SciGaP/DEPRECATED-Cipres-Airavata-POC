<%@ taglib prefix="s" uri="/struts-tags" %>
<title>POY Scripting</title>
<h2>POY Scripting: Phylogenetic tree inference using dynamic homologies. (<a href="#REFERENCE">Andres Varon, Le Sy Vinh, Illya Bomash, and Ward Wheeler</a>)</h2>
<s:form action="poy2" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Input File
<s:select name="infile2_" headerKey='' headerValue='' list="%{ getDataForParameter('infile2_')}" onchange="resolveParameters()"/>
<br/>
Input File
<s:select name="infile3_" headerKey='' headerValue='' list="%{ getDataForParameter('infile3_')}" onchange="resolveParameters()"/>
<br/>
Input File
<s:select name="infile4_" headerKey='' headerValue='' list="%{ getDataForParameter('infile4_')}" onchange="resolveParameters()"/>
<br/>
Input File
<s:select name="infile5_" headerKey='' headerValue='' list="%{ getDataForParameter('infile5_')}" onchange="resolveParameters()"/>
<br/>
Input File
<s:select name="infile6_" headerKey='' headerValue='' list="%{ getDataForParameter('infile6_')}" onchange="resolveParameters()"/>
<br/>
Substitution cost
<font color="red" size="3">*</font>
<s:textfield name="substitutions_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Individual insertion and deletion cost
<font color="red" size="3">*</font>
<s:textfield name="indels_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap opening cost
<font color="red" size="3">*</font>
<s:textfield name="gapopening_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Outgroup
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#terminalsfile')">Terminals file</A>
<s:select name="terminalsfile_" headerKey='' headerValue='' list="%{ getDataForParameter('terminalsfile_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#synonyms')">Synonyms file</A>
<s:select name="synonyms_" headerKey='' headerValue='' list="%{ getDataForParameter('synonyms_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#constraint')">Constraint tree</A>
<s:select name="constraint_" headerKey='' headerValue='' list="%{ getDataForParameter('constraint_')}" onchange="resolveParameters()"/>
<br/>
Random seed for the program initialization.
<s:textfield name="randomseed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=supportparagraph><h2><A HREF="javascript:help.slidedownandjump('#supportparagraph_comment')">Support calculation (require input tree)</A></H2>
Support calculation (requires a tree in one of the
input files)
<font color="red" size="3">*</font>
<s:radio name="support_"
list="#{ 'bremer':'bremer' , 'jackknife':'jackknife' , 'bootstrap':'bootstrap' }" onclick="resolveParameters()"/>
<br/>
Number of pseudoreplicates for bootstrap and jakknife
<s:textfield name="pseudoreplicates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Percentage of characters to be removed per
pseudoreplicate during jackknife
<s:textfield name="remove_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=infile1><i>Scripting File</i></a></dt>
<dd>
Try adding the scripting file here
</dd>
<dt><a name=terminalsfile><i>Terminals file</i></a></dt>
<dd>
File containing the list of terminals appearing in
the input files that should be included in the analysis.
One terminal per line.
</dd>
<dt><a name=synonyms><i>Synonyms file</i></a></dt>
<dd>
A synonyms file is useful to quickly map names of
terminals that are different in various files to a
unique name, or to the name that the user wants for
publication.
</dd><dd>
For example, each input file could be a FASTA format
with the Genbank accession number as terminal name. In
this way, a Chicken with 3 genes in the data set could
appear as AF1 in File1, BC2 in File2, and CX3 in File3,
while the corresponding Human genes appear as XB1, YR4,
and ZE3.
To recognize them all as Chicken, and Human genes, it is
sufficient to provide a synonym file with the following
2 lines:
</dd><dd>
Chicken AF1 BC2 CX3
</dd><dd>
Human XB1 YR4 ZE3
</dd><dd>
There should be one line for each set of terminals in
the input file that should be synonyms of a single
resulting terminal.
</dd>
<dt><a name=constraint><i>Constraint tree</i></a></dt>
<dd>
A constraint file contains a tree with all the terminals
contained in the input files (or the terminals file if
it is selected), that POY should respect during the
search. That is, all the binary trees that POY evaluate
must be resolutions of the polytomies defined in the
constraint file. The file format could be any of the
tree formats read by POY (e.g. newick).
</dd><dd>
For example, if the file contains (A B C (D E)) then the
trees (A (B (C (D E)))), ((A (B C)) (D E)) would be
alowed during the search, but ((A D) ((B C) E)) as D and
E are not sister terminals.
</dd>
<br></br>
<dt><a name=supportparagraph_comment><i><b>Support calculation (require input tree)</b></i></a></dt>
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
// infile2
// infile3
// infile4
// infile5
// infile6
// substitutions
// indels
// gapopening
// terminalsfile
// synonyms
// outgroup
// constraint
// randomseed
// support
// pseudoreplicates
if (getValue('support_')=="jackknife" || getValue('support_')=="bootstrap" )
enable('pseudoreplicates_');
else disable('pseudoreplicates_');
// remove
if (getValue('support_')=="jackknife" )
enable('remove_');
else disable('remove_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// infile2
// infile3
// infile4
// infile5
// infile6
// substitutions
// indels
// gapopening
// terminalsfile
// synonyms
// outgroup
// constraint
// randomseed
// support
// pseudoreplicates
// remove
return issueWarning();
}
function issueWarning() {
// runtime
// infile2
// infile3
// infile4
// infile5
// infile6
// substitutions
// indels
// gapopening
// terminalsfile
// synonyms
// outgroup
// constraint
// randomseed
// support
// pseudoreplicates
// remove
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
var element = document.forms['poy2'].elements[parameter];
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
var element = document.forms['poy2'].elements[parameter];
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
var element = document.forms['poy2'].elements[parameter];
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