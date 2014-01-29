<%@ taglib prefix="s" uri="/struts-tags" %>
<title>TMAP</title>
<h2>TMAP: Display membrane spanning regions </h2>
<s:form action="tmap" theme="simple">
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
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output section</A></H2>
graph (-graph)
<font color="red" size="3">*</font>
<s:radio name="graph_"
list="#{ 'text':'text' , 'ps':'ps' , 'png':'png' }" onclick="resolveParameters()"/>
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
<dd>
</dd><dd>TMAP displays membrane spanning regions</dd><dd>
</dd><dd>This program predicts transmembrane segments in proteins, utilizing the algorithm described in: "Persson, B. & Argos, P. (1994) Prediction of transmembrane segments in proteins utilizing multiple sequence alignments J. Mol. Biol. 237, 182-192." TMAP reads in one or more aligned protein sequences. Two sets of propensity values are then used for the calculations: one for the middle, hydrophobic portion and one for the terminal regions of the transmembrane sequence spans. Average propensity values are calculated for each position along the alignment, with the contribution from each sequence weighted according to its dissimilarity relative to the other aligned sequences.
Eight-residue segments are considered as potential cores of transmembrane segments and elongated if their middle propensity values are above a threshold. End propensity values are also considered as stop signals. Only helices with a length of 15 to 29 residues are allowed and corrections for strictly conserved charged residues are made. The method is more successful than predictions based upon single sequences alone. The results are plotted on a graph and written to a text file.</dd><dd>
</dd>
<dt><a name=sequences><i>sequences -- gapprotein [set of sequences] (-sequences)</i></a></dt>
<dd>File containing a sequence alignment</dd>
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
// graph
}
function validateControl() {
// graph
return issueWarning();
}
function issueWarning() {
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
var element = document.forms['tmap'].elements[parameter];
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
var element = document.forms['tmap'].elements[parameter];
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
var element = document.forms['tmap'].elements[parameter];
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