<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MAFFT on XSEDE</title>
<h2>MAFFT on XSEDE: Multiple alignment program for amino acid or nucleotide sequences; parallel version (<a href="#REFERENCE">Kazutaka Katoh, Kei-ichi Kuma, Hiroyuki Toh, and Takashi Miyata</a>)</h2>
<s:form action="mafft_tg" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Output format
<font color="red" size="3">*</font>
<s:radio name="outputFormat_"
list="#{ '0':'FASTA' , '1':'ClustalW' }" onclick="resolveParameters()"/>
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
<A name=overall><h2><A HREF="javascript:help.slidedownandjump('#overall_comment')">Set the Basic Run Parameters</A></H2>
Input type
<font color="red" size="3">*</font>
<s:radio name="datatype_"
list="#{ '0':'Determine Automatically' , 'dna':'Nucleotide' , 'protein':'Amino Acid' }" onclick="resolveParameters()"/>
<br/>
Automatically select an appropriate strategy from L-INS-i, FFT-NS-i and FFT-NS-2 (based on data size) (--auto)
<s:checkbox name="auto_analysis_" onclick="resolveParameters()"/>
<br/>
Use a preconfigured MAFFT strategy that:
<font color="red" size="3">+</font>
<s:radio name="analysis_type_"
list="#{ 'accurate':'Favors accuracy' , 'fast':'Favors speed' , 'rna':'Considers RNA structure' }" onclick="resolveParameters()"/>
<br/>
I want to configure my own analysis from scratch: (--mafft)
<s:checkbox name="configure_analysis_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#accurate_executable')">Choose a MAFFT accurate executable</A>
<font color="red" size="3">+</font>
<s:select name="accurate_executable_" list="#{ 'linsi68':'L-INS-i ' , 'ginsi68':'G-INS-i ' , 'einsi68':'E-INS-i' , 'ftnsi':'FFT-NS-i' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#fast_executables')">Choose a fast MAFFT executable</A>
<font color="red" size="3">+</font>
<s:select name="fast_executables_" list="#{ 'fftnsi2':'FFT-NS-i (2 cycles)' , 'fftnsi1000':'FFT-NS-i (1000 cycles)' , 'fftns168':'FFT-NS-1 (0 cycles)' , 'fftns268':'FFT-NS-2 (0 cycles)' , 'nwnsi68':'NW-NS-i (2 cycles)' , 'nwns268':'NW-NS-2' , 'nwns268part':'NW-NS-PartTree' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#rna_executable')">Choose a MAFFT RNA structure executable</A>
<font color="red" size="3">+</font>
<s:radio name="rna_executable_"
list="#{ 'qinsi':'Q-INS-i' , 'xinsi':'X-INS-i' }" onclick="resolveParameters()"/>
<br/>
Use Contrafold rather than McCaskill algorithm (--contrafold)
<s:checkbox name="use_contrafold_" onclick="resolveParameters()"/>
<br/>
Which X-INS-i option should be used
<s:select name="xinsi_option_" headerKey='' headerValue='' list="#{ 'larapair':'larapair' , 'foldalignlocalpair':'foldalignlocalpair' , '--foldalignglobalpair':'foldalignglobalpair' , 'scarnapair':'MXSCARNA' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=para_algorithm><h2><A HREF="javascript:help.slidedownandjump('#para_algorithm_comment')">Algorithm Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#distanceMetric')">Distance metric</A>
<font color="red" size="3">+</font>
<s:select name="distanceMetric_" list="#{ '0':'6merpair' , '1':'globalpair' , '2':'localpair' , '3':'genafpair' , '4':'fastapair' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#weighting_factor')">Weighting factor for the consistency term calculated from pairwise alignments (--weighti)</A>
<font color="red" size="3">+</font>
<s:textfield name="weighting_factor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#retrees')">Number of times guide tree is built in progressive stage (--retree)</A>
<s:textfield name="retrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of cycles of iterative refinement (-maxiterate)
<s:textfield name="iterativeRefinements_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
FFT approximation in group-to-group alignment
<s:radio name="useFFT_"
list="#{ '': '[Not Mandatory]', '0':'off' , '1':'on' }" onclick="resolveParameters()"/>
<br/>
Check alignment score in iterative refinement stage ( --noscore)
<s:radio name="noScore_"
list="#{ '': '[Not Mandatory]', '0':'no' , '1':'yes' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#memSave')">Use the Myers-Miller (1988) algorithm (--memsave)</A>
<s:radio name="memSave_"
list="#{ '': '[Not Mandatory]', '0':'auto-select' , '1':'yes' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#usePartTree')">Use the PartTree algorithm for tree building.</A>
<s:radio name="usePartTree_"
list="#{ '': '[Not Mandatory]', '0':'no' , '1':'yes' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#partTreeMetric')">PartTree distance metric</A>
<s:radio name="partTreeMetric_"
list="#{ '': '[Not Mandatory]', '0':'6-mer' , '1':'DP' , '2':'FASTA' }" onclick="resolveParameters()"/>
<br/>
Number of partitions in the PartTree algorithm (--partsize)
<s:textfield name="partTreePartitions_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#maxAlignment')">Maximum alignment size (--groupsize)</A>
<s:textfield name="maxAlignment_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=para_parameters><h2><A HREF="javascript:help.slidedownandjump('#para_parameters_comment')">Seed/Profile/Merge Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_seed')">Use a Seed Alignment (--seed)</A>
<s:checkbox name="use_seed_" onclick="resolveParameters()"/>
<br/>
Select the Seed Alignment
<s:select name="seed_alignment1_" headerKey='' headerValue='' list="%{ getDataForParameter('seed_alignment1_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_add')">Use Add Alignment (--add)</A>
<s:checkbox name="use_add_" onclick="resolveParameters()"/>
<br/>
Select the Alignment to add unaligned sequences to
<s:select name="add_alignment1_" headerKey='' headerValue='' list="%{ getDataForParameter('add_alignment1_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_addfrag')">Use Addfragments Alignment (--addfragments)</A>
<s:checkbox name="use_addfrag_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#large_align')">Fast Alignment for Large data set (--6merpair)</A>
<s:checkbox name="large_align_" onclick="resolveParameters()"/>
<br/>
Select the Reference Alignment
<s:select name="ref_alignment1_" headerKey='' headerValue='' list="%{ getDataForParameter('ref_alignment1_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#reorder_add')">Reorder Output Alignment (--reorder)</A>
<s:checkbox name="reorder_add_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_addprof')">Add Aligned Sequences to an Existing Alignment (--addprofile)</A>
<s:checkbox name="use_addprof_" onclick="resolveParameters()"/>
<br/>
Select the Existing Alignment
<s:select name="existing_alignment1_" headerKey='' headerValue='' list="%{ getDataForParameter('existing_alignment1_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_merge')">Merge Two or more sub-MSAs into a single file (--merge)</A>
<s:checkbox name="use_merge_" onclick="resolveParameters()"/>
<br/>
Select the SUBMSA Table
<s:select name="submsa_table_" headerKey='' headerValue='' list="%{ getDataForParameter('submsa_table_')}" onchange="resolveParameters()"/>
<br/>
Provide a Guide Tree for Merge
<s:select name="treein_tree_" headerKey='' headerValue='' list="%{ getDataForParameter('treein_tree_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=para_parameters><h2><A HREF="javascript:help.slidedownandjump('#para_parameters_comment')">Algorithm Parameters</A></H2>
Nucleic Acid matrix selection (--kimura)
<font color="red" size="3">+</font>
<s:radio name="dnaMatrix_"
list="#{ '200':'200PAM/kappa=2' , '20':'20PAM / kappa=2' , '1':'1PAM / kappa=2' }" onclick="resolveParameters()"/>
<br/>
Amino Acid matrix selection
<s:select name="aaMatrix_" headerKey='' headerValue='' list="#{ '0':'BLOSUM (Henikoff and Henikoff 1992)' , '1':'JTT PAM (Jones et al. 1992)' , '2':'Transmembrane PAM (Jones et al. 1994)' , '3':'User-defined' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#jtt')">JTT PAM matrix (Jones et al. 1992) selection (--jtt)</A>
<s:textfield name="jtt_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#tm')">Transmembrane PAM matrix (Jones et al. 1994) selection (--tm)</A>
<s:textfield name="tm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#userMatrix')">User-defined amino acid scoring matrix in BLAST format (--aamatrix)</A>
<s:select name="userMatrix_" headerKey='' headerValue='' list="%{ getDataForParameter('userMatrix_')}" onchange="resolveParameters()"/>
<br/>
Gap opening penalty for group-to-group alignment (--op)
<s:textfield name="opPenaltyGroupToGroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Offset value (gap extension penalty) for group-to-group alignment (--ep)
<s:textfield name="extendPenaltyGroupToGroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#opPenaltyPairwise')">Gap open penalty for pairwise alignment (--lop)</A>
<s:textfield name="opPenaltyPairwise_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#offsetValuePairwise')">Offset value for pairwise alignment (--lep)</A>
<s:textfield name="offsetValuePairwise_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extendPenaltyPairwise')">Gap extension penalty for pairwise alignment (--lexp)</A>
<font color="red" size="3">+</font>
<s:textfield name="extendPenaltyPairwise_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#opPenaltySkip')">Gap open penalty for skipping the alignment (--LOP)</A>
<s:textfield name="opPenaltySkip_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extendPenaltySkip')">Gap extension penalty for skipping the alignment (--LEXP)</A>
<s:textfield name="extendPenaltySkip_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Incorporate AA/nucleotide composition information into the scoring matrix (--fmodel)
<font color="red" size="3">*</font>
<s:radio name="fmodel_"
list="#{ '0':'no' , '1':'yes' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=para_io><h2><A HREF="javascript:help.slidedownandjump('#para_io_comment')">Input/Output Options</A></H2>
Output order
<font color="red" size="3">*</font>
<s:radio name="outputOrder_"
list="#{ '0':'same as input' , '1':'aligned' }" onclick="resolveParameters()"/>
<br/>
Output guide tree (--treeout)
<font color="red" size="3">*</font>
<s:radio name="outputGuideTree_"
list="#{ '0':'no' , '1':'yes' }" onclick="resolveParameters()"/>
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
Estimate the maximum time your job will need to run (up to 168 hrs). Your job will be killed if it doesn't finish within the time you specify, however jobs with shorter maximum run times are often scheduled sooner than longer jobs.
</dd>
<br></br>
<dt><a name=overall_comment><i><b>Set the Basic Run Parameters</b></i></a></dt>
<dt><a name=accurate_executable><i>Choose a MAFFT accurate executable</i></a></dt>
<dd>Accuracy-oriented methods:</dd><dd>* L-INS-i (probably most accurate; recommended for < 200 sequences; iterative refinement method</dd><dd> incorporating local pairwise alignment information); equivalent to: </dd><dd> mafft --localpair --maxiterate 1000 --reorder --ep 0.0 --retree 1 input [< output]</dd><dd>* G-INS-i (suitable for sequences of similar lengths; recommended for < 200 sequences; iterative</dd><dd> refinement method incorporating global pairwise alignment information); equivalent to:</dd><dd> mafft --globalpair --maxiterate 1000 --reorder --ep 0.0 --retree 1 input [< output]</dd><dd>* E-INS-i (suitable for sequences containing large unalignable regions; recommended for < 200</dd><dd> sequences); equivalent to:</dd><dd> mafft --ep 0.0 --genafpair --maxiterate 1000 --reorder --retree 1 [< output]</dd><dd> For E-INS-i, the --ep 0 option is recommended to allow large gaps.</dd><dd>FFT-NS-i (Slow; iterative refinement method) equivalent to mafft --reorder --ep 0.0 --maxiterate 1000</dd>
<dt><a name=fast_executables><i>Choose a fast MAFFT executable</i></a></dt>
<dd>Speed-oriented methods:</dd><dd>*FFT-NS-i (iterative refinement method; two cycles only); equivalent to</dd><dd> mafft -retree 2 -maxiterate 2 input [< output]</dd><dd>*FFT-NS-i (iterative refinement method; 1000 cycles); equivalent to</dd><dd> mafft -retree 2 -maxiterate 1000 input [< output]</dd><dd>*FFT-NS-1 (very fast; recommended for >2000 sequences; progressive method with a rough guide tree): :</dd><dd> mafft --retree 1 --maxiterate 0 input [< output]</dd><dd>*FFT-NS-2 (fast; progressive method); equivalent to: </dd><dd> mafft --retree 2 --reorder --maxiterate 0 input [< output]</dd><dd>*NW-NS-i (nwnsi) (iterative refinement withoutFFT, two cycles only); equivalent to:</dd><dd> mafft --retree 2 --maxiterate 2 --nofft input [< output] </dd><dd>*NW-NS-2 (fast; progressive method without the FFT approximation); equivalent to:</dd><dd> mafft -retree 2 --maxiterate 0 -nofft input [< output] </dd><dd>* *NW-NS-PartTree-1 (recommended for ~10,000 to ~50,000 sequences; progressive method with the PartTree algorithm); equivalent to:</dd><dd> mafft -retree 1 -maxiterate 0 -nofft -parttree input [< output] </dd>
<dt><a name=rna_executable><i>Choose a MAFFT RNA structure executable</i></a></dt>
<dd>RNA structure methods</dd><dd>* Q-INS-i (suitable for sequences containing large unalignable regions; recommended for < 200 X 1,000 nt</dd><dd> sequences); equivalent to:</dd><dd> mafft-qinsi --reorder --ep 0.0 [--objective function]</dd><dd> Secondary structure information of RNA is considered. Uses the Four-way Consistency objective function (Katoh and Toh, submitted) for incorporating structural information. These methods are suitable for a global alignment of highly diverged ncRNA sequenes. For relatively conserved RNAs, such as SSU and LSU rRNA, the advantage of these methods is small. Uses the Four-way Consistency objective function (Katoh and Toh, submitted) for incorporating structural information.
</dd><dd>* X-INS-i (suitable for sequences containing large unalignable regions; recommended for < 50 sequences x 1,000 nt</dd><dd> sequences); equivalent to:</dd><dd> mafft-xinsi --reorder --ep 0.0 [--algorithm] CONTRAfold or McCaskill (default) algorithm</dd><dd> X-INS-i is a framework based on the Four-way Consistency objective function to build a multiple structural alignment by combining pairwise structural alignments given by an external program. At present, the external program can be selected from MXSCARNA (default), LaRA and FOLDALIGN (the local and global options).
</dd>
<br></br>
<dt><a name=para_algorithm_comment><i><b>Algorithm Options</b></i></a></dt>
<dt><a name=distanceMetric><i>Distance metric</i></a></dt>
<dd>* 6merpair: Distance is calculated based on the number of shared 6mers.</dd><dd>* globalpair: All pairwise alignments are computed with the Needleman-Wunsch algorithm. More accurate</dd><dd> but slower than using 6merpair. Suitable for a set of globally alignable sequences. Applicable to up to</dd><dd> ~200 sequences. A combination with --maxiterate 1000 is recommended (G-INS-i).</dd><dd>* localpair: All pairwise alignments are computed with the Smith-Waterman algorithm. More ac curate but</dd><dd> slower than using 6merpair. Suitable for a set of locally alignable sequences. Applicable up to ~200</dd><dd> sequences. A combination with --maxiterate 1000 is recommended (L-INS-i).</dd><dd>* genafpair: All pairwise alignments are computed with a local algorithm with the generalized affine</dd><dd> gap cost (Altschul 1998). More accurate but slower than using 6merpair. Suitable when large internal</dd><dd> gaps are expected. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is</dd><dd> recommended (E-INS-i).</dd><dd>* fastapair: All pairwise alignments are computed with FASTA (Pearson and Lipman 1988). FASTA is required.</dd>
<dt><a name=weighting_factor><i>Weighting factor for the consistency term calculated from pairwise alignments (--weighti)</i></a></dt>
<dd>Weighting factor for the consistency term calculated from pairwise alignments. Valid when any of --globalpair,</dd><dd> --localpair, --genafpair, --fastapair or --blastpair is selected.</dd>
<dt><a name=retrees><i>Number of times guide tree is built in progressive stage (--retree)</i></a></dt>
<dd>Valid only with 6-mer distances</dd>
<dt><a name=memSave><i>Use the Myers-Miller (1988) algorithm (--memsave)</i></a></dt>
<dd>By default, this is automatically turned on when the alignment length exceeds 10,000</dd>
<dt><a name=usePartTree><i>Use the PartTree algorithm for tree building.</i></a></dt>
<dd>Uses a fast tree-building method (PartTree, Katoh and Toh 2007). Recommended if a large number </dd><dd>(> ~10,000) of sequences are input.</dd>
<dt><a name=partTreeMetric><i>PartTree distance metric</i></a></dt>
<dd>* 6-mer: default distance metric</dd><dd>* DP: distances are based on dynamic programming. Slightly more accurate and slower than using 6-mers.</dd><dd>* FASTA: distances based on FASTA. Slightly more accurate and slower than using 6-mers.</dd>
<dt><a name=maxAlignment><i>Maximum alignment size (--groupsize)</i></a></dt>
<dd>Valid only with the --*parttree options. Default: the number of input sequences</dd>
<br></br>
<dt><a name=para_parameters_comment><i><b>Seed/Profile/Merge Options</b></i></a></dt>
<dt><a name=use_seed><i>Use a Seed Alignment (--seed)</i></a></dt>
<dd>The --seed option can be used for adding unaligned sequences into a highly reliable alignment
(seed) consisting of a small number of sequences. In this option, the aligned letters in the
seed alignment are preserved but gaps are not necessarily preserved. If the given alignment
(including the gap pattern) has to be completely preserved, use the -add or -addfragments option</dd>
<dt><a name=use_add><i>Use Add Alignment (--add)</i></a></dt>
<dd>This option allows the user to upload an alignment to add to. Use the --add option if the number of unaligned sequences
is much smaller than the number of sequences in the skeleton alignment</dd>
<dt><a name=use_addfrag><i>Use Addfragments Alignment (--addfragments)</i></a></dt>
<dd>The --addfrag option allows the user to add unaligned fragmentary sequence(s) into an existing alignment</dd>
<dt><a name=large_align><i>Fast Alignment for Large data set (--6merpair)</i></a></dt>
<dd>Use the --6merpair option for large data.</dd>
<dt><a name=reorder_add><i>Reorder Output Alignment (--reorder)</i></a></dt>
<dd>Omit --reorder to preserve the original sequence order.</dd>
<dt><a name=use_addprof><i>Add Aligned Sequences to an Existing Alignment (--addprofile)</i></a></dt>
<dd>This option allows the user to upload an alignment for addprofile. Use the --addprofile option to add sequences to an existing alignment</dd>
<dt><a name=use_merge><i>Merge Two or more sub-MSAs into a single file (--merge)</i></a></dt>
<dd>This option allows the user to merge two or more sub-MSAs (and unaligned sequences)
into a single MSA by the --merge option. Each sub-MSA is preserved.</dd>
<br></br>
<dt><a name=para_parameters_comment><i><b>Algorithm Parameters</b></i></a></dt>
<dt><a name=jtt><i>JTT PAM matrix (Jones et al. 1992) selection (--jtt)</i></a></dt>
<dd>Valid entries must be greater than 0.</dd>
<dt><a name=tm><i>Transmembrane PAM matrix (Jones et al. 1994) selection (--tm)</i></a></dt>
<dd>Valid entries must be greater than 0.</dd>
<dt><a name=userMatrix><i>User-defined amino acid scoring matrix in BLAST format (--aamatrix)</i></a></dt>
<dd>The format of matrixfile is the same to that of BLAST. Ignored when nucleotide sequences are input.</dd>
<dt><a name=opPenaltyPairwise><i>Gap open penalty for pairwise alignment (--lop)</i></a></dt>
<dd>Valid when the --localpair or --genafpair distance metric options are selected.</dd>
<dt><a name=offsetValuePairwise><i>Offset value for pairwise alignment (--lep)</i></a></dt>
<dd>Valid when the --localpair or --genafpair distance metric options are selected.</dd>
<dt><a name=extendPenaltyPairwise><i>Gap extension penalty for pairwise alignment (--lexp)</i></a></dt>
<dd>Valid when the --localpair or --genafpair distance metric options are selected.</dd>
<dt><a name=opPenaltySkip><i>Gap open penalty for skipping the alignment (--LOP)</i></a></dt>
<dd>Valid when the --genafpair distance metric option is selected.</dd>
<dt><a name=extendPenaltySkip><i>Gap extension penalty for skipping the alignment (--LEXP)</i></a></dt>
<dd>Valid when the --genafpair distance metric option is selected.</dd>
<br></br>
<dt><a name=para_io_comment><i><b>Input/Output Options</b></i></a></dt>
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
// datatype
// auto_analysis
if (!getValue('configure_analysis_'))
enable('auto_analysis_');
else disable('auto_analysis_');
// analysis_type
if (!getValue('configure_analysis_') && !getValue('auto_analysis_'))
enable('analysis_type_');
else disable('analysis_type_');
// configure_analysis
if (!getValue('auto_analysis_'))
enable('configure_analysis_');
else disable('configure_analysis_');
// accurate_executable
if (getValue('analysis_type_')=="accurate" && !getValue('auto_analysis_') && !getValue('configure_analysis_'))
enable('accurate_executable_');
else disable('accurate_executable_');
// fast_executables
if (getValue('analysis_type_')=="fast" && !getValue('auto_analysis_') && !getValue('configure_analysis_'))
enable('fast_executables_');
else disable('fast_executables_');
// rna_executable
if (getValue('analysis_type_')=="rna" && !getValue('auto_analysis_'))
enable('rna_executable_');
else disable('rna_executable_');
// use_contrafold
if (getValue('analysis_type_')=="rna" )
enable('use_contrafold_');
else disable('use_contrafold_');
// xinsi_option
if (getValue('rna_executable_')=="xinsi")
enable('xinsi_option_');
else disable('xinsi_option_');
// distanceMetric
if (getValue('configure_analysis_'))
enable('distanceMetric_');
else disable('distanceMetric_');
// weighting_factor
if (getValue('configure_analysis_') && getValue('distanceMetric_')!="0")
enable('weighting_factor_');
else disable('weighting_factor_');
// retrees
if ((getValue('distanceMetric_')=="0") && getValue('configure_analysis_'))
enable('retrees_');
else disable('retrees_');
// iterativeRefinements
if (getValue('configure_analysis_'))
enable('iterativeRefinements_');
else disable('iterativeRefinements_');
// useFFT
if (getValue('configure_analysis_'))
enable('useFFT_');
else disable('useFFT_');
// noScore
// memSave
// usePartTree
// partTreeMetric
if (getValue('usePartTree_')=="1")
enable('partTreeMetric_');
else disable('partTreeMetric_');
// partTreePartitions
if (getValue('usePartTree_')=="1")
enable('partTreePartitions_');
else disable('partTreePartitions_');
// maxAlignment
if (getValue('usePartTree_')=="1")
enable('maxAlignment_');
else disable('maxAlignment_');
// use_seed
// seed_alignment1
if (getValue('use_seed_'))
enable('seed_alignment1_');
else disable('seed_alignment1_');
// use_add
// add_alignment1
if (getValue('use_add_'))
enable('add_alignment1_');
else disable('add_alignment1_');
// use_addfrag
// large_align
if (getValue('use_addfrag_'))
enable('large_align_');
else disable('large_align_');
// ref_alignment1
if (getValue('use_addfrag_'))
enable('ref_alignment1_');
else disable('ref_alignment1_');
// reorder_add
if (getValue('use_addfrag_') || getValue('use_add_'))
enable('reorder_add_');
else disable('reorder_add_');
// use_addprof
// existing_alignment1
if (getValue('use_addprof_'))
enable('existing_alignment1_');
else disable('existing_alignment1_');
// use_merge
if (!getValue('use_addprof_') && !getValue('use_addfrag_') && !getValue('use_add_'))
enable('use_merge_');
else disable('use_merge_');
// submsa_table
if (getValue('use_merge_'))
enable('submsa_table_');
else disable('submsa_table_');
// treein_tree
if (getValue('use_merge_'))
enable('treein_tree_');
else disable('treein_tree_');
// dnaMatrix
if (getValue('datatype_')=="dna")
enable('dnaMatrix_');
else disable('dnaMatrix_');
// aaMatrix
if (getValue('datatype_')=="protein")
enable('aaMatrix_');
else disable('aaMatrix_');
// jtt
if (( getValue('aaMatrix_') && getValue('aaMatrix_')=="1"))
enable('jtt_');
else disable('jtt_');
// tm
if (( getValue('aaMatrix_') && getValue('aaMatrix_')=="2"))
enable('tm_');
else disable('tm_');
// userMatrix
if (( getValue('aaMatrix_') && getValue('aaMatrix_')=="3"))
enable('userMatrix_');
else disable('userMatrix_');
// opPenaltyGroupToGroup
// extendPenaltyGroupToGroup
if (getValue('configure_analysis_'))
enable('extendPenaltyGroupToGroup_');
else disable('extendPenaltyGroupToGroup_');
// opPenaltyPairwise
if ((getValue('distanceMetric_')=="2") || (getValue('distanceMetric_')=="3"))
enable('opPenaltyPairwise_');
else disable('opPenaltyPairwise_');
// offsetValuePairwise
if ((getValue('distanceMetric_')=="2") || (getValue('distanceMetric_')=="3"))
enable('offsetValuePairwise_');
else disable('offsetValuePairwise_');
// extendPenaltyPairwise
if ((getValue('distanceMetric_')=="2") || (getValue('distanceMetric_')=="3"))
enable('extendPenaltyPairwise_');
else disable('extendPenaltyPairwise_');
// opPenaltySkip
if ((getValue('distanceMetric_')=="3"))
enable('opPenaltySkip_');
else disable('opPenaltySkip_');
// extendPenaltySkip
if ((getValue('distanceMetric_')=="3"))
enable('extendPenaltySkip_');
else disable('extendPenaltySkip_');
// fmodel
// outputFormat
// outputOrder
// outputGuideTree
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 168.0) {
alert('Maximum Hours to Run must be between 0.1 - 168.0.');
return false;
}
// datatype
// auto_analysis
// analysis_type
if (!getValue('configure_analysis_') && !getValue('auto_analysis_')) {
if (!getValue('configure_analysis_') && !getValue('auto_analysis_') && getValue('analysis_type_')!="accurate" && getValue('analysis_type_')!="rna" && getValue('analysis_type_')!="fast") {
alert('Please choose an analysis type, or opt to create an analysis from scratch');
return false;
}
}
// configure_analysis
// accurate_executable
// fast_executables
// rna_executable
// use_contrafold
// xinsi_option
// distanceMetric
// weighting_factor
// retrees
// iterativeRefinements
// useFFT
// noScore
// memSave
// usePartTree
// partTreeMetric
// partTreePartitions
// maxAlignment
// use_seed
if (getValue('use_seed_') && ! getValue('seed_alignment1_')) {
alert('Please select a seed alignment file');
return false;
}
// seed_alignment1
// use_add
if (getValue('use_add_') && (getValue('use_addprof_') || getValue('use_addfrag_') || getValue('use_seed_'))) {
alert('Sorry, you cant use the add option with --seed or --addfragment options, please uncheck one of these boxes');
return false;
}
if (getValue('use_add_') && ! getValue('add_alignment1_')) {
alert('Please select an alignment file to --add to');
return false;
}
// add_alignment1
// use_addfrag
if (getValue('use_addfrag_') && (getValue('use_addprof_') || getValue('use_add_') || getValue('use_seed_'))) {
alert('Sorry, you cant use the addfragment option with --seed, --addprofile, or --add options, please uncheck one of these boxes');
return false;
}
if (getValue('use_addfrag_') && ! getValue('ref_alignment1_')) {
alert('Please select a reference alignment file');
return false;
}
// large_align
// ref_alignment1
// reorder_add
// use_addprof
if (getValue('use_addprof_') && (getValue('use_addfrag_') || getValue('use_add_') || getValue('use_seed_'))) {
alert('Sorry, you cant use the addprofile option with --seed, --add, or addfragment options, please uncheck one of these boxes');
return false;
}
if (getValue('use_addprof_') && ! getValue('existing_alignment1_')) {
alert('Please select an existing alignment file for --addprofile');
return false;
}
// existing_alignment1
// use_merge
// submsa_table
if (getValue('use_merge_')) {
if (getValue('use_merge_') && ! getValue('submsa_table_')) {
alert('Please select a SUBMSA table for the --merge option');
return false;
}
}
// treein_tree
// dnaMatrix
// aaMatrix
// jtt
if (( getValue('aaMatrix_') && getValue('aaMatrix_')=="1")) {
if (getValue('jtt_') < 1) {
alert('Please enter a value greater than 0.');
return false;
}
}
// tm
if (( getValue('aaMatrix_') && getValue('aaMatrix_')=="2")) {
if (getValue('tm_') < 1) {
alert('Please enter a value greater than 0.');
return false;
}
}
// userMatrix
// opPenaltyGroupToGroup
// extendPenaltyGroupToGroup
// opPenaltyPairwise
// offsetValuePairwise
// extendPenaltyPairwise
// opPenaltySkip
// extendPenaltySkip
// fmodel
// outputFormat
// outputOrder
// outputGuideTree
return issueWarning();
}
function issueWarning() {
// runtime
// datatype
if (getValue('datatype_') == 0 || getValue('datatype_')==dna || getValue('datatype_')==protein)
{
if (!confirm(messageSplit("The job will run on 32 processors as configured. If it runs for the entire configured time, it will consume 32 x getValue('runtime_') cpu hours")))
{
return false;
}
}
// auto_analysis
// analysis_type
// configure_analysis
// accurate_executable
// fast_executables
// rna_executable
// use_contrafold
// xinsi_option
// distanceMetric
// weighting_factor
// retrees
// iterativeRefinements
// useFFT
// noScore
// memSave
// usePartTree
// partTreeMetric
// partTreePartitions
// maxAlignment
// use_seed
// seed_alignment1
// use_add
// add_alignment1
// use_addfrag
// large_align
// ref_alignment1
// reorder_add
// use_addprof
// existing_alignment1
// use_merge
// submsa_table
// treein_tree
// dnaMatrix
// aaMatrix
// jtt
// tm
// userMatrix
// opPenaltyGroupToGroup
// extendPenaltyGroupToGroup
// opPenaltyPairwise
// offsetValuePairwise
// extendPenaltyPairwise
// opPenaltySkip
// extendPenaltySkip
// fmodel
// outputFormat
// outputOrder
// outputGuideTree
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
var element = document.forms['mafft_tg'].elements[parameter];
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
var element = document.forms['mafft_tg'].elements[parameter];
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
var element = document.forms['mafft_tg'].elements[parameter];
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