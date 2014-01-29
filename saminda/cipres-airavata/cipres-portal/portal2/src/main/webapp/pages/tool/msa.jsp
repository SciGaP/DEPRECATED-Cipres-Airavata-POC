<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MSA</title>
<h2>MSA: Multiple Sequence Alignment of NS and PS (<a href="#REFERENCE">S. F. Altschul</a>)</h2>
<s:form action="msa" theme="simple">
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
<hr/>
<A name=control><h2><A HREF="javascript:help.slidedownandjump('#control_comment')">Control parameters</A></H2>
Turns off the optimal multiple alignment
<s:checkbox name="optimal_" onclick="resolveParameters()"/>
<br/>
forced aligned residues file (see the documentation)
<s:select name="forcedres_" headerKey='' headerValue='' list="%{ getDataForParameter('forcedres_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=Cost><h2><A HREF="javascript:help.slidedownandjump('#Cost_comment')">Cost parameters</A></H2>
charges terminal gaps the same as internal gaps
<s:checkbox name="endgap_" onclick="resolveParameters()"/>
<br/>
cost = unweighted sum
<s:checkbox name="unweight_" onclick="resolveParameters()"/>
<br/>
maximum score of an optimal multiple alignment
<s:textfield name="maxscore_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Epsilons file (see the documentation)
<s:select name="epsilons_" headerKey='' headerValue='' list="%{ getDataForParameter('epsilons_')}" onchange="resolveParameters()"/>
<br/>
Costs file (see the documentation)
<s:select name="costs_" headerKey='' headerValue='' list="%{ getDataForParameter('costs_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output parameters</A></H2>
suppress verbose output
<s:checkbox name="quiet_" onclick="resolveParameters()"/>
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
<br></br>
<dt><a name=control_comment><i><b>Control parameters</b></i></a></dt>
<br></br>
<dt><a name=Cost_comment><i><b>Cost parameters</b></i></a></dt>
<br></br>
<dt><a name=output_comment><i><b>Output parameters</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// optimal
// forcedres
// endgap
// unweight
// maxscore
// epsilons
// costs
// quiet
}
function validateControl() {
// optimal
// forcedres
// endgap
// unweight
// maxscore
// epsilons
// costs
// quiet
return issueWarning();
}
function issueWarning() {
// optimal
// forcedres
// endgap
// unweight
// maxscore
// epsilons
// costs
// quiet
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
var element = document.forms['msa'].elements[parameter];
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
var element = document.forms['msa'].elements[parameter];
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
var element = document.forms['msa'].elements[parameter];
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