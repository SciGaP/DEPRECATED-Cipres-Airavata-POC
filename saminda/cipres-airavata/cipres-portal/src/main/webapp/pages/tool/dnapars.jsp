<%@ taglib prefix="s" uri="/struts-tags" %>
<title>DNApars</title>
<h2>DNApars: Parsimony for NS Alignments(Phylip) (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="dnapars" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Input sequences interleaved?
<font color="red" size="3">*</font>
<s:radio name="interleavedinfile_"
list="#{ 'yes':'Yes' , 'no':'No' }" onclick="resolveParameters()"/>
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
Number of Trees to Save?
<s:textfield name="numtrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#search_opt')">Search option (S)</A>
<font color="red" size="3">*</font>
<s:radio name="search_opt_"
list="#{ '0':'More thorough search' , '1':'Rearrange on one best tree' , '2':'Less thorough search' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=dnapars_opt><h2><A HREF="javascript:help.slidedownandjump('#dnapars_opt_comment')">Parsimony options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_threshold')">Use Threshold parsimony (T)</A>
<s:checkbox name="use_threshold_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#threshold')">Threshold value (if use threshold parsimony)</A>
<font color="red" size="3">+</font>
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use Transversion parsimony (N)
<s:checkbox name="use_transversion_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Multiple Datasets: </A></H2>
<A HREF="javascript:help.slidedownandjump('#multiple_dataset')">Analyze multiple data sets (M), e.g. from Seqboot; infer Consensus Trees with the output using Consense</A>
<s:checkbox name="multiple_dataset_" onclick="resolveParameters()"/>
<br/>
Multiple data sets or multiple weights? (type D or W)
<font color="red" size="3">+</font>
<s:radio name="weightsordata_"
list="#{ 'data':'Data' , 'weights':'Weights' }" onclick="resolveParameters()"/>
<br/>
How many data sets?
<font color="red" size="3">+</font>
<s:textfield name="datasets_nb_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Random number seed (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="multi_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of times to jumble
<s:textfield name="multi_times_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=jumble_opt><h2><A HREF="javascript:help.slidedownandjump('#jumble_opt_comment')">Randomize options</A></H2>
<A HREF="javascript:help.slidedownandjump('#jumble')">Randomize (jumble) input order (J)</A>
<s:checkbox name="jumble_" onclick="resolveParameters()"/>
<br/>
Random number seed for jumble (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="jumble_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of times to jumble
<font color="red" size="3">+</font>
<s:textfield name="times_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=user_tree_opt><h2><A HREF="javascript:help.slidedownandjump('#user_tree_opt_comment')">User tree options</A></H2>
<A HREF="javascript:help.slidedownandjump('#user_tree')">Use User tree (default: no, search for best tree) (U)</A>
<s:checkbox name="user_tree_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#tree_file')">User Tree file</A>
<s:select name="tree_file_" headerKey='' headerValue='' list="%{ getDataForParameter('tree_file_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=weight_opt><h2><A HREF="javascript:help.slidedownandjump('#weight_opt_comment')">Weight options</A></H2>
<A HREF="javascript:help.slidedownandjump('#weights')">Use weights for sites (W)</A>
<s:checkbox name="weights_" onclick="resolveParameters()"/>
<br/>
Weights file
<s:select name="weights_file_" headerKey='' headerValue='' list="%{ getDataForParameter('weights_file_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#print_tree')">Print out tree (3)</A>
<s:checkbox name="print_tree_" onclick="resolveParameters()"/>
<br/>
Print out steps in each site (4)
<s:checkbox name="print_steps_" onclick="resolveParameters()"/>
<br/>
Print sequences at all nodes of tree (5)
<s:checkbox name="print_sequences_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#print_treefile')">Write out trees onto tree file (6)</A>
<s:checkbox name="print_treefile_" onclick="resolveParameters()"/>
<br/>
Print out the data at start of run (1)
<s:checkbox name="printdata_" onclick="resolveParameters()"/>
<br/>
Indent treefile
<s:checkbox name="indent_tree_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=other_options><h2><A HREF="javascript:help.slidedownandjump('#other_options_comment')">Other options</A></H2>
<A HREF="javascript:help.slidedownandjump('#outgroup')">Outgroup species (default, use as outgroup species 1) (O)</A>
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=search_opt><i>Search option (S)</i></a></dt>
<dd>The S (search) option controls how, and how much, rearrangement is done on the tied trees that are saved by the program. If the "More thorough search" option (the default) is chosen, the program will save multiple tied trees, without collapsing internal branches that have no evidence of change on them. It will subsequently rearrange on all parts of each of those trees. If the "Less thorough search" option is chosen, before saving, the program will collapse all branches that have no evidence that there is any change on that branch. This leads to less attempted rearrangement. If the "Rearrange on one best tree" option is chosen, only the first of the tied trees is used for rearrangement. This is faster but less thorough. If your trees are likely to have large multifurcations, do not use the default "More thorough search" option as it could result in too large a number of trees being saved.
</dd>
<br></br>
<dt><a name=dnapars_opt_comment><i><b>Parsimony options</b></i></a></dt>
<dt><a name=use_threshold><i>Use Threshold parsimony (T)</i></a></dt>
<dd>The T (Threshold) option. This sets a threshold for the parsimony programs such that if the number of
steps counted in a character is higher than the threshold, it will be taken to be the threshold value rather
than the actual number of steps. The default is a threshold so high that it will never be surpassed (in which
case the steps will simply be counted). If you select the T option, you must also supply a threshold. This
will be a positive real number greater than 1. The T option is an important and underutilized one: it is, for
example, the only way in the Phylip package to do a compatibility analysis when there are missing data. It is
a method of de-weighting characters that evolve rapidly.</dd>
<dt><a name=threshold><i>Threshold value (if use threshold parsimony)</i></a></dt>
<dd>This program carries out unrooted parsimony (analogous to Wagner trees) (Eck and Dayhoff, 1966; Kluge
and Farris, 1969) on DNA sequences. The method of Fitch (1971) is used to count the number of changes of base
needed on a given tree. The assumptions of this method are analogous to those of MIX:</dd><dd>Each site evolves independently.</dd><dd>Different lineages evolve independently.</dd><dd>The probability of a base substitution at a given site is small over the lengths of time involved in a branch of
the phylogeny.</dd><dd>The expected amounts of change in different branches of the phylogeny do not vary by so much that two changes in
a high-rate branch are more probable than one change in a low-rate branch.</dd><dd>The expected amounts of change do not vary enough among sites that two changes in one site are more probable than
one change in another.</dd><dd>That these are the assumptions of parsimony methods has been documented in a series of papers of mine:
(1973a, 1978b, 1979, 1981b, 1983b, 1988b). For an opposing view arguing that the parsimony methods make no substantive
assumptions such as these, see the papers by Farris (1983) and Sober (1983a, 1983b, 1988), but also read the exchange
between Felsenstein and Sober (1986).</dd><dd>Change from an occupied site to a deletion is counted as one change. Reversion from a deletion to an occupied
site is allowed and is also counted as one change. Note that this in effect assumes that a deletion N bases long is N
separate events.</dd><dd>Dnapars can handle both bifurcating and multifurcating trees. In doing its search for most parsimonious trees,
it adds species not only by creating new forks in the middle of existing branches, but it also tries putting them at
the end of new branches which are added to existing forks. Thus it searches among both bifurcating and multifurcating
trees. If a branch in a tree does not have any characters which might change in that branch in the most parsimonious tree, it does not save that tree. Thus in any tree that results, a branch exists only if some character has a most parsimonious reconstruction that would involve change in that branch.Thresholds less than or equal to 1.0 do not have any meaning and should not be used: they will result in a tree dependent only on the input order of species and not at all on the data</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Multiple Datasets: </b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M), e.g. from Seqboot; infer Consensus Trees with the output using Consense</i></a></dt>
<dd>The M (Multiple data sets) option allows bootstrapping. The M (multiple data sets option) will ask you whether you want to use multiple sets of weights (from the weights file) or multiple data sets. The ability to use a single data set with multiple weights means that much less disk space will be used for this input data. The bootstrapping and jackknifing tool Seqboot has the ability to create a weights file with multiple weights. The present version of the package allows bootstrapping with the useof Seqboot and Consense. Currently, in SWAMI, these programs must be run separately, rather than invoking it from this interface.</dd><dd>Here is a (very small) sample input file with two five-species data sets: </dd><dd></dd><dd>5 6</dd><dd>Alpha CCACCA</dd><dd>Beta CCAAAA</dd><dd>Gamma CAACCA</dd><dd>Delta AACAAC</dd><dd>Epsilon AACCCA</dd><dd>5 6</dd><dd>Alpha CACACA</dd><dd>Beta CCAACC</dd><dd>Gamma CAACAC</dd><dd>Delta GCCTGG</dd><dd>Epsilon TGCAAT</dd>
<br></br>
<dt><a name=jumble_opt_comment><i><b>Randomize options</b></i></a></dt>
<dt><a name=jumble><i>Randomize (jumble) input order (J)</i></a></dt>
<dd>The J (Jumble) option. In most tree construction programs, the search of different trees
depends on the order of input of species. The J option tells the program to use a random number generator
to choose the input order of species. If you select Jumble, you must provide a "seed" for the random number
generator. The seed should be an integer between 1 and be of form 4n+1. Each different seed leads to a
different sequence of addition of species. By simply changing the random number seed and re-running the
programs one can look for other, and better trees.</dd><dd>Using the Jumble option, you must specify how many times you want to restart the process.
The value 10 causes ten different orders of species to be used in constructing the trees, and the results printed
out will reflect this entire search process (that is, the best trees found among all 10 runs will be printed out,
not the best trees from each individual run).</dd>
<br></br>
<dt><a name=user_tree_opt_comment><i><b>User tree options</b></i></a></dt>
<dt><a name=user_tree><i>Use User tree (default: no, search for best tree) (U)</i></a></dt>
<dd>The U (User tree) option. This option toggles between the default setting, which allows the program to
search for the best tree, and the User tree setting, which reads a tree or trees ("user trees") from an input
tree file. The input tree file default name is intree.</dd><dd>((Alligator,Bear),((Cow,(Dog,Elephant)),Ferret));</dd><dd>((Alligator,Bear),(((Cow,Dog),Elephant),Ferret));</dd><dd>((Alligator,Bear),((Cow,Dog),(Elephant,Ferret)));</dd><dd>Multifurcating trees are permitted. You must then enter the number of trees submitted. In using the
user tree option, check the pattern of parentheses carefully. The programs do not always detect whether
the tree makes sense, and if it does not there will probably be a crash (hopefully, but not inevitably,
with an error message indicating the nature of the problem). Trees written out by programs are typically
in the proper form.</dd>
<dt><a name=tree_file><i>User Tree file</i></a></dt>
<dd>Give a tree whenever the infile does not already contain the tree.</dd>
<br></br>
<dt><a name=weight_opt_comment><i><b>Weight options</b></i></a></dt>
<dt><a name=weights><i>Use weights for sites (W)</i></a></dt>
<dd>The W (Weights) option. This allows the user to read in a series of weights that tell how many times each character is to be counted.
If the weight for a character is zero (0) then that character is effectvely omitted when the tree is evaluated. If it is (1),
the character is to be counted once.
A value greater than one means the character is counted as if it were present that many times, a weight of 4 means
the character is counted 4 times. The values 0-9 give weights 0 through 9, while values A-Z give weights 10 through 35.</dd><dd> Weights are used to analyze s:ubsets of characters, and can also be used for resampling of the data as in bootstrap and jackknife
resampling. For programs that allow weights to be greater than 1, they can also be used to emphasize information from some characters
more strongly than others. Of course, you must have some rationale for doing this. </dd><dd>Weights are provided as a sequence of digits. For example:</dd><dd>10011111100010100011110001100 </dd><dd>The weights are to be provided in an input file. The weights in it are a simple string of digits or letters. Blanks in the
weightfile are skipped over and ignored, and new lines are ignored.</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (6)</i></a></dt>
<dd>Save the tree in a Newick tree file (outtree).</dd>
<br></br>
<dt><a name=other_options_comment><i><b>Other options</b></i></a></dt>
<dt><a name=outgroup><i>Outgroup species (default, use as outgroup species 1) (O)</i></a></dt>
<dd> The O (Outgroup) option is valid only if the tree is not rooted by the Ancestral States option.
It specifies which species is on the line leading to the root of the tree.
For example, if the outgroup is a species "Mouse" then the root of the tree will be placed in the middle of the
branch connected to this species, with Mouse branching off on one side of the root and the lineage leading
to the rest of the tree on the other. When selected, the number of the outgroup must be identified (the species are
numbered in the order they occur in the input file). Entering 6 causes the sixth species in the data set
to be taken as the outgroup (the sixth in the first data set if there are multiple data sets).
Outgroup-rooting will not be attempted if the data have already established a root for the
tree, such as from a user-defined tree. The inferred tree as printed out is still an unrooted tree,
though the outgroup is connected to the bottommost node so that it is easy to visually convert the tree
into rooted form.</dd><dd>©Copyright 1980-2007. University of Washington.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// interleavedinfile
// numtrees
// search_opt
// use_threshold
// threshold
if (getValue('use_threshold_'))
enable('threshold_');
else disable('threshold_');
// use_transversion
// multiple_dataset
// weightsordata
if (getValue('multiple_dataset_'))
enable('weightsordata_');
else disable('weightsordata_');
// datasets_nb
if (getValue('multiple_dataset_'))
enable('datasets_nb_');
else disable('datasets_nb_');
// multi_seed
if (getValue('multiple_dataset_'))
enable('multi_seed_');
else disable('multi_seed_');
// multi_times
if (getValue('multiple_dataset_'))
enable('multi_times_');
else disable('multi_times_');
// jumble
// jumble_seed
if (getValue('jumble_'))
enable('jumble_seed_');
else disable('jumble_seed_');
// times
if (getValue('jumble_'))
enable('times_');
else disable('times_');
// user_tree
// tree_file
if (getValue('user_tree_'))
enable('tree_file_');
else disable('tree_file_');
// weights
// weights_file
if (getValue('weights_'))
enable('weights_file_');
else disable('weights_file_');
// print_tree
// print_steps
// print_sequences
// print_treefile
// printdata
// indent_tree
// outgroup
}
function validateControl() {
// interleavedinfile
// numtrees
if (getValue('numtrees_') < 1) {
alert('Please enter a number greater than 1');
return false;
}
// search_opt
// use_threshold
// threshold
if (getValue('use_threshold_')) {
if ((getValue('threshold_').match("^\d+(\.\==nulld+)?")) || (getValue('threshold_') < 1)) {
alert('Please enter a numeric value for threshold, greater than 1');
return false;
}
}
// use_transversion
// multiple_dataset
// weightsordata
// datasets_nb
if (getValue('multiple_dataset_')) {
if (getValue('datasets_nb_') > 1000) {
alert('there must be no more than 1000 datasets for this server');
return false;
}
}
// multi_seed
if (getValue('multiple_dataset_')) {
if (getValue('multi_seed_') <= 0 || ((getValue('multi_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
return false;
}
}
// multi_times
// jumble
if (getValue('multiple_dataset_') && getValue('jumble_')) {
alert('You may not choose both Multiple data sets and Jumble options');
return false;
}
// jumble_seed
if (getValue('jumble_')) {
if ( (getValue('jumble_seed_') <= 0 || ((getValue('jumble_seed_') % 2) == 0))) {
alert('Random number seed for jumble must be odd. ');
return false;
}
}
// times
// user_tree
if (getValue('user_tree_') && getValue('jumble_')) {
alert('you cannot randomize (jumble) your dataset and give a user tree at the same time');
return false;
}
// tree_file
// weights
// weights_file
// print_tree
// print_steps
// print_sequences
// print_treefile
// printdata
// indent_tree
// outgroup
if (getValue('outgroup_') && getValue('outgroup_') < 1) {
alert('Please enter a value greater than 0');
return false;
}
return issueWarning();
}
function issueWarning() {
// interleavedinfile
// numtrees
// search_opt
// use_threshold
// threshold
// use_transversion
// multiple_dataset
// weightsordata
// datasets_nb
// multi_seed
// multi_times
// jumble
// jumble_seed
// times
// user_tree
// tree_file
// weights
// weights_file
// print_tree
// print_steps
// print_sequences
// print_treefile
// printdata
// indent_tree
// outgroup
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
var element = document.forms['dnapars'].elements[parameter];
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
var element = document.forms['dnapars'].elements[parameter];
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
var element = document.forms['dnapars'].elements[parameter];
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