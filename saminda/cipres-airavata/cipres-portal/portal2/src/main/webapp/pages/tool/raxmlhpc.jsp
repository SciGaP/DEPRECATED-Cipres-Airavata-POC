<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RAxML-VI-HPC</title>
<h2>RAxML-VI-HPC: Phylogenetic tree inference using maximum likelihood/rapid bootstrapping. (<a href="#REFERENCE">Alexandros Stamatakis</a>)</h2>
<s:form action="raxmlhpc" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Sequence Type
<font color="red" size="3">*</font>
<s:radio name="datatype_"
list="#{ 'protein':'Protein' , 'dna':'DNA' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dna_model')">DNA GTR model (-m)</A>
<font color="red" size="3">*</font>
<s:select name="dna_model_" list="#{ 'GTRCAT':'GTRCAT' , 'GTRGAMMA':'GTRGAMMA' , 'GTRMIX':'GTRMIX' , 'GTRCAT_GAMMA':'GTRCAT_GAMMA' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#matrix')">Protein Substitution Matrix</A>
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'DAYHOFF':'DAYHOFF' , 'DCMUT':'DCMUT' , 'JTT':'JTT' , 'MTREV':'MTREV' , 'WAG':'WAG' , 'RTREV':'RTREV' , 'CPREV':'CPREV' , 'VT':'VT' , 'BLOSUM62':'BLOSUM62' , 'MTMAM':'MTMAM' }" onchange="resolveParameters()"/>
<br/>
<br/>
Outgroup (the name of one or more comma separated outgroups)
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#number_cats')">Specify the number of distinct rate categories (-c)</A>
<font color="red" size="3">*</font>
<s:textfield name="number_cats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#treetop')">Supply a starting tree (-t)</A>
<s:select name="treetop_" headerKey='' headerValue='' list="%{ getDataForParameter('treetop_')}" onchange="resolveParameters()"/>
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
<A name=set_analysis><h2><A HREF="javascript:help.slidedownandjump('#set_analysis_comment')">Select the Analysis</A></H2>
<A HREF="javascript:help.slidedownandjump('#startingtreeonly')">Only compute a randomized parsimony starting tree (-y)</A>
<s:checkbox name="startingtreeonly_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bipartitions')">Draw bipartitions onto a single tree topology. (-f b)</A>
<s:checkbox name="bipartitions_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#log_likelihood')">Compute a log likelihood test (-f h)</A>
<s:checkbox name="log_likelihood_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bunchotops')">File with topologies for bipartitions. (-z)</A>
<s:select name="bunchotops_" headerKey='' headerValue='' list="%{ getDataForParameter('bunchotops_')}" onchange="resolveParameters()"/>
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
<font color="red" size="3">+</font>
<s:checkbox name="bootstrap_seed_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bootstrap_seed_val')">Enter a random seed value for rapid bootstrapping</A>
<font color="red" size="3">+</font>
<s:textfield name="bootstrap_seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mlsearch')">Conduct a rapid Bootstrap analysis and search for the best-scoring ML tree in one single program
run. (-f a)</A>
<s:checkbox name="mlsearch_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#provide_parsimony_seed')">Specify a random seed value for parsimony inferences</A>
<font color="red" size="3">+</font>
<s:checkbox name="provide_parsimony_seed_" onclick="resolveParameters()"/>
<br/>
Enter a random seed value for parsimony inferences
<font color="red" size="3">+</font>
<s:textfield name="parsimony_seed_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Specify the number of bootstraps? (no = auto)
<font color="red" size="3">+</font>
<s:checkbox name="specify_bootstraps_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bootstop')">Bootstrap iterations (-#)</A>
<font color="red" size="3">+</font>
<s:textfield name="bootstop_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=dna_model><i>DNA GTR model (-m)</i></a></dt>
<dd>The command line delivered specifies the model for DNA data. The options are as follows:
GTRCAT = GTR + Optimization of substitution rates + Optimization of site-specific evolutionary
rates which are categorized into numberOfCategories distinct rate categories for greater
computational efficiency; GTRGAMMA = GTR + Optimization of substitution rates + GAMMA model
of rate heterogeneity (alpha parameter will be estimated); GTRMIX = Inference of the tree under
GTRCAT and thereafter evaluation of the final tree topology under GTRGAMMA; GTRCAT_GAMMA = Inference of
the tree with site-specific evolutionary rates, where rates are categorized using the 4 discrete
GAMMA rates. The program's author supports the use of Gamma models.</dd>
<dt><a name=matrix><i>Protein Substitution Matrix</i></a></dt>
<dd>The substitution matrix is relevant for the protein datatype, and is used as a suffix to the -m model
string PROTGAMMA_ . Only the use of GAMMA protein models is supported today, at the request of the developer
of RAxML.</dd>
<dt><a name=number_cats><i>Specify the number of distinct rate categories (-c)</i></a></dt>
<dd>This option allows you to specify the number of distinct rate categories, into which the
individually optimized rates for each individual site are thrown under -m GTRCAT. The default of
-c 25 works fine in most practical cases.</dd>
<dt><a name=treetop><i>Supply a starting tree (-t)</i></a></dt>
<dd>Specifies a user starting tree file in Newick format. Branch lengths of that tree will
be ignored. Note that you can also specify a non-comprehensive (not containing all taxa in
the alignment) starting tree now. This might be useful if newly aligned/sequenced taxa have been
added to your alignment. Initially, taxa will be added to the tree using the MP criterion.
The comprehensive tree will then be optimized under ML.</dd>
<dt><a name=number_rearrange><i>Specify the distance from original pruning point (-i)</i></a></dt>
<dd>This option allows you to specify an initial rearrangement setting for the initial
phase of the search algorithm. If you specify e.g. -i 10; the pruned subtrees will be
inserted up to a distance of 10 nodes away from their original pruning point. If you
don_t specify -i; a "good" initial rearrangement setting will automatically be determined by RAxML. </dd>
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
<dd>This option allows you to pass a binary/bifurcating constraint/backbone tree in
NEWICK format to RAxML. Note, that using this option only makes sense if this tree
contains less taxa than the input alignment. The remaining taxa will initially be
added by using the MP criterion. Once a comprehensive tree with all taxa has been
obtained it will be optimized under ML respecting the restrictions of the constraint tree.
</dd>
<dt><a name=partition><i>Use a mixed/partitioned model? (-q)</i></a></dt>
<dd>The multipleModelFileName parameter (-q) allows you to upload a file that specifies the regions
of your alignment for which an individual model of nucleotide substitution should be estimated.
This will typically be used to infer trees for long (in terms of base pairs) multi-gene
alignments. For example, if -m GTRGAMMA is used, individual alpha-shape parameters, GTR-rates,
and empirical base frequencies will be estimated and optimized for each partition. Since Raxml can
now handle mixed Amino Acid and DNA alignments, you must specify the data type in the partition
file, before the partition name. For DNA, this means you have to add DNA to each line in the
partition. For AA data you must specify the transition matrices for each partition:
The AA substitution model must be the first entry in each line and must be separated by a
comma from the gene name, just like the DNA token above. You can not assign different models of
rate heterogeneity to different partitions, i.e. it will be either CAT, GAMMA, GAMMAI etc.
For all partitions, as specified with -m. Finally, if you have a concatenated DNA and AA alignments,
with DNA data at positions 1 - 500 and AA data at 501-1000 with the WAG model the partition file
should look as follows: DNA, gene1 = 1-500; WAG, gene2 = 501-1000</dd>
<dt><a name=invariable><i>Estimate proportion of invariable sites (GTRGAMMA + I) (currently disabled)</i></a></dt>
<dd>This option is disabled in keeping with the developers best advice.</dd>
<dt><a name=exclude_file><i>Create an input file that excludes the range of positions specifed in this file (-E)</i></a></dt>
<dd>This option is used to excludes specific positions in the matrix. For example, uploading a file
that contains the tesxt: 100-200 300-400 will create a file that excludes all columns between positions
100 and 200 as well as all columns between positions 300 and 400. Note that the boundary numbers (positions 100, 200, 300,
and 400) will also be excluded. To exclude a single column write (100-100). This option does not
run an analysis but just prints an alignment file without the excluded columns. Save this file to your
data area, and then run the real analysis. If you use a mixed model, an appropriately adapted model file
will also be written. The ntax element of the phylip files is automatically corrected Example: raxmlHPC -E excl
-s infile -m GTRCAT -q part -n TEST. In this case the files with columns excluded will be named
infile.excl and part.excl. </dd>
<br></br>
<dt><a name=set_analysis_comment><i><b>Select the Analysis</b></i></a></dt>
<dt><a name=startingtreeonly><i>Only compute a randomized parsimony starting tree (-y)</i></a></dt>
<dd>If you want to only compute a randomized parsimony starting tree with RAxML and not execute an ML
analysis of the tree specify -y. The program will exit after computation of the starting tree. This
option can be useful if you want to assess the impact of randomized MP and Neighbor Joining starting trees
on your search algorithm. They can also be used e.g. as starting trees for Derrick Zwickls GARLI program for
ML inferences, which needs comparatively good starting trees to work well above approximately 500 taxa. </dd>
<dt><a name=bipartitions><i>Draw bipartitions onto a single tree topology. (-f b)</i></a></dt>
<dd>When this is specified, RAxML draws the bipartitions using a bunch of topologies
(typically boot-strapped trees) specified with -z onto a single tree topology specified
by -t (typically the best-scoring ML tree). </dd>
<dt><a name=log_likelihood><i>Compute a log likelihood test (-f h)</i></a></dt>
<dd>When this is specified, RAxML will compute a log likelihood test (SH-test [21]) between a best
tree passed via -t and a bunch of other trees passed via -z. Example: raxmlHPC -f h -t ref -z trees
-s alg -m GTRGAMMA -n TEST.. </dd>
<dt><a name=bunchotops><i>File with topologies for bipartitions. (-z)</i></a></dt>
<dd>The -z option is used in combination with the -f b,-f h,-f m,-f n options. The uploaded file
should contain a number of trees in NEWICK format. The file should contain one tree per line
without blank lines between trees. For example, you can directly read in a RAxML bootstrap result
file. </dd>
<br></br>
<dt><a name=bootstrap_config_comment><i><b>Configure Bootstrapping</b></i></a></dt>
<dt><a name=mulparambootstrap_seed><i>Conduct Multiparametric Bootstrapping? (-b)</i></a></dt>
<dd>This option allows you to turn on non-parametric bootstrapping. To allow for reproducibility of
runs in the sequential program, you have to specify a random number seed. Note however, that parallel
bootstraps are not reproducible if you do not provide a fixed starting tree with -t or a parsimony
random seed via -p. </dd>
<dt><a name=mulparambootstrap_seed_val><i>Enter a random seed value for multi-parametric bootstrapping</i></a></dt>
<dd>This random number is provided to assure that there is comparability between runs. </dd>
<dt><a name=bootstrap_seed><i>Conduct rapid bootstrapping? (-x)</i></a></dt>
<dd>This option offers a novel rapid Bootstrapping algorithm that is faster by at least one
order of magnitude than all other current implementations (RAxML 2.2.3, GARLI, PHYML). The
results obtained are qualitatively comparable to those obtained via the standard RAxML BS
algorithm and, more importantly, the deviations in support values between the rapid and the
standard RAxML BS algorithm are smaller than those induced by using a different search strategy,
e.g. GARLI or PHYML. This rapid BS search can be combined with a rapid ML search on the
original alignment and thus allows users to conduct a full ML analysis within one single program run.</dd>
<dt><a name=bootstrap_seed_val><i>Enter a random seed value for rapid bootstrapping</i></a></dt>
<dd>This random number is provided to assure that there is comparability between runs.</dd>
<dt><a name=mlsearch><i>Conduct a rapid Bootstrap analysis and search for the best-scoring ML tree in one single program
run. (-f a)</i></a></dt>
<dd>Tell RAxML to conduct a Rapid Bootstrap analysis (-x) and search for the best-scoring ML
tree in one single program run.</dd>
<dt><a name=provide_parsimony_seed><i>Specify a random seed value for parsimony inferences</i></a></dt>
<dd>Specify a random number seed. The -p option allows you and others to reproduce your results
(reproducible/verifiable experiments) and will help Alexis debug the program. Do not use this option
if you want to generate multiple different starting trees.</dd>
<dt><a name=bootstop><i>Bootstrap iterations (-#)</i></a></dt>
<dd>Specifies the number of alternative runs on distinct starting trees. If 10, RAxML computes 10
distinct ML trees starting from 10 distinct randomized maximum parsimony starting trees. In combination
with the Random seed for rapid bootstrap (-x) invoke a rapid BS analysis. </dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// datatype
// dna_model
if (getValue('datatype_')=="dna")
enable('dna_model_');
else disable('dna_model_');
// matrix
if (getValue('datatype_')=="protein")
enable('matrix_');
else disable('matrix_');
// outgroup
// number_cats
// treetop
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
// invariable
if (getValue('placeholder_'))
enable('invariable_');
else disable('invariable_');
// exclude_file
// startingtreeonly
if (!getValue('mlsearch_') && !getValue('bipartitions_') && ! getValue('constraint_') && !getValue('log_likelihood_'))
enable('startingtreeonly_');
else disable('startingtreeonly_');
// bipartitions
if (!getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('mlsearch_'))
enable('bipartitions_');
else disable('bipartitions_');
// log_likelihood
if (!getValue('startingtreeonly_') && !getValue('mlsearch_') && !getValue('bipartitions_'))
enable('log_likelihood_');
else disable('log_likelihood_');
// bunchotops
if (getValue('bipartitions_') || getValue('log_likelihood_') && !getValue('startingtreeonly_'))
enable('bunchotops_');
else disable('bunchotops_');
// mulparambootstrap_seed
if (!getValue('bootstrap_seed_') && !getValue('startingtreeonly_') && !getValue('mlsearch_'))
enable('mulparambootstrap_seed_');
else disable('mulparambootstrap_seed_');
// mulparambootstrap_seed_val
if (getValue('mulparambootstrap_seed_'))
enable('mulparambootstrap_seed_val_');
else disable('mulparambootstrap_seed_val_');
// bootstrap_seed
if (!getValue('mulparambootstrap_seed_') && !getValue('startingtreeonly_'))
enable('bootstrap_seed_');
else disable('bootstrap_seed_');
// bootstrap_seed_val
if (getValue('bootstrap_seed_') && !getValue('mulparambootstrap_seed_') && !getValue('startingtreeonly_'))
enable('bootstrap_seed_val_');
else disable('bootstrap_seed_val_');
// mlsearch
if (!getValue('bipartitions_') && !getValue('startingtreeonly_') && getValue('bootstrap_seed_'))
enable('mlsearch_');
else disable('mlsearch_');
// provide_parsimony_seed
if (!getValue('startingtreeonly_'))
enable('provide_parsimony_seed_');
else disable('provide_parsimony_seed_');
// parsimony_seed_val
if (getValue('provide_parsimony_seed_'))
enable('parsimony_seed_val_');
else disable('parsimony_seed_val_');
// specify_bootstraps
if (getValue('bootstrap_seed_') || getValue('mulparambootstrap_seed_'))
enable('specify_bootstraps_');
else disable('specify_bootstraps_');
// bootstop
if (getValue('specify_bootstraps_') && !getValue('startingtreeonly_'))
enable('bootstop_');
else disable('bootstop_');
}
function validateControl() {
// datatype
// dna_model
// matrix
// outgroup
// number_cats
// treetop
// rearrangement_yes
// number_rearrange
// constraint
// binary_backbone
// partition
// invariable
// exclude_file
// startingtreeonly
// bipartitions
if (!getValue('startingtreeonly_') && !getValue('log_likelihood_') && !getValue('mlsearch_')) {
if (getValue('bipartitions_') && ( ! getValue('bunchotops_') || ! getValue('treetop_'))) {
alert('To use the -f b option you must specify a best tree with "-t" and file containing multiple trees with the "-z" option');
return false;
}
}
// log_likelihood
if (!getValue('startingtreeonly_') && !getValue('mlsearch_') && !getValue('bipartitions_')) {
if (getValue('log_likelihood_') && (! getValue('bunchotops_') || ! getValue('treetop_'))) {
alert('To use the -f h option you must specify a best tree with "-t" and file containing multiple trees with the "-z" option');
return false;
}
}
// bunchotops
if (getValue('bipartitions_') || getValue('log_likelihood_') && !getValue('startingtreeonly_')) {
if (! getValue('treetop_')) {
alert('You must specify a starting tree (via the -t option above) to use this option');
return false;
}
}
// mulparambootstrap_seed
// mulparambootstrap_seed_val
// bootstrap_seed
// bootstrap_seed_val
// mlsearch
// provide_parsimony_seed
// parsimony_seed_val
// specify_bootstraps
// bootstop
return issueWarning();
}
function issueWarning() {
// datatype
// dna_model
// matrix
// outgroup
// number_cats
// treetop
// rearrangement_yes
// number_rearrange
// constraint
// binary_backbone
// partition
// invariable
// exclude_file
// startingtreeonly
// bipartitions
// log_likelihood
// bunchotops
// mulparambootstrap_seed
// mulparambootstrap_seed_val
// bootstrap_seed
// bootstrap_seed_val
// mlsearch
// provide_parsimony_seed
// parsimony_seed_val
// specify_bootstraps
// bootstop
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
var element = document.forms['raxmlhpc'].elements[parameter];
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
var element = document.forms['raxmlhpc'].elements[parameter];
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
var element = document.forms['raxmlhpc'].elements[parameter];
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