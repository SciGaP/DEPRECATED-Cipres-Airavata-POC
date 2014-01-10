<%@ taglib prefix="s" uri="/struts-tags" %>
<title>ProbCons</title>
<h2>ProbCons: Probabilistic Consistency-based Multiple Alignment of Amino/Nucleic Acid Sequences (<a href="#REFERENCE">C.Do, M.Brudno, S.Batzoglou</a>)</h2>
<s:form action="probcons" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#outputFormat')">Output file format</A>
<font color="red" size="3">*</font>
<s:radio name="outputFormat_"
list="#{ 'MFA':'Multi-FASTA' , 'clustal':'ClustalW' }" onclick="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#numConsistencyReps')">Number of passes of consistency transformation (--consistency)</A>
<font color="red" size="3">*</font>
<s:select name="numConsistencyReps_" list="#{ '0':'0' , '1':'1' , '2':'2' , '3':'3' , '4':'4' , '5':'5' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#numRefinementReps')">Number of passes of iterative refinement, up to 1000 (--iterative-refinement)</A>
<font color="red" size="3">*</font>
<s:textfield name="numRefinementReps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#numPretrainingReps')">Number of rounds of pretraining, up to 20 (--pre-training)</A>
<font color="red" size="3">*</font>
<s:textfield name="numPretrainingReps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pairwise')">Generate only pairwise alignments? (-pairs)</A>
<font color="red" size="3">*</font>
<s:checkbox name="pairwise_" onclick="resolveParameters()"/>
<br/>
Use Viterbi decoding (-<A HREF="javascript:help.slidedownandjump('#viterbi')">viterbi</A>)
<font color="red" size="3">+</font>
<s:checkbox name="viterbi_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#writeAnnotation')">Write annotation for multiple alignment (-annot)</A>
<font color="red" size="3">*</font>
<s:checkbox name="writeAnnotation_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#writeTraining')">Write EM transition probabilities (--train)</A>
<font color="red" size="3">*</font>
<s:checkbox name="writeTraining_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#paramsFile')">Trained ProbCons parameter file (--paramfile)</A>
<font color="red" size="3">*</font>
<s:select name="paramsFile_" headerKey='' headerValue='' list="%{ getDataForParameter('paramsFile_')}" onchange="resolveParameters()"/>
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
<dd>Amino acid inputs are processed by ProbCons version 1.12; nucleic acid inputs are</dd><dd>processed by ProbConsRNA.</dd>
<dt><a name=outputFormat><i>Output file format</i></a></dt>
<dd>For detailed descriptions of the Multi-FASTA and ClustalW formats, please consult</dd><dd>the ProbCons User Manual at http://probcons.stanford.edu/.</dd>
<dt><a name=numConsistencyReps><i>Number of passes of consistency transformation (--consistency)</i></a></dt>
<dd>Each pass applies one round of the consistency transformation on the set of</dd><dd>sequences. The consistency transformation is described in detail in the</dd><dd>publication. In each round, the aligner computes the consistency transformation</dd><dd>for each pair of sequences using all other sequences. The aligner then updates</dd><dd>the posterior probability matrices of the pairwise alignments.</dd>
<dt><a name=numRefinementReps><i>Number of passes of iterative refinement, up to 1000 (--iterative-refinement)</i></a></dt>
<dd>This specifies the number of iterations of iterative refinement to be performed.</dd><dd>In each stage of iterative refinement, the set of sequences in the alignment is</dd><dd>randomly partitioned into two groups. After projecting the alignments to these</dd><dd>groups, the two groups are realigned, resulting in an alignment whose objective</dd><dd>score is guaranteed to be at least that of the original alignment.</dd>
<dt><a name=numPretrainingReps><i>Number of rounds of pretraining, up to 20 (--pre-training)</i></a></dt>
<dd>This specifies the number of rounds of EM to be applied on the set of sequences</dd><dd>being aligned. This option is used in case the default parameters are not</dd><dd>appropriate for the particular sequences being aligned; in general, this option</dd><dd>is not recommended as it may lead to unstable alignment parameters.</dd>
<dt><a name=pairwise><i>Generate only pairwise alignments? (-pairs)</i></a></dt>
<dd>When this option is selected, PROBCONS generates all pairs pairwise maximum</dd><dd>expected accuracy alignments using the posterior matrices without generating a</dd><dd>full multiple alignment. The names of the files are based on the header comments</dd><dd>for each of the sequences in the original input file with .fasta appended. When</dd><dd>the clustalw output option is selected, then .aln is used as a suffix instead.</dd>
<dt><a name=viterbi><i>Use Viterbi decoding (-viterbi)</i></a></dt>
<dd>Generates all-pairs pairwise alignments using the Viterbi algorithm. Note that</dd><dd>this option requires the -pairs option to be enabled. This option is not</dd><dd>recommended but is available for comparison to the maximum expected accuracy</dd><dd>alignments.</dd>
<dt><a name=writeAnnotation><i>Write annotation for multiple alignment (-annot)</i></a></dt>
<dd>Turning on this option causes the program to write quality scores for columns in</dd><dd>the produced alignment to a file called output.annotations. The quality score</dd><dd>for each column of the alignment is given on a separate line and is an integer</dd><dd>between 0 and 100 inclusive, representing the expected percentage of correct</dd><dd>pairwise matches in the column. Columns containing only one non-gap character</dd><dd>automatically have quality score 0.</dd>
<dt><a name=writeTraining><i>Write EM transition probabilities (--train)</i></a></dt>
<dd>This option is used to train the aligner using a set of sequences. The test</dd><dd>sequences are read from the specified input file. This performs exactly one</dd><dd>round of EM training on the sequences; multiple calls to PROBCONS are needed in</dd><dd>order to obtain convergence. The training parameters are written to a file</dd><dd>called trained.params as three lines:</dd><dd> initMatchProb initInsertXProb initInsertYProb</dd><dd> startInsertXProb startInsertYProb</dd><dd> extendInsertXProb extendInsertYProb</dd>
<dt><a name=paramsFile><i>Trained ProbCons parameter file (--paramfile)</i></a></dt>
<dd>Reads initial/final and transition probabilities from a user-specified file.</dd><dd>This file should specify the initial/final probabilities and transition</dd><dd>probabilities for the HMM model used by the aligner. The HMM model consists of</dd><dd>a Match state, an Insert X state, and an Insert Y state, and is described in</dd><dd>more detail in the publication. The file format consists of three lines,</dd><dd> containing:</dd><dd> initMatchProb initInsertXProb initInsertYProb</dd><dd> startInsertXProb startInsertYProb</dd><dd> extendInsertXProb extendInsertYProb</dd>
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
// outputFormat
// numConsistencyReps
// numRefinementReps
// numPretrainingReps
// pairwise
// viterbi
if (getValue('pairwise_'))
enable('viterbi_');
else disable('viterbi_');
// writeAnnotation
// writeTraining
// paramsFile
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// sequenceType
// outputFormat
// numConsistencyReps
// numRefinementReps
if (getValue('numRefinementReps_') < 0 || getValue('numRefinementReps_') > 1000) {
alert('Values for "--iterative-refinement" must be between 0 and 1000, inclusive.');
return false;
}
// numPretrainingReps
if (getValue('numPretrainingReps_') < 0 || getValue('numPretrainingReps_') > 20) {
alert('Values for "--pre-training" must be between 0 and 20, inclusive.');
return false;
}
// pairwise
// viterbi
// writeAnnotation
// writeTraining
// paramsFile
return issueWarning();
}
function issueWarning() {
// runtime
// sequenceType
// outputFormat
// numConsistencyReps
// numRefinementReps
// numPretrainingReps
// pairwise
// viterbi
// writeAnnotation
// writeTraining
// paramsFile
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
var element = document.forms['probcons'].elements[parameter];
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
var element = document.forms['probcons'].elements[parameter];
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
var element = document.forms['probcons'].elements[parameter];
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