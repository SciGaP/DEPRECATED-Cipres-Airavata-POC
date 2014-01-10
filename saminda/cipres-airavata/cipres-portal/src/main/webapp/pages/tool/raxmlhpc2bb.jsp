<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RAxML-HPC BlackBox</title>
<h2>RAxML-HPC BlackBox: Phylogenetic tree inference using maximum likelihood/rapid bootstrapping on XSEDE. (<a href="#REFERENCE">Alexandros Stamatakis</a>)</h2>
<s:form action="raxmlhpc2bb" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Sequence Type
<font color="red" size="3">*</font>
<s:radio name="datatype_"
list="#{ 'protein':'Protein' , 'dna':'Nucleotide' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#outgroup')">Outgroup (one or more comma-separated outgroups, see comment for syntax)</A>
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#exclude_file')">Create an input file that excludes the range of positions specifed in this file (-E)</A>
<s:select name="exclude_file_" headerKey='' headerValue='' list="%{ getDataForParameter('exclude_file_')}" onchange="resolveParameters()"/>
<br/>
Estimate proportion of invariable sites (GTRGAMMA + I)
<font color="red" size="3">*</font>
<s:radio name="invariable_"
list="#{ 'I':'yes' , '':'no' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#prot_matrix_spec')">Protein Substitution Matrix</A>
<font color="red" size="3">*</font>
<s:select name="prot_matrix_spec_" list="#{ 'DAYHOFF':'DAYHOFF' , 'DCMUT':'DCMUT' , 'JTT':'JTT' , 'MTREV':'MTREV' , 'WAG':'WAG' , 'RTREV':'RTREV' , 'CPREV':'CPREV' , 'VT':'VT' , 'BLOSUM62':'BLOSUM62' , 'MTMAM':'MTMAM' , 'LG':'LG' , 'GTR':'GTR' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#empirical')">Use empirical base frequencies?</A>
<font color="red" size="3">*</font>
<s:radio name="empirical_"
list="#{ 'F':'yes' , '':'no' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mlsearch')">Find best tree using maximum likelihood search</A>
<s:checkbox name="mlsearch_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_bootstopping')">Let RAxML halt bootstrapping automatically (HIGHLY recommended)</A>
<font color="red" size="3">*</font>
<s:checkbox name="use_bootstopping_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#printbrlength')">Print branch lengths (-k)</A>
<s:checkbox name="printbrlength_" onclick="resolveParameters()"/>
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
<dd>Estimate the maximum time your job will need to run. We recommend testimg initially with a < 0.5hr test run because Jobs set for 0.5 h or less depedendably run immediately in the "debug" queue.
Once you are sure the configuration is correct, you then increase the time. The reason is that jobs > 0.5 h are submitted to the "normal" queue, where jobs configured for 1 or a few hours times may
run sooner than jobs configured for the full 168 hours.
</dd>
<dt><a name=outgroup><i>Outgroup (one or more comma-separated outgroups, see comment for syntax)</i></a></dt>
<dd>The correct syntax for the box is outgroup1,outgroup2,outgroupn. If white space is introduced (e.g. outgroup1, outgroup2, outgroupn) the program will fail with the message
"Error, you must specify a model of substitution with the '-m' option"
</dd>
<dt><a name=constraint><i>Constraint (-g)</i></a></dt>
<dd> This option allows you to specify an incomplete or comprehensive multifurcating constraint tree for the RAxML
search in NEWICK format. Initially, multifurcations are resolved randomly. If the tree is incomplete (does not contain
all taxa) the remaining taxa are added by using the MP criterion. Once a comprehensive (containing all taxa) bifurcating
tree is computed, it is further optimized under ML respecting the given constraints. Important: If you specify a
non-comprehensive constraint, e.g., a constraint tree that does not contain all taxa, RAxML will assume that any taxa
that not found in the constraint topology are unconstrained, i.e., these taxa can be placed in any part of the tree. As
an example consider an alignment with 10 taxa: Loach, Chicken, Human, Cow, Mouse, Whale, Seal, Carp, Rat, Frog. If, for
example you would like Loach, Chicken, Human, Cow to be monophyletic you would specify the constraint tree as follows: </dd><dd> ((Loach, Chicken, Human, Cow),(Mouse, Whale, Seal, Carp, Rat, Frog)); </dd><dd> Moreover, if you would like Loach, Chicken, Human, Cow to be monophyletic and in addition Human, Cow to be
monophyletic within that clade you could specify: </dd><dd> ((Loach, Chicken, (Human, Cow)),(Mouse, Whale, Seal, Carp, Rat, Frog)); </dd><dd> If you specify an incomplete constraint: </dd><dd> ((Loach, Chicken, Human, Cow),(Mouse, Whale, Seal, Carp)); </dd><dd> the two groups Loach, Chicken, Human, Cow and Mouse, Whale, Seal, Carp will be monophyletic, while Rat and Frog can
end up anywhere in the tree. </dd>
<dt><a name=binary_backbone><i>Binary Backbone (-r)</i></a></dt>
<dd>This option allows you to pass a binary/bifurcating constraint/backbone tree in NEWICK format to RAxML. Note that using this option only makes sense if this tree contains fewer taxa than the input alignment. The remaining taxa will initially be added by using the MP criterion. Once a comprehensive tree with all taxa has been obtained it will be optimized under ML respecting the restrictions of the constraint tree.
</dd>
<dt><a name=partition><i>Use a mixed/partitioned model? (-q)</i></a></dt>
<dd>The multipleModelFileName parameter (-q) allows you to upload a file that specifies the regions of your alignment for which an individual model of nucleotide substitution should be estimated. This will typically be used to infer trees for long (in terms of base pairs) multi-gene alignments. For example, if -m GTRGAMMA is used, individual alpha-shape parameters, GTR-rates, and empirical base frequencies will be estimated and optimized for each partition. Since Raxml can now handle mixed Amino Acid and DNA alignments, you must specify the data type in the partition file, before the partition name. For DNA, this means you have to add DNA to each line in the partition. For AA data you must specify the transition matrices for each partition:
The AA substitution model must be the first entry in each line and must be separated by a comma from the gene name, just like the DNA token above. You can not assign different models of rate heterogeneity to different partitions, i.e. it will be CAT or CATI. for all partitions. Finally, if you have a concatenated DNA and AA alignments, with DNA data at positions 1 - 500 and AA data at 501-1000 with the WAG model the partition file should look as follows: DNA, gene1 = 1-500; WAG, gene2 = 501-1000. For more help see http://phylobench.vital-it.ch/raxml-bb/index.php?help=model.
</dd>
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
<dt><a name=prot_matrix_spec><i>Protein Substitution Matrix</i></a></dt>
<dd>Note: FLOAT and invariable sites (I) options are not exposed here. If you require this option, please contact mmiller@sdsc.edu.</dd><dd>-m PROTCATmatrixName: analyses using the specified AA matrix + Optimization of substitution rates + Optimization of site-specific evolutionary rates which are categorized into numberOfCategories distinct rate categories for greater computational efficiency. Final tree might be evaluated automatically under PROTGAMMAmatrixName[f], depending on the tree search option.
</dd><dd>-m PROTGAMMAmatrixName[F] anyses use the specified AA matrix + Optimization of substitution rates + GAMMA model of rate heterogeneity (alpha parameter will be estimated)</dd><dd>Available AA substitution models: DAYHOFF, DCMUT, JTT, MTREV, WAG, RTREV, CPREV, VT, BLOSUM62, MTMAM, LG, GTR. You can specify if you want to use empirical base frequencies. Please note that for mixed models you can in addition specify the per-gene AA model in the mixed model file (see manual for details). Also note that if you estimate AA GTR parameters on a partitioned dataset, they will be linked (estimated jointly) across all partitions to avoid over-parametrization.</dd>
<dt><a name=empirical><i>Use empirical base frequencies?</i></a></dt>
<dd>The empirical base frequency command is relevant for the protein datatype, and is used as a suffix to the -m model string PROTGAMMA_____
</dd>
<dt><a name=mlsearch><i>Find best tree using maximum likelihood search</i></a></dt>
<dd>Tell RAxML to conduct a Rapid Bootstrap analysis (-x) and search for the best-scoring ML tree in one single program run.
</dd>
<dt><a name=use_bootstopping><i>Let RAxML halt bootstrapping automatically (HIGHLY recommended)</i></a></dt>
<dd>This option instructs Raxml to automatically halt bootstrapping when certain criteria are met, instead of specifying the number of bootstraps for an analysis. The exact criteria are specified/configured using subsequent entry fields.</dd>
<dt><a name=printbrlength><i>Print branch lengths (-k)</i></a></dt>
<dd> The -k option causes bootstrapped trees to be printed with branch lengths.
The bootstraps will require a bit longer to run under this option because model parameters will be optimized at
the end of each run under GAMMA or GAMMA+P-Invar respectively.
</dd>
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
// outgroup
// constraint
if (! getValue('binary_backbone_'))
enable('constraint_');
else disable('constraint_');
// binary_backbone
if (! getValue('constraint_'))
enable('binary_backbone_');
else disable('binary_backbone_');
// partition
// exclude_file
// invariable
if (getValue('mlsearch_'))
enable('invariable_');
else disable('invariable_');
// prot_matrix_spec
if (getValue('datatype_')=="protein")
enable('prot_matrix_spec_');
else disable('prot_matrix_spec_');
// empirical
if (getValue('datatype_')=="protein")
enable('empirical_');
else disable('empirical_');
// mlsearch
// use_bootstopping
// printbrlength
}
function validateControl() {
// runtime
if (getValue('runtime_') > 168.0) {
alert('Maximum Hours to Run must be less than 168');
return false;
}
// datatype
// outgroup
// constraint
// binary_backbone
// partition
// exclude_file
// invariable
// prot_matrix_spec
// empirical
// mlsearch
// use_bootstopping
// printbrlength
return issueWarning();
}
function issueWarning() {
// runtime
if (getValue('runtime_')!=0 )
{
if (!confirm(messageSplit("The job will run on 64 processors as configured. If it runs for the entire configured time, it will consume 64 x getValue('runtime_') cpu hours")))
{
return false;
}
}
// datatype
// outgroup
// constraint
// binary_backbone
// partition
// exclude_file
// invariable
// prot_matrix_spec
// empirical
// mlsearch
// use_bootstopping
// printbrlength
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
var element = document.forms['raxmlhpc2bb'].elements[parameter];
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
var element = document.forms['raxmlhpc2bb'].elements[parameter];
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
var element = document.forms['raxmlhpc2bb'].elements[parameter];
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