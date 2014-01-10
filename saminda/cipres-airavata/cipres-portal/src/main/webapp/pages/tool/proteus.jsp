<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Proteus</title>
<h2>Proteus: Proteus Comprehensive Secondary Structure Predictions (<a href="#REFERENCE">Scott Montgomerie, Shan Sundararaj, Warren J Gallin, and David S Wishart</a>)</h2>
<s:form action="proteus" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#analysis_type')">Choose a specific analysis</A>
<font color="red" size="3">*</font>
<s:select name="analysis_type_" list="#{ 'psipred':'Psipred' , 'jnet':'JNET' , 'fast':'Psipred + JNET + Consensus' , 'all':'ALL' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#transmembrane_only')">Run Transmembrane Analysis (-t)</A>
<font color="red" size="3">*</font>
<s:checkbox name="transmembrane_only_" onclick="resolveParameters()"/>
<br/>
Choose the class of organism if you are analysing for signal peptide (-organism)
<font color="red" size="3">*</font>
<s:radio name="signalpeptide_org_"
list="#{ '1':'Gram pos' , '2':'Gram neg' , '3':'Eukaryote' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#is_verbose')">All possible output (-verbose)</A>
<font color="red" size="3">*</font>
<s:checkbox name="is_verbose_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_homology')">Run Homology Modelling (-h)</A>
<font color="red" size="3">*</font>
<s:checkbox name="use_homology_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#energy_min')">Run energy minimization. (-e)</A>
<font color="red" size="3">*</font>
<s:checkbox name="energy_min_" onclick="resolveParameters()"/>
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
<dt><a name=analysis_type><i>Choose a specific analysis</i></a></dt>
<dd></dd>
<dt><a name=transmembrane_only><i>Run Transmembrane Analysis (-t)</i></a></dt>
<dd></dd>
<dt><a name=is_verbose><i>All possible output (-verbose)</i></a></dt>
<dd></dd>
<dt><a name=use_homology><i>Run Homology Modelling (-h)</i></a></dt>
<dd></dd>
<dt><a name=energy_min><i>Run energy minimization. (-e)</i></a></dt>
<dd></dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// analysis_type
// transmembrane_only
// signalpeptide_org
if (getValue('transmembrane_only_'))
enable('signalpeptide_org_');
else disable('signalpeptide_org_');
// is_verbose
if (!getValue('transmembrane_only_'))
enable('is_verbose_');
else disable('is_verbose_');
// use_homology
if (!getValue('transmembrane_only_'))
enable('use_homology_');
else disable('use_homology_');
// energy_min
if (!getValue('transmembrane_only_'))
enable('energy_min_');
else disable('energy_min_');
}
function validateControl() {
// analysis_type
// transmembrane_only
// signalpeptide_org
// is_verbose
// use_homology
// energy_min
return issueWarning();
}
function issueWarning() {
// analysis_type
// transmembrane_only
// signalpeptide_org
// is_verbose
// use_homology
// energy_min
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
var element = document.forms['proteus'].elements[parameter];
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
var element = document.forms['proteus'].elements[parameter];
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
var element = document.forms['proteus'].elements[parameter];
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