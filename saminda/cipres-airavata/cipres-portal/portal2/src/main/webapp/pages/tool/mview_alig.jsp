<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MView_Alig</title>
<h2>MView_Alig: Multiple Alignment Viewer (<a href="#REFERENCE">N. P. Brown</a>)</h2>
<s:form action="mview_alig" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Type of alignment (-in)
<font color="red" size="3">*</font>
<s:select name="in_" list="#{ 'pearson':'Pearson/FASTA' , 'msf':'MSF (GCG)' , 'clustal':'CLUSTAL W' , 'phylip':'PHYLIP' , 'hssp':'MaxHom/HSSP' , 'plain':'plain' , 'multas':'multas: MULTAS/MULTAL ' , 'mips':'mips: MIPS-ALN' }" onchange="resolveParameters()"/>
<br/>
<br/>
Attach a ruler (-ruler)
<s:checkbox name="ruler_" onclick="resolveParameters()"/>
<br/>
Show alignment (-alignment)
<s:checkbox name="alignment_" onclick="resolveParameters()"/>
<br/>
Show consensus (-consensus)
<s:checkbox name="consensus_" onclick="resolveParameters()"/>
<br/>
Use DNA/RNA colormaps and/or consensus groups (-dna)
<s:checkbox name="dna_" onclick="resolveParameters()"/>
<br/>
Colour scheme (-<A HREF="javascript:help.slidedownandjump('#coloring')">coloring</A>)
<s:select name="coloring_" headerKey='' headerValue='' list="#{ 'any':'any: colour all the residues' , 'consensus':'consensus: colour only when above a given percent similarity' , 'group':'groups: colours residues by the colour of the class to which they belong' , 'identity':'identity: colouring by identity to the first sequence' , 'none':'none: no colouring' }" onchange="resolveParameters()"/>
<br/>
<br/>
Output format (-out)
<font color="red" size="3">*</font>
<s:select name="out_" list="#{ 'html':'HTML' , 'msf':'GCG/MSF' , 'pearson':'Pearson/FASTA' , 'pir':'PIR' }" onchange="resolveParameters()"/>
<br/>
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
<A name=main_formatting_options><h2><A HREF="javascript:help.slidedownandjump('#main_formatting_options_comment')">Main formatting options</A></H2>
<hr/>
<A name=alignment_options><h2><A HREF="javascript:help.slidedownandjump('#alignment_options_comment')">Alignment options</A></H2>
Threshold percentage for consensus coloring (-threshold)
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ignore singleton or class group (-<A HREF="javascript:help.slidedownandjump('#ignore')">ignore</A>)
<s:radio name="ignore_"
list="#{ '': '[Not Mandatory]', 'class':'class' , 'none':'none' , 'singleton':'singleton' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=consensus_options><h2><A HREF="javascript:help.slidedownandjump('#consensus_options_comment')">Consensus options</A></H2>
Basic style of coloring (-<A HREF="javascript:help.slidedownandjump('#con_coloring')">con_coloring</A>)
<s:radio name="con_coloring_"
list="#{ '': '[Not Mandatory]', 'any':'any: colour all the residues' , 'identity':'identity: coloring by identity to the first sequence' , 'none':'none: no coloring' }" onclick="resolveParameters()"/>
<br/>
Consensus line thresholds (in range 50..100) (separated by commas) (-con_threshold)
<s:textfield name="con_threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ignore singleton or class group (-con_ignore)
<s:radio name="con_ignore_"
list="#{ '': '[Not Mandatory]', 'class':'class' , 'none':'none' , 'singleton':'singleton' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=hybrid_alignment_consensus_options><h2><A HREF="javascript:help.slidedownandjump('#hybrid_alignment_consensus_options_comment')">Hybrid alignment and consensus options</A></H2>
Count gaps during consensus computations (-con_gaps)
<s:checkbox name="con_gaps_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=general_row_column_filters><h2><A HREF="javascript:help.slidedownandjump('#general_row_column_filters_comment')">General row/column filters</A></H2>
Report top N hits (-top)
<s:textfield name="top_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Display column range M..N as numbered by ruler (M,N) (-range)
<s:textfield name="range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Only report sequences with %identity <= N (-maxident)
<s:textfield name="maxident_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use row N or row identifier as %id entity reference (-ref)
<s:textfield name="ref_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Keep only the rows from start to end (separated by commas: start,end) (-keep)
<s:textfield name="keep_only_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Discard rows from start to end (separated by commas: start,end) (-disc)
<s:textfield name="disc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Display rows unprocessed (separated by commas) (-nops)
<s:textfield name="nops_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=general_formatting_options><h2><A HREF="javascript:help.slidedownandjump('#general_formatting_options_comment')">General formatting options</A></H2>
Paginate in N columns of alignment (-width)
<s:textfield name="width_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use this character as the gap (-gap)
<s:textfield name="gap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Switch off label: row number (-label0)
<s:checkbox name="label0_" onclick="resolveParameters()"/>
<br/>
Switch off label: identifier (-label1)
<s:checkbox name="label1_" onclick="resolveParameters()"/>
<br/>
Switch off label: description (-label2)
<s:checkbox name="label2_" onclick="resolveParameters()"/>
<br/>
Switch off label: scores (-label3)
<s:checkbox name="label3_" onclick="resolveParameters()"/>
<br/>
Switch off label: percent identity (-label4)
<s:checkbox name="label4_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=html_markup_options><h2><A HREF="javascript:help.slidedownandjump('#html_markup_options_comment')">HTML markup options</A></H2>
HTML output
<font color="red" size="3">+</font>
<s:select name="html_output_" list="#{ 'full':'full' , 'head':'head' , 'body':'body' , 'data':'data' , 'css':'css' , 'off':'off' }" onchange="resolveParameters()"/>
<br/>
<br/>
Page backgound color (-pagecolor)
<s:textfield name="pagecolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Page text color (-textcolor)
<s:textfield name="textcolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Link color (-linkcolor)
<s:textfield name="linkcolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Active link color (-alinkcolor)
<s:textfield name="alinkcolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Visited link color (-vlinkcolor)
<s:textfield name="vlinkcolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Alignment background color (-alncolor)
<s:textfield name="alncolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Alignment default text color (-symcolor)
<s:textfield name="symcolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Alignment gap color (-gapcolor)
<s:textfield name="gapcolor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use bold emphasis for coloured residues (-bold)
<s:checkbox name="bold_" onclick="resolveParameters()"/>
<br/>
Use Cascading Style Sheets (-css)
<s:radio name="css_"
list="#{ '': '[Not Mandatory]', 'off':'off' , 'on':'on' }" onclick="resolveParameters()"/>
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
<br></br>
<dt><a name=main_formatting_options_comment><i><b>Main formatting options</b></i></a></dt>
<br></br>
<dt><a name=alignment_options_comment><i><b>Alignment options</b></i></a></dt>
<dt><a name=coloring><i>Colour scheme (-coloring)</i></a></dt>
<dd>-coloring consensus: will colour only those residues that belong to a specified physicochemical class that is conserved in at least a specified percentage of all rows for a given column. This defaults to 70% and and may be set to another threshold, eg., -coloring consensus -threshold 80 would specify 80%. Note that the physicochemical classes in question can be confined to individual residues. </dd><dd>-coloring group, is like -coloring consensus, but colours residues by the colour of the class to which they belong.</dd><dd>By default, the consensus computation counts gap characters, so that sections of the alignment may be uncolored where the presence of gaps prevents the non-gap count from reaching the threshold. Setting -con_gaps off prevents this, allowing sequence-only based consensus thresholding. </dd><dd>The default palette assumes the input alignment is of protein sequences and sets their colours according to amino acid physicochemical properties: another palette should be selected for DNA or RNA alignments. </dd><dd>Consensus colouring is complicated and some understanding of palettes and consensus patterns is required first before trying to explain alignment consensus coloring.</dd>
<dt><a name=ignore><i>Ignore singleton or class group (-ignore)</i></a></dt>
<dd>Tip: If you want to see only the conserved residues above the threshold (ie., only one type of conserved residue per column), add the option -ignore class. </dd>
<br></br>
<dt><a name=consensus_options_comment><i><b>Consensus options</b></i></a></dt>
<dt><a name=con_coloring><i>Basic style of coloring (-con_coloring)</i></a></dt>
<dd>-coloring consensus: will colour only those residues that belong to a specified physicochemical class that is conserved in at least a specified percentage of all rows for a given column. This defaults to 70% and and may be set to another threshold, eg., -coloring consensus -threshold 80 would specify 80%. Note that the physicochemical classes in question can be confined to individual residues. </dd><dd>-coloring group, is like -coloring consensus, but colours residues by the colour of the class to which they belong.</dd><dd>By default, the consensus computation counts gap characters, so that sections of the alignment may be uncolored where the presence of gaps prevents the non-gap count from reaching the threshold. Setting -con_gaps off prevents this, allowing sequence-only based consensus thresholding. </dd><dd>The default palette assumes the input alignment is of protein sequences and sets their colours according to amino acid physicochemical properties: another palette should be selected for DNA or RNA alignments. </dd><dd>Consensus coloring is complicated and some understanding of palettes and consensus patterns is required first before trying to explain alignment consensus coloring.</dd>
<br></br>
<dt><a name=hybrid_alignment_consensus_options_comment><i><b>Hybrid alignment and consensus options</b></i></a></dt>
<br></br>
<dt><a name=general_row_column_filters_comment><i><b>General row/column filters</b></i></a></dt>
<br></br>
<dt><a name=general_formatting_options_comment><i><b>General formatting options</b></i></a></dt>
<br></br>
<dt><a name=html_markup_options_comment><i><b>HTML markup options</b></i></a></dt>
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
// in
// ruler
// alignment
// consensus
// dna
// coloring
// threshold
// ignore
// con_coloring
if (getValue('consensus_'))
enable('con_coloring_');
else disable('con_coloring_');
// con_threshold
if (getValue('consensus_'))
enable('con_threshold_');
else disable('con_threshold_');
// con_ignore
if (getValue('consensus_'))
enable('con_ignore_');
else disable('con_ignore_');
// con_gaps
// top
// range
// maxident
// ref
// keep_only
// disc
// nops
// width
// gap
// label0
// label1
// label2
// label3
// label4
// html_output
if (getValue('out_')=="html" )
enable('html_output_');
else disable('html_output_');
// pagecolor
// textcolor
// linkcolor
// alinkcolor
// vlinkcolor
// alncolor
// symcolor
// gapcolor
// bold
// css
// out
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// in
// ruler
// alignment
// consensus
// dna
// coloring
// threshold
// ignore
// con_coloring
// con_threshold
// con_ignore
// con_gaps
// top
// range
// maxident
// ref
// keep_only
// disc
// nops
// width
// gap
// label0
// label1
// label2
// label3
// label4
// html_output
// pagecolor
// textcolor
// linkcolor
// alinkcolor
// vlinkcolor
// alncolor
// symcolor
// gapcolor
// bold
// css
// out
return issueWarning();
}
function issueWarning() {
// runtime
// in
// ruler
// alignment
// consensus
// dna
// coloring
// threshold
// ignore
// con_coloring
// con_threshold
// con_ignore
// con_gaps
// top
// range
// maxident
// ref
// keep_only
// disc
// nops
// width
// gap
// label0
// label1
// label2
// label3
// label4
// html_output
// pagecolor
// textcolor
// linkcolor
// alinkcolor
// vlinkcolor
// alncolor
// symcolor
// gapcolor
// bold
// css
// out
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
var element = document.forms['mview_alig'].elements[parameter];
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
var element = document.forms['mview_alig'].elements[parameter];
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
var element = document.forms['mview_alig'].elements[parameter];
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