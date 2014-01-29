<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MBSUM</title>
<h2>MBSUM: Prepare MrBayes .t files for BUCKy (<a href="#REFERENCE">C. Ané, B. Larget, D.A. Baum, S.D. Smith, A. Rokas</a>)</h2>
<s:form action="mbsum" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#skipped_lines')">Specify lines of trees to skip, aka burn-in value (-n)</A>
<s:textfield name="skipped_lines_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#num_files')">How many files do you wish to combine?</A>
<s:textfield name="num_files_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Second Input file for mbsum
<s:select name="mb_infile2_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile2_')}" onchange="resolveParameters()"/>
<br/>
Third Input file for mbsum
<s:select name="mb_infile3_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile3_')}" onchange="resolveParameters()"/>
<br/>
Fourth Input file for mbsum
<s:select name="mb_infile4_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile4_')}" onchange="resolveParameters()"/>
<br/>
Fifth Input file for mbsum
<s:select name="mb_infile5_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile5_')}" onchange="resolveParameters()"/>
<br/>
Sixth Input file for mbsum
<s:select name="mb_infile6_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile6_')}" onchange="resolveParameters()"/>
<br/>
Seventh Input file for mbsum
<s:select name="mb_infile7_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile7_')}" onchange="resolveParameters()"/>
<br/>
Eighth Input file for mbsum
<s:select name="mb_infile8_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile8_')}" onchange="resolveParameters()"/>
<br/>
Ninth Input file for mbsum
<s:select name="mb_infile9_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile9_')}" onchange="resolveParameters()"/>
<br/>
Tenth Input file for mbsum
<s:select name="mb_infile10_" headerKey='' headerValue='' list="%{ getDataForParameter('mb_infile10_')}" onchange="resolveParameters()"/>
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
<dt><a name=skipped_lines><i>Specify lines of trees to skip, aka burn-in value (-n)</i></a></dt>
<dd>The -n parameter allows the user to skip lines of trees before actually starting the tally tree topologies.
The default is 0, i.e no tree is skipped. The same number of trees will be skipped in each input file</dd>
<dt><a name=num_files><i>How many files do you wish to combine?</i></a></dt>
<dd>Use mbsum to summarize all files from the same locus. You want mbsum to create a file .in
for each locus. The extension .in just means input (for later analysis by bucky). Output files *.in from mbsum will typically look like the following,
containing a list of tree topologies and a tally representing the trees' posterior probabilities from a given locus (as obtained in the frst step of BCA). </dd>
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
// skipped_lines
// num_files
// mb_infile2
if (getValue('num_files_') > 1)
enable('mb_infile2_');
else disable('mb_infile2_');
// mb_infile3
if (getValue('num_files_') > 2)
enable('mb_infile3_');
else disable('mb_infile3_');
// mb_infile4
if (getValue('num_files_') > 3)
enable('mb_infile4_');
else disable('mb_infile4_');
// mb_infile5
if (getValue('num_files_') > 4)
enable('mb_infile5_');
else disable('mb_infile5_');
// mb_infile6
if (getValue('num_files_') > 5)
enable('mb_infile6_');
else disable('mb_infile6_');
// mb_infile7
if (getValue('num_files_') > 6)
enable('mb_infile7_');
else disable('mb_infile7_');
// mb_infile8
if (getValue('num_files_') > 7)
enable('mb_infile8_');
else disable('mb_infile8_');
// mb_infile9
if (getValue('num_files_') > 8)
enable('mb_infile9_');
else disable('mb_infile9_');
// mb_infile10
if (getValue('num_files_') > 9)
enable('mb_infile10_');
else disable('mb_infile10_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// skipped_lines
// num_files
if (getValue('num_files_') < 1) {
alert('Sorry, you must chose between 1 and 10 files for analysis');
return false;
}
if (getValue('num_files_') > 10) {
alert('Sorry, you cannot select more than 10 files for analysis');
return false;
}
// mb_infile2
// mb_infile3
// mb_infile4
// mb_infile5
// mb_infile6
// mb_infile7
// mb_infile8
// mb_infile9
// mb_infile10
return issueWarning();
}
function issueWarning() {
// runtime
// skipped_lines
// num_files
// mb_infile2
// mb_infile3
// mb_infile4
// mb_infile5
// mb_infile6
// mb_infile7
// mb_infile8
// mb_infile9
// mb_infile10
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
var element = document.forms['mbsum'].elements[parameter];
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
var element = document.forms['mbsum'].elements[parameter];
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
var element = document.forms['mbsum'].elements[parameter];
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