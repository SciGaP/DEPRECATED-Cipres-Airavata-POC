<%@ taglib prefix="s" uri="/struts-tags" %>
<title>LAlign</title>
<h2>LAlign: Find local similarity between 2 PS or 2 NS (<a href="#REFERENCE">W. Pearson</a>)</h2>
<s:form action="lalign" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Query sequence2 File
<font color="red" size="3">*</font>
<s:select name="query2_" headerKey='' headerValue='' list="%{ getDataForParameter('query2_')}" onchange="resolveParameters()"/>
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
<A name=slectivity_opt><h2><A HREF="javascript:help.slidedownandjump('#slectivity_opt_comment')">Selectivity options</A></H2>
Penalty for the first residue a gap(-14 by default for align with proteins, -16 for DNA) (-f)
<s:textfield name="gapinit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Penalty for each additional residues in a gap(-4 by default) (-g)
<s:textfield name="gapext_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=score_opt><h2><A HREF="javascript:help.slidedownandjump('#score_opt_comment')">Scoring options</A></H2>
Scoring matrix file (-s)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'BL50':'BLOSUM50' , 'BL62':'BLOSUM62' , 'BL80':'BLOSUM80' , 'P20':'PAM20' , 'P40':'PAM40' , 'P120':'PAM120' , 'P250':'PAM250' , 'M10':'MDM_10' , 'M20':'MDM_20' , 'M40':'MDM_40' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=affichage><h2><A HREF="javascript:help.slidedownandjump('#affichage_comment')">Report options</A></H2>
output line length for sequence alignments (max. 200) (-w)
<s:textfield name="linlen_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=slectivity_opt_comment><i><b>Selectivity options</b></i></a></dt>
<br></br>
<dt><a name=score_opt_comment><i><b>Scoring options</b></i></a></dt>
<br></br>
<dt><a name=affichage_comment><i><b>Report options</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// query2
// gapinit
// gapext
// matrix
// linlen
}
function validateControl() {
// query2
// gapinit
// gapext
// matrix
// linlen
return issueWarning();
}
function issueWarning() {
// query2
// gapinit
// gapext
// matrix
// linlen
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
var element = document.forms['lalign'].elements[parameter];
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
var element = document.forms['lalign'].elements[parameter];
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
var element = document.forms['lalign'].elements[parameter];
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