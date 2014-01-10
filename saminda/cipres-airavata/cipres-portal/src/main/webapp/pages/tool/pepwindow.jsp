<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Pepwindow</title>
<h2>Pepwindow: Displays hydropathy of a PS </h2>
<s:form action="pepwindow" theme="simple">
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
<A name=input><h2><A HREF="javascript:help.slidedownandjump('#input_comment')">Input section</A></H2>
<hr/>
<A name=advanced><h2><A HREF="javascript:help.slidedownandjump('#advanced_comment')">Advanced section</A></H2>
Aaindex database file (-datafile)
<font color="red" size="3">*</font>
<s:select name="datafile_" headerKey='' headerValue='' list="%{ getDataForParameter('datafile_')}" onchange="resolveParameters()"/>
<br/>
window size (-length)
<font color="red" size="3">*</font>
<s:textfield name="length_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output section</A></H2>
graph (-graph)
<font color="red" size="3">*</font>
<s:select name="graph_" list="#{ 'x11':'x11' , 'hp7470':'hp7470' , 'postscript':'postscript' , 'cps':'cps' , 'hp7580':'hp7580' , 'null':'null' , 'data':'data' , 'colourps':'colourps' , 'text':'text' , 'none':'none' , 'tek4107t':'tek4107t' , 'tekt':'tekt' , 'xwindows':'xwindows' , 'hpgl':'hpgl' , 'xterm':'xterm' , 'meta':'meta' , 'ps':'ps' , 'tek':'tek' , 'png':'png' , 'tektronics':'tektronics' }" onchange="resolveParameters()"/>
<br/>
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
<dt><a name=input_comment><i><b>Input section</b></i></a></dt>
<br></br>
<dt><a name=advanced_comment><i><b>Advanced section</b></i></a></dt>
<br></br>
<dt><a name=output_comment><i><b>Output section</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// datafile
// length
// graph
}
function validateControl() {
// datafile
// length
// graph
return issueWarning();
}
function issueWarning() {
// datafile
// length
// graph
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
var element = document.forms['pepwindow'].elements[parameter];
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
var element = document.forms['pepwindow'].elements[parameter];
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
var element = document.forms['pepwindow'].elements[parameter];
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