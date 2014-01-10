<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PFSEARCH</title>
<h2>PFSEARCH: Compares Protein Profile against PROSITE DB (<a href="#REFERENCE">P. Bucher</a>)</h2>
<s:form action="pfsearch" theme="simple">
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
list="#{ 'pfsearch':'pfsearch: search a sequence db for segments matching a profile' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=pfsearch><h2><A HREF="javascript:help.slidedownandjump('#pfsearch_comment')">PFSEARCH parameters</A></H2>
Convert the profile from GCG format to PROSITE format ?
<s:checkbox name="gcg2psa_" onclick="resolveParameters()"/>
<br/>
protein or nucleotide db
<font color="red" size="3">+</font>
<s:radio name="aa_or_nuc_db_"
list="#{ 'protein':'protein' , 'dna':'DNA' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#aadb')">Protein Database</A>
<s:select name="aadb_" headerKey='' headerValue='' list="#{ 'UNIPROT.fasta':'UNIPROT' , 'SWISSPROT.fasta':'SWISSPROT' , 'TREMBL.fasta':'TREMBL' , 'PFILTUNIPROT.fasta':'PFILTUNIPROT' , 'PFILTTREMBL.fasta':'PFILTTREMBL' , 'PFILTSWISSPROT.fasta':'PFILTSWISSPROT' , 'PDBSEQ.fasta':'PDB' , 'REFSEQ_FUNGI_PROTEIN.fasta':'RefSeq Fungal' , 'REFSEQ_INV_PROTEIN.fasta':'RefSeq Invertebrate' , 'REFSEQ_MICRO_PROTEIN.fasta':'RefSeq Microbial' , 'REFSEQ_MITO_PROTEIN.fasta':'RefSeq Mitochondrion' , 'REFSEQ_PLANT_PROTEIN.fasta':'RefSeq Plant' , 'REFSEQ_PLASM_PROTEIN.fasta':'RefSeq Plasmid' , 'REFSEQ_PLAST_PROTEIN.fasta':'RefSeq Plastid' , 'REFSEQ_PROT_PROTEIN.fasta':'RefSeq Protozoans' , 'REFSEQ_VERTM_PROTEIN.fasta':'RefSeq Mammalian' , 'REFSEQ_VERTO_PROTEIN.fasta':'RefSeq Other Vertebrates' , 'REFSEQ_VIRAL_PROTEIN.fasta':'RefSeq Viral' , 'TPA_PROTEIN.fasta':'GENBANK Third-Party Annotation' , 'UNIMES.fasta':'UNIPROT: UNIMES' , 'UNIREF100.fasta':'UNIPROT: Uniref100' , 'NCBI_NR.fasta':'NCBI_NR: NCBI Non-Redundant' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nucdb')">Nucleotid Database</A>
<s:select name="nucdb_" headerKey='' headerValue='' list="#{ 'NCBI_NT.fasta':'NCBI Non-Redundant (nt)' , 'GBMAM.fasta':'GBMAM: Other Mammals' , 'GBBCT.fasta':'GBBCT: Bacteria' , 'GBENV.fasta':'GBENV: Enivronmental ' , 'GBEST.fasta':'GBEST: Expressed Sequence Tags' , 'GBGSS.fasta':'GBGSS: Genome Survey Sequences' , 'GBHTC.fasta':'GBHTC: High Throughput cDNA' , 'GBHTG.fasta':'GBHTG: High Throughput Genomics' , 'GBPAT.fasta':'GBPAT: Patented' , 'GBINV.fasta':'GBINV: Invertebrates' , 'GBPHG.fasta':'GBPHG: Phages' , 'GBPLN.fasta':'GBPLN: Plants (including yeast)' , 'GBPRI.fasta':'GBPRI: Primates' , 'GBROD.fasta':'GBROD: Rodents' , 'GBSTS.fasta':'GBSTS: Sequence Tagged Sites' , 'GBSYN.fasta':'GBSYN: Synthetic' , 'GBUNA.fasta':'GBUNA: Unannotated' , 'GBVRL.fasta':'GBVRL: Virus' , 'GBVRT.fasta':'GBVRT: Other Vertebrates' , 'REFSEQ_FUNGI_GENOMIC.fasta':'RefSeq Fungi: Genomic' , 'REFSEQ_FUNGI_RNA.fasta':'RefSeq Fungi: RNA' , 'REFSEQ_INV_GENOMIC.fasta':'RefSeq Invertebrate: Genomic' , 'REFSEQ_INV_RNA.fasta':'RefSeq Invertebrate: RNA' , 'REFSEQ_MICRO_GENOMIC.fasta':'RefSeq Microbial: Genomic' , 'REFSEQ_MITO_GENOMIC.fasta':'RefSeq Mitochondrion: Genomic' , 'REFSEQ_PLANT_GENOMIC.fasta':'RefSeq Plant: Genomic' , 'REFSEQ_PLANT_RNA.fasta':'RefSeq Plant: RNA' , 'REFSEQ_PLASM_GENOMIC.fasta':'RefSeq Plasmid: Genomic' , 'REFSEQ_PLASM_RNA.fasta':'RefSeq Plasmid: RNA' , 'REFSEQ_PLAST_GENOMIC.fasta':'RefSeq Plastid: Genomic' , 'REFSEQ_PLAST_RNA.fasta':'RefSeq Plastid: RNA' , 'REFSEQ_PROT_GENOMIC.fasta':'RefSeq Protozoa: Genomic' , 'REFSEQ_PROT_RNA.fasta':'RefSeq Protozoa: RNA' , 'REFSEQ_VERTM_GENOMIC.fasta':'RefSeq Mammalian: Genomic' , 'REFSEQ_VERTM_RNA.fasta':'RefSeq Mammalian: RNA' , 'REFSEQ_VERTO_GENOMIC.fasta':'RefSeq Other Vertebrate: Genomic' , 'REFSEQ_VERTO_RNA.fasta':'RefSeq Other Vertebrate: RNA' , 'REFSEQ_VIRAL_GENOMIC.fasta':'RefSeq Viral: Genomic' , 'TPA_NUCLEIC.fasta':'GENBANK: Third-Party Annotation' , 'ENSEMBL.fasta':'Ensembl' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pfsearch_cutoff')">Cut-off value</A>
<s:textfield name="pfsearch_cutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dd>pfsearch compares a query profile against a DNA or protein sequence library.</dd><dd>The result is an unsorted list of profile-sequence matches written to the standard output.</dd>
<br></br>
<dt><a name=pfsearch_comment><i><b>PFSEARCH parameters</b></i></a></dt>
<dt><a name=aadb><i>Protein Database</i></a></dt>
<dd>Choose a protein db for blastp or blastx.</dd><dd>Please note that Swissprot usage by and for commercial entities requires a license agreement.</dd>
<dt><a name=nucdb><i>Nucleotid Database</i></a></dt>
<dd>Choose a nucleotide db for blastn, tblastn or tblastx</dd>
<dt><a name=pfsearch_cutoff><i>Cut-off value</i></a></dt>
<dd>Over-writes the level zero cut-off value specified in the profile. An integer argument is interpreted
as a raw score value, a decimal argument as a normalized score value.</dd>
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
// gcg2psa
if ( (getValue('pftools_')=="pfsearch") )
enable('gcg2psa_');
else disable('gcg2psa_');
// aa_or_nuc_db
if ( (getValue('pftools_')=="pfsearch") )
enable('aa_or_nuc_db_');
else disable('aa_or_nuc_db_');
// aadb
if ( (getValue('pftools_')=="pfsearch") && (getValue('aa_or_nuc_db_')=="protein") )
enable('aadb_');
else disable('aadb_');
// nucdb
if ( (getValue('pftools_')=="pfsearch") && (getValue('aa_or_nuc_db_')=="dna") )
enable('nucdb_');
else disable('nucdb_');
// pfsearch_cutoff
if ( (getValue('pftools_')=="pfsearch") )
enable('pfsearch_cutoff_');
else disable('pfsearch_cutoff_');
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
// gcg2psa
// aa_or_nuc_db
// aadb
if ( (getValue('pftools_')=="pfsearch") && (getValue('aa_or_nuc_db_')=="protein") ) {
if (! ( getValue('aadb_') || getValue('nucdb_'))) {
alert('You must either choose a protein or a nucleotid db');
return false;
}
}
// nucdb
// pfsearch_cutoff
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
// gcg2psa
// aa_or_nuc_db
// aadb
// nucdb
// pfsearch_cutoff
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
var element = document.forms['pfsearch'].elements[parameter];
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
var element = document.forms['pfsearch'].elements[parameter];
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
var element = document.forms['pfsearch'].elements[parameter];
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