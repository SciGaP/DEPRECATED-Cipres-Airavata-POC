<%@ taglib prefix="s" uri="/struts-tags" %>
<title>FastY</title>
<h2>FastY: Use Translated NS to Search PS DB for Similarity (<a href="#REFERENCE">W. Pearson</a>)</h2>
<s:form action="fasty" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
DNA sequence (-n)
<font color="red" size="3">*</font>
<s:radio name="seqtype_"
list="#{ 'DNA':'DNA' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#protein_db')">Protein Database</A>
<font color="red" size="3">*</font>
<s:select name="protein_db_" list="#{ 'UNIPROT.fasta':'UNIPROT' , 'SWISSPROT.fasta':'SWISSPROT' , 'TREMBL.fasta':'TREMBL' , 'PFILTUNIPROT.fasta':'PFILTUNIPROT' , 'PFILTTREMBL.fasta':'PFILTTREMBL' , 'PFILTSWISSPROT.fasta':'PFILTSWISSPROT' , 'PDBSEQ.fasta':'PDB' , 'REFSEQ_FUNGI_PROTEIN.fasta':'RefSeq Fungal' , 'REFSEQ_INV_PROTEIN.fasta':'RefSeq Invertebrate' , 'REFSEQ_MICRO_PROTEIN.fasta':'RefSeq Microbial' , 'REFSEQ_MITO_PROTEIN.fasta':'RefSeq Mitochondrion' , 'REFSEQ_PLANT_PROTEIN.fasta':'RefSeq Plant' , 'REFSEQ_PLASM_PROTEIN.fasta':'RefSeq Plasmid' , 'REFSEQ_PLAST_PROTEIN.fasta':'RefSeq Plastid' , 'REFSEQ_PROT_PROTEIN.fasta':'RefSeq Protozoans' , 'REFSEQ_VERTM_PROTEIN.fasta':'RefSeq Mammalian' , 'REFSEQ_VERTO_PROTEIN.fasta':'RefSeq Other Vertebrates' , 'REFSEQ_VIRAL_PROTEIN.fasta':'RefSeq Viral' , 'TPA_PROTEIN.fasta':'GENBANK Third-Party Annotation' , 'UNIMES.fasta':'UNIPROT: UNIMES' , 'UNIREF100.fasta':'UNIPROT: Uniref100' , 'NCBI_NR.fasta':'NCBI_NR: NCBI Non-Redundant' }" onchange="resolveParameters()"/>
<br/>
<br/>
HTML output (-m)
<s:checkbox name="html_output_" onclick="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#fasta')">Fasta program</A>
<font color="red" size="3">*</font>
<s:radio name="fasta_"
list="#{ 'fasty_t':'fasty = fastx + frameshifts anywhere' }" onclick="resolveParameters()"/>
<br/>
Break long library sequences into blocks (-N)
<s:textfield name="break_long_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=slectivity_opt><h2><A HREF="javascript:help.slidedownandjump('#slectivity_opt_comment')">Selectivity options</A></H2>
<A HREF="javascript:help.slidedownandjump('#ktup')">ktup : sensitivity and speed of the search (protein:2, DNA:6)</A>
<s:textfield name="ktup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#optcut')">OPTCUT : the threshold for optimization. (-c)</A>
<s:textfield name="optcut_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gapinit')">Penalty for gap initiation (-12 by default for fasta with proteins, -16 for DNA) (-f)</A>
<s:textfield name="gapinit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gapext')">Penalty for gap extention (-2 by default for fasta with proteins, -4 for DNA) (-g)</A>
<s:textfield name="gapext_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#high_expect')">Maximal expectation value threshold for displaying scores and alignments (-E)</A>
<s:textfield name="high_expect_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#low_expect')">Minimal expectation value threshold for displaying scores and alignments (-F)</A>
<s:textfield name="low_expect_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=score_opt><h2><A HREF="javascript:help.slidedownandjump('#score_opt_comment')">Scoring options</A></H2>
Reward for a match (-r)
<s:textfield name="dna_match_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nucleotid_mismatch')">Penalty for a mismatch (-r)</A>
<s:textfield name="nucleotid_mismatch_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Scoring matrix file (-s)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'BL50':'BLOSUM50' , 'BL62':'BLOSUM62' , 'BL80':'BLOSUM80' , 'P20':'PAM20' , 'P40':'PAM40' , 'P120':'PAM120' , 'P250':'PAM250' , 'M10':'MDM_10' , 'M20':'MDM_20' , 'M40':'MDM_40' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#X_penalty')">Penalty for a match to 'X' (independently of the PAM matrix) (-x)</A>
<s:textfield name="X_penalty_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=frame_transl_opt><h2><A HREF="javascript:help.slidedownandjump('#frame_transl_opt_comment')">Frameshift and translation options</A></H2>
Penalty for frameshift between codon (fast[xy]/tfast[xy])(-h)
<s:textfield name="frameshift_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Penalty for frameshift within a codon (fasty/tfasty)(-j)
<s:textfield name="frameshift_within_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Search only the three forward frames (tfasta) (-3)
<s:checkbox name="threeframe_" onclick="resolveParameters()"/>
<br/>
Reverse complement the query sequence (all tfasta) (-i)
<s:checkbox name="invert_" onclick="resolveParameters()"/>
<br/>
Use genetic code for translation (tfasta/tfast[xy]/fast[xy]) (-t)
<s:select name="genetic_code_" headerKey='' headerValue='' list="#{ '1':'1: Standard' , '2':'2: Vertebrate Mitochondrial' , '3':'3: Yeast Mitochondrial' , '4':'4: Mold, Protozoan, Coelenterate Mitochondrial and Mycoplasma/Spiroplasma' , '5':'5: Invertebrate Mitochondrial' , '6':'6: Ciliate Macronuclear and Dasycladacean' , '9':'9: Echinoderm Mitochondrial' , '10':'10: Euplotid Nuclear' , '11':'11: Bacterial' , '12':'12: Alternative Yeast Nuclear' , '13':'13: Ascidian Mitochondrial' , '14':'14: Flatworm Mitochondrial' , '15':'15: Blepharisma Macronuclear' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=optimize_opt><h2><A HREF="javascript:help.slidedownandjump('#optimize_opt_comment')">Optimization options</A></H2>
<A HREF="javascript:help.slidedownandjump('#band')">band-width used for optimization (-y)</A>
<s:textfield name="band_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#swalig')">unlimited Smith-Waterman alignment for DNA (-A)</A>
<s:checkbox name="swalig_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#noopt')">no limited optimization (-o)</A>
<s:checkbox name="noopt_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stat')">Specify statistical calculation. (-z)</A>
<s:select name="stat_" headerKey='' headerValue='' list="#{ '-1':'-1: turn off statistics' , '0':' 0: no correction of library sequebce length' , '1':' 1: weigthed regression against the length of the library sequence' , '2':' 2: maximum likelihood estimates of Lambda abd K' , '3':' 3: Altschul-Gish parameters' , '4':' 4: Variation1 of 1' , '5':' 5: Variation2 of 1' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#random')">Estimate stat parameters from shuffled copies of each library sequence (-z)</A>
<s:checkbox name="random_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=affichage><h2><A HREF="javascript:help.slidedownandjump('#affichage_comment')">Report options</A></H2>
No histogram (-H)
<s:checkbox name="histogram_" onclick="resolveParameters()"/>
<br/>
number of similarity scores to be shown (-b)
<s:textfield name="scores_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
number of alignments to be shown (-d)
<s:textfield name="alns_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#markx')">Alternate display of matches and mismatches in alignments</A>
<s:select name="markx_" headerKey='' headerValue='' list="#{ '0':'0 [: identities] [. conservative repl] [ non-conserv repl]' , '1':'1: [ identities] [x conservative repl] [X non-conserv repl]' , '2':'2: [. identities] [res mismatch] - do not display the 2nd seq' , '3':'3: writes a file of library sequences in FASTA format' , '4':'4: displays a graph of the alignment' , '9':'9: 0 + percent identity + coordinates' , '10':'10: output more information' }" onchange="resolveParameters()"/>
<br/>
<br/>
sequences ranked by the z-score based on the init1 score (-1)
<s:checkbox name="init1_" onclick="resolveParameters()"/>
<br/>
Show normalize score as (-B)
<s:radio name="z_score_out_"
list="#{ '': '[Not Mandatory]', '1':'z-score' , '0':'bit-score' }" onclick="resolveParameters()"/>
<br/>
both sequences are shown in their entirety in alignments (fasta only) (-a)
<s:checkbox name="showall_" onclick="resolveParameters()"/>
<br/>
output line length for sequence alignments (max. 200) (-w)
<s:textfield name="linlen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#offsets')">Start numbering the aligned sequences at position x1 x2 (2 numbers) (-X)</A>
<s:textfield name="offsets_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Display more information about the library sequence in the alignment (-L)
<s:checkbox name="info_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=other_opt><h2><A HREF="javascript:help.slidedownandjump('#other_opt_comment')">Other options</A></H2>
<A HREF="javascript:help.slidedownandjump('#filter')">Lower case filtering (-S)</A>
<s:checkbox name="filter_" onclick="resolveParameters()"/>
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
<dt><a name=fasta><i>Fasta program</i></a></dt>
<dd>. fastx/fasty - compare a DNA sequence to a protein sequence database, comparing the translated DNA
sequence in three frames, with frameshifts. fasty2 allows frameshifts inside codons.</dd>
<dt><a name=protein_db><i>Protein Database</i></a></dt>
<dd>Please note that Swissprot usage by and for commercial entities requires a license agreement.</dd>
<br></br>
<dt><a name=slectivity_opt_comment><i><b>Selectivity options</b></i></a></dt>
<dt><a name=ktup><i>ktup : sensitivity and speed of the search (protein:2, DNA:6)</i></a></dt>
<dd>ktup sets the sensitivity and speed of the search. If ktup=2, similar regions in the two sequences being compared are found by looking at pairs of aligned residues; if ktup=1, single aligned amino acids are examined. ktup can be set to 2 or 1 for protein sequences, or from 1 to 6 for DNA sequences. The default if ktup is not specified is 2 for proteins and 6 for DNA. 1ktup=1 should be used for oligonucleotides (DNA query length < 20).</dd>
<dt><a name=optcut><i>OPTCUT : the threshold for optimization. (-c)</i></a></dt>
<dd>The OPTCUT value is normally calculated based on sequence length.</dd>
<dt><a name=gapinit><i>Penalty for gap initiation (-12 by default for fasta with proteins, -16 for DNA) (-f)</i></a></dt>
<dd>The default for fastx/fasty/tfastz/tfasty is -15.</dd>
<dt><a name=gapext><i>Penalty for gap extention (-2 by default for fasta with proteins, -4 for DNA) (-g)</i></a></dt>
<dd>The default for fastx/fasty/tfastz/tfasty is -3.</dd>
<dt><a name=high_expect><i>Maximal expectation value threshold for displaying scores and alignments (-E)</i></a></dt>
<dd>Expectation value limit for displaying scores and alignments. Typically 10.0 for protein sequence comparisons; 5.0 for fastx, and 2.0 for DNA sequence comparisons.</dd>
<dt><a name=low_expect><i>Minimal expectation value threshold for displaying scores and alignments (-F)</i></a></dt>
<dd>This allow one to skip over close relationships in searches for more distant relationships.</dd>
<br></br>
<dt><a name=score_opt_comment><i><b>Scoring options</b></i></a></dt>
<dt><a name=nucleotid_mismatch><i>Penalty for a mismatch (-r)</i></a></dt>
<dd>'+5/-4' are the default values for match/mismatch, but '+3/-2' can perform better in some cases.</dd>
<dt><a name=X_penalty><i>Penalty for a match to 'X' (independently of the PAM matrix) (-x)</i></a></dt>
<dd>Particularly useful for fast[xy], where termination codons are encoded as 'X'.</dd>
<br></br>
<dt><a name=frame_transl_opt_comment><i><b>Frameshift and translation options</b></i></a></dt>
<br></br>
<dt><a name=optimize_opt_comment><i><b>Optimization options</b></i></a></dt>
<dt><a name=band><i>band-width used for optimization (-y)</i></a></dt>
<dd>Set the band-width used for optimization. -y 16 is the default for protein when ktup=2 and for all DNA alignments. -y 32 is used for protein and ktup=1. For proteins, optimization slows comparison 2-fold and is highly recommended.</dd>
<dt><a name=swalig><i>unlimited Smith-Waterman alignment for DNA (-A)</i></a></dt>
<dd>force Smith-Waterman alignment for output. Smith-Waterman is the default for protein sequences and FASTX, but not for TFASTA or DNA comparisons with FASTA.</dd>
<dt><a name=noopt><i>no limited optimization (-o)</i></a></dt>
<dd>Turn off default optimization of all scores greater than OPTCUT. Shirt results by 'initn' scores reduces the accuracy of statistical estimates.</dd>
<dt><a name=stat><i>Specify statistical calculation. (-z)</i></a></dt>
<dd>In general, 1 and 2 are the best methods.</dd>
<dt><a name=random><i>Estimate stat parameters from shuffled copies of each library sequence (-z)</i></a></dt>
<dd>This doubles the time required for a search, but allows accurate statistics to be estimated for libraries comprised of a single protein family.</dd>
<br></br>
<dt><a name=affichage_comment><i><b>Report options</b></i></a></dt>
<dt><a name=markx><i>Alternate display of matches and mismatches in alignments</i></a></dt>
<dd>(MARKX) =0,1,2,3,4. Alternate display of matches and mismatches in alignments.</dd><dd>MARKX=0 uses ':','.',' ', for identities, conservative replacements, and non-conservative replacements, respectively.</dd><dd>MARKX=1 uses ' ','x', and 'X'. </dd><dd>MARKX=2 does not show the second sequence, but uses the second alignment line to display matches with a '.' for identity, or with the mismatched residue for mismatches. MARKX=2 is useful for aligning large numbers of similar sequences.</dd><dd>MARKX=3 writes out a file of library sequences in FASTA format. MARKX=3 should always be used with the 'SHOWALL' (-a) option, but this does not completely ensure that all of the sequences output will be aligned. </dd><dd>MARKX=4 displays a graph of the alignment of the library sequence with repect to the query sequence, so that one can identify the regions of the query sequence that are conserved.</dd>
<dt><a name=offsets><i>Start numbering the aligned sequences at position x1 x2 (2 numbers) (-X)</i></a></dt>
<dd>causes fasta/lfasta/plfasta to start numbering the aligned sequences starting with offset1 and offset2, rather than 1 and 1. This is particularly useful for showing alignments of promoter regions.</dd>
<br></br>
<dt><a name=other_opt_comment><i><b>Other options</b></i></a></dt>
<dt><a name=filter><i>Lower case filtering (-S)</i></a></dt>
<dd>Treat lower-case characters in the query or library sequence as 'low-complexity' residues. These characters are treated as 'X' during the initial scan, but are treated as normal residues during the final alignment. Sinces statistical significance is calculated from similarity score calculated during library search, low complexity regions will not produce statistical significant matches.</dd><dd>If a significant alignment contains low complexity regions the final score may be higher than the score obtainded during the search.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// fasta
// seqtype
// protein_db
if ((getValue('seqtype_')=="protein" && getValue('fasta_').match("^fasta")) || getValue('fasta_').match("^fast(x|y|s|f)"))
enable('protein_db_');
else disable('protein_db_');
// break_long
// ktup
// optcut
// gapinit
// gapext
// high_expect
// low_expect
// dna_match
// nucleotid_mismatch
if ( getValue('dna_match_'))
enable('nucleotid_mismatch_');
else disable('nucleotid_mismatch_');
// matrix
// X_penalty
// frameshift
if ( (getValue('fasta_').match("fast(x|y)")) )
enable('frameshift_');
else disable('frameshift_');
// frameshift_within
if ( (getValue('fasta_').match("fasty")) )
enable('frameshift_within_');
else disable('frameshift_within_');
// threeframe
if (getValue('fasta_').match("^tfasta"))
enable('threeframe_');
else disable('threeframe_');
// invert
if (getValue('fasta_').match("^tfasta"))
enable('invert_');
else disable('invert_');
// genetic_code
if (getValue('fasta_').match("^tfast") || getValue('fasta_').match("fast[xy]"))
enable('genetic_code_');
else disable('genetic_code_');
// band
// swalig
// noopt
// stat
// random
if (getValue('stat_') > 0)
enable('random_');
else disable('random_');
// histogram
// scores
// alns
// html_output
// markx
if (! getValue('html_output_'))
enable('markx_');
else disable('markx_');
// init1
// z_score_out
// showall
// linlen
// offsets
// info
// filter
}
function validateControl() {
// fasta
// seqtype
if (getValue('fasta_').match("^fast(f|s)") && getValue('seqtype_')=="DNA") {
alert('fastf and fasts take a protein sequence ');
return false;
}
if (getValue('fasta_').match("^fast(x|y)") && getValue('seqtype_')=="protein") {
alert('fastx and fasty take a DNA sequence ');
return false;
}
if (getValue('fasta_').match("^tfast") && getValue('seqtype_')=="DNA") {
alert('tfasta, tfastx, tfasty, tfastf and tfasts take a protein sequence');
return false;
}
// protein_db
// break_long
// ktup
// optcut
// gapinit
// gapext
// high_expect
// low_expect
// dna_match
// nucleotid_mismatch
// matrix
// X_penalty
// frameshift
// frameshift_within
// threeframe
// invert
// genetic_code
// band
// swalig
// noopt
// stat
// random
// histogram
// scores
// alns
// html_output
// markx
// init1
// z_score_out
// showall
// linlen
// offsets
// info
// filter
return issueWarning();
}
function issueWarning() {
// fasta
// seqtype
// protein_db
// break_long
// ktup
// optcut
// gapinit
// gapext
// high_expect
// low_expect
// dna_match
// nucleotid_mismatch
// matrix
// X_penalty
// frameshift
// frameshift_within
// threeframe
// invert
// genetic_code
// band
// swalig
// noopt
// stat
// random
// histogram
// scores
// alns
// html_output
// markx
// init1
// z_score_out
// showall
// linlen
// offsets
// info
// filter
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
var element = document.forms['fasty'].elements[parameter];
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
var element = document.forms['fasty'].elements[parameter];
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
var element = document.forms['fasty'].elements[parameter];
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