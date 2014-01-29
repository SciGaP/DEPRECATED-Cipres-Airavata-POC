<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PSI-Blast</title>
<h2>PSI-Blast: Position Specific Iterative Blast (<a href="#REFERENCE">Altschul, Madden, Schaeffer, Zhang, Miller, Lipman</a>)</h2>
<s:form action="psiblast" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#protein_db')">protein db (-d )</A>
<font color="red" size="3">*</font>
<s:select name="protein_db_" list="#{ 'UNIPROT':'UNIPROT' , 'SWISSPROT':'SWISSPROT' , 'TREMBL':'TREMBL' , 'PDBSEQ':'PDB' , 'REFSEQ_FUNGI_PROTEIN':'RefSeq Fungal' , 'REFSEQ_INV_PROTEIN':'RefSeq Invertebrate' , 'REFSEQ_MICRO_PROTEIN':'RefSeq Microbial' , 'REFSEQ_MITO_PROTEIN':'RefSeq Mitochondrion' , 'REFSEQ_PLANT_PROTEIN':'RefSeq Plant' , 'REFSEQ_PLASM_PROTEIN':'RefSeq Plasmid' , 'REFSEQ_PLAST_PROTEIN':'RefSeq Plastid' , 'REFSEQ_PROT_PROTEIN':'RefSeq Protozoa' , 'REFSEQ_VERTM_PROTEIN':'RefSeq Mammalian' , 'REFSEQ_VERTO_PROTEIN':'RefSeq Other Vertebrates' , 'REFSEQ_VIRAL_PROTEIN':'RefSeq Viral' , 'TPA_PROTEIN':'GenBank Third-Party Annotation' , 'UNIMES':'Uniprot UNIMES' , 'UNIREF100':'UNIPROT Uniref100' , 'NCBI_NR':'NCBI_NR: NCBI Non-Redundant' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Expect')">Expect value cutoff frequency of chance occurrence of a set of HSPs (-e)</A>
<s:textfield name="Expect_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
Start of required region in query (-S)
<s:textfield name="start_region_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
End of required region in query (-1 indicates end of query) (-H)
<s:textfield name="end_region_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=filter_opt><h2><A HREF="javascript:help.slidedownandjump('#filter_opt_comment')">Filtering and masking options</A></H2>
Filter query sequence with SEG (-F)
<s:checkbox name="filter_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=selectivity_opt><h2><A HREF="javascript:help.slidedownandjump('#selectivity_opt_comment')">Selectivity options</A></H2>
<A HREF="javascript:help.slidedownandjump('#window')">Multiple hits window size (zero for single hit algorithm) (-A)</A>
<s:textfield name="window_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extend_hit')">Threshold for extending hits (-f)</A>
<s:textfield name="extend_hit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff_y')">Dropoff for blast ungapped extensions in bits (-y)</A>
<s:textfield name="dropoff_y_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Perform gapped alignment (-g)
<s:checkbox name="gapped_alig_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff')">X dropoff value for gapped alignment (in bits) (-X)</A>
<s:textfield name="dropoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff_z')">X dropoff value for final gapped alignment (in bits) (-Z)</A>
<s:textfield name="dropoff_z_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Start of required region in query (-S)
<s:textfield name="word_size_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=scoring><h2><A HREF="javascript:help.slidedownandjump('#scoring_comment')">Scoring options</A></H2>
Matrix (-M)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'PAM30':'PAM30' , 'PAM70':'PAM70' , 'BLOSUM80':'BLOSUM80' , 'BLOSUM62':'BLOSUM62' , 'BLOSUM45':'BLOSUM45' }" onchange="resolveParameters()"/>
<br/>
<br/>
Cost to open a gap (-G)
<s:textfield name="open_a_gap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extend_a_gap')">Cost to extend a gap (-E)</A>
<s:textfield name="extend_a_gap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=psi_spec_opt><h2><A HREF="javascript:help.slidedownandjump('#psi_spec_opt_comment')">PSI-Blast specific selectivity options</A></H2>
Maximum number of passes to use in multipass version (-j)
<s:textfield name="max_passes_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
e-value threshold for inclusion in multipass model (-h)
<s:textfield name="expect_in_multipass_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pseudocounts')">Constant in pseudocounts for multipass version (-c)</A>
<s:textfield name="pseudocounts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#trigger')">Number of bits to trigger gapping (-N)</A>
<s:textfield name="trigger_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=affichage><h2><A HREF="javascript:help.slidedownandjump('#affichage_comment')">Report options</A></H2>
<A HREF="javascript:help.slidedownandjump('#Descriptions')">How many short descriptions? (-v)</A>
<s:textfield name="Descriptions_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Alignments')">How many alignments? (-b)</A>
<s:textfield name="Alignments_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Alignment view options (not with blastx/tblastx) (-m)
<s:select name="view_alignments_" headerKey='' headerValue='' list="#{ '0':'0: pairwise' , '1':'1: query-anchored showing identities' , '2':'2: query-anchored no identities' , '3':'3: flat query-anchored, show identities' , '4':'4: flat query-anchored, no identities' , '5':'5: query-anchored no identities and blunt ends' , '6':'6: flat query-anchored, no identities and blunt ends' , '7':'7: XML Blast output' , '8':'8: Tabular output' }" onchange="resolveParameters()"/>
<br/>
<br/>
HTML output
<s:checkbox name="htmloutput_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=scoremat_stuff><h2><A HREF="javascript:help.slidedownandjump('#scoremat_stuff_comment')">Input/Checkpoint data options</A></H2>
<A HREF="javascript:help.slidedownandjump('#alignment_restart')">Restart PSI Blast with an Input Alignment File (-B )</A>
<s:checkbox name="alignment_restart_" onclick="resolveParameters()"/>
<br/>
Input File for PSI-BLAST Restart
<s:select name="inalign_infile_" headerKey='' headerValue='' list="%{ getDataForParameter('inalign_infile_')}" onchange="resolveParameters()"/>
<br/>
Restart PSI-BLAST with a file (-R)
<s:checkbox name="restart_me_" onclick="resolveParameters()"/>
<br/>
Input File for PSI-BLAST Restart
<s:select name="checkpoint_infile_" headerKey='' headerValue='' list="%{ getDataForParameter('checkpoint_infile_')}" onchange="resolveParameters()"/>
<br/>
ASN.1 Scoremat input of checkpoint data: (-q)
<font color="red" size="3">+</font>
<s:radio name="scoremat_in_"
list="#{ '0':'No scoremat input' , '1':'Restart w/ASCII scoremat file' , '2':'Restart w/binary scoremat file' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=output_files><h2><A HREF="javascript:help.slidedownandjump('#output_files_comment')">Outputfile Options</A></H2>
Believe the query defline (-J)
<s:checkbox name="believe_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#seqalign_file')">Create a SeqAlign file (-O)</A>
<s:checkbox name="seqalign_file_" onclick="resolveParameters()"/>
<br/>
Save PSI-BLAST Matrix as text to file (-Q)
<s:checkbox name="save_matrix_txt_" onclick="resolveParameters()"/>
<br/>
Save PSI-Blast Matrix to a checkpointing file (-C)
<s:checkbox name="save_matrix_chk_" onclick="resolveParameters()"/>
<br/>
ASN.1 Scoremat output of checkpoint data (-u)
<font color="red" size="3">+</font>
<s:radio name="scoremat_out_"
list="#{ '0':'No scoremat output' , '1':'Output ASCII scoremat' , '2':'Output binary scoremat' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=><h2><A HREF="javascript:help.slidedownandjump('#_comment')">Composition Based Statistics</A></H2>
<A HREF="javascript:help.slidedownandjump('#comp_based_stats')"> Use composition based statistics (-t)</A>
<s:select name="comp_based_stats_" headerKey='' headerValue='' list="#{ '0':'No composition-based statistics' , '1':'Composition-based statistics' , '2':'Conditioned on round 1 sequence properties' , '3':'Unconditionally in round 1' }" onchange="resolveParameters()"/>
<br/>
<br/>
Unified p-value
<s:checkbox name="uni_p_" onclick="resolveParameters()"/>
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
<dt><a name=protein_db><i>protein db (-d )</i></a></dt>
<dd>Choose a protein database.</dd><dd>Please note that Swissprot usage by and for commercial entities requires a license agreement.</dd>
<br></br>
<dt><a name=filter_opt_comment><i><b>Filtering and masking options</b></i></a></dt>
<dd>
</dd><dd>This option also takes a string as an argument. One may use such a string to change the specific parameters of seg or invoke other filters. Please see the 'Filtering Strings' section (below) for details.</dd><dd>
</dd>
<br></br>
<dt><a name=selectivity_opt_comment><i><b>Selectivity options</b></i></a></dt>
<dt><a name=Expect><i>Expect value cutoff frequency of chance occurrence of a set of HSPs (-e)</i></a></dt>
<dd>The statistical significance threshold for reporting matches against database sequences; the default value is 10, such that 10 matches are expected to be found merely by chance, according to the stochastic model of Karlin and Altschul (1990). If the statistical significance ascribed to a match is greater than the EXPECT threshold, the match will not be reported. Lower EXPECT thresholds are more stringent, leading to fewer chance matches being reported. Fractional values are acceptable. </dd>
<dt><a name=window><i>Multiple hits window size (zero for single hit algorithm) (-A)</i></a></dt>
<dd>When multiple hits method is used, this parameter defines the distance from last hit on the same diagonal to the new one.</dd><dd>Zero means single hit algorithm.</dd>
<dt><a name=extend_hit><i>Threshold for extending hits (-f)</i></a></dt>
<dd>Blast first searhces for short word pairs whose aligned score reaches at least this Threshold value (default for blastp is 11) (T in the NAR paper and in Blast 1.4)</dd>
<dt><a name=dropoff_y><i>Dropoff for blast ungapped extensions in bits (-y)</i></a></dt>
<dd>This parameter controls the dropoff at ungapped extension stage. See also the -X parameter.</dd>
<dt><a name=dropoff><i>X dropoff value for gapped alignment (in bits) (-X)</i></a></dt>
<dd>This value controls the path graph region explored by Blast during a gapped extension (Xg in the NAR paper).</dd>
<dt><a name=dropoff_z><i>X dropoff value for final gapped alignment (in bits) (-Z)</i></a></dt>
<dd>This parameter controls the dropoff for the final reported alignment. See also the -X parameter.</dd>
<br></br>
<dt><a name=scoring_comment><i><b>Scoring options</b></i></a></dt>
<dt><a name=extend_a_gap><i>Cost to extend a gap (-E)</i></a></dt>
<dd>Limited values for gap existence and extension are supported for these three programs. Some supported and suggested values are:</dd><dd>Existence Extension</dd><dd>10 1</dd><dd>10 2</dd><dd>11 1</dd><dd>8 2</dd><dd>9 2</dd><dd>(source: NCBI Blast page)</dd>
<br></br>
<dt><a name=psi_spec_opt_comment><i><b>PSI-Blast specific selectivity options</b></i></a></dt>
<dt><a name=pseudocounts><i>Constant in pseudocounts for multipass version (-c)</i></a></dt>
<dd>This constant is the weight given to a pre-calculated residue target frequency (versus the observed one) in a column of the position specific matrix. The larger its value, the greater the emphasis given to prior knowledge of residue relationships vis a vis observed residue frequencies (beta constant in NAR paper).</dd>
<dt><a name=trigger><i>Number of bits to trigger gapping (-N)</i></a></dt>
<dd>Blast does first an ungapped extension of the hit to make an HSP. The gapped extension is triggered when the HSP score reaches this value (Sg in the NAR paper).</dd>
<br></br>
<dt><a name=affichage_comment><i><b>Report options</b></i></a></dt>
<dt><a name=Descriptions><i>How many short descriptions? (-v)</i></a></dt>
<dd>Maximum number of database sequences for which one-line descriptions will be reported (-v).</dd>
<dt><a name=Alignments><i>How many alignments? (-b)</i></a></dt>
<dd>Maximum number of database sequences for which high-scoring segment pairs will be reported (-b).</dd>
<br></br>
<dt><a name=scoremat_stuff_comment><i><b>Input/Checkpoint data options</b></i></a></dt>
<dt><a name=alignment_restart><i>Restart PSI Blast with an Input Alignment File (-B )</i></a></dt>
<dd>The -B flag provides a way to jump start PSI-BLAST from a master-slave multiple alignment computed outside PSI-BLAST. The multiple alignment must include the query sequence as one of the sequences, but it need not be the first sequence. The multiple alignment must be specified in a format that is derived from Clustal, but without some headers and trailers. See example below. The rules are also described by the following words. Suppose the multiple alignments has N sequences. It may be presented in 1 or more blocks, where each block presents a range of columns from the multiple alignment. E.g., the first block might have columns 1-60, the second block might have columns 61-95, the third block might have columns 96-128. Each block should have N rows, 1 row per sequence. The sequences should be in the same order in every block. Blocks are separated by 1 or more blank lines. Within a block there are no blank lines, and each line consists of 1 sequence identifier followed by some white space followed by characters (and gaps) for that sequence in the multiple alignment. In each column, all letters must be in upper case, or all letters must be in lower case. Upper case means that this column is to be given position-specific scores. Lower-case means to use the underlying matrix (specified by -M) for this column; e.g., if the query sequence has an 'l' residue in the column, then the standard scores for matching an L are used in the column.
</dd><dd>From: Aravind L, Ponting CP, Homologues of 26S proteasome subunits are regulators of transcription and translation, Protein Science 7(1998) 1250-1254.</dd>
<br></br>
<dt><a name=output_files_comment><i><b>Outputfile Options</b></i></a></dt>
<dt><a name=seqalign_file><i>Create a SeqAlign file (-O)</i></a></dt>
<dd>SeqAlign is in binary ASN.1 format so it can be read with NCBI tools (such as Sequin). This allows one to view the results in different formats.</dd>
<br></br>
<dt><a name=_comment><i><b>Composition Based Statistics</b></i></a></dt>
<dt><a name=comp_based_stats><i> Use composition based statistics (-t)</i></a></dt>
<dd>Composition-based statistics are as in Nucl. Acids Res. 29:2994 3005, 2001; Composition-based score adjustment conditioned on sequence properties in round 1; and unconditionally in round 1 are as in Bioinformatics 21:902-911, 2005. If composition-based statistics are selected, the unified p-value combining alignment p-value and compositional p-value in round 1 only can be added.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// start_region
// end_region
// protein_db
// filter
// Expect
// window
// extend_hit
// dropoff_y
// gapped_alig
// dropoff
// dropoff_z
// word_size
// matrix
// open_a_gap
// extend_a_gap
// max_passes
// expect_in_multipass
// pseudocounts
// trigger
// Descriptions
// Alignments
// view_alignments
// htmloutput
if (getValue('view_alignments_').match("^[78]")==null)
enable('htmloutput_');
else disable('htmloutput_');
// alignment_restart
// inalign_infile
if (getValue('alignment_restart_'))
enable('inalign_infile_');
else disable('inalign_infile_');
// restart_me
// checkpoint_infile
if (getValue('restart_me_'))
enable('checkpoint_infile_');
else disable('checkpoint_infile_');
// scoremat_in
if (getValue('restart_me_'))
enable('scoremat_in_');
else disable('scoremat_in_');
// believe
// seqalign_file
if (getValue('believe_'))
enable('seqalign_file_');
else disable('seqalign_file_');
// save_matrix_txt
// save_matrix_chk
if (getValue('believe_'))
enable('save_matrix_chk_');
else disable('save_matrix_chk_');
// scoremat_out
if (getValue('believe_'))
enable('scoremat_out_');
else disable('scoremat_out_');
// comp_based_stats
// uni_p
if (getValue('comp_based_stats_') !=0)
enable('uni_p_');
else disable('uni_p_');
}
function validateControl() {
// start_region
// end_region
// protein_db
// filter
// Expect
// window
// extend_hit
// dropoff_y
// gapped_alig
// dropoff
// dropoff_z
// word_size
// matrix
// open_a_gap
// extend_a_gap
// max_passes
if (getValue('max_passes_') <= 1 ) {
alert('for j = 1, you should use Blastp, not PSI Blast');
return false;
}
// expect_in_multipass
// pseudocounts
// trigger
// Descriptions
// Alignments
// view_alignments
// htmloutput
// alignment_restart
// inalign_infile
// restart_me
// checkpoint_infile
// scoremat_in
// believe
// seqalign_file
// save_matrix_txt
// save_matrix_chk
// scoremat_out
// comp_based_stats
// uni_p
return issueWarning();
}
function issueWarning() {
// start_region
// end_region
// protein_db
// filter
// Expect
// window
// extend_hit
// dropoff_y
// gapped_alig
// dropoff
// dropoff_z
// word_size
// matrix
// open_a_gap
// extend_a_gap
// max_passes
// expect_in_multipass
// pseudocounts
// trigger
// Descriptions
// Alignments
// view_alignments
// htmloutput
// alignment_restart
// inalign_infile
// restart_me
// checkpoint_infile
// scoremat_in
// believe
// seqalign_file
// save_matrix_txt
// save_matrix_chk
// scoremat_out
// comp_based_stats
// uni_p
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
var element = document.forms['psiblast'].elements[parameter];
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
var element = document.forms['psiblast'].elements[parameter];
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
var element = document.forms['psiblast'].elements[parameter];
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