<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Muscle</title>
<h2>Muscle: Create Multiple Alignments from Sequences or Profiles (<a href="#REFERENCE">Robert C. Edgar</a>)</h2>
<s:form action="muscle" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Data type (-seqtype)
<font color="red" size="3">*</font>
<s:select name="data_type_" list="#{ 'protein':'Amino acid' , 'dna':'DNA' , 'rna':'RNA' , 'auto':'Auto' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stable')">Preserve the order of the input sequences</A>
<s:checkbox name="stable_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#make_scorefile')">Write a Matrix Score File</A>
<s:checkbox name="make_scorefile_" onclick="resolveParameters()"/>
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
<A name=clusteronly_para><h2><A HREF="javascript:help.slidedownandjump('#clusteronly_para_comment')">Cluster Only Parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#clusteronly')">Use clustering only (upgma)</A>
<s:checkbox name="clusteronly_" onclick="resolveParameters()"/>
<br/>
Number of iterations for Clustering (-maxiters)
<s:textfield name="clusteronlymaxiters_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=runparams><h2><A HREF="javascript:help.slidedownandjump('#runparams_comment')">Alignment Parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#maxiterations')">Number of iterations (-maxiters)</A>
<s:textfield name="maxiterations_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#max_mem')">Set the Maximum Memory to be allocated for this job</A>
<font color="red" size="3">*</font>
<s:textfield name="max_mem_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#protprofilefunction')">Specify Protein Profile Scoring Function</A>
<font color="red" size="3">+</font>
<s:radio name="protprofilefunction_"
list="#{ '-le':'Log-expectation' , '-sp':'PAM200' , '-sv':'VTML240' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#hydrowindow')">Window size for determining whether a region is hydrophobic. Protein only. (-hydro)</A>
<s:textfield name="hydrowindow_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Multiplier for gap open/close penalties in hydrophobic regions, protein only (-hydrofactor)
<s:textfield name="hydrofactormultiplier_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#logfile')">Produce a logfile containing the command line? (-log)</A>
<s:checkbox name="logfile_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#verboselogfile')">Produce a more verbose logfile? (-verbose)</A>
<s:checkbox name="verboselogfile_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=User_matrix><h2><A HREF="javascript:help.slidedownandjump('#User_matrix_comment')">User Supplied Matrices</A></H2>
<A HREF="javascript:help.slidedownandjump('#add_matrix')">User Supplied Matrix </A>
<s:checkbox name="add_matrix_" onclick="resolveParameters()"/>
<br/>
Matrix File (NCBI or WU-BLAST format)
<s:select name="mymatrix_" headerKey='' headerValue='' list="%{ getDataForParameter('mymatrix_')}" onchange="resolveParameters()"/>
<br/>
Gap Open Penalty (must be negative)
<s:textfield name="gpopen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gap Extend Penalty (must be negative)
<s:textfield name="gpextend_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Center Value (must be zero or negative)
<s:textfield name="ctr_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=Diagonal_Options><h2><A HREF="javascript:help.slidedownandjump('#Diagonal_Options_comment')">Diagonal Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_diags')">Use Diagonals</A>
<s:checkbox name="use_diags_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#diagfunction')">Diagonal Functions (-diags)</A>
<s:select name="diagfunction_" multiple="true" list="#{ '-diags1':'Iteration1' , '-diags2':'Iteration2' , '-diags':'Iterations 1and 2' }" onchange="resolveParameters()"/>
<br/>
<br/>
Maximum distance between two diagonals that allows them to merge into one diagonal. (-diagbreak)
<s:textfield name="maxdiagdist_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mindiaglength')">Minimum length of diagonal (-diaglength)</A>
<s:textfield name="mindiaglength_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#diagmarginpos')">Discard this many positions at ends of diagonal (-diagmargin)</A>
<s:textfield name="diagmarginpos_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=tree_options><h2><A HREF="javascript:help.slidedownandjump('#tree_options_comment')">Tree parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_guide_tree')">Provide a Guide Tree</A>
<s:checkbox name="use_guide_tree_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#guidetree')">Guide Tree File; Newick/Phylip format (-usetree)</A>
<s:select name="guidetree_" headerKey='' headerValue='' list="%{ getDataForParameter('guidetree_')}" onchange="resolveParameters()"/>
<br/>
Save tree produced in first iteration in Newick (Phylip-compatible) format
<s:checkbox name="make_tree1file_" onclick="resolveParameters()"/>
<br/>
Save tree produced in second iteration in Newick (Phylip-compatible) format
<s:checkbox name="make_tree2file_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=options1><h2><A HREF="javascript:help.slidedownandjump('#options1_comment')">First Stage Options</A></H2>
Use Weights for Iterations 1 and 2
<font color="red" size="3">*</font>
<s:checkbox name="use_weights_1_" onclick="resolveParameters()"/>
<br/>
Sequence weighting scheme for Iteration 1: (-<A HREF="javascript:help.slidedownandjump('#weight1')">weight1</A>)
<font color="red" size="3">*</font>
<s:select name="weight1_" list="#{ 'henikoff':'Henikoff' , 'henikoffpb':'Mod. Henikoff' , 'gsc':'GSC' , 'clustalw':'ClustalW' , 'threeway':'Gotoh' }" onchange="resolveParameters()"/>
<br/>
<br/>
Distance measure for iteration 1; Protein only (-distance1)
<s:select name="distance1p_" headerKey='' headerValue='' list="#{ 'kmer6_6':'kmer6_6' , 'kmer20_3':'kmer20_3' , 'kmer20_4':'kmer20_4' , 'kbit20_3':'kbit20_3' , 'kmer4_6':'kmer4_6' }" onchange="resolveParameters()"/>
<br/>
<br/>
Clustering for Iterations 1 and 2: (-<A HREF="javascript:help.slidedownandjump('#cluster1')">cluster1</A>)
<font color="red" size="3">*</font>
<s:radio name="cluster1_"
list="#{ 'upgma':'UPGMA' , 'upgmb':'UPGMB' , 'neighborjoining':'Neighbor Joining' }" onclick="resolveParameters()"/>
<br/>
SUEFF(must be between 0 and 1)
<s:textfield name="sueff1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Method used to root tree in iterations 1 and 2 (-root1)
<font color="red" size="3">*</font>
<s:radio name="root1_"
list="#{ 'pseudo':'Pseudo' , 'midlongestspan':'Mid longest Span' , 'minavgleafdist':'Min Avg Leaf Distance' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=options2><h2><A HREF="javascript:help.slidedownandjump('#options2_comment')">Later Stage Options</A></H2>
Maximum trees in Iteration 2 (-<A HREF="javascript:help.slidedownandjump('#maxtrees')">maxtrees</A>)
<font color="red" size="3">+</font>
<s:textfield name="maxtrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use Weights for Iterations 3 and beyond
<font color="red" size="3">*</font>
<s:checkbox name="use_weights_2_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#weight2')">Sequence weighting for tree-dependent refinement.</A>
<s:select name="weight2_" headerKey='' headerValue='' list="#{ 'henikoff':'Henikoff' , 'henikoffpb':'Mod. Henikoff' , 'gsc':'GSC' , 'clustalw':'ClustalW' , 'threeway':'Gotoh' }" onchange="resolveParameters()"/>
<br/>
<br/>
Distance Measure for Iterations 2 and above (-distance2)
<s:select name="distance2_" headerKey='' headerValue='' list="#{ 'kmer20_3':'kmer20_3' , 'kmer20_4':'kmer20_4' , 'kbit20_3':'kbit20_3' , 'pctid_kimura':'pctid_kimura' , 'pctid_log':'pctid_log' }" onchange="resolveParameters()"/>
<br/>
<br/>
Clustering method for later iterations: (-cluster2)
<font color="red" size="3">+</font>
<s:radio name="cluster2_"
list="#{ 'upgma':'UPGMA' , 'upgmb':'UPGMB' , 'neighborjoining':'Neighbor Joining' }" onclick="resolveParameters()"/>
<br/>
SUEFF(must be between 0 and 1)
<s:textfield name="sueff2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Method used to root tree in iterations 3 and beyond (-root2)
<font color="red" size="3">+</font>
<s:radio name="root2_"
list="#{ 'pseudo':'Pseudo' , 'midlongestspan':'Mid longest Span' , 'minavgleafdist':'Min Avg Leaf Distance' }" onclick="resolveParameters()"/>
<br/>
Objective score used by tree dependent refinement (-objscore)
<s:select name="objectivescore_" headerKey='' headerValue='' list="#{ 'sp':'sum-of-pairs score' , 'spf':'sum-of-pairs score (dimer approximation)' , 'spm':'sp for less then 100 seqs, otherwise spf' , 'ps':'average profile-sequence score' , 'dp':'dynamic programming score' , 'xp':'cross profile score' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#anchor')">Use Anchor Optimization (-noanchors) This option has no effect if -maxiters 1 or -maxiters 2 is specified.</A>
<s:checkbox name="anchor_" onclick="resolveParameters()"/>
<br/>
Minimum spacing between anchor columns
<s:textfield name="minanchorcolumnspacing_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum score a column must have to be an anchor
<s:textfield name="minanchorcolumnscore_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum smoothed score a column must have to be an anchor
<s:textfield name="minsmoothanchorscore_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Window Used for Anchor Smoothing
<s:textfield name="anchorsmoothingwindow_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output_options><h2><A HREF="javascript:help.slidedownandjump('#output_options_comment')">Output Options (select as many as you like) </A></H2>
Fasta output
<s:checkbox name="output_fasta_" onclick="resolveParameters()"/>
<br/>
Clustal output (.aln)
<s:checkbox name="output_clustal_" onclick="resolveParameters()"/>
<br/>
Strict Clustal output (.aln; has the Clustal header)
<s:checkbox name="output_clustals_" onclick="resolveParameters()"/>
<br/>
HTML output (.html)
<s:checkbox name="output_html_" onclick="resolveParameters()"/>
<br/>
GCG output (.msf)
<s:checkbox name="output_gcg_" onclick="resolveParameters()"/>
<br/>
Interleaved Phylip output
<s:checkbox name="output_phyi_" onclick="resolveParameters()"/>
<br/>
Sequential Phylip output (.phy)
<s:checkbox name="output_phys_" onclick="resolveParameters()"/>
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
<dt><a name=stable><i>Preserve the order of the input sequences</i></a></dt>
<dd>By default, Muscle re-arranges sequences so that similar sequences are adjacent in the output
file. (This is done by ordering sequences according to a prefix traversal of the guide tree).
This makes the alignment easier to evaluate by eye. If you want to the sequences to be output in
the same order as the input file, you can use the –stable option.</dd>
<dt><a name=make_scorefile><i>Write a Matrix Score File</i></a></dt>
<dd>Write a score file. This contains one line for each column in the alignment.
Each line contains the letters in the column followed by the
average BLOSUM62 score over pairs of letters in the column.</dd>
<br></br>
<dt><a name=clusteronly_para_comment><i><b>Cluster Only Parameters</b></i></a></dt>
<dt><a name=clusteronly><i>Use clustering only (upgma)</i></a></dt>
<dd>The fast clustering algorithm in Muscle can be used to prepare data for other applications.</dd><dd>Typical usage is:</dd><dd>muscle -cluster -tree1 tree.phy -maxiters 1</dd><dd>The sequences will be clustered, and a tree written to an tree.phy.
Options -weight1, -distance1, -cluster1 and -root1 can be applied if desired. UPGMA
clustering is used.</dd>
<br></br>
<dt><a name=runparams_comment><i><b>Alignment Parameters</b></i></a></dt>
<dt><a name=max_mem><i>Set the Maximum Memory to be allocated for this job</i></a></dt>
<dd>Specifies the amount of memory (in mb) that MUSCLE uses. Allowed values are 500-2000 mb. If the limit is exceeded, MUSCLE quits, saving the best alignment so far produced (if any). This feature has been hacked on
top of code that wasn't really designed for it. So it doesn't always work perfectly, but is better than nothing. The ideal solution
would be to implement linear space dynamic programming code (e.g., the Myers-Miller algorithm) for situations where memory is tight.</dd>
<dt><a name=protprofilefunction><i>Specify Protein Profile Scoring Function</i></a></dt>
<dd>Three different protein profile scoring functions are supported: the log-expectation score (–le option)
and 2 sum of pairs scores: either the PAM200 (–sp) or the VTML240 matrix (–sv). The log-expectation score is the default as it gives better results on our tests, but is typically
somewhere between two or three times slower than the sum-of-pairs score. For nucleotides, –spn is currently
the only option (which is of course the default for nucleotide data, so you don't need to specify this option)</dd>
<dt><a name=hydrowindow><i>Window size for determining whether a region is hydrophobic. Protein only. (-hydro)</i></a></dt>
<dd> </dd>
<dt><a name=logfile><i>Produce a logfile containing the command line? (-log)</i></a></dt>
<dd>You can specify a log file by using this option. A message will be written to the log file when muscle starts and stops. Error and warning messages will also be written to the log.</dd>
<dt><a name=verboselogfile><i>Produce a more verbose logfile? (-verbose)</i></a></dt>
<dd>If –verbose is specified, then more information will be written, including the command line used to invoke muscle, the resulting internal parameter settings, and also progress messages.IThe author highly recommends using –verbose and –log;. This enables a user to verify whether a particular alignment was completed and to review any errors or warnings that occurred.</dd>
<br></br>
<dt><a name=User_matrix_comment><i><b>User Supplied Matrices</b></i></a></dt>
<dt><a name=add_matrix><i>User Supplied Matrix </i></a></dt>
<dd>You can specify your own substitution matrix by using the -matrix option. This reads a protein substitution matrix in NCBI or WU-BLAST format. The alphabet is assumed to be amino acid, and sum-of-pairs scoring is used. The -gapopen, -gapextend and -center parameters should be specified; normally you will specify a zero value for the center. Note that gap penalties MUST be negative. The environment variable MUSCLE_MXPATH can be used to specify a path where the matrices are stored. </dd><dd> </dd><dd>For example:</dd><dd>muscle -in seqs.fa -out seqs.afa -matrix blosum62 -gapopen -12.0 -gapextend -1.0 -center 0.0</dd><dd> </dd><dd>You can hack a nucleotide matrix by pretending that AGCT are amino acids and making a 20x20 matrix out of the original 4x4 matrix.</dd>
<br></br>
<dt><a name=Diagonal_Options_comment><i><b>Diagonal Options</b></i></a></dt>
<dt><a name=use_diags><i>Use Diagonals</i></a></dt>
<dd></dd>
<dt><a name=diagfunction><i>Diagonal Functions (-diags)</i></a></dt>
<dd>The –diags option optimizes for speed by finding common words (6-mers in a compressed amino acid alphabet) between the two sequences as seeds for diagonals. For large numbers of closely related sequences, this option works very well, but sometimes has lower average accuracy. If you want the fastest possible speed, then the following example shows the applicable options for proteins:</dd><dd></dd><dd>Maxiters=1; Diagonal Iterations 1 and 2; Profile Matrix=VTML240; Distance measure =kbit20_3</dd><dd></dd><dd>If the number of sequences exceeds, say, several thousand, or if they are very long, the kbit20_3 option may cause a memory issue. If so, you can try using the default distance settings.</dd><dd></dd><dd>Maxiters=1; Diagonal Iteration 1; Profile Matrix=VTML240</dd><dd></dd><dd>For nucleotides, use:</dd><dd></dd><dd>Maxiters=1; Diagonal Iterations 1 and 2</dd><dd></dd><dd>Muscle uses k-mer extension to find diagonals. It is disabled by default, as it causes a slight reduction in average accuracy. You may select k-mer extension separately for iteratons 1 or 2 (or both) because it would be reasonable to enable diagonals in the first iteration but not the second. The main goal of the first iteration is to construct a multiple alignment quickly in order to improve the distance matrix, which is not very sensitive to alignment quality. The goal of the second iteration is to make the best possible progressive alignment</dd>
<dt><a name=mindiaglength><i>Minimum length of diagonal (-diaglength)</i></a></dt>
<dd></dd>
<dt><a name=diagmarginpos><i>Discard this many positions at ends of diagonal (-diagmargin)</i></a></dt>
<dd></dd>
<br></br>
<dt><a name=tree_options_comment><i><b>Tree parameters</b></i></a></dt>
<dt><a name=use_guide_tree><i>Provide a Guide Tree</i></a></dt>
<dd>Users can provide a guide tree to help with their sequence alignments. </dd>
<dt><a name=guidetree><i>Guide Tree File; Newick/Phylip format (-usetree)</i></a></dt>
<dd>You can specify a guide tree for your alignment. It must be in Phylip/Newick format (.dnd file). WARNING: Do not use this option just because you believe
that you have an accurate evolutionary tree for your sequences. The best guide tree for multiple sequence alignment is not the correct evolutionary tree. This can be
understood by the following argument. Alignment accuracy decreases with lower sequence identity. It follows that a given set of profiles the two that can be aligned
most accurately will tend to be the pair with the highest identity, i.e. at the shortest evolutionary distance. This is exactly the pair selected by the nearest-neighbor
criterion that Muscle uses by default. When mutation rates are variable, the evolutionary neighbor may not be the nearest neighbor. This explains why a nearest-neighbor
tree may be superior to the true evolutionary tree for for guiding a progressive alignment.</dd>
<br></br>
<dt><a name=options1_comment><i><b>First Stage Options</b></i></a></dt>
<dt><a name=weight1><i>Sequence weighting scheme for Iteration 1: (-weight1)</i></a></dt>
<dd>weight1 is used in iterations 1 and 2; none=all sequences have equal weight; Henokoff = Henikoff and Henikoff, Modified Henikoff = Henikoff as used in Psi-BLAST[
ClustalW=CLUSTALW method, Gotoh = Gotoh three-way method.</dd>
<dt><a name=cluster1><i>Clustering for Iterations 1 and 2: (-cluster1)</i></a></dt>
<dd>UPGMB is a method based on a combination of both UPGMA and Neighbor Joining (called here UPGMB).</dd>
<br></br>
<dt><a name=options2_comment><i><b>Later Stage Options</b></i></a></dt>
<dt><a name=maxtrees><i>Maximum trees in Iteration 2 (-maxtrees) </i></a></dt>
<dd>This option controls the maximum number of new trees to create in iteration 2. A point of diminishing returns is typically reached after the first tree. If a larger value is
given, the process will repeat until convergence or until this number of trees has been created, whichever comes first.</dd>
<dt><a name=weight2><i>Sequence weighting for tree-dependent refinement.</i></a></dt>
<dd>weight2 is used in iterations 1 and 2; none=all sequences have equal weight; Henokoff = Henikoff and Henikoff, Modified Henikoff = Henikoff as used in Psi-BLAST[
ClustalW=CLUSTALW method, Gotoh = Gotoh three-way method.</dd>
<dt><a name=anchor><i>Use Anchor Optimization (-noanchors) This option has no effect if -maxiters 1 or -maxiters 2 is specified.</i></a></dt>
<dd>Tree-dependent refinement (iterations 3, 4 ... ) can be speeded up by dividing the
alignment vertically into blocks. Block boundaries are found by identifying high-scoring columns
(e.g., a perfectly conserved column of Cs or Ws would be a candidate). Each vertical block is then
refined independently before reassembling the complete alignment, which is faster because of the
L2 factor in dynamic programming (e.g., suppose the alignment is split into two vertical blocks,
then 2 x (0.5)e2 = 0.5, so the dynamic programming time is roughly halved).
The –noanchors option is used to disable this feature. This option has no effect if –maxiters 1
or –maxiters 2 is specified. On benchmark tests, enabling anchors has little or no effect on
accuracy, but if you want to be very conservative and are striving for the best possible accuracy
then –noanchors is a reasonable choice.</dd>
<br></br>
<dt><a name=output_options_comment><i><b>Output Options (select as many as you like) </b></i></a></dt>
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
// data_type
// stable
// make_scorefile
// clusteronly
// clusteronlymaxiters
if (getValue('clusteronly_'))
enable('clusteronlymaxiters_');
else disable('clusteronlymaxiters_');
// maxiterations
if (!getValue('clusteronly_'))
enable('maxiterations_');
else disable('maxiterations_');
// max_mem
// protprofilefunction
if (getValue('data_type_')=="protein")
enable('protprofilefunction_');
else disable('protprofilefunction_');
// hydrowindow
if (!getValue('clusteronly_') && getValue('data_type_')=="protein")
enable('hydrowindow_');
else disable('hydrowindow_');
// hydrofactormultiplier
if (!getValue('clusteronly_') && getValue('data_type_')=="protein")
enable('hydrofactormultiplier_');
else disable('hydrofactormultiplier_');
// logfile
// verboselogfile
// add_matrix
if (!getValue('clusteronly_'))
enable('add_matrix_');
else disable('add_matrix_');
// mymatrix
if (getValue('add_matrix_'))
enable('mymatrix_');
else disable('mymatrix_');
// gpopen
if (getValue('add_matrix_'))
enable('gpopen_');
else disable('gpopen_');
// gpextend
if (getValue('add_matrix_'))
enable('gpextend_');
else disable('gpextend_');
// ctr
if (getValue('add_matrix_'))
enable('ctr_');
else disable('ctr_');
// use_diags
if (!getValue('clusteronly_'))
enable('use_diags_');
else disable('use_diags_');
// diagfunction
if (getValue('use_diags_'))
enable('diagfunction_');
else disable('diagfunction_');
// maxdiagdist
if (getValue('use_diags_'))
enable('maxdiagdist_');
else disable('maxdiagdist_');
// mindiaglength
if (getValue('use_diags_'))
enable('mindiaglength_');
else disable('mindiaglength_');
// diagmarginpos
if (getValue('use_diags_'))
enable('diagmarginpos_');
else disable('diagmarginpos_');
// use_guide_tree
if (!getValue('clusteronly_'))
enable('use_guide_tree_');
else disable('use_guide_tree_');
// guidetree
if (getValue('use_guide_tree_'))
enable('guidetree_');
else disable('guidetree_');
// make_tree1file
// make_tree2file
if (!getValue('clusteronly_'))
enable('make_tree2file_');
else disable('make_tree2file_');
// use_weights_1
// weight1
// distance1p
if (getValue('data_type_')=="protein" )
enable('distance1p_');
else disable('distance1p_');
// cluster1
// sueff1
if (getValue('cluster1_')=="upgmb")
enable('sueff1_');
else disable('sueff1_');
// root1
// maxtrees
if (!getValue('clusteronly_'))
enable('maxtrees_');
else disable('maxtrees_');
// use_weights_2
// weight2
if (!getValue('clusteronly_'))
enable('weight2_');
else disable('weight2_');
// distance2
if (!getValue('clusteronly_') && getValue('data_type_')=="protein")
enable('distance2_');
else disable('distance2_');
// cluster2
if (!getValue('clusteronly_'))
enable('cluster2_');
else disable('cluster2_');
// sueff2
if (getValue('cluster2_')=="upgmb")
enable('sueff2_');
else disable('sueff2_');
// root2
if (!getValue('clusteronly_'))
enable('root2_');
else disable('root2_');
// objectivescore
if (!getValue('clusteronly_'))
enable('objectivescore_');
else disable('objectivescore_');
// anchor
// minanchorcolumnspacing
if (getValue('anchor_'))
enable('minanchorcolumnspacing_');
else disable('minanchorcolumnspacing_');
// minanchorcolumnscore
if (getValue('anchor_'))
enable('minanchorcolumnscore_');
else disable('minanchorcolumnscore_');
// minsmoothanchorscore
if (getValue('anchor_'))
enable('minsmoothanchorscore_');
else disable('minsmoothanchorscore_');
// anchorsmoothingwindow
if (getValue('anchor_'))
enable('anchorsmoothingwindow_');
else disable('anchorsmoothingwindow_');
// output_fasta
// output_clustal
// output_clustals
// output_html
// output_gcg
// output_phyi
// output_phys
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// data_type
// stable
// make_scorefile
// clusteronly
// clusteronlymaxiters
if (getValue('clusteronly_')) {
if (getValue('clusteronlymaxiters_') < 1) {
alert('At least one iteration is required');
return false;
}
}
// maxiterations
if (!getValue('clusteronly_')) {
if (getValue('maxiterations_') < 1) {
alert('At least one iteration must be specified');
return false;
}
}
// max_mem
if (getValue('max_mem_') < 500) {
alert('The max memory value must be greater than 500');
return false;
}
if (getValue('max_mem_') > 30000000) {
alert('The max memory value must be less than or equal to 30000000');
return false;
}
// protprofilefunction
// hydrowindow
if (!getValue('clusteronly_') && getValue('data_type_')=="protein") {
if (getValue('hydrowindow_') < 1) {
alert('The hydrophobic window size must be must be greater than or equal to 1');
return false;
}
}
// hydrofactormultiplier
if (!getValue('clusteronly_') && getValue('data_type_')=="protein") {
if (getValue('hydrofactormultiplier_') <= 0) {
alert('The hydrophobic multiplier must be greater than 0');
return false;
}
}
// logfile
// verboselogfile
// add_matrix
// mymatrix
// gpopen
if (getValue('add_matrix_')) {
if (getValue('gpopen_') >= 0) {
alert('The gap open penalty must be a negative number');
return false;
}
}
// gpextend
if (getValue('add_matrix_')) {
if (getValue('gpextend_') >= 0) {
alert('The gap extend penalty must be a negative number');
return false;
}
}
// ctr
if (getValue('add_matrix_')) {
if (getValue('ctr_') > 0) {
alert('The center value is usually 0, MUST be less than or equal to zero');
return false;
}
}
// use_diags
// diagfunction
// maxdiagdist
if (getValue('use_diags_')) {
if (getValue('maxdiagdist_') < 1) {
alert('The maximum distance between two diagonals must be greater than or equal to 1');
return false;
}
}
// mindiaglength
if (getValue('use_diags_')) {
if (getValue('mindiaglength_') < 1) {
alert('The minimum length of the diagonal must not be less than 1');
return false;
}
}
// diagmarginpos
if (getValue('use_diags_')) {
if (getValue('diagmarginpos_') < 1) {
alert('You must discard at least 1 position at the end of a diagonal');
return false;
}
}
// use_guide_tree
// guidetree
// make_tree1file
// make_tree2file
// use_weights_1
// weight1
// distance1p
// cluster1
// sueff1
if (getValue('cluster1_')=="upgmb") {
if (getValue('sueff1_') <= 0 ) {
alert('The SUEFF Value Must be > 0 and 1 or less');
return false;
}
}
if (getValue('cluster1_')=="upgmb") {
if (getValue('sueff1_') > 1) {
alert('The SUEFF Value Must be > 0 and 1 or less');
return false;
}
}
// root1
// maxtrees
if (!getValue('clusteronly_')) {
if (getValue('maxtrees_') < 1) {
alert('The value must be greater than or equal to 1');
return false;
}
}
// use_weights_2
// weight2
// distance2
// cluster2
// sueff2
if (getValue('cluster2_')=="upgmb") {
if (getValue('sueff2_') <= 0 ) {
alert('The SUEFF Value Must be > 0 and 1 or less');
return false;
}
}
if (getValue('cluster2_')=="upgmb") {
if (getValue('sueff2_') > 1) {
alert('The SUEFF Value Must be > 0 and 1 or less');
return false;
}
}
// root2
// objectivescore
// anchor
// minanchorcolumnspacing
if (getValue('anchor_')) {
if (getValue('minanchorcolumnspacing_') <1) {
alert('The minimum spacing between anchor columns must not be less than 1');
return false;
}
}
// minanchorcolumnscore
if (getValue('anchor_')) {
if (getValue('minanchorcolumnscore_') <1) {
alert('The minimum score a column to be an anchor cannot be less than 1');
return false;
}
}
// minsmoothanchorscore
if (getValue('anchor_')) {
if (getValue('minsmoothanchorscore_') <1) {
alert('The minimum smoothed score to be an anchor cannot be less than 1');
return false;
}
}
// anchorsmoothingwindow
if (getValue('anchor_')) {
if (getValue('anchorsmoothingwindow_') <=1) {
alert('The window smoothing value must be at least 1');
return false;
}
}
// output_fasta
// output_clustal
// output_clustals
// output_html
// output_gcg
// output_phyi
// output_phys
return issueWarning();
}
function issueWarning() {
// runtime
// data_type
// stable
// make_scorefile
// clusteronly
// clusteronlymaxiters
// maxiterations
// max_mem
// protprofilefunction
// hydrowindow
// hydrofactormultiplier
// logfile
// verboselogfile
// add_matrix
// mymatrix
// gpopen
// gpextend
// ctr
// use_diags
// diagfunction
// maxdiagdist
// mindiaglength
// diagmarginpos
// use_guide_tree
// guidetree
// make_tree1file
// make_tree2file
// use_weights_1
// weight1
// distance1p
// cluster1
// sueff1
// root1
// maxtrees
// use_weights_2
// weight2
// distance2
// cluster2
// sueff2
// root2
// objectivescore
// anchor
// minanchorcolumnspacing
// minanchorcolumnscore
// minsmoothanchorscore
// anchorsmoothingwindow
// output_fasta
// output_clustal
// output_clustals
// output_html
// output_gcg
// output_phyi
// output_phys
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
var element = document.forms['muscle'].elements[parameter];
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
var element = document.forms['muscle'].elements[parameter];
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
var element = document.forms['muscle'].elements[parameter];
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