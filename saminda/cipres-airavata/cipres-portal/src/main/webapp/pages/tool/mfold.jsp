<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MFOLD</title>
<h2>MFOLD: Prediction of RNA secondary structure (<a href="#REFERENCE">M. Zuker</a>)</h2>
<s:form action="mfold" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Sequence type (default = linear) (LC)
<s:radio name="LC_"
list="#{ '': '[Not Mandatory]', 'linear':'linear' , 'circular':'circular' }" onclick="resolveParameters()"/>
<br/>
RNA (default) or DNA (NA)
<s:radio name="NA_"
list="#{ '': '[Not Mandatory]', 'RNA':'RNA' , 'DNA':'DNA' }" onclick="resolveParameters()"/>
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
<A name=control><h2><A HREF="javascript:help.slidedownandjump('#control_comment')">Control options</A></H2>
Temperature (T)
<s:textfield name="T_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#P')">Percent (P)</A>
<s:textfield name="P_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Na+ molar concentration (NA_CONC)
<s:textfield name="NA_CONC_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Mg++ molar concentration (MG_CONC)
<s:textfield name="MG_CONC_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#W')">Window parameter (default - set by sequence length) (W)</A>
<s:textfield name="W_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#MAXBP')">MAXBP: Max base pair distance (default - no limit)</A>
<s:textfield name="MAXBP_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#MAX')">MAX: Maximum number of foldings to be computed</A>
<s:textfield name="MAX_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ANN')">Structure annotation type (default=none) (ANN)</A>
<s:radio name="ANN_"
list="#{ '': '[Not Mandatory]', 'none':'none' , 'p-num':'p-num' , 'ss-count':'ss-count' }" onclick="resolveParameters()"/>
<br/>
Structure display mode (default=auto) (MODE)
<s:radio name="MODE_"
list="#{ '': '[Not Mandatory]', 'auto':'auto' , 'bases':'bases' , 'lines':'lines' }" onclick="resolveParameters()"/>
<br/>
Structure rotation angle (ROT_ANG)
<s:textfield name="ROT_ANG_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
5' base number (START)
<s:textfield name="START_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
3' base number (default = end) (STOP)
<s:textfield name="STOP_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=SEQ><i>Sequence File (SEQ)</i></a></dt>
<dd>
SEQ: The sequence file may contain multiple sequences. The mfold script will fold the first sequence by default.</dd>
<br></br>
<dt><a name=control_comment><i><b>Control options</b></i></a></dt>
<dt><a name=P><i>Percent (P)</i></a></dt>
<dd>
P is the percent suboptimality for computing the energy dot plot and suboptimal foldings. The default value is 5%.
This parameter controls the value of the free energy increment, delta (deltaG). Delta of deltaG is set to P% of
deltaG, the computed minimum free energy. The energy dot plot shows only those base pairs that are in
foldings with free energy minus or equal to deltaG plus delta (deltaG). Similarly, the free energies of computed
foldings are in the range from deltaG to deltaG plus delta (deltaG). No matter the value of P, mfold currently keeps
delta (deltaG) in the range [1,12](kcal/mole).</dd>
<dt><a name=W><i>Window parameter (default - set by sequence length) (W)</i></a></dt>
<dd>
W : This is the window parameter that controls the number of foldings
that are automatically computed by mfold. `W' may be thought of as a
distance parameter. The distance between 2 base pairs, i.j and i'.j'
may be defined as max{|i-i'|,|j-j'|}. Then if k-1 foldings have
already been predicted by mfold, the kth folding will have at least W
base pairs that are at least a distance W from any of the base pairs
in the first k-1 foldings. As W increases, the number of predicted
foldings decreases. If W is not specified, mfold selects a value by
default based on sequence length, as displayed in Table 3.</dd>
<dt><a name=MAXBP><i>MAXBP: Max base pair distance (default - no limit)</i></a></dt>
<dd>
MAXBP: A base pair i.j will not be allowed to form (in linear RNA) if
j-i > MAXBP. For circular RNA, a base pair i.j cannot form if
min{j-i,n+i-j} > MAXBP . Thus small values of MAXBP ensure that only
short range base pairs will be predicted. By default, MAXBP=+infinity,
indicating no constraint.</dd>
<dt><a name=MAX><i>MAX: Maximum number of foldings to be computed</i></a></dt>
<dd>
MAX : This is the maximum number of foldings that mfold will compute
(50 by default). It is better to limit the number of foldings by
careful selection of the P and W parameters. </dd>
<dt><a name=ANN><i>Structure annotation type (default=none) (ANN)</i></a></dt>
<dd>
ANN: This parameter currently takes on 3 values. </dd><dd>1. `none' :
secondary structures are drawn without any special annotation. Letters
or outline are in black, while base pairs are red lines or dots for GC
pairs and blue lines or dots for AU and GU pairs. </dd><dd>2. `p-num' : Colored
dots, colored base characters or a combination are used to display in
each folding how well-determined each base is according to the P-num
values in the `fold_name.ann' file. </dd><dd>3. `ss-count' : Colored dots,
colored base characters or a combination are used to display in each
folding how likely a base is to be single-stranded according to sample
statistics stored in the `fold_name.ss-count' file. Both 2. and
3. were recently described [38].</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// LC
// NA
// T
// P
// NA_CONC
// MG_CONC
// W
// MAXBP
// MAX
// ANN
// MODE
// ROT_ANG
// START
// STOP
}
function validateControl() {
// LC
// NA
// T
// P
// NA_CONC
// MG_CONC
// W
// MAXBP
// MAX
// ANN
// MODE
// ROT_ANG
// START
// STOP
return issueWarning();
}
function issueWarning() {
// LC
// NA
// T
// P
// NA_CONC
// MG_CONC
// W
// MAXBP
// MAX
// ANN
// MODE
// ROT_ANG
// START
// STOP
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
var element = document.forms['mfold'].elements[parameter];
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
var element = document.forms['mfold'].elements[parameter];
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
var element = document.forms['mfold'].elements[parameter];
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