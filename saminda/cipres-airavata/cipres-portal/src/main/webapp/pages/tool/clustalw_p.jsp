<%@ taglib prefix="s" uri="/struts-tags" %>
<title>ClustalW_P</title>
<h2>ClustalW_P: Multiple Alignment of Protein Sequences (<a href="#REFERENCE">Des Higgins</a>)</h2>
<s:form action="clustalw_p" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Phylip alignment output format (-output)
<s:checkbox name="phylip_alig_" onclick="resolveParameters()"/>
<br/>
Toggle Slow/Fast pairwise alignments (-<A HREF="javascript:help.slidedownandjump('#quicktree')">quicktree</A>)
<font color="red" size="3">*</font>
<s:radio name="quicktree_"
list="#{ 'slow':'Slow' , 'fast':'Fast' }" onclick="resolveParameters()"/>
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
Actions
<font color="red" size="3">*</font>
<s:select name="actions_" list="#{ '-align':'-align: do full multiple alignment' , '-profile':'-profile: merge two alignments (PROFILE1 and 2) by profile or structure alignment' , '-sequences':'-sequences: sequentially add PROFILE2 sequences to PROFILE1 alignment' , '-tree':'-tree: calculate NJ tree' , '-bootstrap':'-bootstrap: bootstrap a NJ tree' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=multalign><h2><A HREF="javascript:help.slidedownandjump('#multalign_comment')">Multiple Alignments parameters</A></H2>
Protein or DNA (-type)
<s:radio name="typeseq_"
list="#{ '': '[Not Mandatory]', 'protein':'protein' }" onclick="resolveParameters()"/>
<br/>
Protein weight matrix (-<A HREF="javascript:help.slidedownandjump('#matrix')">matrix</A>)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'gonnet':'Gonnet series' , 'blosum':'BLOSUM series' , 'pam':'PAM series' , 'id':'Identity matrix' }" onchange="resolveParameters()"/>
<br/>
<br/>
DNA weight matrix (-<A HREF="javascript:help.slidedownandjump('#dnamatrix')">dnamatrix</A>)
<s:radio name="dnamatrix_"
list="#{ '': '[Not Mandatory]', 'iub':'IUB' , 'clustalw':'CLUSTALW' }" onclick="resolveParameters()"/>
<br/>
Gap opening penalty (-<A HREF="javascript:help.slidedownandjump('#gapopen')">gapopen</A>)
<s:textfield name="gapopen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap extension penalty (-gapext)
<s:textfield name="gapext_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
End gap separation penalty (-<A HREF="javascript:help.slidedownandjump('#endgaps')">endgaps</A>)
<s:checkbox name="endgaps_" onclick="resolveParameters()"/>
<br/>
Gap separation pen. range (-<A HREF="javascript:help.slidedownandjump('#gapdist')">gapdist</A>)
<s:textfield name="gapdist_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pgap')">Residue specific penalties (Pascarella gaps) (-nopgap)</A>
<s:checkbox name="pgap_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#hgap')">Hydrophilic gaps (-nohgap)</A>
<s:checkbox name="hgap_" onclick="resolveParameters()"/>
<br/>
Hydrophilic residues list (-hgapresidues)
<s:select name="hgapresidues_" multiple="true" list="#{ 'A':'A' , 'R':'R' , 'N':'N' , 'D':'D' , 'C':'C' , 'Q':'Q' , 'E':'E' , 'G':'G' , 'H':'H' , 'I':'I' , 'L':'L' , 'K':'K' , 'M':'M' , 'F':'F' , 'P':'P' , 'S':'S' , 'T':'T' , 'W':'W' , 'Y':'Y' , 'V':'V' }" onchange="resolveParameters()"/>
<br/>
<br/>
Delay divergent sequences : % ident. for delay (-<A HREF="javascript:help.slidedownandjump('#maxdiv')">maxdiv</A>)
<s:textfield name="maxdiv_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Negative values in matrix ? (-negative)
<s:checkbox name="negative_" onclick="resolveParameters()"/>
<br/>
Transitions weight (between 0 and 1) (-<A HREF="javascript:help.slidedownandjump('#transweight')">transweight</A>)
<s:textfield name="transweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
File for old guide tree (-<A HREF="javascript:help.slidedownandjump('#usetree')">usetree</A>)
<s:select name="usetree_" headerKey='' headerValue='' list="%{ getDataForParameter('usetree_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=fastpw><h2><A HREF="javascript:help.slidedownandjump('#fastpw_comment')">Fast Pairwise Alignments parameters</A></H2>
Word size (-<A HREF="javascript:help.slidedownandjump('#ktuple')">ktuple</A>)
<s:textfield name="ktuple_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of best diagonals (-<A HREF="javascript:help.slidedownandjump('#topdiags')">topdiags</A>)
<s:textfield name="topdiags_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Window around best diags (-<A HREF="javascript:help.slidedownandjump('#window')">window</A>)
<s:textfield name="window_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap penalty (-<A HREF="javascript:help.slidedownandjump('#pairgap')">pairgap</A>)
<s:textfield name="pairgap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Percent or absolute score ? (-score)
<s:radio name="score_"
list="#{ '': '[Not Mandatory]', 'percent':'percent' , 'absolute':'absolute' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=slowpw><h2><A HREF="javascript:help.slidedownandjump('#slowpw_comment')">Slow Pairwise Alignments parameters</A></H2>
Protein weight matrix (-<A HREF="javascript:help.slidedownandjump('#pwmatrix')">pwmatrix</A>)
<s:select name="pwmatrix_" headerKey='' headerValue='' list="#{ 'blosum':'BLOSUM30 (Henikoff)' , 'gonnet':'Gonnet 250' , 'pam':'PAM350 (Dayhoff)' , 'id':'Identity matrix' }" onchange="resolveParameters()"/>
<br/>
<br/>
DNA weight matrix (-<A HREF="javascript:help.slidedownandjump('#pwdnamatrix')">pwdnamatrix</A>)
<s:radio name="pwdnamatrix_"
list="#{ '': '[Not Mandatory]', 'iub':'IUB' , 'clustalw':'CLUSTALW' }" onclick="resolveParameters()"/>
<br/>
Gap opening penalty (-pwgapopen)
<s:textfield name="pwgapopen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap extension penalty (-pwgapext)
<s:textfield name="pwgapext_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=trees><h2><A HREF="javascript:help.slidedownandjump('#trees_comment')">Tree parameters</A></H2>
Use Kimura's correction (multiple substitutions) ? (-<A HREF="javascript:help.slidedownandjump('#kimura')">kimura</A>)
<s:checkbox name="kimura_" onclick="resolveParameters()"/>
<br/>
Ignore positions with gaps ? (-<A HREF="javascript:help.slidedownandjump('#tossgaps')">tossgaps</A>)
<s:checkbox name="tossgaps_" onclick="resolveParameters()"/>
<br/>
Bootstrap a NJ tree (give the number of bootstraps, 0 for none) (-<A HREF="javascript:help.slidedownandjump('#bootstrap')">bootstrap</A>)
<s:textfield name="bootstrap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Phylip bootstrap positions (-<A HREF="javascript:help.slidedownandjump('#bootlabels')">bootlabels</A>)
<s:radio name="bootlabels_"
list="#{ '': '[Not Mandatory]', 'node':'NODE labels' , 'branch':'BRANCH labels' }" onclick="resolveParameters()"/>
<br/>
Seed number for bootstraps (-seed)
<s:textfield name="seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Output tree/distance format (-<A HREF="javascript:help.slidedownandjump('#outputtree')">outputtree</A>)
<s:select name="outputtree_" headerKey='' headerValue='' list="#{ 'NJ':'Clustal format' , 'PHYLIP':'Phylip format tree' , 'DIST':'Phylip format distance matrix' , 'NEXUS':'NEXUS format tree' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=outputparam><h2><A HREF="javascript:help.slidedownandjump('#outputparam_comment')">Output parameters</A></H2>
Output format (-output)
<s:select name="output_" headerKey='' headerValue='' list="#{ '':'CLUSTALW' , 'GCG':'GCG' , 'GDE':'GDE' , 'PHYLIP':'PHYLIP' , 'PIR':'PIR' , 'NEXUS':'NEXUS' }" onchange="resolveParameters()"/>
<br/>
<br/>
Upper case GDE output (-case)
<s:checkbox name="gde_lower_" onclick="resolveParameters()"/>
<br/>
Result order (-outorder)
<s:radio name="outorder_"
list="#{ '': '[Not Mandatory]', 'input':'input' , 'aligned':'aligned' }" onclick="resolveParameters()"/>
<br/>
Output sequence numbers in the output file (clustalw format) (-seqnos)
<s:checkbox name="seqnos_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=profile><h2><A HREF="javascript:help.slidedownandjump('#profile_comment')">Profile Alignments parameters</A></H2>
Profile 1 (-profile1)
<font color="red" size="3">+</font>
<s:select name="profile1_" headerKey='' headerValue='' list="%{ getDataForParameter('profile1_')}" onchange="resolveParameters()"/>
<br/>
Profile 2 (-profile2)
<font color="red" size="3">+</font>
<s:select name="profile2_" headerKey='' headerValue='' list="%{ getDataForParameter('profile2_')}" onchange="resolveParameters()"/>
<br/>
File for old guide tree for profile1 (-usetree1)
<s:select name="usetree1_" headerKey='' headerValue='' list="%{ getDataForParameter('usetree1_')}" onchange="resolveParameters()"/>
<br/>
File for old guide tree for profile2 (-usetree2)
<s:select name="usetree2_" headerKey='' headerValue='' list="%{ getDataForParameter('usetree2_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=structure><h2><A HREF="javascript:help.slidedownandjump('#structure_comment')">Structure Alignments parameters</A></H2>
Use profile 1 secondary structure / penalty mask (-<A HREF="javascript:help.slidedownandjump('#nosecstr1')">nosecstr1</A>)
<s:checkbox name="nosecstr1_" onclick="resolveParameters()"/>
<br/>
Use profile 2 secondary structure / penalty mask (-<A HREF="javascript:help.slidedownandjump('#nosecstr2')">nosecstr2</A>)
<s:checkbox name="nosecstr2_" onclick="resolveParameters()"/>
<br/>
Helix gap penalty (-<A HREF="javascript:help.slidedownandjump('#helixgap')">helixgap</A>)
<s:textfield name="helixgap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Strand gap penalty (-<A HREF="javascript:help.slidedownandjump('#strandgap')">strandgap</A>)
<s:textfield name="strandgap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Loop gap penalty (-<A HREF="javascript:help.slidedownandjump('#loopgap')">loopgap</A>)
<s:textfield name="loopgap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Secondary structure terminal penalty (-<A HREF="javascript:help.slidedownandjump('#terminalgap')">terminalgap</A>)
<s:textfield name="terminalgap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Helix terminal positions: number of residues inside helix to be treated as terminal (-<A HREF="javascript:help.slidedownandjump('#helixendin')">helixendin</A>)
<s:textfield name="helixendin_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Helix terminal positions: number of residues outside helix to be treated as terminal (-<A HREF="javascript:help.slidedownandjump('#helixendout')">helixendout</A>)
<s:textfield name="helixendout_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Strand terminal positions: number of residues inside strand to be treated as terminal (-<A HREF="javascript:help.slidedownandjump('#strandendin')">strandendin</A>)
<s:textfield name="strandendin_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Strand terminal positions: number of residues outside strand to be treated as terminal (-<A HREF="javascript:help.slidedownandjump('#strandendout')">strandendout</A>)
<s:textfield name="strandendout_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Output in alignment (-<A HREF="javascript:help.slidedownandjump('#secstrout')">secstrout</A>)
<s:select name="secstrout_" headerKey='' headerValue='' list="#{ 'STRUCTURE':'Secondary Structure' , 'MASK':'Gap Penalty Mask' , 'BOTH':'Structure and Penalty Mask' , 'NONE':'None' }" onchange="resolveParameters()"/>
<br/>
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
<br></br>
<dt><a name=multalign_comment><i><b>Multiple Alignments parameters</b></i></a></dt>
<dd>
</dd><dd>Multiple alignments are carried out in 3 stages :</dd><dd>
</dd><dd>1) all sequences are compared to each other (pairwise alignments);</dd><dd>
</dd><dd>2) a dendrogram (like a phylogenetic tree) is constructed, describing the approximate groupings of the sequences by similarity (stored in a file).</dd><dd>
</dd><dd>3) the final multiple alignment is carried out, using the dendrogram as a guide.</dd><dd>
</dd><dd>Pairwise alignment parameters control the speed/sensitivity of the initial alignments.</dd><dd>
</dd><dd>Multiple alignment parameters control the gaps in the final multiple alignments.</dd><dd>
</dd>
<dt><a name=quicktree><i>Toggle Slow/Fast pairwise alignments (-quicktree)</i></a></dt>
<dd>slow: by dynamic programming (slow but accurate)</dd><dd>fast: method of Wilbur and Lipman (extremely fast but approximate)</dd>
<dt><a name=matrix><i>Protein weight matrix (-matrix)</i></a></dt>
<dd>There are three 'in-built' series of weight matrices offered. Each consists of several matrices which work differently at different evolutionary distances. To see the exact details, read the documentation. Crudely, we store several matrices in memory, spanning the full range of amino acid distance (from almost identical sequences to highly divergent ones). For very similar sequences, it is best to use a strict weight matrix which only gives a high score to identities and the most favoured conservative substitutions. For more divergent sequences, it is appropriate to use 'softer' matrices which give a high score to many other frequent substitutions.</dd><dd>BLOSUM (Henikoff). These matrices appear to be the best available for carrying out data base similarity (homology searches). The matrices used are: Blosum80, 62, 40 and 30.</dd><dd>The Gonnet Pam 250 matrix has been reported as the best single matrix for alignment, if you only choose one matrix. Our experience with profile database searches is that the Gonnet series is unambiguously superior to the Blosum series at high divergence. However, we did not get the series to perform systematically better than the Blosum series in Clustal W (communication of the authors).</dd><dd>PAM (Dayhoff). These have been extremely widely used since the late '70s. We use the PAM 120, 160, 250 and 350 matrices.</dd>
<dt><a name=dnamatrix><i>DNA weight matrix (-dnamatrix)</i></a></dt>
<dd>1) IUB. This is the default scoring matrix used by BESTFIT for the comparison of nucleic acid sequences. X's and N's are treated as matches to any IUB ambiguity symbol. All matches score 1.9; all mismatches for IUB symbols score 0.</dd><dd>2) CLUSTALW(1.6). The previous system used by ClustalW, in which matches score 1.0 and mismatches score 0. All matches for IUB symbols also score 0.</dd>
<dt><a name=gapopen><i>Gap opening penalty (-gapopen)</i></a></dt>
<dd></dd>
<dt><a name=endgaps><i>End gap separation penalty (-endgaps)</i></a></dt>
<dd>End gap separation treats end gaps just like internal gaps for the purposes of avoiding gaps that are too close (set by GAP SEPARATION DISTANCE above). If you turn this off, end gaps will be ignored for this purpose. This is useful when you wish to align fragments where the end gaps are not biologically meaningful.</dd>
<dt><a name=gapdist><i>Gap separation pen. range (-gapdist)</i></a></dt>
<dd>Gap separation distance tries to decrease the chances of gaps being too close to each other. Gaps that are less than this distance apart are penalised more than other gaps. This does not prevent close gaps; it makes them less frequent, promoting a block-like appearance of the alignment.</dd>
<dt><a name=pgap><i>Residue specific penalties (Pascarella gaps) (-nopgap)</i></a></dt>
<dd>Residue specific penalties are amino acid specific gap penalties that reduce or increase the gap opening penalties at each position in the alignment or sequence. As an example, positions that are rich in glycine are more likely to have an adjacent gap than positions that are rich in valine.</dd><dd>Table of residue specific gap modification factors:</dd><dd>A 1.13 M 1.29</dd><dd>C 1.13 N 0.63</dd><dd>D 0.96 P 0.74</dd><dd>E 1.31 Q 1.07</dd><dd>F 1.20 R 0.72</dd><dd>G 0.61 S 0.76</dd><dd>H 1.00 T 0.89</dd><dd>I 1.32 V 1.25</dd><dd>K 0.96 Y 1.00</dd><dd>L 1.21 W 1.23</dd><dd>The values are normalised around a mean value of 1.0 for H. The lower the value, the greater the chance of having an adjacent gap. These are derived from the original table of relative frequencies of gaps adjacent to each residue (12) by subtraction from 2.0.</dd>
<dt><a name=hgap><i>Hydrophilic gaps (-nohgap)</i></a></dt>
<dd>Hydrophilic gap penalties are used to increase the chances of a gap within a run (5 or more residues) of hydrophilic amino acids; these are likely to be loop or random coil regions where gaps are more common. The residues that are 'considered' to be hydrophilic are set by menu item 3.</dd>
<dt><a name=maxdiv><i>Delay divergent sequences : % ident. for delay (-maxdiv)</i></a></dt>
<dd>Delays the alignment of the most distantly related sequences until after the most closely related sequences have been aligned. The setting shows the percent identity level required to delay the addition of a sequence; sequences that are less identical than this level to any other sequences will be aligned later.</dd>
<dt><a name=transweight><i>Transitions weight (between 0 and 1) (-transweight)</i></a></dt>
<dd>The transition weight option for aligning nucleotide sequences has been changed in version 1.7 from an on/off toggle to a weight between 0 and 1. A weight of zero means that the transitions are scored as mismatches; a weight of 1 gives transitions the full match score. For distantly related DNA sequences, the weight should be near to zero; for closely related sequences it can be useful to assign a higher score.</dd>
<dt><a name=usetree><i>File for old guide tree (-usetree)</i></a></dt>
<dd>You can give a previously computed tree (.dnd file) - on the same data</dd>
<br></br>
<dt><a name=fastpw_comment><i><b>Fast Pairwise Alignments parameters</b></i></a></dt>
<dd>
</dd><dd>These similarity scores are calculated from fast, approximate, global alignments, which are controlled by 4 parameters. 2 techniques are used to make these alignments very fast: 1) only exactly matching fragments (k-tuples) are considered; 2) only the 'best' diagonals (the ones with most k-tuple matches) are used.</dd><dd>
</dd>
<dt><a name=ktuple><i>Word size (-ktuple)</i></a></dt>
<dd>K-TUPLE SIZE: This is the size of exactly matching fragment that is used. INCREASE for speed (max= 2 for proteins; 4 for DNA), DECREASE for sensitivity. For longer sequences (e.g. >1000 residues) you may need to increase the default.</dd>
<dt><a name=topdiags><i>Number of best diagonals (-topdiags)</i></a></dt>
<dd>The number of k-tuple matches on each diagonal (in an imaginary dot-matrix plot) is calculated. Only the best ones (with most matches) are used in the alignment. This parameter specifies how many. Decrease for speed; increase for sensitivity.</dd>
<dt><a name=window><i>Window around best diags (-window)</i></a></dt>
<dd>WINDOW SIZE: This is the number of diagonals around each of the 'best' diagonals that will be used. Decrease for speed; increase for sensitivity</dd>
<dt><a name=pairgap><i>Gap penalty (-pairgap)</i></a></dt>
<dd>This is a penalty for each gap in the fast alignments. It has little affect on the speed or sensitivity except for extreme values.</dd>
<br></br>
<dt><a name=slowpw_comment><i><b>Slow Pairwise Alignments parameters</b></i></a></dt>
<dd>
</dd><dd>These parameters do not have any affect on the speed of the alignments. They are used to give initial alignments which are then rescored to give percent identity scores. These % scores are the ones which are displayed on the screen. The scores are converted to distances for the trees.</dd><dd>
</dd>
<dt><a name=pwmatrix><i>Protein weight matrix (-pwmatrix)</i></a></dt>
<dd>The scoring table which describes the similarity of each amino acid to each other. For DNA, an identity matrix is used.</dd><dd>BLOSUM (Henikoff). These matrices appear to be the best available for carrying out data base similarity (homology searches). The matrices used are: Blosum80, 62, 40 and 30.</dd><dd>The Gonnet Pam 250 matrix has been reported as the best single matrix for alignment, if you only choose one matrix. Our experience with profile database searches is that the Gonnet series is unambiguously superior to the Blosum series at high divergence. However, we did not get the series to perform systematically better than the Blosum series in Clustal W (communication of the authors).</dd><dd>PAM (Dayhoff). These have been extremely widely used since the late '70s. We use the PAM 120, 160, 250 and 350 matrices.</dd>
<dt><a name=pwdnamatrix><i>DNA weight matrix (-pwdnamatrix)</i></a></dt>
<dd>For DNA, a single matrix (not a series) is used. Two hard-coded matrices are available:</dd><dd>1) IUB. This is the default scoring matrix used by BESTFIT for the comparison of nucleic acid sequences. X's and N's are treated as matches to any IUB ambiguity symbol. All matches score 1.9; all mismatches for IUB symbols score 0.</dd><dd>2) CLUSTALW(1.6). The previous system used by ClustalW, in which matches score 1.0 and mismatches score 0. All matches for IUB symbols also score 0.</dd>
<br></br>
<dt><a name=trees_comment><i><b>Tree parameters</b></i></a></dt>
<dd>
</dd><dd>If you ask for an alignment, the program automatic computes the tree as well; but you can also ask for a tree, given an alignment (file .aln), with specific options.</dd><dd>
</dd><dd>The method used is the NJ (Neighbour Joining) method of Saitou and Nei. First you calculate distances (percent divergence) between all pairs of sequence from a multiple alignment; second you apply the NJ method to the distance matrix.</dd><dd>
</dd>
<dt><a name=kimura><i>Use Kimura's correction (multiple substitutions) ? (-kimura)</i></a></dt>
<dd>For small divergence (say <10%) this option makes no difference. For greater divergence, this option corrects for the fact that observed distances underestimate actual evolutionary distances. This is because, as sequences diverge, more than one substitution will happen at many sites. However, you only see one difference when you look at the present day sequences. Therefore, this option has the effect of stretching (for DNA or proteins) are both due to Motoo Kimura. See the documentation for details. </dd><dd>For VERY divergent sequences, the distances cannot be reliably corrected. You will be warned if this happens. Even if none of the distances in a data set exceed the reliable threshold, if you bootstrap the data, some of the bootstrap distances may randomly exceed the safe limit.</dd>
<dt><a name=tossgaps><i>Ignore positions with gaps ? (-tossgaps)</i></a></dt>
<dd>With this option, any alignment positions where ANY of the sequences have a gap will be ignored. This means that 'like' will be compared to 'like' in all distances. It also, automatically throws away the most ambiguous parts of the alignment, which are concentrated around gaps (usually). The disadvantage is that you may throw away much of the data if there are many gaps. </dd>
<dt><a name=bootstrap><i>Bootstrap a NJ tree (give the number of bootstraps, 0 for none) (-bootstrap)</i></a></dt>
<dd>BOOTSTRAPPING is a method for deriving confidence values for the groupings in a tree (first adapted for trees by Joe Felsenstein). It involves making N random samples of sites from the alignment (N should be LARGE, e.g. 500 - 1000); drawing N trees (1 from each sample) and counting how many times each grouping from the original tree occurs in the sample trees. You must supply a seed number for the random number generator. Different runs with the same seed will give the same answer. See the documentation for details.</dd>
<dt><a name=bootlabels><i>Phylip bootstrap positions (-bootlabels)</i></a></dt>
<dd>The bootstrap values written in the phylip tree file format can be assigned either to branches or nodes. The default is to write the values on the nodes, as this can be read by several commonly-used tree display programs. But note that this can lead to confusion if the tree is rooted and the bootstraps may be better attached to the internal branches: Software developers should ensure they can read the branch label format.</dd>
<dt><a name=outputtree><i>Output tree/distance format (-outputtree)</i></a></dt>
<dd>Clustal format output: This format is verbose and lists all of the distances between the sequences and the number of alignment positions used for each. The tree is described at the end of the file. It lists the sequences that are joined at each alignment step and the branch lengths. After two sequences are joined, it is referred to later as a NODE. The number of a NODE is the number of the lowest sequence in that NODE. </dd><dd>Phylip format tree output: This format is the New Hampshire format, used by many phylogenetic analysis packages. It consists of a series of nested parentheses, describing the branching order, with the sequence names and branch lengths. It can be used by the RETREE, DRAWGRAM and DRAWTREE programs of the PHYLIP package to see the trees graphically. This is the same format used during multiple alignment for the guide trees. </dd><dd>The distance matrix only: This format just outputs a matrix of all the pairwise distances in a format that can be used by the Phylip package. It used to be useful when one could not produce distances from protein sequences in the Phylip package but is now redundant (Protdist of Phylip 3.5 now does this). </dd><dd>NEXUS format tree: This format is used by several popular phylogeny programs, including PAUP and MacClade. </dd>
<br></br>
<dt><a name=outputparam_comment><i><b>Output parameters</b></i></a></dt>
<br></br>
<dt><a name=profile_comment><i><b>Profile Alignments parameters</b></i></a></dt>
<dd>
</dd><dd>By PROFILE ALIGNMENT, we mean alignment using existing alignments. Profile alignments allow you to store alignments of your favourite sequences and add new sequences to them in small bunches at a time. A profile is simply an alignment of one or more sequences (e.g. an alignment output file from CLUSTAL W). Each input can be a single sequence. One or both sets of input sequences may include secondary structure assignments or gap penalty masks to guide the alignment.</dd><dd>
</dd><dd>Give 2 profiles to align the 2 profiles to each other</dd><dd>
</dd>
<br></br>
<dt><a name=structure_comment><i><b>Structure Alignments parameters</b></i></a></dt>
<dd>
</dd><dd>These options, when doing a profile alignment, allow you to set 2D structure parameters. If a solved structure is available, it can be used to guide the alignment by raising gap penalties within secondary structure elements, so that gaps will preferentially be inserted into unstructured surface loops. Alternatively, a user-specified gap penalty mask can be supplied directly.</dd><dd>
</dd><dd>A gap penalty mask is a series of numbers between 1 and 9, one per position in the alignment. Each number specifies how much the gap opening penalty is to be raised at that position (raised by multiplying the basic gap opening penalty by the number) i.e. a mask figure of 1 at a position means no change in gap opening penalty; a figure of 4 means that the gap opening penalty is four times greater at that position, making gaps 4 times harder to open.</dd><dd>
</dd><dd>Gap penalty masks is to be supplied with the input sequences. The masks work by raising gap penalties in specified regions (typically secondary structure elements) so that gaps are preferentially opened in the less well conserved regions (typically surface loops).</dd><dd>
</dd><dd>CLUSTAL W can read the masks from SWISS-PROT, CLUSTAL or GDE format input files. For many 3-D protein structures, secondary structure information is recorded in the feature tables of SWISS-PROT database entries. You should always check that the assignments are correct - some are quite inaccurate. CLUSTAL W looks for SWISS-PROT HELIX and STRAND assignments e.g.</dd><dd>
</dd><dd>FT HELIX 100 115</dd><dd>
</dd><dd>FT HELIX 100 115</dd><dd>
</dd><dd>The structure and penalty masks can also be read from CLUSTAL alignment format as comment lines beginning !SS_ or GM_ e.g.</dd><dd>
</dd><dd>!SS_HBA_HUMA ..aaaAAAAAAAAAAaaa.aaaAAAAAAAAAAaaaaaaAaaa.........aaaAAAAAA</dd><dd>
</dd><dd>!GM_HBA_HUMA 112224444444444222122244444444442222224222111111111222444444</dd><dd>
</dd><dd>HBA_HUMA VLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGK</dd><dd>
</dd><dd>Note that the mask itself is a set of numbers between 1 and 9 each of which is assigned to the residue(s) in the same column below. In GDE flat file format, the masks are specified as text and the names must begin with SS_ or GM_. Either a structure or penalty mask or both may be used. If both are included in an alignment, the user will be asked which is to be used.</dd><dd>
</dd>
<dt><a name=nosecstr1><i>Use profile 1 secondary structure / penalty mask (-nosecstr1)</i></a></dt>
<dd>This option controls whether the input secondary structure information or gap penalty masks will be used.</dd>
<dt><a name=nosecstr2><i>Use profile 2 secondary structure / penalty mask (-nosecstr2)</i></a></dt>
<dd>This option controls whether the input secondary structure information or gap penalty masks will be used.</dd>
<dt><a name=helixgap><i>Helix gap penalty (-helixgap)</i></a></dt>
<dd>This option provides the value for raising the gap penalty at core Alpha Helical (A) residues. In CLUSTAL format, capital residues denote the A and B core structure notation. The basic gap penalties are multiplied by the amount specified.</dd>
<dt><a name=strandgap><i>Strand gap penalty (-strandgap)</i></a></dt>
<dd>This option provides the value for raising the gap penalty at Beta Strand (B) residues. In CLUSTAL format, capital residues denote the A and B core structure notation. The basic gap penalties are multiplied by the amount specified.</dd>
<dt><a name=loopgap><i>Loop gap penalty (-loopgap)</i></a></dt>
<dd>This option provides the value for the gap penalty in Loops. By default this penalty is not raised. In CLUSTAL format, loops are specified by . in the secondary structure notation.</dd>
<dt><a name=terminalgap><i>Secondary structure terminal penalty (-terminalgap)</i></a></dt>
<dd>This option provides the value for setting the gap penalty at the ends of secondary structures. Ends of secondary structures are observed to grow and-or shrink in related structures. Therefore by default these are given intermediate values, lower than the core penalties. All secondary structure read in as lower case in CLUSTAL format gets the reduced terminal penalty.</dd>
<dt><a name=helixendin><i>Helix terminal positions: number of residues inside helix to be treated as terminal (-helixendin)</i></a></dt>
<dd>This option (together with the -helixendin) specify the range of structure termini for the intermediate penalties. In the alignment output, these are indicated as lower case. For Alpha Helices, by default, the range spans the end helical turn.</dd>
<dt><a name=helixendout><i>Helix terminal positions: number of residues outside helix to be treated as terminal (-helixendout)</i></a></dt>
<dd>This option (together with the -helixendin) specify the range of structure termini for the intermediate penalties. In the alignment output, these are indicated as lower case. For Alpha Helices, by default, the range spans the end helical turn.</dd>
<dt><a name=strandendin><i>Strand terminal positions: number of residues inside strand to be treated as terminal (-strandendin)</i></a></dt>
<dd>This option (together with the -strandendout option) specify the range of structure termini for the intermediate penalties. In the alignment output, these are indicated as lower case. For Beta Strands, the default range spans the end residue and the adjacent loop residue, since sequence conservation often extends beyond the actual H-bonded Beta Strand.</dd>
<dt><a name=strandendout><i>Strand terminal positions: number of residues outside strand to be treated as terminal (-strandendout)</i></a></dt>
<dd>This option (together with the -strandendin option) specify the range of structure termini for the intermediate penalties. In the alignment output, these are indicated as lower case. For Beta Strands, the default range spans the end residue and the adjacent loop residue, since sequence conservation often extends beyond the actual H-bonded Beta Strand.</dd>
<dt><a name=secstrout><i>Output in alignment (-secstrout)</i></a></dt>
<dd>This option lets you choose whether or not to include the masks in the CLUSTAL W output alignments. Showing both is useful for understanding how the masks work. The secondary structure information is itself very useful in judging the alignment quality and in seeing how residue conservation patterns vary with secondary structure.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// actions
// phylip_alig
// quicktree
if ((getValue('actions_').match("align") ))
enable('quicktree_');
else disable('quicktree_');
// typeseq
if ((getValue('actions_').match("align") ))
enable('typeseq_');
else disable('typeseq_');
// matrix
if ((getValue('actions_').match("align") ))
enable('matrix_');
else disable('matrix_');
// dnamatrix
if ((getValue('actions_').match("align") ))
enable('dnamatrix_');
else disable('dnamatrix_');
// gapopen
if ((getValue('actions_').match("align") ))
enable('gapopen_');
else disable('gapopen_');
// gapext
if ((getValue('actions_').match("align") ))
enable('gapext_');
else disable('gapext_');
// endgaps
if ((getValue('actions_').match("align") ))
enable('endgaps_');
else disable('endgaps_');
// gapdist
if ((getValue('actions_').match("align") ))
enable('gapdist_');
else disable('gapdist_');
// pgap
if ((getValue('actions_').match("align") ))
enable('pgap_');
else disable('pgap_');
// hgap
if ((getValue('actions_').match("align") ))
enable('hgap_');
else disable('hgap_');
// hgapresidues
if ((getValue('actions_').match("align") ) && getValue('hgap_'))
enable('hgapresidues_');
else disable('hgapresidues_');
// maxdiv
if ((getValue('actions_').match("align") ))
enable('maxdiv_');
else disable('maxdiv_');
// negative
if ((getValue('actions_').match("align") ))
enable('negative_');
else disable('negative_');
// transweight
if ((getValue('actions_').match("align") ))
enable('transweight_');
else disable('transweight_');
// usetree
if ((getValue('actions_').match("align") ))
enable('usetree_');
else disable('usetree_');
// ktuple
if ((getValue('quicktree_')=="fast") && (getValue('quicktree_')=="fast"))
enable('ktuple_');
else disable('ktuple_');
// topdiags
if ((getValue('quicktree_')=="fast") && (getValue('quicktree_')=="fast"))
enable('topdiags_');
else disable('topdiags_');
// window
if ((getValue('quicktree_')=="fast") && (getValue('quicktree_')=="fast"))
enable('window_');
else disable('window_');
// pairgap
if ((getValue('quicktree_')=="fast") && (getValue('quicktree_')=="fast"))
enable('pairgap_');
else disable('pairgap_');
// score
if ((getValue('quicktree_')=="fast") && (getValue('quicktree_')=="fast"))
enable('score_');
else disable('score_');
// pwmatrix
if ((getValue('quicktree_')=="slow") && (getValue('quicktree_')=="slow"))
enable('pwmatrix_');
else disable('pwmatrix_');
// pwdnamatrix
if ((getValue('quicktree_')=="slow") && (getValue('quicktree_')=="slow"))
enable('pwdnamatrix_');
else disable('pwdnamatrix_');
// pwgapopen
if ((getValue('quicktree_')=="slow") && (getValue('quicktree_')=="slow"))
enable('pwgapopen_');
else disable('pwgapopen_');
// pwgapext
if ((getValue('quicktree_')=="slow") && (getValue('quicktree_')=="slow"))
enable('pwgapext_');
else disable('pwgapext_');
// kimura
if ( (getValue('actions_').match("tree")) )
enable('kimura_');
else disable('kimura_');
// tossgaps
if ( (getValue('actions_').match("tree")) )
enable('tossgaps_');
else disable('tossgaps_');
// bootstrap
if ( (getValue('actions_').match("tree")) )
enable('bootstrap_');
else disable('bootstrap_');
// bootlabels
if ( (getValue('actions_').match("tree")) )
enable('bootlabels_');
else disable('bootlabels_');
// seed
if ( (getValue('actions_').match("tree")) )
enable('seed_');
else disable('seed_');
// outputtree
if ( (getValue('actions_').match("tree")) )
enable('outputtree_');
else disable('outputtree_');
// output
// gde_lower
if (getValue('output_')=="GDE")
enable('gde_lower_');
else disable('gde_lower_');
// outorder
// seqnos
if (getValue('output_')=="")
enable('seqnos_');
else disable('seqnos_');
// profile1
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('profile1_');
else disable('profile1_');
// profile2
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('profile2_');
else disable('profile2_');
// usetree1
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('usetree1_');
else disable('usetree1_');
// usetree2
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences" && (! getValue('actions_').match("sequence") ))
enable('usetree2_');
else disable('usetree2_');
// nosecstr1
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('nosecstr1_');
else disable('nosecstr1_');
// nosecstr2
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('nosecstr2_');
else disable('nosecstr2_');
// helixgap
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('helixgap_');
else disable('helixgap_');
// strandgap
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('strandgap_');
else disable('strandgap_');
// loopgap
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('loopgap_');
else disable('loopgap_');
// terminalgap
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('terminalgap_');
else disable('terminalgap_');
// helixendin
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('helixendin_');
else disable('helixendin_');
// helixendout
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('helixendout_');
else disable('helixendout_');
// strandendin
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('strandendin_');
else disable('strandendin_');
// strandendout
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('strandendout_');
else disable('strandendout_');
// secstrout
if (getValue('actions_')=="-profile" || getValue('actions_')=="-sequences")
enable('secstrout_');
else disable('secstrout_');
}
function validateControl() {
// actions
// phylip_alig
// quicktree
// typeseq
// matrix
// dnamatrix
// gapopen
// gapext
// endgaps
// gapdist
// pgap
// hgap
// hgapresidues
// maxdiv
// negative
// transweight
// usetree
// ktuple
// topdiags
// window
// pairgap
// score
// pwmatrix
// pwdnamatrix
// pwgapopen
// pwgapext
// kimura
// tossgaps
// bootstrap
// bootlabels
// seed
// outputtree
// output
// gde_lower
// outorder
// seqnos
// profile1
// profile2
// usetree1
// usetree2
// nosecstr1
// nosecstr2
// helixgap
// strandgap
// loopgap
// terminalgap
// helixendin
// helixendout
// strandendin
// strandendout
// secstrout
return issueWarning();
}
function issueWarning() {
// actions
// phylip_alig
// quicktree
// typeseq
// matrix
// dnamatrix
// gapopen
// gapext
// endgaps
// gapdist
// pgap
// hgap
// hgapresidues
// maxdiv
// negative
// transweight
// usetree
// ktuple
// topdiags
// window
// pairgap
// score
// pwmatrix
// pwdnamatrix
// pwgapopen
// pwgapext
// kimura
// tossgaps
// bootstrap
// bootlabels
// seed
// outputtree
// output
// gde_lower
// outorder
// seqnos
// profile1
// profile2
// usetree1
// usetree2
// nosecstr1
// nosecstr2
// helixgap
// strandgap
// loopgap
// terminalgap
// helixendin
// helixendout
// strandendin
// strandendout
// secstrout
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
var element = document.forms['clustalw_p'].elements[parameter];
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
var element = document.forms['clustalw_p'].elements[parameter];
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
var element = document.forms['clustalw_p'].elements[parameter];
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