<%@ taglib prefix="s" uri="/struts-tags" %>
<title>FingerPRINTScan</title>
<h2>FingerPRINTScan: Search PRINTS DB for motifs similar to PS (<a href="#REFERENCE">Phil Scordis</a>)</h2>
<s:form action="fingerprintscan" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
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
<A HREF="javascript:help.slidedownandjump('#motif')">Percentage allowed distance deviation between motifs (-d)</A>
<s:textfield name="motif_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#threshold')">E-value threshold (-e)</A>
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=Output><h2><A HREF="javascript:help.slidedownandjump('#Output_comment')">Output Options</A></H2>
Set options to produce output compatable with the GRAPHScan program (-G)
<s:checkbox name="graph_scan_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#number_bits')">A decimal number corresponding to the type of output
required (-o)
</A>
<s:textfield name="number_bits_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Select the random shuffle option (which shuffles all sequences) (-s)
<s:checkbox name="random_shuffle_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#profile_score')">Specify the Profile score threshold (-t)</A>
<s:textfield name="profile_score_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_value')">Specify the P-value score threshold (-x)</A>
<s:textfield name="p_value_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=sequence><i>Entry sequence file:</i></a></dt>
<dd>The input sequence file is in fasta format</dd>
<dt><a name=motif><i>Percentage allowed distance deviation between motifs (-d)</i></a></dt>
<dd> Percentage allowed distance deviation between motifs.
where the numerical value is a number between 0 - 100
(0 is a special case which turns off distance checking)</dd>
<dt><a name=threshold><i>E-value threshold (-e)</i></a></dt>
<dd>E-value threshold (-e) where value is a floating point number</dd>
<br></br>
<dt><a name=Output_comment><i><b>Output Options</b></i></a></dt>
<dt><a name=number_bits><i>A decimal number corresponding to the type of output
required (-o)
</i></a></dt>
<dd>
The input is a decimal number corresponding to the type of output
required. The number corresponds to the number of bits turned on
in the following matrix:
TableNo 4 3 2 1
BitValue 1 2 4 8
Eg. 0 0 1 1 = 4+8 = 12, which will switch on
tables 1 and 2 in the output
Table 1 = shortest description of the results, only the
top scoring hits
Table 2 = medium description of the results, the ten
top scoring hits detailed by fingerprint
Table 3 = most detailed description of the results,
the ten top scoring hits, detailed by
individual motif
Table 4 = experimental alignment of the sequence and the
consensus sequence of the motif.
(-a flag needs to be on too)
</dd>
<dt><a name=profile_score><i>Specify the Profile score threshold (-t)</i></a></dt>
<dd>Specify the Profile score threshold. This is a positive integer (default= 15)</dd>
<dt><a name=p_value><i>Specify the P-value score threshold (-x)</i></a></dt>
<dd>Specify the P-value score threshold
(where this value is a positive integer representing the negative power to which 1 is raised)</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// motif
// threshold
// graph_scan
// number_bits
// random_shuffle
// profile_score
// p_value
}
function validateControl() {
// motif
if (getValue('motif_') > 100) {
alert('percentage must be less than 100');
return false;
}
if (getValue('motif_') < 0) {
alert('percentage must be more than 0');
return false;
}
// threshold
// graph_scan
// number_bits
// random_shuffle
// profile_score
if (getValue('profile_score_') < 0) {
alert('Positive Integer is required for Profile Score');
return false;
}
// p_value
if (getValue('p_value_') < 0) {
alert('Positive Integer is required for P-value score threshold');
return false;
}
return issueWarning();
}
function issueWarning() {
// motif
// threshold
// graph_scan
// number_bits
// random_shuffle
// profile_score
// p_value
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
var element = document.forms['fingerprintscan'].elements[parameter];
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
var element = document.forms['fingerprintscan'].elements[parameter];
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
var element = document.forms['fingerprintscan'].elements[parameter];
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