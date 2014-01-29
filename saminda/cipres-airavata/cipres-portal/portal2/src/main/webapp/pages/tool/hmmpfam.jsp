<%@ taglib prefix="s" uri="/struts-tags" %>
<title>HMMPFAM</title>
<h2>HMMPFAM: search PS against the PFAM database
(<a href="#REFERENCE">S. Eddy</a>)</h2>
<s:form action="hmmpfam" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
HMM database
<font color="red" size="3">*</font>
<s:radio name="HMMDB_"
list="#{ 'Pfam_ls':'Pfam:The Pfam global-local (ls) HMM library.' , 'Pfam_fs':'Pfam:The Pfam local-local (fs) HMM library.' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#n_best')">number of reported alignments (-A n)</A>
<s:textfield name="n_best_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#E_value_cutoff')">E_value cutoff (-E x)</A>
<s:textfield name="E_value_cutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Bit_cutoff')">Bit score cutoff (-T x)</A>
<s:textfield name="Bit_cutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#E_value_calculation')">Control of E_value calculation (-Z n)</A>
<s:textfield name="E_value_calculation_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=expert_options><h2><A HREF="javascript:help.slidedownandjump('#expert_options_comment')">Expert Options</A></H2>
Report accessions instead of names in the output reports (--acc)
<s:checkbox name="acc_" onclick="resolveParameters()"/>
<br/>
Use the output format of HMMER 2.1.1 (--compat)
<s:checkbox name="compat_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#domE')">E-value cutoff for the per-domain ranked hit list (--domE x)</A>
<s:textfield name="domE_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#domT')">bit score cutoff for the per-domain ranked hit list (--domT x)</A>
<s:textfield name="domT_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#forward')">forward algorithm (--forward)</A>
<s:checkbox name="forward_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#null2')">turns off the second post processing step (--null2)</A>
<s:checkbox name="null2_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#xnu')">turns on XNU filtering (--xnu)</A>
<s:checkbox name="xnu_" onclick="resolveParameters()"/>
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
<dt><a name=n_best><i>number of reported alignments (-A n)</i></a></dt>
<dd>Limits the alignment output to the n best scoring domains. -A0 shuts off the alignment output and can be
used to reduce the size of output files.</dd>
<dt><a name=E_value_cutoff><i>E_value cutoff (-E x)</i></a></dt>
<dd>Set the E-value cutoff for the per-sequence ranked hit list. Input a positive real number. The default is
10.0. Hits with E-values better than (less than) this threshold will be shown.</dd>
<dt><a name=Bit_cutoff><i>Bit score cutoff (-T x)</i></a></dt>
<dd>Set the bit score cutoff for the per-sequence ranked hit list by inputting a real number.
The default is negative infinity; by default, the threshold is controlled by E-value and not by bit score.
Hits with bit scores better than (greater than) this threshold will be shown.</dd>
<dt><a name=E_value_calculation><i>Control of E_value calculation (-Z n)</i></a></dt>
<dd>Calculate the E-value scores as if we had seen a sequence database of n sequences. The default is arbitrarily set to 59021, the size of Swissprot 34.</dd>
<br></br>
<dt><a name=expert_options_comment><i><b>Expert Options</b></i></a></dt>
<dt><a name=domE><i>E-value cutoff for the per-domain ranked hit list (--domE x)</i></a></dt>
<dd>Set the E-value cutoff for the per-domain ranked hit list to a positive real number. The default is infinity; by default, all domains in the sequences that passed the first threshold will be reported in the second list, so that the number of domains reported in the per-sequence list is consistent with the number that appear in the per-domain list.</dd>
<dt><a name=domT><i>bit score cutoff for the per-domain ranked hit list (--domT x)</i></a></dt>
<dd>Set the bit score cutoff for the per-domain ranked hit list to a real number. The default is negative infinity; by default,
all domains in the sequences that passed the first threshold will be reported in the second list, so that the number
of domains reported in the per-sequence list is consistent with the number that appear in the per-domain list.
Important note: only one domain in a sequence is absolutely controlled by this parameter, or by --domT. The second
and subsequent domains in a sequence have a de facto bit score threshold of 0 because of the details of how HMMER works. HMMER requires at east one pass through the main model per sequence; to do more than one pass (more than one domain) the multidomain alignment must have a better score than the single domain alignment, and hence the extra domains must contribute positive score. See the Users' Guide for more detail. </dd>
<dt><a name=forward><i>forward algorithm (--forward)</i></a></dt>
<dd>Use the Forward algorithm instead of the Viterbi algorithm to determine the per-sequence scores. Per-domain
scores are still determined by the Viterbi algorithm. Some have argued that Forward is a more sensitive algorithm
for detecting remote sequence homologues; my experiments with HMMER have not confirmed this, however.</dd>
<dt><a name=null2><i>turns off the second post processing step (--null2)</i></a></dt>
<dd>Turn off the post hoc second null model. By default, each alignment is rescored by a postprocessing step that
takes into account possible biased composition in either the HMM or the target sequence. This is almost essential in
database searches, especially with local alignment models. There is a very small chance that this postprocessing might
remove real matches, and in these cases --null2 may improve sensitivity at the expense of reducing specificity by
letting biased composition hits through.</dd>
<dt><a name=xnu><i>turns on XNU filtering (--xnu)</i></a></dt>
<dd>Turn on XNU filtering of target protein sequences. Has no effect on nucleic acid sequences. In trial experiments,
--xnu appears to perform less well than the default post hoc null2 model.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// HMMDB
// n_best
// E_value_cutoff
// Bit_cutoff
// E_value_calculation
// acc
// compat
// domE
// domT
// forward
// null2
// xnu
}
function validateControl() {
// HMMDB
// n_best
// E_value_cutoff
// Bit_cutoff
// E_value_calculation
// acc
// compat
// domE
// domT
// forward
// null2
// xnu
return issueWarning();
}
function issueWarning() {
// HMMDB
// n_best
// E_value_cutoff
// Bit_cutoff
// E_value_calculation
// acc
// compat
// domE
// domT
// forward
// null2
// xnu
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
var element = document.forms['hmmpfam'].elements[parameter];
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
var element = document.forms['hmmpfam'].elements[parameter];
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
var element = document.forms['hmmpfam'].elements[parameter];
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