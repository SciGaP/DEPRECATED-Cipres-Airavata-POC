<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PFSCAN</title>
<h2>PFSCAN: Compare PS or NS against PROSITE Profile DB (<a href="#REFERENCE">P. Bucher</a>)</h2>
<s:form action="pfscan" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#pftools')">PFTOOLS program</A>
<font color="red" size="3">*</font>
<s:radio name="pftools_"
list="#{ 'pfscan':'pfscan: scan a sequence with a profile db' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=pfscan><h2><A HREF="javascript:help.slidedownandjump('#pfscan_comment')">PFSCAN parameters</A></H2>
Scan PROSITE db (default)?
<s:checkbox name="prosite_" onclick="resolveParameters()"/>
<br/>
Profile db (PROSITE/NUCSITE format) (if not PROSITE)
<font color="red" size="3">+</font>
<s:select name="profiledb_" headerKey='' headerValue='' list="%{ getDataForParameter('profiledb_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pfscan_cutoff')">Cut-off value</A>
<s:textfield name="pfscan_cutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=control><h2><A HREF="javascript:help.slidedownandjump('#control_comment')">Control options</A></H2>
Search the complementary strands of DNA sequences as well (-b)
<s:checkbox name="compl_" onclick="resolveParameters()"/>
<br/>
Use raw scores rather than normalized scores for match selection. Normalized scores will not be listed in the output. (-r)
<s:checkbox name="raw_score_" onclick="resolveParameters()"/>
<br/>
Forces DISJOINT=UNIQUE (-u)
<s:checkbox name="unique_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#optimal')">Report optimal alignment scores for all sequences regardless of the cut-off value (-a)? </A>
<s:checkbox name="optimal_" onclick="resolveParameters()"/>
<br/>
List the sequences of the matched regions as well. The output will be a Pearson/Fasta-formatted sequence library. (-s)
<s:checkbox name="listseq_" onclick="resolveParameters()"/>
<br/>
List profile-sequence alignments in pftools PSA format. (-x)
<s:checkbox name="psa_format_" onclick="resolveParameters()"/>
<br/>
Display alignments between the profile and the matched sequence regions in a human-friendly format. (-y)
<s:checkbox name="between_" onclick="resolveParameters()"/>
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
<dt><a name=pftools><i>PFTOOLS program</i></a></dt>
<dd>pfscan compares a protein or nucleic acid sequence against a profile library (default: Prosite).</dd><dd>The result is an unsorted list of profile-sequence matches written to the standard output.</dd>
<br></br>
<dt><a name=pfscan_comment><i><b>PFSCAN parameters</b></i></a></dt>
<dt><a name=seqfile><i>Sequence File</i></a></dt>
<dd>pfscan will scan this sequence with a profile db (default db: PROSITE)</dd>
<dt><a name=pfscan_cutoff><i>Cut-off value</i></a></dt>
<dd>Cut-off level to be used for match selection. If level L is not specified in the profile,
the next higher (if L is negative) or next lower (if L is positive) level specified is used instead.</dd>
<br></br>
<dt><a name=control_comment><i><b>Control options</b></i></a></dt>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=optimal><i>Report optimal alignment scores for all sequences regardless of the cut-off value (-a)? </i></a></dt>
<dd>This option simultaneously forces DISJOINT=UNIQUE.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// pftools
// prosite
if ( (getValue('pftools_')=="pfscan") )
enable('prosite_');
else disable('prosite_');
// profiledb
if ( (getValue('pftools_')=="pfscan") && ( ! getValue('prosite_') ))
enable('profiledb_');
else disable('profiledb_');
// pfscan_cutoff
if ( (getValue('pftools_')=="pfscan") )
enable('pfscan_cutoff_');
else disable('pfscan_cutoff_');
// compl
// raw_score
// unique
// optimal
// listseq
// psa_format
// between
}
function validateControl() {
// pftools
// prosite
// profiledb
// pfscan_cutoff
// compl
// raw_score
// unique
// optimal
// listseq
// psa_format
// between
return issueWarning();
}
function issueWarning() {
// pftools
// prosite
// profiledb
// pfscan_cutoff
// compl
// raw_score
// unique
// optimal
// listseq
// psa_format
// between
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
var element = document.forms['pfscan'].elements[parameter];
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
var element = document.forms['pfscan'].elements[parameter];
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
var element = document.forms['pfscan'].elements[parameter];
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