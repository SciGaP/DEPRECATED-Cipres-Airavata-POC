<%@ taglib prefix="s" uri="/struts-tags" %>
<title>COMPASS</title>
<h2>COMPASS: A Tool for Comparison of Multiple Protein Sequence Alignments (<a href="#REFERENCE">R. I. Sadreyev (sadreyev@chop.swmed.edu)</a>)</h2>
<s:form action="compass" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Second Alignment File (-j)
<font color="red" size="3">*</font>
<s:select name="alignment_number_two_" headerKey='' headerValue='' list="%{ getDataForParameter('alignment_number_two_')}" onchange="resolveParameters()"/>
<br/>
Threshold of gap content to disregard 'gapped' columns (0.0 to 1.0)
<s:textfield name="gap_threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Threshold of gap content for marking 'moderately gapped' regions, where penalty for the 1st gap opening is waived (0.0 to 1.0)
<s:textfield name="gap_threshold_moderate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Penalty for gap opening (-O)
<s:textfield name="gap_opening_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Penalty for gap extension (-E)
<s:textfield name="gap_extension_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ungapped_lambda')"> Ungapped lambda for a standard sequence-sequence scoring system (-L)</A>
<s:textfield name="ungapped_lambda_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#expect_positional')">Expected value of individual positional scores for a standard sequence-sequence scoring system (-x)</A>
<s:textfield name="expect_positional_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#database_length')">Database length (-z)</A>
<s:textfield name="database_length_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=output_opts><h2><A HREF="javascript:help.slidedownandjump('#output_opts_comment')">Output Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#alignment_length')">Length of alignment chunks to print out in lines (-b)</A>
<s:textfield name="alignment_length_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of sequences to print out in each of the aligned alignments (-n)
<s:textfield name="number_sequences_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=ungapped_lambda><i> Ungapped lambda for a standard sequence-sequence scoring system (-L)</i></a></dt>
<dd>Ungapped lambda for a standard sequence-sequence scoring system used in the score rescaling for profile-profile comparison
Default = 0.3176 (ungapped lambda for BLOSUM62) </dd>
<dt><a name=expect_positional><i>Expected value of individual positional scores for a standard sequence-sequence scoring system (-x)</i></a></dt>
<dd>Ungapped lambda for a standard sequence-sequence scoring system used in the score rescaling for profile-profile comparison
Default = 0.3176 (ungapped lambda for BLOSUM62) </dd>
<dt><a name=database_length><i>Database length (-z)</i></a></dt>
<dd>Database length (including only columns with gap content lower than the threshold (-g)) used for Evalue calculation: Default = length of alignment 2</dd>
<br></br>
<dt><a name=output_opts_comment><i><b>Output Options</b></i></a></dt>
<dt><a name=alignment_length><i>Length of alignment chunks to print out in lines (-b)</i></a></dt>
<dd>Database length (including only columns with gap content lower than the threshold (-g)) used for Evalue calculation: Default = length of alignment 2</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// alignment_number_two
// gap_threshold
// gap_threshold_moderate
// gap_opening
// gap_extension
// ungapped_lambda
// expect_positional
// database_length
// alignment_length
// number_sequences
}
function validateControl() {
// alignment_number_two
// gap_threshold
// gap_threshold_moderate
// gap_opening
// gap_extension
// ungapped_lambda
// expect_positional
// database_length
// alignment_length
// number_sequences
return issueWarning();
}
function issueWarning() {
// alignment_number_two
// gap_threshold
// gap_threshold_moderate
// gap_opening
// gap_extension
// ungapped_lambda
// expect_positional
// database_length
// alignment_length
// number_sequences
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
var element = document.forms['compass'].elements[parameter];
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
var element = document.forms['compass'].elements[parameter];
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
var element = document.forms['compass'].elements[parameter];
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