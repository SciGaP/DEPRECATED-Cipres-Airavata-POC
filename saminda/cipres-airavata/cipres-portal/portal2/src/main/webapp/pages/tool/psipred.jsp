<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PSIPRED</title>
<h2>PSIPRED: Predict Secondary Structure (PSIPRED) </h2>
<s:form action="psipred" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#filter_iterations')">Number of Filter Iterations</A>
<s:textfield name="filter_iterations_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#helix')">Helix Constant</A>
<s:textfield name="helix_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Strand Constant
<s:textfield name="strand_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=sequence><i>Input sequence (single letter code)</i></a></dt>
<dd>AMINO ACID sequence</dd><dd>Input Sequence: This tool only accepts protein sequences.
Note that there is an upper limit to the length of sequences which can be submitted.
For mGenTHREADER that limit is 1000 residues. For the other methods, the limit is 1500 residues.
If your sequence is longer than this, try breaking it into likely domains before submitting it. </dd><dd>The current DB that is being used with PSIBLAST is UNIPROT</dd>
<dt><a name=filter_iterations><i>Number of Filter Iterations</i></a></dt>
<dd>Number of filter iterations: This controls the amount of "smoothing" that is carried out on the final
prediction. The recommended setting is 1, but it may be worth trying
higher values to increase the level of smoothing.</dd>
<dt><a name=helix><i>Helix Constant</i></a></dt>
<dd>Helix/Strand Decision constants control the bias for helix (Arg3) and strand (Arg4) predictions.
Normally these are set to 1.0 which applies no helix or strand bias. However, sometimes bias parameters can be useful.
FOr examples, if you know your protein is mostly comprised of beta strands, you can increase the bias
towards beta strand prediction.
Chpoosing the calues helix=1.0; strand=1.5 increases the bias towards beta strand prediction by 50%.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// filter_iterations
// helix
// strand
}
function validateControl() {
// filter_iterations
if (getValue('filter_iterations_') < 0) {
alert('Positive Integer is required for Number of Filter Iterations');
return false;
}
// helix
// strand
return issueWarning();
}
function issueWarning() {
// filter_iterations
// helix
// strand
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
var element = document.forms['psipred'].elements[parameter];
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
var element = document.forms['psipred'].elements[parameter];
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
var element = document.forms['psipred'].elements[parameter];
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