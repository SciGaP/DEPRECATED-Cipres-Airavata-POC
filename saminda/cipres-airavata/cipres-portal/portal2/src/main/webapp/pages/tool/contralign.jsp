<%@ taglib prefix="s" uri="/struts-tags" %>
<title>CONTRAlign</title>
<h2>CONTRAlign: CONditional TRAining for Sequence Alignment (<a href="#REFERENCE">Do, C.B., Gross, S.S., and Batzoglou, S.</a>)</h2>
<s:form action="contralign" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sequenceType')">Data Type</A>
<font color="red" size="3">*</font>
<s:radio name="sequenceType_"
list="#{ 'aminoAcid':'amino acid' , 'nucleicAcid':'nucleic acid' }" onclick="resolveParameters()"/>
<br/>
Write output in MFA format? (--mfa)
<font color="red" size="3">*</font>
<s:checkbox name="outputMFA_" onclick="resolveParameters()"/>
<br/>
Write output in ClustalW format? (--clustalw)
<font color="red" size="3">*</font>
<s:checkbox name="outputClustal_" onclick="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#gamma')">Gamma (--gamma)</A>
<font color="red" size="3">*</font>
<s:textfield name="gamma_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#annealing')">Use annealing? (--annealing)</A>
<font color="red" size="3">*</font>
<s:checkbox name="annealing_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pc_iters')">Number of probabilistic consistency iterations (--pc_iters)</A>
<font color="red" size="3">*</font>
<s:textfield name="pc_iters_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sc_iters')">Number of spectral consistency iterations (--sc_iters)</A>
<font color="red" size="3">*</font>
<s:textfield name="sc_iters_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#paramsFile')">Trained CONTRAlign parameter file (--params)</A>
<font color="red" size="3">*</font>
<s:select name="paramsFile_" headerKey='' headerValue='' list="%{ getDataForParameter('paramsFile_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#partition')">Compute the log partition function for the input sequence? (--partition)</A>
<font color="red" size="3">*</font>
<s:checkbox name="partition_" onclick="resolveParameters()"/>
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
<dt><a name=runtime><i>Maximum Hours to Run (click here for help setting this correctly)</i></a></dt>
<dd>
Estimate the maximum time your job will need to run (up to 72 hrs). Your job will be killed if it doesn't finish within the time you specify, however jobs with shorter maximum run times are often scheduled sooner than longer jobs.
</dd>
<dt><a name=sequenceType><i>Data Type</i></a></dt>
<dd>CONTRAlign will be used in prediction mode, with parameter values trained on protein</dd><dd>or RNA sequences.</dd>
<dt><a name=gamma><i>Gamma (--gamma)</i></a></dt>
<dd>This option sets the sensitivity/specificity tradeoff parameter for the maximum</dd><dd>expected accuracy decoding algorithm. In particular, consider a scoring system in</dd><dd>which each nucleotide belonging to a correct match gets a score of gamma, and each</dd><dd>nucleotide correctly gapped gets a score of 1. Then, CONTRAlign finds the alignment</dd><dd>of the input sequences with maximum expected accuracy with respect to this scoring</dd><dd>system. Intuitively, gamma > 1 causes the parsing algorithm to emphasize sensitivity,</dd><dd>while 0 <= gamma <= 1 causes the parsing algorithm to emphasize specificity. In</dd><dd>addition, if the user specifies any value of gamma < 0, then CONTRAlign tries</dd><dd>trade-off parameters of 2^k for k in {-5, -4, ... , 10}, and generates one output file</dd><dd>for each trade-off parameter.</dd>
<dt><a name=annealing><i>Use annealing? (--annealing)</i></a></dt>
<dd>This option replaces the standard progressive alignment dynamic programming algorithm</dd><dd>for alignment with an implementation of the sequence annealing algorithm described in:</dd><dd>Schwartz, A.S., and Pachter, L. (2007) Multiple alignment by sequence annealing.</dd><dd>Bioinformatics, 23(2): e24-e29.</dd>
<dt><a name=pc_iters><i>Number of probabilistic consistency iterations (--pc_iters)</i></a></dt>
<dd>This option sets the number of iterations of probabilistic consistency to use before</dd><dd>running the multiple alignment algorithm.</dd>
<dt><a name=sc_iters><i>Number of spectral consistency iterations (--sc_iters)</i></a></dt>
<dd>This option sets the number of iterations of spectral consistency to use before</dd><dd>running the multiple alignment algorithm.</dd>
<dt><a name=paramsFile><i>Trained CONTRAlign parameter file (--params)</i></a></dt>
<dd>This option uses a trained CONTRAlign parameter file instead of the default program</dd><dd>parameters. The format of the parameter file should be the same as the</dd><dd>contralign.params.protein file in the CONTRAlign source code; each line contains a</dd><dd>single parameter name and a parameter value.</dd>
<dt><a name=partition><i>Compute the log partition function for the input sequence? (--partition)</i></a></dt>
<dd>Compute the log partition function for the input sequence.</dd>
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
// sequenceType
// outputMFA
// outputClustal
// gamma
// annealing
// pc_iters
// sc_iters
// paramsFile
// partition
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// sequenceType
// outputMFA
// outputClustal
// gamma
if (getValue('gamma_') < 0) {
alert('Values for "--gamma" less than 0 are not currently supported. Please enter a new value.');
return false;
}
// annealing
// pc_iters
// sc_iters
// paramsFile
// partition
return issueWarning();
}
function issueWarning() {
// runtime
// sequenceType
// outputMFA
// outputClustal
// gamma
// annealing
// pc_iters
// sc_iters
// paramsFile
// partition
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
var element = document.forms['contralign'].elements[parameter];
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
var element = document.forms['contralign'].elements[parameter];
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
var element = document.forms['contralign'].elements[parameter];
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