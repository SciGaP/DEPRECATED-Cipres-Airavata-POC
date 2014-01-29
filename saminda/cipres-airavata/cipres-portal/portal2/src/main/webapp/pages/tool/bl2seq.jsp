<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Bl2Seq</title>
<h2>Bl2Seq: Blast 2 sequences, DNA or Protein (NCBI) (<a href="#REFERENCE">Altschul, Madden, Schaeffer, Zhang, Miller, Lipman</a>)</h2>
<s:form action="bl2seq" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#bl2seq')">Blast program</A>
<font color="red" size="3">*</font>
<s:select name="bl2seq_" list="#{ 'blastp':'blastp: protein / protein' , 'blastn':'blastn: nucleotide / nucleotide' , 'blastx':'blastx: nucleotide / protein' , 'tblastn':'tblastn : protein / nucleotide' , 'tblastx':'tblastx: nucleotide / nucleotide' }" onchange="resolveParameters()"/>
<br/>
<br/>
Second sequence (-j)
<font color="red" size="3">*</font>
<s:select name="second_sequence_" headerKey='' headerValue='' list="%{ getDataForParameter('second_sequence_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Expect')">Expect: upper bound on the expected frequency of chance occurrence of a set of HSPs (-e)</A>
<s:textfield name="Expect_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Query strands to search against database (-S)
<font color="red" size="3">*</font>
<s:radio name="strand_"
list="#{ '1':'1: top' , '2':'2: bottom' , '3':'3: both' }" onclick="resolveParameters()"/>
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
Location on first sequence (-I)
<s:textfield name="first_seq_loc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Location on second sequence (-J)
<s:textfield name="second_seq_loc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=filter_opt><h2><A HREF="javascript:help.slidedownandjump('#filter_opt_comment')">Filtering and masking options</A></H2>
Filter query sequence (DUST with blastn, SEG with others) (-F)
<s:checkbox name="filter_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#other_filters')">Filtering options (-F must be true)</A>
<s:select name="other_filters_" headerKey='' headerValue='' list="#{ 'v1':'masking instead of filtering (with Seg)' , 'v2':'coiled-coil filter' , 'v3':'both seg and coiled-coil filters' , 'v4':'dust filter (DNA query)' , 'v5':'lower-case masking (-U must be true)' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#lower_case')">Use lower case filtering (-U)</A>
<s:checkbox name="lower_case_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=selectivity_opt><h2><A HREF="javascript:help.slidedownandjump('#selectivity_opt_comment')">Selectivity options</A></H2>
Wordsize (-W) (zero invokes default behavior)
<s:textfield name="word_size_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Perform gapped alignment (-g)
<s:checkbox name="gapped_alig_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff')">X dropoff value for gapped alignment (in bits) (-X)</A>
<s:textfield name="dropoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gap_open')">Cost to open a gap (-G)</A>
<s:textfield name="gap_open_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gap_extend')">Cost to extend a gap (-E)</A>
<s:textfield name="gap_extend_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Matrix (-M)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'PAM30':'PAM30' , 'PAM70':'PAM70' , 'BLOSUM80':'BLOSUM80' , 'BLOSUM62':'BLOSUM62' , 'BLOSUM45':'BLOSUM45' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=blastn_opt><h2><A HREF="javascript:help.slidedownandjump('#blastn_opt_comment')">BLASTN Options</A></H2>
Penalty for a nucleotide mismatch (-q)
<s:textfield name="mismatch_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Reward for a nucleotide match (-r)
<s:textfield name="match_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=othersopt><h2><A HREF="javascript:help.slidedownandjump('#othersopt_comment')">Other Options</A></H2>
theor. db size (zero is real size) (-d)
<s:textfield name="dbsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Effective length of the search space (use zero for the real size) (-Y)
<s:textfield name="searchspacesize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output_opt><h2><A HREF="javascript:help.slidedownandjump('#output_opt_comment')">Output options</A></H2>
Output format (-D)
<s:radio name="outformat_"
list="#{ '': '[Not Mandatory]', '0':'0: traditional' , '1':'1: tabulated' }" onclick="resolveParameters()"/>
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
<dt><a name=bl2seq><i>Blast program</i></a></dt>
<dd>Program name: blastp, blastn, blastx, tblastn, tblastx. For blastx 1st sequence should be nucleotide, tblastn 2nd sequence nucleotide</dd>
<dt><a name=Expect><i>Expect: upper bound on the expected frequency of chance occurrence of a set of HSPs (-e)</i></a></dt>
<dd>The statistical significance threshold for reporting matches against database sequences; the default value is 10, such that 10 matches are expected to be found merely by chance, according to the stochastic model of Karlin and Altschul (1990). If the statistical significance ascribed to a match is greater than the EXPECT threshold, the match will not be reported. Lower EXPECT thresholds are more stringent, leading to fewer chance matches being reported. Fractional values are acceptable. </dd>
<br></br>
<dt><a name=filter_opt_comment><i><b>Filtering and masking options</b></i></a></dt>
<dd>
</dd><dd>Mask off segments of the query sequence that have low compositional complexity, as determined by the SEG program of Wootton & Federhen (Computers and Chemistry, 1993) or, for BLASTN, by the DUST program of Tatusov and Lipman (in preparation). Filtering can eliminate statistically significant but biologically uninteresting reports from the blast output (e.g., hits against common acidic-, basic- or proline-rich regions), leaving the more biologically interesting regions of the query sequence available for specific matching against database sequences.</dd><dd>
</dd><dd>Filtering is only applied to the query sequence (or its translation products), not to database sequences. Default filtering is DUST for BLASTN, SEG for other programs. It is not unusual for nothing at all to be masked by SEG, when applied to sequences in SWISS-PROT, so filtering should not be expected to always yield an effect. Furthermore, in some cases, sequences are masked in their entirety, indicating that the statistical significance of any matches reported against the unfiltered query sequence should be suspect.</dd><dd>
</dd>
<dt><a name=other_filters><i>Filtering options (-F must be true)</i></a></dt>
<dd>The -F argument can take a string as input to specify that seg should be run with certain values, or that other non-standard filters should be used.</dd><dd> For example, a coiled-coil filter may be invoked by specifying: -F 'C' . The filter is based on the work of Lupas et al. [Science, vol 252, pp. 1162-4 (1991)] written by John Kuzio [Wilson et al., J Gen Virol, vol. 76, pp. 2923-32 (1995)]</dd><dd> One may also run both seg and coiled-coil together by using a semi colon: -F 'C;S'</dd><dd> Filtering by DUST may also be specified by capital D: -F 'D'</dd><dd> To specify that masking should only be done during the process of building the initial words, prepend the filtering command with the letter 'm', e.g.: -F 'm S' </dd><dd> This specifies that seg (with default arguments) should be used for masking, but that the masking should only be done when the words are being built.</dd><dd> If the -U option is used to mask any lower-case sequence in the input FASTA file; and one wishes to mask ONLY when building the lookup tables, specify: -F 'm' </dd>
<dt><a name=lower_case><i>Use lower case filtering (-U)</i></a></dt>
<dd> This option specifies that any lower-case letters in the input FASTA file should be masked.</dd>
<br></br>
<dt><a name=selectivity_opt_comment><i><b>Selectivity options</b></i></a></dt>
<dt><a name=dropoff><i>X dropoff value for gapped alignment (in bits) (-X)</i></a></dt>
<dd>This is the value that controls the path graph region explored by Blast during a gapped extension (Xg in the NAR paper) (default for blastp is 15).</dd>
<dt><a name=gap_open><i>Cost to open a gap (-G)</i></a></dt>
<dd>default is 5 for blastn, 10 for blastp</dd>
<dt><a name=gap_extend><i>Cost to extend a gap (-E)</i></a></dt>
<dd>default is 2 for blastn, 1 for blastp</dd><dd>Limited values for gap existence and extension are supported for these three programs. Some supported and suggested values are:</dd><dd>Existence Extension</dd><dd>10 1</dd><dd>10 2</dd><dd>11 1</dd><dd>8 2</dd><dd>9 2</dd><dd>(source: NCBI Blast page)</dd>
<br></br>
<dt><a name=blastn_opt_comment><i><b>BLASTN Options</b></i></a></dt>
<br></br>
<dt><a name=othersopt_comment><i><b>Other Options</b></i></a></dt>
<br></br>
<dt><a name=output_opt_comment><i><b>Output options</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// bl2seq
// first_seq_loc
// second_sequence
// second_seq_loc
// Expect
// filter
// other_filters
// lower_case
// word_size
// gapped_alig
// dropoff
// gap_open
// gap_extend
// matrix
// mismatch
if (getValue('bl2seq_')=="blastn")
enable('mismatch_');
else disable('mismatch_');
// match
if (getValue('bl2seq_')=="blastn")
enable('match_');
else disable('match_');
// strand
if (getValue('bl2seq_')=="blastn")
enable('strand_');
else disable('strand_');
// dbsize
// searchspacesize
// outformat
}
function validateControl() {
// bl2seq
// first_seq_loc
// second_sequence
// second_seq_loc
// Expect
// filter
// other_filters
// lower_case
// word_size
// gapped_alig
// dropoff
// gap_open
// gap_extend
// matrix
// mismatch
// match
// strand
// dbsize
// searchspacesize
// outformat
return issueWarning();
}
function issueWarning() {
// bl2seq
// first_seq_loc
// second_sequence
// second_seq_loc
// Expect
// filter
// other_filters
// lower_case
// word_size
// gapped_alig
// dropoff
// gap_open
// gap_extend
// matrix
// mismatch
// match
// strand
// dbsize
// searchspacesize
// outformat
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
var element = document.forms['bl2seq'].elements[parameter];
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
var element = document.forms['bl2seq'].elements[parameter];
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
var element = document.forms['bl2seq'].elements[parameter];
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