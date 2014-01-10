<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RAxML Light on XSEDE (BETA)</title>
<h2>RAxML Light on XSEDE (BETA): RAxML-Light is a modification of RAxML for inferring very large trees on XSEDE machines (<a href="#REFERENCE">Alexandros Stamatakis, Christian Goll, Wayne Pfeiffer</a>)</h2>
<s:form action="raxml_light2" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#partition')">Select a partition file that specifies mixed/partitioned model (-q. Optional)</A>
<s:select name="partition_" headerKey='' headerValue='' list="%{ getDataForParameter('partition_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#estimate_branch')">Estimate individual per-partition branch lengths (-M)</A>
<s:checkbox name="estimate_branch_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#outgroup')">Outgroup (one or more comma-separated outgroups, click link for syntax description)</A>
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=configure_model><h2><A HREF="javascript:help.slidedownandjump('#configure_model_comment')">Model Configuration Parameters</A></H2>
Sequence Type
<font color="red" size="3">*</font>
<s:radio name="datatype_"
list="#{ 'dna':'Nucleotide' , 'protein':'Protein' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dna_model')">Model for Tree Inference with DNA data (-m)</A>
<font color="red" size="3">+</font>
<s:radio name="dna_model_"
list="#{ 'GTRCAT':'GTRCAT' , 'GTRGAMMA':'GTRGAMMA' }" onclick="resolveParameters()"/>
<br/>
Model for Tree Inference with Protein data (-m)
<font color="red" size="3">+</font>
<s:radio name="prot_sub_model_"
list="#{ 'PROTCAT':'PROTCAT' , 'PROTGAMMA':'PROTGAMMA' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#prot_matrix_spec')">Protein Substitution Matrix</A>
<font color="red" size="3">+</font>
<s:select name="prot_matrix_spec_" list="#{ 'DAYHOFF':'DAYHOFF' , 'DCMUT':'DCMUT' , 'JTT':'JTT' , 'MTREV':'MTREV' , 'WAG':'WAG' , 'RTREV':'RTREV' , 'CPREV':'CPREV' , 'VT':'VT' , 'BLOSUM62':'BLOSUM62' , 'MTMAM':'MTMAM' , 'LG':'LG' , 'MTART':'MTART' , 'MTZOA':'MTZOA' , 'PMB':'PMB' , 'HIVB':'HIVB' , 'HIVW':'HIVW' , 'JTTDCMUT':'JTTDCMUT' , 'FLU':'FLU' , 'AUTO':'AUTO' , 'GTR':'GTR' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#empirical')">Use empirical base frequencies?</A>
<font color="red" size="3">+</font>
<s:radio name="empirical_"
list="#{ 'F':'yes' , '':'no' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#number_cats')">Specify the number of distinct rate categories (-c, default = 25)</A>
<font color="red" size="3">+</font>
<s:textfield name="number_cats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=configure_search><h2><A HREF="javascript:help.slidedownandjump('#configure_search_comment')">Search Configuration Parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#pars_hours')">Maximum time in hours to generate a starting parsimony tree (default = 1 h; --parshours)</A>
<font color="red" size="3">*</font>
<s:textfield name="pars_hours_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#rsearch_seed')">Set seed for generating first parsimony tree (-p, default = 12345)</A>
<font color="red" size="3">*</font>
<s:textfield name="rsearch_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#num_rsearches')">Number of regular searches to perform (-rsearches)</A>
<font color="red" size="3">*</font>
<s:textfield name="num_rsearches_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#search_hours')">Maximum time for a Search (default = 1 h)</A>
<font color="red" size="3">*</font>
<s:textfield name="search_hours_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_mlsearchcc')">Apply ML search convergence criterion to regular searches (-D)</A>
<font color="red" size="3">*</font>
<s:checkbox name="use_mlsearchcc_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#num_bsearches')">Number of bootstrap searches to perform (-bsearches)</A>
<font color="red" size="3">*</font>
<s:textfield name="num_bsearches_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#bootstrap_seed')">Provide a bootstrap seed (-b, default = 12345 )</A>
<font color="red" size="3">*</font>
<s:textfield name="bootstrap_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#aposterior_bootstopping')">Select the criterion for a posteriori bootstopping analysis (-I)</A>
<font color="red" size="3">*</font>
<s:select name="aposterior_bootstopping_" list="#{ 'autoFC':'autoFC' , 'autoMR':'autoMR' , 'autoMRE':'autoMRE' , 'autoMRE_IGN':'autoMRE_IGN' }" onchange="resolveParameters()"/>
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
<dt><a name=partition><i>Select a partition file that specifies mixed/partitioned model (-q. Optional)</i></a></dt>
<dd>The multipleModelFileName parameter (-q) allows you to identify a file that specifies the regions of your alignment for which an individual
model of nucleotide or protein substitution should be estimated. This will typically be used to infer trees for long (in terms of base pairs)
multi-gene alignments. For example, if -m GTRGAMMA is used, individual alpha-shape parameters, GTR-rates, and empirical base frequencies
will be estimated and optimized for each partition. Since Raxml can now handle mixed Amino Acid and DNA alignments, you must specify the
data type in the partition file, before the partition name. For DNA, this means you have to add DNA to each line in the partition. For
AA data you must specify the transition matrices for each partition: The AA substitution model must be the first entry in each line and
must be separated by a comma from the gene name, just like the DNA token above. You can not assign different models of rate heterogeneity
to different partitions, i.e. it will be CAT or CATI. for all partitions. Finally, if you have a concatenated DNA and AA alignments, with
DNA data at positions 1 - 500 and AA data at 501-1000 with the WAG model the partition file should look as follows: DNA, gene1 = 1-500; WAG,
gene2 = 501-1000. For more help see http://phylobench.vital-it.ch/raxml-bb/index.php?help=model.
</dd>
<dt><a name=estimate_branch><i>Estimate individual per-partition branch lengths (-M)</i></a></dt>
<dd>The -M option switches on estimation of individual per-partition branch lengths. It is used in combination with partitions, (-q). Branch lengths
for individual partitions will be printed to separate files. A weighted average of the branch lengths is computed using the respective partition lengths.
</dd>
<dt><a name=outgroup><i>Outgroup (one or more comma-separated outgroups, click link for syntax description)</i></a></dt>
<dd>The correct syntax for the box is outgroup1,outgroup2,outgroupn (no spaces between the taxa). In cases where multiple outgroups are not monophyletic, the first name in the list
will be selected as outgroup. The job will fail if white space is introduced between outgroups (e.g. outgroup1, outgroup2, outgroupn).
"Error, you must specify a model of substitution with the '-m' option."
</dd>
<br></br>
<dt><a name=configure_model_comment><i><b>Model Configuration Parameters</b></i></a></dt>
<dt><a name=dna_model><i>Model for Tree Inference with DNA data (-m)</i></a></dt>
<dd>The GTRCAT option specifies: GTR + Optimization of substitution rates + Optimization of site-specific evolutionary rates
which are categorized into numberOfCategories distinct rate categories for greater computational
efficiency. The GTRGAMMA option specifies: GTR + GAMMA model of rate heterogeneity. This uses
4 hard-coded discrete rates to discretize the GAMMA distribution.</dd>
<dt><a name=prot_matrix_spec><i>Protein Substitution Matrix</i></a></dt>
<dd>Note: FLOAT and invariable sites (I) options are not exposed here. If you require this option, please contact mmiller@sdsc.edu.</dd><dd>-m PROTCATmatrixName[F] uses the specified AA matrix + Optimization of substitution rates + Optimization of site-specific
evolutionary rates which are categorized into numberOfCategories distinct rate categories for greater computational efficiency.
</dd><dd>-m PROTGAMMAmatrixName[F] uses the specified AA matrix + GAMMA model of rate heterogeneity. This uses 4 hard-coded discrete rates to discretize the GAMMA distribution.
</dd><dd>Available AA substitution models: DAYHOFF, DCMUT, JTT, MTREV, WAG, RTREV, CPREV, VT, BLOSUM62, MTMAM, LG, MTART, MTZOA, PMB,
HIVB, HIVW, JTTDCMUT, FLU, AUTO, GTR. With the optional "F" appendix you can specify if you want to use empirical base
frequencies.</dd><dd> AUTO should currently not be used for partitioned datasets, we have not figured out yet what the best
way to determine this is, especially when branch lengths are jointly estimated across partitions. AUTO also can be called in two
flavors AUTO and AUTOF (using empirical base frequencies instead of the pre-defined ones). Typically you would want to use
AUTOF since the likelihood scores will be better.</dd>
<dt><a name=empirical><i>Use empirical base frequencies?</i></a></dt>
<dd>The empirical base frequency command is relevant for the protein datatype, and is used as a suffix to the -m model string PROTGAMMA_____
</dd>
<dt><a name=number_cats><i>Specify the number of distinct rate categories (-c, default = 25)</i></a></dt>
<dd>This option allows you to specify the number of distinct rate categories, into which the individually optimized rates for each individual site are thrown under -m GTRCAT. The default of -c 25 works fine in most practical cases.
</dd>
<br></br>
<dt><a name=configure_search_comment><i><b>Search Configuration Parameters</b></i></a></dt>
<dt><a name=pars_hours><i>Maximum time in hours to generate a starting parsimony tree (default = 1 h; --parshours)</i></a></dt>
<dd>The parsimony starting tree is created by parsimonator or by RAxML light for each input file and each replica data set if you are running bootstraps.
This paramter should help control the total run time of the program.</dd>
<dt><a name=rsearch_seed><i>Set seed for generating first parsimony tree (-p, default = 12345)</i></a></dt>
<dd>Keeping the same seed value makes the starting trees comparable between runs.</dd>
<dt><a name=num_rsearches><i>Number of regular searches to perform (-rsearches)</i></a></dt>
<dd>This parameter sets the number of regular likelihood searches on the input data set. Regular searches are the likelihood searches on the input data. They are slow
and accurate. The maximum number of regular searches is 100</dd>
<dt><a name=search_hours><i>Maximum time for a Search (default = 1 h)</i></a></dt>
<dd>The value entered here sets the maximum wall-clock time in hours for a regular (slow) search. Default is 1 h; the total hours in a regular search set must not exceed
1000. </dd>
<dt><a name=use_mlsearchcc><i>Apply ML search convergence criterion to regular searches (-D)</i></a></dt>
<dd>The ML search convergence criterion breaks off ML searches if the relative Robinson-Foulds topological
distance between the pair of trees trees obtained from two consecutive lazy SPR cycles for improving the likelihood
of the tree is smaller or equal to 1%. Usage is highly recommended for very large datasets in terms of taxa. This
option will prevent spending a large amount of processor time to obtain only slight improvements in the
likelihood score</dd>
<dt><a name=num_bsearches><i>Number of bootstrap searches to perform (-bsearches)</i></a></dt>
<dd>This parameter sets the number of bootstrap searches. Each Bootstrap run generates a modified replica alignment, infers a parsimony tree, and runs a
rapid bootstrap likelihood tree inference algorithm. The maximum number of bootstrap searches permitted is 500. The results are used for convergence appraisal, support values
and possibly as a starting tree for regular searches.</dd>
<dt><a name=bootstrap_seed><i>Provide a bootstrap seed (-b, default = 12345 )</i></a></dt>
<dd>Keeping the same seed value allows a comparison between runs.</dd>
<dt><a name=aposterior_bootstopping><i>Select the criterion for a posteriori bootstopping analysis (-I)</i></a></dt>
<dd>Once searches are completed, a convergence evaluation is run on the set of bootstrapped trees produced.
This option allows the user to select the criterion used in this a posteriori bootstopping analysis.
Use: autoFC for the frequency-based criterion, autoMR for the majority-rule consensus tree criterion,
autoMRE for the extended majority-rule consensus tree criterion and autoMRE_IGN for metrics similar to MRE,
but includes bipartitions under the threshold whether they are compatible or not. This emulates MRE but is faster to compute.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// partition
// estimate_branch
if ( getValue('partition_'))
enable('estimate_branch_');
else disable('estimate_branch_');
// outgroup
// datatype
// dna_model
if (getValue('datatype_')=="dna")
enable('dna_model_');
else disable('dna_model_');
// prot_sub_model
if (getValue('datatype_')=="protein")
enable('prot_sub_model_');
else disable('prot_sub_model_');
// prot_matrix_spec
if (getValue('datatype_')=="protein")
enable('prot_matrix_spec_');
else disable('prot_matrix_spec_');
// empirical
if (getValue('datatype_')=="protein")
enable('empirical_');
else disable('empirical_');
// number_cats
if ((getValue('datatype_')=="dna" && getValue('dna_model_')=="GTRCAT") || (getValue('datatype_')=="protein" && getValue('prot_sub_model_')=="PROTCAT"))
enable('number_cats_');
else disable('number_cats_');
// pars_hours
// rsearch_seed
// num_rsearches
// search_hours
// use_mlsearchcc
// num_bsearches
// bootstrap_seed
// aposterior_bootstopping
}
function validateControl() {
// partition
// estimate_branch
// outgroup
// datatype
// dna_model
if (getValue('datatype_')=="dna") {
if ( getValue('datatype_')=="dna" && getValue('dna_model_')!="GTRCAT" && getValue('dna_model_')!="GTRGAMMA") {
alert('Please choose either GTRCAT or GTRGAMMA as the model');
return false;
}
}
// prot_sub_model
if (getValue('datatype_')=="protein") {
if ( getValue('datatype_')=="protein" && getValue('prot_sub_model_')!="PROTCAT" && getValue('prot_sub_model_')!="PROTGAMMA") {
alert('Please choose either PROTCAT or PROTGAMMA as the model');
return false;
}
}
// prot_matrix_spec
if (getValue('datatype_')=="protein") {
if (getValue('prot_matrix_spec_')=="AUTO" && getValue('partition_')) {
alert('Sorry, you cannot use the "AUTO" option with a partitioned dataset');
return false;
}
}
// empirical
// number_cats
// pars_hours
if (! getValue('rsearch_seed_')) {
alert('Please enter the maximum time in hours for a starting parsimony tree search (default = 1 h)');
return false;
}
// rsearch_seed
// num_rsearches
if (getValue('num_rsearches_') > 100 ) {
alert('Sorry, the maximum number of regular searches is 100');
return false;
}
// search_hours
if (! getValue('search_hours_')) {
alert('Please enter a value for the maximum time for a search (default = 1 h)');
return false;
}
if (getValue('num_rsearches_') * getValue('search_hours_') > 1000 ) {
alert('Sorry, the number of total hours for regular searches must not exceed 1000');
return false;
}
// use_mlsearchcc
// num_bsearches
if (getValue('num_bsearches_') > 500 ) {
alert('Sorry, the maximum number of bootstrap searches is 500');
return false;
}
// bootstrap_seed
// aposterior_bootstopping
return issueWarning();
}
function issueWarning() {
// partition
// estimate_branch
// outgroup
// datatype
// dna_model
// prot_sub_model
// prot_matrix_spec
// empirical
// number_cats
// pars_hours
// rsearch_seed
// num_rsearches
// search_hours
if (getValue('num_bsearches_') == 500 && getValue('num_rsearches_') == 100 && getValue('search_hours_') == 1 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require more than 5,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. For the default configuration, the maximum consumption is 1084 cpu hrs.")))
{
return false;
}
}
if (getValue('num_bsearches_') > 249 && getValue('num_rsearches_') > 49 && getValue('search_hours_') > 1 && getValue('search_hours_') < 5 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 5,000 and 10,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 99 && getValue('num_bsearches_') < 251 && getValue('num_rsearches_') > 19 && getValue('num_rsearches_') < 51 && getValue('search_hours_') == 5 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 6,000 and 13,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 249 && getValue('num_rsearches_') > 50 && getValue('search_hours_') == 5 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 12,000 and 24,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 249 && getValue('num_rsearches_') > 50 && getValue('search_hours_') == 6)
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 15,000 and 30,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 249 && getValue('num_rsearches_') > 50 && getValue('search_hours_') == 7 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 17,000 and 34,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 249 && getValue('num_rsearches_') > 50 && getValue('search_hours_') == 8 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 20,000 and 40,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 249 && getValue('num_rsearches_') > 50 && getValue('search_hours_') > 8 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 20,000 and 50,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 99 && getValue('num_bsearches_') < 250 && getValue('num_rsearches_') > 19 && getValue('num_rsearches_') < 51 && getValue('search_hours_') == 6 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 6,000 and 14,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 99 && getValue('num_bsearches_') < 250 && getValue('num_rsearches_') > 19 && getValue('num_rsearches_') < 51 && getValue('search_hours_') == 7 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 7,000 and 17,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 99 && getValue('num_bsearches_') < 250 && getValue('num_rsearches_') > 19 && getValue('num_rsearches_') < 51 && getValue('search_hours_') == 8 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 8,000 and 20,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 99 && getValue('num_bsearches_') < 250 && getValue('num_rsearches_') > 19 && getValue('num_rsearches_') < 51 && getValue('search_hours_') == 9 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 9,000 and 22,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
if (getValue('num_bsearches_') > 99 && getValue('num_bsearches_') < 250 && getValue('num_rsearches_') > 19 && getValue('num_rsearches_') < 51 && getValue('search_hours_') == 10 )
{
if (!confirm(messageSplit("ALERT: You have configured a run that could require between 10,000 and 24,000 cpu hrs. CPU use can be calculated from the following formula: [(number of bsearches + number of rsearches)*(maximum parsimony search hours) + 8 * maximum search hours)]+ 4. ")))
{
return false;
}
}
// use_mlsearchcc
// num_bsearches
// bootstrap_seed
// aposterior_bootstopping
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
var element = document.forms['raxml_light2'].elements[parameter];
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
var element = document.forms['raxml_light2'].elements[parameter];
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
var element = document.forms['raxml_light2'].elements[parameter];
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