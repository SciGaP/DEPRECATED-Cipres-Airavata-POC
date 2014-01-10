<%@ taglib prefix="s" uri="/struts-tags" %>
<title>BlastX</title>
<h2>BlastX: Compare a Translated NS to PS DBs (<a href="#REFERENCE">Altschul, Madden, Schaeffer, Zhang, Miller, Lipman</a>)</h2>
<s:form action="blastx" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#blast2')">Blast program</A>
<font color="red" size="3">*</font>
<s:radio name="blast2_"
list="#{ 'blastx':'blastx: nucleotide query translated / protein db' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#protein_db')">protein db</A>
<font color="red" size="3">*</font>
<s:select name="protein_db_" list="#{ 'UNIPROT':'UNIPROT' , 'SWISSPROT':'SWISSPROT' , 'TREMBL':'TREMBL' , 'PDBSEQ':'PDB' , 'REFSEQ_FUNGI_PROTEIN':'RefSeq Fungal' , 'REFSEQ_INV_PROTEIN':'RefSeq Invertebrate' , 'REFSEQ_MICRO_PROTEIN':'RefSeq Microbial' , 'REFSEQ_MITO_PROTEIN':'RefSeq Mitochondrion' , 'REFSEQ_PLANT_PROTEIN':'RefSeq Plant' , 'REFSEQ_PLASM_PROTEIN':'RefSeq Plasmid' , 'REFSEQ_PLAST_PROTEIN':'RefSeq Plastid' , 'REFSEQ_PROT_PROTEIN':'RefSeq Protozoa' , 'REFSEQ_VERTM_PROTEIN':'RefSeq Mammalian' , 'REFSEQ_VERTO_PROTEIN':'RefSeq Other Vertebrates' , 'REFSEQ_VIRAL_PROTEIN':'RefSeq Viral' , 'TPA_PROTEIN':'GenBank Third-Party Annotation' , 'UNIMES':'Uniprot UNIMES' , 'UNIREF100':'UNIPROT Uniref100' , 'NCBI_NR':'NCBI_NR: NCBI Non-Redundant' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Expect')">Expect: upper bound on the expected frequency of chance occurrence of a set of HSPs (-e)</A>
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
Start of required region in query sequence (-L)
<s:textfield name="start_region_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
End of required region in query sequence (-L)
<s:textfield name="end_region_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=filter_opt><h2><A HREF="javascript:help.slidedownandjump('#filter_opt_comment')">Filtering and masking options</A></H2>
Filter query sequence (DUST with blastn, SEG with others) (-F)
<s:checkbox name="filter_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#other_filters')">Filtering options (-F must be true)</A>
<s:select name="other_filters_" headerKey='' headerValue='' list="#{ 'v1':'masking instead of filtering (with Seg)' , 'v2':'coiled-coiled filter' , 'v3':'both seg and coiled-coiled filters' , 'v4':'DUST filter (DNA query)' , 'v5':'lower-case masking (-U must be true)' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#lower_case')">Use lower case filtering (-U)</A>
<s:checkbox name="lower_case_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=selectivity_opt><h2><A HREF="javascript:help.slidedownandjump('#selectivity_opt_comment')">Selectivity options</A></H2>
Word Size (-W) (zero invokes default behavior)
<s:textfield name="word_size_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Multiple Hits window size (zero for single hit algorithm) (-A)
<s:textfield name="dist_hits_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extend_hit')">Threshold for extending hits (-f)</A>
<s:textfield name="extend_hit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
X dropoff for blast extention in bits (0.0 invokes default behavior) (-y)
<s:textfield name="dropoff_extent_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#keep_hits')">Number of best hits from region to keep (-K)</A>
<s:textfield name="keep_hits_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Perform gapped alignment (not available with tblastx) (-g)
<s:checkbox name="gapped_alig_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff')">X dropoff value for gapped alignment (in bits) (-X)</A>
<s:textfield name="dropoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
X dropoff value for final alignment (in bits) (-Z)
<s:textfield name="dropoff_final_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=scoring_opt><h2><A HREF="javascript:help.slidedownandjump('#scoring_opt_comment')">Scoring options</A></H2>
Penalty for a nucleotide mismatch (blastn) (-q)
<s:textfield name="mismatch_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Reward for a nucleotide match (blastn) (-r)
<s:textfield name="match_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Matrix (-M)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'BLOSUM62':'BLOSUM62' , 'BLOSUM45':'BLOSUM45' , 'BLOSUM80':'BLOSUM80' , 'PAM30':'PAM30' , 'PAM70':'PAM70' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#open_a_gap')">Cost to open a gap (-G)</A>
<s:textfield name="open_a_gap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extend_a_gap')">Cost to extend a gap (-E)</A>
<s:textfield name="extend_a_gap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=translation_opt><h2><A HREF="javascript:help.slidedownandjump('#translation_opt_comment')">Translation options</A></H2>
Query Genetic code to use (blastx) (-Q)
<s:select name="gc_query_" headerKey='' headerValue='' list="#{ '1':'1: Standard' , '2':'2: Vertebrate Mitochondrial' , '3':'3: Yeast Mitochondrial' , '4':'4: Mold, Protozoan, Coelenterate Mitochondrial and Mycoplasma/Spiroplasma' , '5':'5: Invertebrate Mitochondrial' , '6':'6: Ciliate Macronuclear and Dasycladacean' , '9':'9: Echinoderm Mitochondrial' , '10':'10: Euplotid Nuclear' , '11':'11: Bacterial' , '12':'12: Alternative Yeast Nuclear' , '13':'13: Ascidian Mitochondrial' , '14':'14: Flatworm Mitochondrial' , '15':'15: Blepharisma Macronuclear' }" onchange="resolveParameters()"/>
<br/>
<br/>
DB Genetic code (for tblast[nx] only) (-D)
<s:select name="gc_db_" headerKey='' headerValue='' list="#{ '1':'1: Standard' , '2':'2: Vertebrate Mitochondrial' , '3':'3: Yeast Mitochondrial' , '4':'4: Mold, Protozoan, Coelenterate Mitochondrial and Mycoplasma/Spiroplasma' , '5':'5: Invertebrate Mitochondrial' , '6':'6: Ciliate Macronuclear and Dasycladacean' , '9':'9: Echinoderm Mitochondrial' , '10':'10: Euplotid Nuclear' , '11':'11: Bacterial' , '12':'12: Alternative Yeast Nuclear' , '13':'13: Ascidian Mitochondrial' , '14':'14: Flatworm Mitochondrial' , '15':'15: Blepharisma Macronuclear' }" onchange="resolveParameters()"/>
<br/>
<br/>
Query strand to search against database (for blastx and tblastx) (-S)
<s:radio name="strand_"
list="#{ '': '[Not Mandatory]', '1':'1: top' , '2':'2: bottom' , '3':'3:both' }" onclick="resolveParameters()"/>
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
<s:select name="view_alignments_" headerKey='' headerValue='' list="#{ '0':'0: pairwise' , '1':'1: query-anchored showing identities' , '2':'2: query-anchored no identities' , '3':'3: flat query-anchored, show identities' , '4':'4: flat query-anchored, no identities' , '5':'5: query-anchored no identities and blunt ends' , '6':'6: flat query-anchored, no identities and blunt ends' , '8':'8: Tabular output' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#show_gi')">Show GI's in deflines (only available for NCBI db such as nrprot) (-I)</A>
<s:checkbox name="show_gi_" onclick="resolveParameters()"/>
<br/>
Believe the query defline (-J)
<s:checkbox name="believe_" onclick="resolveParameters()"/>
<br/>
Html output
<s:checkbox name="htmloutput_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=htmlopt><h2><A HREF="javascript:help.slidedownandjump('#htmlopt_comment')">HTML output options (html4blast)</A></H2>
<A HREF="javascript:help.slidedownandjump('#external_links')">Use external web sites for databases entries retrieval links (-e instead of -s)</A>
<s:checkbox name="external_links_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#one_HSP_per_line')">Draw one HSP per line in image instead of putting all HSP in one line (-l)</A>
<s:checkbox name="one_HSP_per_line_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#image_query')">Generate images names based on corresponding query (-q)</A>
<s:checkbox name="image_query_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=othersopt><h2><A HREF="javascript:help.slidedownandjump('#othersopt_comment')">Other Options</A></H2>
Restrict search of database to GI's in file (-l)
<s:select name="restrict_db_" headerKey='' headerValue='' list="%{ getDataForParameter('restrict_db_')}" onchange="resolveParameters()"/>
<br/>
PSI-TBLASTN checkpoint file (-R)
<s:select name="psi_checkpoint_" headerKey='' headerValue='' list="%{ getDataForParameter('psi_checkpoint_')}" onchange="resolveParameters()"/>
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
<dt><a name=blast2><i>Blast program</i></a></dt>
<dd>blastx compares the six-frame conceptual translation products of a nucleotide query sequence (both strands) against a protein sequence database</dd>
<dt><a name=protein_db><i>protein db</i></a></dt>
<dd>Choose a protein db for blastp or blastx.</dd><dd>Please note that Swissprot usage by and for commercial entities requires a license agreement.</dd>
<br></br>
<dt><a name=filter_opt_comment><i><b>Filtering and masking options</b></i></a></dt>
<dd>
</dd><dd>BLAST 2.0 and 2.1 uses the DUST low-complexity filter for blastn and seg for the other programs. Both 'DUST' and 'seg' are integral parts of the NCBI toolkit and are accessed automatically.</dd><dd>
</dd><dd>If one uses '-F T' then normal filtering by seg or DUST (for blastn) occurs (likewise '-F F' means no filtering whatsoever). </dd><dd>
</dd><dd>This option also takes a string as an argument. One may use such a string to change the specific parameters of seg or invoke other filters. Please see the 'Filtering Strings' section (below) for details.</dd><dd>
</dd>
<dt><a name=other_filters><i>Filtering options (-F must be true)</i></a></dt>
<dd>The -F argument can take a string as input to specify that seg should be run with certain values, or that other non-standard filters should be used.</dd><dd> For example, a coiled-coil filter may be invoked by specifying: -F 'C' . The filter is based on the work of Lupas et al. [Science, vol 252, pp. 1162-4 (1991)] written by John Kuzio [Wilson et al., J Gen Virol, vol. 76, pp. 2923-32 (1995)]</dd><dd> One may also run both seg and coiled-coil together by using a semi colon: -F 'C;S'</dd><dd> Filtering by DUST may also be specified by capital D: -F 'D'</dd><dd> To specify that masking should only be done during the process of building the initial words, prepend the filtering command with the letter 'm', e.g.: -F 'm S' </dd><dd> This specifies that seg (with default arguments) should be used for masking, but that the masking should only be done when the words are being built.</dd><dd> If the -U option is used to mask any lower-case sequence in the input FASTA file; and one wishes to mask ONLY when building the lookup tables, specify: -F 'm' </dd>
<dt><a name=lower_case><i>Use lower case filtering (-U)</i></a></dt>
<dd> This option specifies that any lower-case letters in the input FASTA file should be masked.</dd>
<br></br>
<dt><a name=selectivity_opt_comment><i><b>Selectivity options</b></i></a></dt>
<dd>
</dd><dd>The programs blastn and blastp offer fully gapped alignments. blastx and tblastn offer 'in-frame' gapped alignments and use sum statistics to link alignments from different frames. tblastx provides only ungapped alignments.</dd><dd>
</dd>
<dt><a name=Expect><i>Expect: upper bound on the expected frequency of chance occurrence of a set of HSPs (-e)</i></a></dt>
<dd>The statistical significance threshold for reporting matches against database sequences; the default value is 10, such that 10 matches are expected to be found merely by chance, according to the stochastic model of Karlin and Altschul (1990). If the statistical significance ascribed to a match is greater than the EXPECT threshold, the match will not be reported. Lower EXPECT thresholds are more stringent, leading to fewer chance matches being reported. Fractional values are acceptable. </dd>
<dt><a name=extend_hit><i>Threshold for extending hits (-f)</i></a></dt>
<dd>Blast first searches for short word pairs whose aligned score reaches at least this Threshold value (default for blastp is 11) (T in the NAR paper and in Blast 1.4)</dd>
<dt><a name=keep_hits><i>Number of best hits from region to keep (-K)</i></a></dt>
<dd>If this option is used a value of 100 is recommended.</dd>
<dt><a name=dropoff><i>X dropoff value for gapped alignment (in bits) (-X)</i></a></dt>
<dd>This value controls the path graph region explored by Blast during a gapped extension (Xg in the NAR paper) (default for blastp is 15).</dd>
<br></br>
<dt><a name=scoring_opt_comment><i><b>Scoring options</b></i></a></dt>
<dt><a name=open_a_gap><i>Cost to open a gap (-G)</i></a></dt>
<dd>for blastn default=5, for blastp, blastx and tblastn default=10</dd>
<dt><a name=extend_a_gap><i>Cost to extend a gap (-E)</i></a></dt>
<dd>for blastn default=2, for blastp, blastx and tblastn default=1</dd><dd>Limited values for gap existence and extension are supported for these three programs. Some supported and suggested values are:</dd><dd>Existence Extension</dd><dd>10 1</dd><dd>10 2</dd><dd>11 1</dd><dd>8 2</dd><dd>9 2</dd><dd>(source: NCBI Blast page)</dd>
<br></br>
<dt><a name=translation_opt_comment><i><b>Translation options</b></i></a></dt>
<br></br>
<dt><a name=affichage_comment><i><b>Report options</b></i></a></dt>
<dt><a name=Descriptions><i>How many short descriptions? (-v)</i></a></dt>
<dd>Maximum number of database sequences for which one-line descriptions will be reported (-v).</dd>
<dt><a name=Alignments><i>How many alignments? (-b)</i></a></dt>
<dd>Maximum number of database sequences for which high-scoring segment pairs will be reported (-b).</dd>
<dt><a name=show_gi><i>Show GI's in deflines (only available for NCBI db such as nrprot) (-I)</i></a></dt>
<dd>Causes NCBI gi identifiers to be shown in the output along with the accession and/or locus name. </dd><dd>Warning: only available for NCBI db's such as nrprot.</dd>
<dt><a name=seqalign_file><i>SeqAlign file (-J option must be true) (-O)</i></a></dt>
<dd>SeqAlign is in ASN.1 format, so it can be read with NCBI tools (such as sequin). This allows one to view the results in different formats.</dd>
<br></br>
<dt><a name=htmlopt_comment><i><b>HTML output options (html4blast)</b></i></a></dt>
<dt><a name=external_links><i>Use external web sites for databases entries retrieval links (-e instead of -s)</i></a></dt>
<dd>-s option will use SRS for databases entries retrieval links, whereas -e will use the original database site links.</dd>
<dt><a name=one_HSP_per_line><i>Draw one HSP per line in image instead of putting all HSP in one line (-l)</i></a></dt>
<dd>Useful for searching genomes, where there is only one sequence in the database.</dd>
<dt><a name=image_query><i>Generate images names based on corresponding query (-q)</i></a></dt>
<dd>Useful when you only want to keep the image.</dd>
<br></br>
<dt><a name=othersopt_comment><i><b>Other Options</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// blast2
// start_region
// end_region
if (getValue('start_region_'))
enable('end_region_');
else disable('end_region_');
// protein_db
if (getValue('blast2_').match("^blast[px]"))
enable('protein_db_');
else disable('protein_db_');
// filter
// other_filters
// lower_case
// Expect
// word_size
// dist_hits
// extend_hit
// dropoff_extent
// keep_hits
// gapped_alig
if (getValue('blast2_')!="tblastx")
enable('gapped_alig_');
else disable('gapped_alig_');
// dropoff
// dropoff_final
// mismatch
if (getValue('blast2_')=="blastn")
enable('mismatch_');
else disable('mismatch_');
// match
if (getValue('blast2_')=="blastn")
enable('match_');
else disable('match_');
// matrix
if (getValue('blast2_')!="blastn")
enable('matrix_');
else disable('matrix_');
// open_a_gap
// extend_a_gap
// gc_query
if (getValue('blast2_').match("blastx"))
enable('gc_query_');
else disable('gc_query_');
// gc_db
if (getValue('blast2_').match("^tblast"))
enable('gc_db_');
else disable('gc_db_');
// strand
if (getValue('blast2_').match("blastx"))
enable('strand_');
else disable('strand_');
// Descriptions
// Alignments
// view_alignments
if (getValue('blast2_').match("blastx")==null)
enable('view_alignments_');
else disable('view_alignments_');
// show_gi
if (getValue('protein_db_')=="nrprot")
enable('show_gi_');
else disable('show_gi_');
// believe
// htmloutput
if ( (getValue('view_alignments_').match("^[78]"))==null)
enable('htmloutput_');
else disable('htmloutput_');
// external_links
if (getValue('htmloutput_') && (getValue('view_alignments_').match("^[78]"))==null)
enable('external_links_');
else disable('external_links_');
// one_HSP_per_line
if (getValue('htmloutput_') && (getValue('view_alignments_').match("^[78]"))==null)
enable('one_HSP_per_line_');
else disable('one_HSP_per_line_');
// image_query
if (getValue('htmloutput_') && (getValue('view_alignments_').match("^[78]"))==null)
enable('image_query_');
else disable('image_query_');
// restrict_db
if (getValue('protein_db_')=="nrprot")
enable('restrict_db_');
else disable('restrict_db_');
// psi_checkpoint
if (getValue('blast2_')=="psitblastn")
enable('psi_checkpoint_');
else disable('psi_checkpoint_');
}
function validateControl() {
// blast2
// start_region
// end_region
// protein_db
// filter
// other_filters
// lower_case
// Expect
// word_size
// dist_hits
// extend_hit
// dropoff_extent
// keep_hits
// gapped_alig
// dropoff
// dropoff_final
// mismatch
// match
// matrix
// open_a_gap
// extend_a_gap
// gc_query
// gc_db
// strand
// Descriptions
// Alignments
// view_alignments
// show_gi
// believe
// htmloutput
// external_links
// one_HSP_per_line
// image_query
// restrict_db
// psi_checkpoint
return issueWarning();
}
function issueWarning() {
// blast2
// start_region
// end_region
// protein_db
// filter
// other_filters
// lower_case
// Expect
// word_size
// dist_hits
// extend_hit
// dropoff_extent
// keep_hits
// gapped_alig
// dropoff
// dropoff_final
// mismatch
// match
// matrix
// open_a_gap
// extend_a_gap
// gc_query
// gc_db
// strand
// Descriptions
// Alignments
// view_alignments
// show_gi
// believe
// htmloutput
// external_links
// one_HSP_per_line
// image_query
// restrict_db
// psi_checkpoint
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
var element = document.forms['blastx'].elements[parameter];
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
var element = document.forms['blastx'].elements[parameter];
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
var element = document.forms['blastx'].elements[parameter];
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