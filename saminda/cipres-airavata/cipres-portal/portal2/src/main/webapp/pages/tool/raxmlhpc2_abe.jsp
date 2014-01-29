<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RAxML-HPC2 on Abe</title>
<h2>RAxML-HPC2 on Abe: Phylogenetic tree inference using maximum likelihood/rapid bootstrapping run on teragrid. (beta interface) (<a href="#REFERENCE">Alexandros Stamatakis</a>)</h2>
<s:form action="raxmlhpc2_abe" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nchars')">Number of chars in your dataset</A>
<s:textfield name="nchars_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Sequence Type
<font color="red" size="3">*</font>
<s:select name="datatype_" list="#{ 'protein':'Protein' , 'dna':'Nucleotide' , 'rna':'RNA Structure' , 'binary':'Binary' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#outgroup')">Outgroup (one or more comma-separated outgroups, see comment for syntax)</A>
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#number_cats')">Specify the number of distinct rate categories (-c)</A>
<font color="red" size="3">*</font>
<s:textfield name="number_cats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#treetop')">Supply a starting tree (Not available when doing rapid bootstrapping, -x) (-t)</A>
<s:select name="treetop_" headerKey='' headerValue='' list="%{ getDataForParameter('treetop_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#provide_parsimony_seed')">Specify a random seed value for parsimony inferences (-p)</A>
<font color="red" size="3">*</font>
<s:checkbox name="provide_parsimony_seed_" onclick="resolveParameters()"/>
<br/>
Enter a random seed value for parsimony inferences (gives reproducible results from random starting tree)
<font color="red" size="3">*</font>
<s:textfield name="parsimony_seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Specify an initial rearrangement setting (-i)
<font color="red" size="3">*</font>
<s:checkbox name="rearrangement_yes_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#number_rearrange')">Specify the distance from original pruning point (-i)</A>
<font color="red" size="3">*</font>
<s:textfield name="number_rearrange_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#constraint')">Constraint (-g)</A>
<s:select name="constraint_" headerKey='' headerValue='' list="%{ getDataForParameter('constraint_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#binary_backbone')">Binary Backbone (-r)</A>
<s:select name="binary_backbone_" headerKey='' headerValue='' list="%{ getDataForParameter('binary_backbone_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#partition')">Use a mixed/partitioned model? (-q)</A>
<s:select name="partition_" headerKey='' headerValue='' list="%{ getDataForParameter('partition_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#estimate_perpartbrlen')">Estimate individual per-partition branch lengths (-M)</A>
<font color="red" size="3">*</font>
<s:checkbox name="estimate_perpartbrlen_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#invariable')">Estimate proportion of invariable sites (GTRGAMMA + I) (currently disabled)</A>
<font color="red" size="3">*</font>
<s:radio name="invariable_"
list="#{ 'I':'yes' , '':'no' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#exclude_file')">Create an input file that excludes the range of positions specifed in this file (-E)</A>
<s:select name="exclude_file_" headerKey='' headerValue='' list="%{ getDataForParameter('exclude_file_')}" onchange="resolveParameters()"/>
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
<A name=nucleic_opts><h2><A HREF="javascript:help.slidedownandjump('#nucleic_opts_comment')">Nucleic Acid Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#dna_gtrcat')">Use GTRCAT for the bootstrapping phase, and GTRGAMMA for the final tree inference (default)</A>
<s:checkbox name="dna_gtrcat_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dna_gtrgamma')">Use GTRGAMMA for the bootstrapping phase and GTRGAMMA for the final tree (takes longer)</A>
<s:checkbox name="dna_gtrgamma_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=protein_opts><h2><A HREF="javascript:help.slidedownandjump('#protein_opts_comment')">Protein Analysis Options</A></H2>
Choose GAMMA or CAT model:
<font color="red" size="3">+</font>
<s:radio name="prot_sub_model_"
list="#{ 'PROTGAMMA':'Protein GAMMA' , 'PROTCAT':'Protein CAT' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#prot_matrix_spec')">Protein Substitution Matrix</A>
<font color="red" size="3">+</font>
<s:select name="prot_matrix_spec_" list="#{ 'DAYHOFF':'DAYHOFF' , 'DCMUT':'DCMUT' , 'JTT':'JTT' , 'MTREV':'MTREV' , 'WAG':'WAG' , 'RTREV':'RTREV' , 'CPREV':'CPREV' , 'VT':'VT' , 'BLOSUM62':'BLOSUM62' , 'MTMAM':'MTMAM' , 'LG':'LG' , 'MTART':'MTART' , 'MTZOA':'MTZOA' , 'PMB':'PMB' , 'HIVB':'HIVB' , 'HIVW':'HIVW' , 'JTTDCMUT':'JTTDCMUT' , 'FLU':'FLU' , 'GTR':'GTR' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#user_prot_matrix')">Upload a Custom Protein Substitution Matrix</A>
<s:select name="user_prot_matrix_" headerKey='' headerValue='' list="%{ getDataForParameter('user_prot_matrix_')}" onchange="resolveParameters()"/>
<br/>
Use empirical frequencies?
<s:radio name="use_emp_freqs_"
list="#{ '': '[Not Mandatory]', 'F':'Yes' , '':'No' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=Sec_structure_opts><h2><A HREF="javascript:help.slidedownandjump('#Sec_structure_opts_comment')">RNA Secondary Structure Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#sec_str_file')">Upload a Secondary Structure File (-S)</A>
<s:select name="sec_str_file_" headerKey='' headerValue='' list="%{ getDataForParameter('sec_str_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#rna_model')">Use an RNA Secondary Structure Substitution Model (-A)</A>
<font color="red" size="3">+</font>
<s:select name="rna_model_" list="#{ 'S6A':'Six State Model A' , 'S6B':'Six State Model B' , 'S6C':'Six State Model C' , 'S6D':'Six State Model D' , 'S6E':'Six State Model E' , 'S7A':'Seven State Model A' , 'S7B':'Seven State Model B' , 'S7C':'Seven State Model C' , 'S7D':'Seven State Model D' , 'S7E':'Seven State Model E' , 'S7F':'Seven State Model F' , 'S16A':'Sixteen State Model A' , 'S16B':'Sixteen State Model B' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=bin_opts><h2><A HREF="javascript:help.slidedownandjump('#bin_opts_comment')">Binary Matrix Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#bin_model')">Binary data model (-m)</A>
<font color="red" size="3">+</font>
<s:radio name="bin_model_"
list="#{ 'BINCAT':'Binary CAT' , 'BINGAMMA':'Binary GAMMA' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=set_analysis><h2><A HREF="javascript:help.slidedownandjump('#set_analysis_comment')">Select the Analysis</A></H2>
<A HREF="javascript:help.slidedownandjump('#startingtreeonly')">Only compute a randomized parsimony starting tree (-y)</A>
<s:checkbox name="startingtreeonly_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_runs')">Specify the number alternative runs on distinct starting trees? (-#/-N)</A>
<font color="red" size="3">+</font>
<s:checkbox name="specify_runs_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#altrun_number')">Enter number of number alternative runs</A>
<font color="red" size="3">+</font>
<s:textfield name="altrun_number_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bipartitions')">Draw bipartitions onto a single tree topology. (-f b)</A>
<s:checkbox name="bipartitions_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#log_likelihood')">Compute a log likelihood test (-f h)</A>
<s:checkbox name="log_likelihood_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#compute_mr')">Compute majority rule consensus tree (-J; GAMMA models only)</A>
<font color="red" size="3">+</font>
<s:checkbox name="compute_mr_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#specify_mr')">Specify majority rule consensus tree (-J) technique </A>
<font color="red" size="3">+</font>
<s:radio name="specify_mr_"
list="#{ 'MR':'Majority rule' , 'MRE':'Extended majority rule' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bunchotops')">File with topologies for bipartitions or bootstopping (-z)</A>
<s:select name="bunchotops_" headerKey='' headerValue='' list="%{ getDataForParameter('bunchotops_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#compute_ml_distances')">Compute pair-wise ML distances (-f x; GAMMA models only)</A>
<font color="red" size="3">+</font>
<s:checkbox name="compute_ml_distances_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=bootstrap_config><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_config_comment')">Configure Bootstrapping</A></H2>
<A HREF="javascript:help.slidedownandjump('#mulparambootstrap_seed')">Conduct Multiparametric Bootstrapping? (-b)</A>
<font color="red" size="3">+</font>
<s:checkbox name="mulparambootstrap_seed_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mulparambootstrap_seed_val')">Enter a random seed value for multi-parametric bootstrapping</A>
<font color="red" size="3">+</font>
<s:textfield name="mulparambootstrap_seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bootstrap_seed')">Conduct rapid bootstrapping? (-x)</A>
<s:checkbox name="bootstrap_seed_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bootstrap_seed_val')">Enter a random seed value for rapid bootstrapping</A>
<font color="red" size="3">+</font>
<s:textfield name="bootstrap_seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mlsearch')">Conduct a rapid Bootstrap analysis and search for the best-scoring ML tree in one single program run. (-f a)</A>
<s:checkbox name="mlsearch_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#printbrlength')">Print branch lengths (-k)</A>
<s:checkbox name="printbrlength_" onclick="resolveParameters()"/>
<br/>
Specify an Explicit Number of Bootstraps
<font color="red" size="3">+</font>
<s:checkbox name="specify_bootstraps_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bootstop')">Bootstrap iterations (-#|-N)</A>
<font color="red" size="3">+</font>
<s:textfield name="bootstop_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_bootstopping')">Let RAxML halt bootstrapping automatically</A>
<font color="red" size="3">+</font>
<s:checkbox name="use_bootstopping_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#freq_bootstopping')">Stop Bootstrapping Automatically with Frequency Criterion</A>
<font color="red" size="3">+</font>
<s:checkbox name="freq_bootstopping_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mr_bootstopping')">Stop Bootstrapping Automatically with Majority Rule Criterion</A>
<font color="red" size="3">+</font>
<s:checkbox name="mr_bootstopping_" onclick="resolveParameters()"/>
<br/>
Select Majority Rule Criterion: (autoMRE is usually preferred)
<font color="red" size="3">+</font>
<s:radio name="mrbootstopping_type_"
list="#{ 'autoMR':'autoMR' , 'autoMRE':'autoMRE' , 'autoMRE_IGN':'autoMRE_IGN' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_apobootstopping')">Use a posteriori bootstrapping</A>
<s:checkbox name="use_apobootstopping_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#aposterior_bootstopping')">Select the criterion for a posteriori bootstopping analysis</A>
<font color="red" size="3">+</font>
<s:select name="aposterior_bootstopping_" list="#{ 'autoFC':'autoFC' , 'autoMR':'autoMR' , 'autoMRE':'autoMRE' , 'autoMRE_IGN':'autoMRE_IGN' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#apo_tops')">File with topologies for a posteriori bootstopping (-z)</A>
<s:select name="apo_tops_" headerKey='' headerValue='' list="%{ getDataForParameter('apo_tops_')}" onchange="resolveParameters()"/>
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
<dd>Estimate the maximum time your job will need to run (168hrs max).
Your job will be killed if it doesn't finish within the time you specify,
however jobs with shorter maximum run times are often scheduled sooner than
longer jobs. Jobs that specify < .5 hr are run in the debug queue and
are normally scheduled quickly. Jobs that need less than 48 hrs go the
normal queue and jobs requiring up to 168 hrs go the long queue.</dd>
<dt><a name=nchars><i>Number of chars in your dataset</i></a></dt>
<dd>
Knowing the number of characters in your dataset helps us determine the most efficient way to run raxml.
We need to know the number of characters per row in the input data matrix.
</dd>
<dt><a name=outgroup><i>Outgroup (one or more comma-separated outgroups, see comment for syntax)</i></a></dt>
<dd>The correct syntax for the box is outgroup1,outgroup2,outgroupn. If white space is introduced (e.g. outgroup1, outgroup2, outgroupn) the program will fail with the message
"Error, you must specify a model of substitution with the '-m' option"
</dd>
<dt><a name=number_cats><i>Specify the number of distinct rate categories (-c)</i></a></dt>
<dd>This option allows you to specify the number of distinct rate categories, into which the individually optimized rates for each individual site are thrown under -m GTRCAT. The default of -c 25 works fine in most practical cases.
</dd>
<dt><a name=treetop><i>Supply a starting tree (Not available when doing rapid bootstrapping, -x) (-t)</i></a></dt>
<dd>Specifies a user starting tree file in Newick format. Not available when doing rapid bootstrapping. Branch lengths of that tree will be ignored. Note that you can also specify a non-comprehensive (not containing all taxa in the alignment) starting tree now. This might be useful if newly aligned/sequenced taxa have been added to your alignment. Initially, taxa will be added to the tree using the MP criterion. The comprehensive tree will then be optimized
under ML.</dd>
<dt><a name=provide_parsimony_seed><i>Specify a random seed value for parsimony inferences (-p)</i></a></dt>
<dd>Specify a random number seed. The -p option allows you and others to reproduce your results (reproducible/verifiable experiments) and will help Alexis debug the program. Do not use this option if you want to generate multiple different starting trees.</dd>
<dt><a name=number_rearrange><i>Specify the distance from original pruning point (-i)</i></a></dt>
<dd>This option allows you to specify an initial rearrangement setting for the initial phase of the search algorithm. If you specify e.g. -i 10; the pruned subtrees will be inserted up to a distance of 10 nodes away from their original pruning point. If you dont specify -i; a "good" initial rearrangement setting will automatically be determined by RAxML.
</dd>
<dt><a name=constraint><i>Constraint (-g)</i></a></dt>
<dd> This option allows you to specify an incomplete or comprehensive multifurcating constraint
tree for the RAxML search in NEWICK format. Initially, multifurcations are resolved
randomly. If the tree is incomplete (does not contain all taxa) the remaining taxa are added by
using the MP criterion. Once a comprehensive (containing all taxa) bifurcating tree
is computed, it is further optimized under ML respecting the given constraints. Important: If you
specify a non-comprehensive constraint, e.g., a constraint tree that does not contain all taxa,
RAxML will assume that any taxa that not found in the constraint topology
are unconstrained, i.e., these taxa can be placed in any part of the tree. As an example
consider an alignment with 10 taxa: Loach, Chicken, Human, Cow, Mouse, Whale, Seal, Carp,
Rat, Frog. If, for example you would like Loach, Chicken, Human, Cow to be monophyletic you
would specify the constraint tree as follows: </dd><dd> ((Loach, Chicken, Human, Cow),(Mouse, Whale, Seal, Carp, Rat, Frog)); </dd><dd> Moreover, if you would like Loach, Chicken, Human, Cow to be monophyletic and in
addition Human, Cow to be monophyletic within that clade you could specify: </dd><dd> ((Loach, Chicken, (Human, Cow)),(Mouse, Whale, Seal, Carp, Rat, Frog)); </dd><dd> If you specify an incomplete constraint: </dd><dd> ((Loach, Chicken, Human, Cow),(Mouse, Whale, Seal, Carp)); </dd><dd> the two groups Loach, Chicken, Human, Cow and Mouse, Whale, Seal, Carp will be
monophyletic, while Rat and Frog can end up anywhere in the tree. </dd>
<dt><a name=binary_backbone><i>Binary Backbone (-r)</i></a></dt>
<dd>This option allows you to pass a binary/bifurcating constraint/backbone tree in NEWICK format to RAxML. Note that using this option only makes sense if this tree contains fewer taxa than the input alignment. The remaining taxa will initially be added by using the MP criterion. Once a comprehensive tree with all taxa has been obtained it will be optimized under ML respecting the restrictions of the constraint tree.
</dd>
<dt><a name=partition><i>Use a mixed/partitioned model? (-q)</i></a></dt>
<dd>This parameter allows you to upload a file that specifies the regions of your alignment for which an individual model of nucleotide substitution should be estimated. This will typically be used to infer trees for long (in terms of base pairs) multi-gene alignments. If DNA and protein mixed models are used together (for example) you should choose a model option based on the model of rate heterogeneity you want to use. If you specify either -m GTRCAT or PROTCAT, the CAT model will be used, if you specify -m GTRGAMMA or -m BINGAMMA, the GAMMA model will be used ....
For example, if -m GTRGAMMA is used, individual alpha-shape parameters, GTR-rates, and empirical base frequencies will be estimated and optimized for each partition. Since Raxml can now handles mixed Amino Acid and DNA alignments, you must specify the data type in the partition file, before the partition name. For DNA, this means you have to add DNA to each line in the partition. For AA data you must specify the transition matrices for each partition:
The AA substitution model must be the first entry in each line and must be separated by a comma from the gene name, just like the DNA token above. You can not assign different models of rate heterogeneity to different partitions, i.e. it will be either CAT, GAMMA, GAMMAI etc. for all partitions, as specified with -m. Finally, if you have a concatenated DNA and AA alignments, with DNA data at positions 1 - 500 and AA data at 501-1000 with the WAG model the partition file should look as follows:</dd><dd>DNA, gene1 = 1-500</dd><dd>WAG gene2 = 501-1000</dd>
<dt><a name=estimate_perpartbrlen><i>Estimate individual per-partition branch lengths (-M)</i></a></dt>
<dd>The -M option switches on estimation of individual per-partition branch lengths. Only has effect when used in combination with -q and an alignment partition file. Branch lengths for individual partitions will be printed to separate files. A weighted average of the branch lengths is also computed by using the respective partition lengths (number of columns per partition). Note that, this does not take into account the "gappyness" of partitions, but I am currently not sure how to solve this problem. By default RAxML will compute a joined branch length estimate.</dd>
<dt><a name=invariable><i>Estimate proportion of invariable sites (GTRGAMMA + I) (currently disabled)</i></a></dt>
<dd>This option is disabled in keeping with the developers best advice.</dd>
<dt><a name=exclude_file><i>Create an input file that excludes the range of positions specifed in this file (-E)</i></a></dt>
<dd>This option is used to excludes specific positions in the matrix. For example, uploading a file
that contains the text: 100-200 300-400 will create a file that excludes all columns between positions
100 and 200 as well as all columns between positions 300 and 400. Note that the boundary numbers (positions 100, 200, 300,
and 400) will also be excluded. To exclude a single column write (100-100). This option does not
run an analysis but just prints an alignment file without the excluded columns. Save this file to your
data area, and then run the real analysis. If you use a mixed model, an appropriately adapted model file
will also be written. The ntax element of the phylip files is automatically corrected Example: raxmlHPC -E excl
-s infile -m GTRCAT -q part -n TEST. In this case the files with columns excluded will be named
infile.excl and part.excl. </dd>
<br></br>
<dt><a name=nucleic_opts_comment><i><b>Nucleic Acid Options</b></i></a></dt>
<dt><a name=dna_gtrcat><i>Use GTRCAT for the bootstrapping phase, and GTRGAMMA for the final tree inference (default)</i></a></dt>
<dd>The meaning of the model name GTRGAMMA used by RAxML 7.2.0 is exactly opposite that
used in RAxML 7.0.4, so we have eliminated selection by model name. Instead we use a
description of the model analysis. This selection gives GTR + Optimization of substitution
rates + Optimization of site-specific evolutionary rates which are categorized into "numberOfCategories" distinct
rate categories for greater computational efficiency. Final tree is evaluated under GTRGAMMA.
GTRMIX and GTRCAT_GAMMA have been eliminated as options. FLOAT options that are native in RAxML 7.2.3 are currently not supported here.
</dd>
<dt><a name=dna_gtrgamma><i>Use GTRGAMMA for the bootstrapping phase and GTRGAMMA for the final tree (takes longer)</i></a></dt>
<dd>The meaning of the model names used by RAxML 7.2.0 are exactly opposite to those used in RAxML 7.0.4,
so we have eliminated selection by model name. Instead we use a description of the model analysis.
This option gives GTR + Optimization of substitution rates + GAMMA model of rate heterogeneity
(alpha parameter will be estimated) for bootstrap AND final evaluation. An analysis run in this
way will take a good deal longer than the alternative option (what used to be called GTRGAMMA in RAxML v.7.0.4).
GTRMIX and GTRCAT_GAMMA have been eliminated as options. FLOAT options that are native in RAxML 7.2.3 are currently not supported here.
</dd>
<br></br>
<dt><a name=protein_opts_comment><i><b>Protein Analysis Options</b></i></a></dt>
<dt><a name=prot_matrix_spec><i>Protein Substitution Matrix</i></a></dt>
<dd>Note: FLOAT and invariable sites (I) options are not exposed here. If you require this option, please contact mmiller@sdsc.edu.</dd><dd>-m PROTCATmatrixName: analyses using the specified AA matrix + Optimization of substitution rates + Optimization of site-specific evolutionary rates which are categorized into numberOfCategories distinct rate categories for greater computational efficiency. Final tree might be evaluated automatically under PROTGAMMAmatrixName[f], depending on the tree search option.
</dd><dd>-m PROTGAMMAmatrixName[F] analyses use the specified AA matrix + Optimization of substitution rates + GAMMA model of rate heterogeneity (alpha parameter will be estimated)</dd><dd>Available AA substitution models: DAYHOFF, DCMUT, JTT, MTREV, WAG, RTREV, CPREV, VT, BLOSUM62, MTMAM, LG, GTR. You can specify if you want to use empirical base frequencies. Please note that for mixed models you can in addition specify the per-gene AA model in the mixed model file (see manual for details). Also note that if you estimate AA GTR parameters on a partitioned dataset, they will be linked (estimated jointly) across all partitions to avoid over-parametrization.</dd>
<dt><a name=user_prot_matrix><i>Upload a Custom Protein Substitution Matrix</i></a></dt>
<dd>Specify a file containing a user-defined Protein substitution model. This file must contain 420 entries, the first 400 entires are the AA substitution rates (this matrix must be symmetric) and the last 20 entries are the empirical base frequencies</dd>
<br></br>
<dt><a name=Sec_structure_opts_comment><i><b>RNA Secondary Structure Options</b></i></a></dt>
<dt><a name=sec_str_file><i>Upload a Secondary Structure File (-S)</i></a></dt>
<dd>This option allows you to provide a secondary structure file. The file can contain "." for alignment columns that do not form part of a stem and characters, while "(), [], and {}" are used to define stem regions and pseudoknots.</dd>
<dt><a name=rna_model><i>Use an RNA Secondary Structure Substitution Model (-A)</i></a></dt>
<dd>Use this option to specify one of the 6, 7, or 16 state RNA secondary structure substitution models.The nomenclature is identical to that used in the program PHASE. For more information, see PHASE documentation: 6 state model nomenclature: http://www.cs.manchester.ac.uk/ai/Software/phase/manual/node101.html; 7 state model nomenclature http://www.cs.manchester.ac.uk/ai/Software/phase/manual/node107.html; 16 state model nomenclature http://www.cs.manchester.ac.uk/ai/Software/phase/manual/node114.html</dd>
<br></br>
<dt><a name=bin_opts_comment><i><b>Binary Matrix Options</b></i></a></dt>
<dt><a name=bin_model><i>Binary data model (-m)</i></a></dt>
<dd>Binary data is handled in RAXML 7.2.0. Binary CAT use optimization of site-specific evolutionary rates, which are categorized into numberOfCategories (option -c) distinct rate categories for greater computational efficiency. Final tree might be evaluatedautomatically under BINGAMMA, depending on the tree search option. </dd><dd>Binary GAMMA uses the GAMMA model of rate heterogeneity (alpha parameter will be estimated). The option for invariable sites is not provided at this time. The program's author supports the use of Gamma models.</dd>
<br></br>
<dt><a name=set_analysis_comment><i><b>Select the Analysis</b></i></a></dt>
<dt><a name=startingtreeonly><i>Only compute a randomized parsimony starting tree (-y)</i></a></dt>
<dd>If you want to only compute a randomized parsimony starting tree with RAxML and not execute an ML analysis of the tree specify -y. The program will exit after computation of the starting tree. This option can be useful if you want to assess the impact of randomized MP and Neighbor Joining starting trees on your search algorithm. They can also be used e.g. as starting trees for Derrick Zwickls GARLI program for ML inferences, which needs comparatively good starting trees to work well above approximately 500 taxa. </dd>
<dt><a name=specify_runs><i>Specify the number alternative runs on distinct starting trees? (-#/-N)</i></a></dt>
<dd>This option specifies the number of alternative runs on distinct starting trees. For example, if -N 10 is specfied, RAxML
will compute 10 distinct ML trees starting from 10 distinct randomized maximum parsimony starting trees. </dd>
<dt><a name=altrun_number><i>Enter number of number alternative runs</i></a></dt>
<dd>if -N 10 is specfied, RAxML will compute 10 distinct ML trees starting from 10 distinct randomized maximum parsimony starting trees.</dd>
<dt><a name=bipartitions><i>Draw bipartitions onto a single tree topology. (-f b)</i></a></dt>
<dd>When this is specified, RAxML draws the bipartitions using a bunch of topologies (typically boot-strapped trees) specified with -z onto a single tree topology specified by -t (typically the best-scoring ML tree). </dd>
<dt><a name=log_likelihood><i>Compute a log likelihood test (-f h)</i></a></dt>
<dd>When this is specified, RAxML will compute a log likelihood test (SH-test [21]) between a best tree passed via -t and a bunch of other trees passed via -z. Example: raxmlHPC -f h -t ref -z trees -s alg -m GTRGAMMA -n TEST</dd>
<dt><a name=compute_mr><i>Compute majority rule consensus tree (-J; GAMMA models only)</i></a></dt>
<dd>This option allows the user to compute majority rule consensus tree or extended majority rule consensus tree from an uploaded file containing several trees (-z)</dd>
<dt><a name=specify_mr><i>Specify majority rule consensus tree (-J) technique </i></a></dt>
<dd>A badly formatted tree file may produce an error like this: /u/ac/cipres/ngbw/contrib/tools/bin/wrap.sh: line 21: 31550 Segmentation fault $*
</dd>
<dt><a name=bunchotops><i>File with topologies for bipartitions or bootstopping (-z)</i></a></dt>
<dd>The -z option is used in combination with the -f b,-f h,-f m,-f n options. The uploaded file should contain a number of trees in NEWICK format. The file should contain one tree per line without blank lines between trees. For example, you can directly read in a RAxML bootstrap result file.</dd>
<dt><a name=compute_ml_distances><i>Compute pair-wise ML distances (-f x; GAMMA models only)</i></a></dt>
<dd>Compute pair-wise ML distances, ML model parameters will be estimated on an MP starting tree or a user-defined tree passed via "-t".</dd>
<br></br>
<dt><a name=bootstrap_config_comment><i><b>Configure Bootstrapping</b></i></a></dt>
<dt><a name=mulparambootstrap_seed><i>Conduct Multiparametric Bootstrapping? (-b)</i></a></dt>
<dd>This option allows you to turn on non-parametric bootstrapping. To allow for reproducibility of runs in the sequential program, you have to specify a random number seed.
</dd>
<dt><a name=mulparambootstrap_seed_val><i>Enter a random seed value for multi-parametric bootstrapping</i></a></dt>
<dd>This random number is provided to assure that there is comparability between runs.</dd>
<dt><a name=bootstrap_seed><i>Conduct rapid bootstrapping? (-x)</i></a></dt>
<dd>This option offers a novel rapid Bootstrapping algorithm that is faster by at least one order of magnitude than all other current implementations (RAxML 2.2.3, GARLI, PHYML). The results obtained are qualitatively comparable to those obtained via the standard RAxML BS algorithm and, more importantly, the deviations in support values between the rapid and the standard RAxML BS algorithm are smaller than those induced by using a different search strategy, e.g. GARLI or PHYML. This rapid BS search can be combined with a rapid ML search on the original alignment and thus allows users to conduct a full ML analysis within one single program run.</dd>
<dt><a name=bootstrap_seed_val><i>Enter a random seed value for rapid bootstrapping</i></a></dt>
<dd>This random number is provided to assure that there is comparability between runs.</dd>
<dt><a name=mlsearch><i>Conduct a rapid Bootstrap analysis and search for the best-scoring ML tree in one single program run. (-f a)</i></a></dt>
<dd>Tell RAxML to conduct a Rapid Bootstrap analysis (-x) and search for the best-scoring ML tree in one single program run.
</dd>
<dt><a name=printbrlength><i>Print branch lengths (-k)</i></a></dt>
<dd> The -k option causes bootstrapped trees to be printed with branch lengths.
The bootstraps will require a bit longer to run under this option because model parameters will be optimized at
the end of each run under GAMMA or GAMMA+P-Invar respectively.
</dd>
<dt><a name=bootstop><i>Bootstrap iterations (-#|-N)</i></a></dt>
<dd>Specifies the number of alternative runs on distinct starting trees. If 10, RAxML computes 10 distinct ML trees starting from 10 distinct randomized maximum parsimony starting trees. In combination with the Random seed for rapid bootstrap (-x) invoke a rapid BS analysis.
</dd>
<dt><a name=use_bootstopping><i>Let RAxML halt bootstrapping automatically</i></a></dt>
<dd>This option instructs Raxml to automatically halt bootstrapping when certain criteria are met, instead of specifying the number of bootstraps for an analysis. The exact criteria are specified/configured using subsequent entry fields.</dd>
<dt><a name=freq_bootstopping><i>Stop Bootstrapping Automatically with Frequency Criterion</i></a></dt>
<dd>If you want to use the bootstopping criteria specify "-# autoMR" or "-# autoMRE" or "-# autoMRE_IGN" for the majority-rule tree based criteria (see -I option) or "-# autoFC" for the frequency-based criterion. Bootstopping will only work in combination with "-x" or "-b"</dd>
<dt><a name=mr_bootstopping><i>Stop Bootstrapping Automatically with Majority Rule Criterion</i></a></dt>
<dd>If you want to use the bootstopping criteria specify "-# autoMR" or "-# autoMRE" or "-# autoMRE_IGN" for the majority-rule tree based criteria (see -I option) or "-# autoFC" for the frequency-based criterion. Bootstopping will only work in combination with "-x" or "-b"</dd>
<dt><a name=use_apobootstopping><i>Use a posteriori bootstrapping</i></a></dt>
<dd>This option is used when a bootstrap analysis is already completed. Upload an input file, a tree, and bootstrapped trees. You must upload a set of bootstrapped trees uploaded as a single file using the -z option. Once this selection is made, the user must select whether the bootstopping threshold is determined using frequency criteria or majority rule criteria</dd>
<dt><a name=aposterior_bootstopping><i>Select the criterion for a posteriori bootstopping analysis</i></a></dt>
<dd>This option allows the user to conduct a posteriori bootstopping analysis based on a set of bootstrapped trees. Use: autoFC for the frequency-based criterion, autoMR for the majority-rule consensus tree criterion, autoMRE for the extended majority-rule consensus tree criterion
and autoMRE_IGN for metrics similar to MRE, but include bipartitions under the threshold whether they are compatible or not. This emulates MRE but is faster to compute. For any of these options, you also need to upload a tree file containing several bootstrap replicates via "-z"</dd>
<dt><a name=apo_tops><i>File with topologies for a posteriori bootstopping (-z)</i></a></dt>
<dd></dd>
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
// nchars
// datatype
// outgroup
// number_cats
if ((getValue('datatype_')=="dna" && getValue('dna_gtrcat_')) || (getValue('datatype_')=="protein" && getValue('prot_sub_model_')=="PROTCAT") || (getValue('datatype_')=="binary" && getValue('bin_model_')=="BINCAT"))
enable('number_cats_');
else disable('number_cats_');
// treetop
if (!getValue('bootstrap_seed_'))
enable('treetop_');
else disable('treetop_');
// provide_parsimony_seed
if (!getValue('startingtreeonly_') && ! getValue('treetop_'))
enable('provide_parsimony_seed_');
else disable('provide_parsimony_seed_');
// parsimony_seed_val
if (getValue('provide_parsimony_seed_'))
enable('parsimony_seed_val_');
else disable('parsimony_seed_val_');
// rearrangement_yes
// number_rearrange
if (getValue('rearrangement_yes_'))
enable('number_rearrange_');
else disable('number_rearrange_');
// constraint
if (! getValue('binary_backbone_') && !getValue('startingtreeonly_'))
enable('constraint_');
else disable('constraint_');
// binary_backbone
if (! getValue('constraint_'))
enable('binary_backbone_');
else disable('binary_backbone_');
// partition
// estimate_perpartbrlen
if ( getValue('partition_'))
enable('estimate_perpartbrlen_');
else disable('estimate_perpartbrlen_');
// invariable
if (getValue('placeholder_'))
enable('invariable_');
else disable('invariable_');
// exclude_file
// dna_gtrcat
if (!getValue('dna_gtrgamma_') && (getValue('datatype_')=="dna" || getValue('datatype_')=="rna"))
enable('dna_gtrcat_');
else disable('dna_gtrcat_');
// dna_gtrgamma
if (!getValue('dna_gtrcat_') && (getValue('datatype_')=="dna" || getValue('datatype_')=="rna") )
enable('dna_gtrgamma_');
else disable('dna_gtrgamma_');
// prot_sub_model
if (getValue('datatype_')=="protein")
enable('prot_sub_model_');
else disable('prot_sub_model_');
// prot_matrix_spec
if (getValue('datatype_')=="protein")
enable('prot_matrix_spec_');
else disable('prot_matrix_spec_');
// user_prot_matrix
if (getValue('datatype_')=="protein")
enable('user_prot_matrix_');
else disable('user_prot_matrix_');
// use_emp_freqs
if (getValue('datatype_')=="protein")
enable('use_emp_freqs_');
else disable('use_emp_freqs_');
// sec_str_file
if (getValue('datatype_')=="rna")
enable('sec_str_file_');
else disable('sec_str_file_');
// rna_model
if ( getValue('sec_str_file_'))
enable('rna_model_');
else disable('rna_model_');
// bin_model
if (getValue('datatype_')=="binary")
enable('bin_model_');
else disable('bin_model_');
// startingtreeonly
if (!getValue('mulparambootstrap_seed_') &&!getValue('bootstrap_seed_') && !getValue('bipartitions_') && ! getValue('constraint_') && !getValue('log_likelihood_') && !getValue('compute_ml_distances_') && !getValue('specify_runs_'))
enable('startingtreeonly_');
else disable('startingtreeonly_');
// specify_runs
if (!getValue('bootstrap_seed_') && !getValue('mulparambootstrap_seed_') && !getValue('bipartitions_') && !getValue('startingtreeonly_') && !getValue('log_likelihood_'))
enable('specify_runs_');
else disable('specify_runs_');
// altrun_number
if (getValue('specify_runs_'))
enable('altrun_number_');
else disable('altrun_number_');
// bipartitions
if (!getValue('mulparambootstrap_seed_') &&!getValue('bootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('compute_ml_distances_') && !getValue('specify_runs_'))
enable('bipartitions_');
else disable('bipartitions_');
// log_likelihood
if (!getValue('mulparambootstrap_seed_') && !getValue('bootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('bipartitions_') && !getValue('compute_ml_distances_') && !getValue('specify_runs_'))
enable('log_likelihood_');
else disable('log_likelihood_');
// compute_mr
if (getValue('dna_gtrgamma_') || getValue('bin_model_')=="BINGAMMA" || getValue('prot_sub_model_')=="PROTGAMMA")
enable('compute_mr_');
else disable('compute_mr_');
// specify_mr
if (getValue('compute_mr_'))
enable('specify_mr_');
else disable('specify_mr_');
// bunchotops
if ((getValue('bipartitions_') || getValue('log_likelihood_') || getValue('compute_mr_')) && ! getValue('apo_tops_'))
enable('bunchotops_');
else disable('bunchotops_');
// compute_ml_distances
if (!getValue('mulparambootstrap_seed_') && !getValue('bootstrap_seed_') && !getValue('bipartitions_') && !getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('specify_runs_'))
enable('compute_ml_distances_');
else disable('compute_ml_distances_');
// mulparambootstrap_seed
if (!getValue('bootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('compute_ml_distances_') && !getValue('bipartitions_') && !getValue('log_likelihood_') && !getValue('compute_mr_') && !getValue('specify_runs_'))
enable('mulparambootstrap_seed_');
else disable('mulparambootstrap_seed_');
// mulparambootstrap_seed_val
if (getValue('mulparambootstrap_seed_'))
enable('mulparambootstrap_seed_val_');
else disable('mulparambootstrap_seed_val_');
// bootstrap_seed
if (!getValue('mulparambootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('compute_ml_distances_') && !getValue('bipartitions_') && !getValue('log_likelihood_') && !getValue('compute_mr_') && !getValue('specify_runs_'))
enable('bootstrap_seed_');
else disable('bootstrap_seed_');
// bootstrap_seed_val
if (getValue('bootstrap_seed_') && !getValue('mulparambootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('compute_ml_distances_'))
enable('bootstrap_seed_val_');
else disable('bootstrap_seed_val_');
// mlsearch
if (!getValue('bipartitions_') && !getValue('startingtreeonly_') && getValue('bootstrap_seed_') && !getValue('compute_ml_distances_'))
enable('mlsearch_');
else disable('mlsearch_');
// printbrlength
// specify_bootstraps
if ((getValue('bootstrap_seed_') || getValue('mulparambootstrap_seed_')) && !getValue('use_bootstopping_'))
enable('specify_bootstraps_');
else disable('specify_bootstraps_');
// bootstop
if (getValue('specify_bootstraps_') && !getValue('startingtreeonly_'))
enable('bootstop_');
else disable('bootstop_');
// use_bootstopping
if ((getValue('bootstrap_seed_') || getValue('mulparambootstrap_seed_')) && !getValue('specify_bootstraps_'))
enable('use_bootstopping_');
else disable('use_bootstopping_');
// freq_bootstopping
if (getValue('use_bootstopping_'))
enable('freq_bootstopping_');
else disable('freq_bootstopping_');
// mr_bootstopping
if (getValue('use_bootstopping_'))
enable('mr_bootstopping_');
else disable('mr_bootstopping_');
// mrbootstopping_type
if (getValue('mr_bootstopping_'))
enable('mrbootstopping_type_');
else disable('mrbootstopping_type_');
// use_apobootstopping
// aposterior_bootstopping
if (getValue('use_apobootstopping_'))
enable('aposterior_bootstopping_');
else disable('aposterior_bootstopping_');
// apo_tops
if (getValue('use_apobootstopping_') && ! getValue('bunchotops_'))
enable('apo_tops_');
else disable('apo_tops_');
}
function validateControl() {
// runtime
if (getValue('runtime_') > 168.0) {
alert('Maximum Hours to Run must be less than 168');
return false;
}
// nchars
if (! getValue('nchars_')) {
alert('Please enter a value for the number of characters in your data matrix');
return false;
}
if (getValue('nchars_') < 1) {
alert('The number of characters in the matrix must 1 or greater.');
return false;
}
// datatype
// outgroup
// number_cats
// treetop
// provide_parsimony_seed
if (!getValue('startingtreeonly_') && ! getValue('treetop_')) {
if ( getValue('treetop_')) {
alert('Sorry, you cannot specify a starting tree (via the -t option above) and a random seed value');
return false;
}
}
// parsimony_seed_val
if (getValue('provide_parsimony_seed_')) {
if (getValue('provide_parsimony_seed_') && ! getValue('parsimony_seed_val_')) {
alert('Please enter a random seed for the -p option (eg 12345)');
return false;
}
}
// rearrangement_yes
// number_rearrange
if (getValue('rearrangement_yes_')) {
if (getValue('rearrangement_yes_') && ! getValue('number_rearrange_')) {
alert('Please specify the distance from original pruning point (default would be 10)');
return false;
}
}
// constraint
// binary_backbone
// partition
// estimate_perpartbrlen
// invariable
// exclude_file
// dna_gtrcat
// dna_gtrgamma
// prot_sub_model
// prot_matrix_spec
// user_prot_matrix
// use_emp_freqs
// sec_str_file
// rna_model
// bin_model
// startingtreeonly
// specify_runs
// altrun_number
if (getValue('specify_runs_')) {
if (getValue('specify_runs_') && ! getValue('altrun_number_')) {
alert('Please specify how many runs you wish to execute (eg 10)');
return false;
}
}
// bipartitions
if (!getValue('mulparambootstrap_seed_') &&!getValue('bootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('compute_ml_distances_') && !getValue('specify_runs_')) {
if (!getValue('bootstrap_seed_') && getValue('bipartitions_') && ( ! getValue('bunchotops_') || ! getValue('treetop_'))) {
alert('To use the -f b option you must specify a best tree with "-t" and file containing multiple trees with the "-z" option');
return false;
}
}
// log_likelihood
if (!getValue('mulparambootstrap_seed_') && !getValue('bootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('bipartitions_') && !getValue('compute_ml_distances_') && !getValue('specify_runs_')) {
if (getValue('log_likelihood_') && (! getValue('bunchotops_') || ! getValue('treetop_'))) {
alert('To use the -f h option you must specify a best tree with "-t" and file containing multiple trees with the "-z" option');
return false;
}
}
// compute_mr
// specify_mr
if (getValue('compute_mr_')) {
if (!getValue('specify_mr_')) {
alert('Please select a majority rule option: MR or MRE');
return false;
}
}
if (getValue('compute_mr_')) {
if (getValue('compute_mr_') && ! getValue('bunchotops_')) {
alert('In order to use the -J option, you must upload a set of bootstrapped trees using the -z option');
return false;
}
}
// bunchotops
// compute_ml_distances
if (!getValue('mulparambootstrap_seed_') && !getValue('bootstrap_seed_') && !getValue('bipartitions_') && !getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('specify_runs_')) {
if (getValue('compute_ml_distances_') && ! getValue('treetop_')) {
alert('You must specify a starting tree (via the -t option above) to use the -f x option');
return false;
}
}
if (!getValue('mulparambootstrap_seed_') && !getValue('bootstrap_seed_') && !getValue('bipartitions_') && !getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('specify_runs_')) {
if (getValue('compute_ml_distances_') && !getValue('dna_gtrgamma_') && getValue('bin_model_')!="BINGAMMA" && getValue('prot_sub_model_')!="PROTGAMMA") {
alert('Sorry, the -f x option is valid only with GAMMA models');
return false;
}
}
// mulparambootstrap_seed
// mulparambootstrap_seed_val
if (getValue('mulparambootstrap_seed_')) {
if (getValue('mulparambootstrap_seed_') && ! getValue('mulparambootstrap_seed_val_')) {
alert('Please enter a random seed for the -b option (eg 12345)');
return false;
}
}
// bootstrap_seed
// bootstrap_seed_val
if (getValue('bootstrap_seed_') && !getValue('mulparambootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('compute_ml_distances_')) {
if (getValue('bootstrap_seed_') && ! getValue('bootstrap_seed_val_')) {
alert('Please enter a random seed for the -x option (eg 12345)');
return false;
}
}
// mlsearch
// printbrlength
// specify_bootstraps
// bootstop
if (getValue('specify_bootstraps_') && !getValue('startingtreeonly_')) {
if (getValue('specify_bootstraps_') && ! getValue('bootstop_')) {
alert('Please enter number of bootstrap reps desired (eg 100)');
return false;
}
}
// use_bootstopping
if ((getValue('bootstrap_seed_') || getValue('mulparambootstrap_seed_')) && !getValue('specify_bootstraps_')) {
if ( (getValue('bootstrap_seed_') || getValue('mulparambootstrap_seed_')) && (!getValue('use_bootstopping_') && !getValue('specify_bootstraps_'))) {
alert('Please select to "specify bootstraps explicitly" or "automatically halt bootstrapping"');
return false;
}
}
// freq_bootstopping
if (getValue('use_bootstopping_')) {
if (getValue('mr_bootstopping_') && getValue('freq_bootstopping_') ) {
alert('Sorry, you cannot choose both majority rule and frequency criterion');
return false;
}
}
if (getValue('use_bootstopping_')) {
if (getValue('use_bootstopping_') && !getValue('mr_bootstopping_') && !getValue('freq_bootstopping_') ) {
alert('Please choose either majority rule and frequency criterion');
return false;
}
}
// mr_bootstopping
if (getValue('use_bootstopping_')) {
if (getValue('use_bootstopping_') && !getValue('mr_bootstopping_') && !getValue('freq_bootstopping_')) {
alert('Sorry, you cannot choose both majority rule and frequency criterion');
return false;
}
}
if (getValue('use_bootstopping_')) {
if (!getValue('mr_bootstopping_') && !getValue('freq_bootstopping_') ) {
alert('Please choose either majority rule and frequency criterion');
return false;
}
}
// mrbootstopping_type
if (getValue('mr_bootstopping_')) {
if (getValue('mr_bootstopping_') && ! getValue('mrbootstopping_type_')) {
alert('Please choose a Majority Rule criterion');
return false;
}
}
// use_apobootstopping
if (getValue('use_apobootstopping_') && (getValue('bootstrap_seed_') || getValue('mulparambootstrap_seed_'))) {
alert('Sorry, you cannot use a posteriori bootstrapping with the -b or -x options');
return false;
}
// aposterior_bootstopping
if (getValue('use_apobootstopping_')) {
if (! getValue('apo_tops_')) {
alert('In order to use the a posteriori bootstrapping option, you must upload a set of bootstrapped trees below');
return false;
}
}
// apo_tops
return issueWarning();
}
function issueWarning() {
// runtime
// nchars
// datatype
// outgroup
// number_cats
// treetop
// provide_parsimony_seed
// parsimony_seed_val
// rearrangement_yes
// number_rearrange
// constraint
// binary_backbone
// partition
// estimate_perpartbrlen
// invariable
// exclude_file
// dna_gtrcat
// dna_gtrgamma
// prot_sub_model
// prot_matrix_spec
// user_prot_matrix
// use_emp_freqs
// sec_str_file
// rna_model
// bin_model
// startingtreeonly
// specify_runs
// altrun_number
// bipartitions
// log_likelihood
// compute_mr
// specify_mr
// bunchotops
// compute_ml_distances
// mulparambootstrap_seed
// mulparambootstrap_seed_val
// bootstrap_seed
// bootstrap_seed_val
// mlsearch
// printbrlength
// specify_bootstraps
// bootstop
// use_bootstopping
// freq_bootstopping
// mr_bootstopping
// mrbootstopping_type
// use_apobootstopping
// aposterior_bootstopping
// apo_tops
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
var element = document.forms['raxmlhpc2_abe'].elements[parameter];
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
var element = document.forms['raxmlhpc2_abe'].elements[parameter];
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
var element = document.forms['raxmlhpc2_abe'].elements[parameter];
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