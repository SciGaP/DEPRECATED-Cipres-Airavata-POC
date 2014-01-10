<%@ taglib prefix="s" uri="/struts-tags" %>
<title>SAPS</title>
<h2>SAPS: Statistical Analysis of Protein Sequences (<a href="#REFERENCE">V. Brendel</a>)</h2>
<s:form action="saps" theme="simple">
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
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#documented')">Generate documented output (-d)</A>
<s:checkbox name="documented_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#terse')">Generate terse output (-t)</A>
<s:checkbox name="terse_" onclick="resolveParameters()"/>
<br/>
Generate verbose output (-v)
<s:checkbox name="verbose_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#table')">Append computer-readable table summary output (-T)</A>
<s:checkbox name="table_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=control><h2><A HREF="javascript:help.slidedownandjump('#control_comment')">Control options</A></H2>
Use this specie for quantile comparisons (-s)
<s:select name="specie_" headerKey='' headerValue='' list="#{ 'BACSU':'BACSU: Bacillus subtilis' , 'DROME':'DROME: Drosophila melanogaster' , 'HUMAN':'HUMAN: human' , 'RAT':'RAT: rat' , 'YEAST':'YEAST: Saccharomyces cerevisiae' , 'CHICK':'CHICK: chicken' , 'ECOLI':'ECOLI: Escherichia coli' , 'MOUSE':'MOUSE: mouse' , 'XENLA':'XENLA: frog' , 'swp23s':'swp23s: random sample of proteins from SWISS-PROT 23.0' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#H_positive')">Count H as positive charge (-H)</A>
<s:checkbox name="H_positive_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#analyze')">Analyze spacings of amino acids X, Y, .... (-a)</A>
<s:textfield name="analyze_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=documented><i>Generate documented output (-d)</i></a></dt>
<dd>The output will come with documentation that annotates each part of the program; this flag should be set when SAPS is used for the first time as it provides helpful explanations with respect to the statistics being used and the layout of the output.</dd>
<dt><a name=terse><i>Generate terse output (-t)</i></a></dt>
<dd>This flag specifies terse output that is limited to the analysis of the charge distribution and of high scoring segments.</dd>
<dt><a name=table><i>Append computer-readable table summary output (-T)</i></a></dt>
<dd>This flag is used in conjunction with the analysis of sets of proteins ; if specified, the file saps.table is appended with computer-readable lines describing the input files and their significant features.</dd>
<br></br>
<dt><a name=control_comment><i><b>Control options</b></i></a></dt>
<dt><a name=H_positive><i>Count H as positive charge (-H)</i></a></dt>
<dd>By default, SAPS treats only lysine (K) and arginine (R) as positively charged residues. If the command line flag -H is set, then histidine (H) is also treated as positively charged in all parts of the program involving the charge alphabet.</dd>
<dt><a name=analyze><i>Analyze spacings of amino acids X, Y, .... (-a)</i></a></dt>
<dd>Clusters of particular amino acid types may be evaluated by means of the same tests that are used to detect clustering of charged residues (binomial model and scoring statistics). These tests are invoked by setting this flag; for example, to test (separately) for clusters of alanine (A) and serine (S), set thisparameter to AS. The binomial test is also programmed for certain combinations of amino acids: AG (flag -a a), PEST (flag -a p), QP (flag -a q), ST (flag -a s).</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// documented
// terse
// verbose
// table
// specie
// H_positive
// analyze
}
function validateControl() {
// documented
// terse
// verbose
// table
// specie
// H_positive
// analyze
return issueWarning();
}
function issueWarning() {
// documented
// terse
// verbose
// table
// specie
// H_positive
// analyze
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
var element = document.forms['saps'].elements[parameter];
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
var element = document.forms['saps'].elements[parameter];
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
var element = document.forms['saps'].elements[parameter];
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