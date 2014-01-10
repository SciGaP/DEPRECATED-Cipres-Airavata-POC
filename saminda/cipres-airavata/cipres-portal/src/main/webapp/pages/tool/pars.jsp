<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Pars</title>
<h2>Pars: Discrete character parsimony (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="pars" theme="simple">
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
<hr/>
<A name=pars_opt><h2><A HREF="javascript:help.slidedownandjump('#pars_opt_comment')">Pars options</A></H2>
<A HREF="javascript:help.slidedownandjump('#search_opt')">Search option (S)</A>
<s:radio name="search_opt_"
list="#{ '': '[Not Mandatory]', '0':'More thorough search' , '1':'Rearrange on one best tree' , '2':'Less thorough' }" onclick="resolveParameters()"/>
<br/>
Number of trees to save? (V)
<s:textfield name="save_trees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=jumble_opt><h2><A HREF="javascript:help.slidedownandjump('#jumble_opt_comment')">Randomize options</A></H2>
<A HREF="javascript:help.slidedownandjump('#jumble')">Randomize (jumble) input order (J)</A>
<s:checkbox name="jumble_" onclick="resolveParameters()"/>
<br/>
Random number seed (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="jumble_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of times to jumble
<s:textfield name="times_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=weight_opt><h2><A HREF="javascript:help.slidedownandjump('#weight_opt_comment')">Weight options</A></H2>
<A HREF="javascript:help.slidedownandjump('#weights')">Weighted sites (W)</A>
<s:checkbox name="weights_" onclick="resolveParameters()"/>
<br/>
Weight file
<s:select name="weight_file_" headerKey='' headerValue='' list="%{ getDataForParameter('weight_file_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=user_tree_opt><h2><A HREF="javascript:help.slidedownandjump('#user_tree_opt_comment')">User tree options</A></H2>
<A HREF="javascript:help.slidedownandjump('#user_tree')">Search with User tree (default = no) (U)</A>
<s:checkbox name="user_tree_" onclick="resolveParameters()"/>
<br/>
Please Specify the Starting Tree
<s:select name="tree_file_" headerKey='' headerValue='' list="%{ getDataForParameter('tree_file_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=multidata><h2><A HREF="javascript:help.slidedownandjump('#multidata_comment')">Multiple Datasets: Can be generated as Weights or Data using Seqboot. Please use Consense to calculate a Consensus tree</A></H2>
<A HREF="javascript:help.slidedownandjump('#multiple_dataset')">Analyze multiple data sets (M)</A>
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
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#print_tree')">Print out tree (3)</A>
<s:checkbox name="print_tree_" onclick="resolveParameters()"/>
<br/>
Print out steps in each character (4)
<s:checkbox name="print_step_" onclick="resolveParameters()"/>
<br/>
Print states at all nodes of tree (5)
<s:checkbox name="print_states_" onclick="resolveParameters()"/>
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
<A name=parcimony_opt><h2><A HREF="javascript:help.slidedownandjump('#parcimony_opt_comment')">Parsimony options</A></H2>
Use Threshold parsimony (T)
<s:checkbox name="use_threshold_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#threshold')">Threshold value (if use threshold parsimony)</A>
<font color="red" size="3">+</font>
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=other_options><h2><A HREF="javascript:help.slidedownandjump('#other_options_comment')">Other options</A></H2>
<A HREF="javascript:help.slidedownandjump('#outgroup')">Outgroup root (default, use as outgroup species 1) (O)</A>
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
<dt><a name=infile><i>Input File</i></a></dt>
<dd>Example input file:</dd><dd> 5 6</dd><dd>Alpha 110110</dd><dd>Beta 110000</dd><dd>Gamma 100110</dd><dd>Delta 001001</dd><dd>Epsilon 001110</dd>
<br></br>
<dt><a name=pars_opt_comment><i><b>Pars options</b></i></a></dt>
<dt><a name=search_opt><i>Search option (S)</i></a></dt>
<dd> PARS is a general parsimony program which carries out the Wagner parsimony method with multiple states. Wagner parsimony allows changes among all states. The criterion is to find the tree which requires the minimum number of changes. The Wagner method was originated by Eck and Dayhoff (1966) and by Kluge and Farris (1969). Here are its assumptions:</dd><dd> 1. Ancestral states are unknown.</dd><dd> 2. Different characters evolve independently.</dd><dd> 3. Different lineages evolve independently.</dd><dd> 4. Changes to all other states are equally probable (Wagner).</dd><dd> 5. These changes are a priori improbable over the evolutionary time
spans involved in the differentiation of the group in question.</dd><dd> 6. Other kinds of evolutionary event such as retention of
polymorphism are far less probable than these state changes.</dd><dd> 7. Rates of evolution in different lineages are sufficiently low that two changes in a long segment of the tree are far less probable than one change in a short segment.</dd><dd>PARS can handle both bifurcating and multifurcating trees. In doing its search for most parsimonious trees, it adds species not only by
creating new forks in the middle of existing branches, but it also tries putting them at the end of new branches which are added to
existing forks. Thus it searches among both bifurcating and multifurcating trees. If a branch in a tree does not have any
characters which might change in that branch in the most parsimonious tree, it does not save that tree. Thus in any tree that results, a
branch exists only if some character has a most parsimonious reconstruction that would involve change in that branch.</dd><dd>It also saves a number of trees tied for best (you can alter the number it saves using the V option in the menu). When rearranging trees, it tries rearrangements of all of the saved trees. This makes the algorithm slower than earlier programs such as Mix.</dd>
<br></br>
<dt><a name=jumble_opt_comment><i><b>Randomize options</b></i></a></dt>
<dt><a name=jumble><i>Randomize (jumble) input order (J)</i></a></dt>
<dd>The J (Jumble) option. In most tree construction programs, the search of different trees depends on the order of input of species. The J option tells the program to use a random number generator to choose the input order of species. If you select Jumble, you must provide a "seed" for the random number generator. The seed should be an integer between 1 and be of form 4n+1. Each different seed leads to a different sequence of addition of species. By simply changing the random number seed and re-running the programs one can look for other, and better trees. </dd><dd>
Using the Jumble option, you must specify how many times you want to restart the process. The value 10 causes ten different orders of species to be used in constructing the trees, and the results printed out will reflect this entire search process (that is, the best trees found among all 10 runs will be printed out, not the best trees from each individual run).</dd>
<br></br>
<dt><a name=weight_opt_comment><i><b>Weight options</b></i></a></dt>
<dt><a name=weights><i>Weighted sites (W)</i></a></dt>
<dd>The W (Weights) option. This signals the program that, in addition to the data set, you want to read in a series of weights that tell how many times each character is to be counted. If the weight for a character is zero (0) then that character is in effect to be omitted when the tree is evaluated. If it is (1) the character is to be counted once. A value greater than one means the character is counted as if it were present that many times, so that a weight of 4 means that the character is counted 4 times. The values 0-9 give weights 0 through 9, and the values A-Z give weights 10 through 35.</dd><dd>The weights are used to analyze subsets of the characters, and also can be used for resampling of the data as in bootstrap and jackknife resampling. For those programs that allow weights to be greater than 1, they can also be used to emphasize information from some characters more strongly than others. Of course, you must have some rationale for doing this. </dd><dd>The weights are provided as a sequence of digits. Thus they might be</dd><dd></dd><dd>10011111100010100011110001100</dd><dd>The weights are to be provided in an input file whose default name = weights. The weights in it are a simple string of digits. Blanks in the weightfile are skipped over and ignored, and the weights can continue to a new line.</dd>
<br></br>
<dt><a name=user_tree_opt_comment><i><b>User tree options</b></i></a></dt>
<dt><a name=user_tree><i>Search with User tree (default = no) (U)</i></a></dt>
<dd>The U (User tree) option. This option toggles between the default setting, which allows the program to
search for the best tree, and the User tree setting, which reads a tree or trees ("user trees") from an input
tree file. The input tree file default name is intree.</dd><dd>((Alligator,Bear),((Cow,(Dog,Elephant)),Ferret));</dd><dd>((Alligator,Bear),(((Cow,Dog),Elephant),Ferret));</dd><dd>((Alligator,Bear),((Cow,Dog),(Elephant,Ferret)));</dd><dd>Multifurcating trees are permitted. You must then enter the number of trees submitted. In using the
user tree option, check the pattern of parentheses carefully. The programs do not always detect whether
the tree makes sense, and if it does not there will probably be a crash (hopefully, but not inevitably,
with an error message indicating the nature of the problem). Trees written out by programs are typically
in the proper form.</dd>
<br></br>
<dt><a name=multidata_comment><i><b>Multiple Datasets: Can be generated as Weights or Data using Seqboot. Please use Consense to calculate a Consensus tree</b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M)</i></a></dt>
<dd>The M (Multiple data sets) option. The main use of this option is to allow bootstrapping. Using the program Seqboot, one can take any DNA, protein, restriction sites, gene frequency or binary character data set and make multiple data sets by bootstrapping. Trees can be produced for all of these using the M option. They will be written on the tree output file if that option is left in force. The program Consense can be used with that multi-tree output file as its input file. The result is a majority rule consensus tree that can be used to make confidence intervals. The present version of the package allows bootstrapping with the use of Seqboot and Consense and the M option.</dd><dd>Here is a (very small) sample input file with two five-species data sets:</dd><dd>    5   6</dd><dd>Alpha     CCACCA</dd><dd>Beta      CCAAAA</dd><dd>Gamma     CAACCA</dd><dd>Delta     AACAAC</dd><dd>Epsilon   AACCCA</dd><dd>    5   6</dd><dd>Alpha     CCACCA</dd><dd>Beta      CCAAAA</dd><dd>Gamma     CAACCA</dd><dd>Delta     AACAAC</dd><dd>Epsilon   AACCCA</dd><dd>Pars can take multiple weights instead of multiple data sets. It can do bootstrapping by reading in one data set, together with a file of weights that show how the characters (or sites) are reweighted in each bootstrap sample. Thus a site that is omitted in a bootstrap sample has effectively been given weight 0, while a site that has been duplicated has effectively been given weight 2. Seqboot has a menu selection to produce the file of weights information automatically, instead of producing a file of multiple data sets. It can be renamed and used as the input weights file. </dd><dd>The main use of this option will be to allow all of the methods in these programs to be bootstrapped. Using the program Seqboot one can take any DNA, protein, restriction sites, gene frequency or binary character data set and make multiple data sets by bootstrapping. Trees can be produced for all of these using the M option. They will be written on the tree output file if that option is left in force. Then the program Consense can be used with that tree file as its input file. The result is a majority rule consensus tree which can be used to make confidence intervals. The present version of the package allows, with the use of Seqboot and Consense and the M option, bootstrapping of many of the methods in the package. </dd><dd>
Programs Dnaml, Dnapars and Pars can also take multiple weights instead of multiple data sets. They can then do bootstrapping by reading in one data set, together with a file of weights that show how the characters (or sites) are reweighted in each bootstrap sample. Thus a site that is omitted in a bootstrap sample has effectively been given weight 0, while a site that has been duplicated has effectively been given weight 2. Seqboot has a menu selection to produce the file of weights information automatically, instead of producing a file of multiple data sets. It can be renamed and used as the input weights file.</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (6)</i></a></dt>
<dd>Tells the program to save the tree in a treefile (a standard representation of trees where the tree is specified by a nested pairs of parentheses, enclosing names and separated by commas).</dd>
<br></br>
<dt><a name=parcimony_opt_comment><i><b>Parsimony options</b></i></a></dt>
<dt><a name=threshold><i>Threshold value (if use threshold parsimony)</i></a></dt>
<dd>The T (Threshold) option. This sets a threshold for the parsimony programs such that if the number of
steps counted in a character is higher than the threshold, it will be taken to be the threshold value rather
than the actual number of steps. The default is a threshold so high that it will never be surpassed (in which
case the steps will simply be counted). If you select the T option, you must also supply a threshold. This
will be a positive real number greater than 1. The T option is an important and underutilized one: it is, for
example, the only way in the Phylip package to do a compatibility analysis when there are missing data. It is
a method of de-weighting characters that evolve rapidly.</dd>
<br></br>
<dt><a name=other_options_comment><i><b>Other options</b></i></a></dt>
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
// search_opt
// save_trees
// jumble
// jumble_seed
if (getValue('jumble_'))
enable('jumble_seed_');
else disable('jumble_seed_');
// times
// weights
// weight_file
if (getValue('weights_'))
enable('weight_file_');
else disable('weight_file_');
// user_tree
// tree_file
if (getValue('user_tree_'))
enable('tree_file_');
else disable('tree_file_');
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
// print_tree
// print_step
// print_states
// print_treefile
// printdata
// indent_tree
// use_threshold
// threshold
if (getValue('use_threshold_'))
enable('threshold_');
else disable('threshold_');
// outgroup
}
function validateControl() {
// interleavedinfile
// search_opt
// save_trees
// jumble
// jumble_seed
if (getValue('jumble_')) {
if (getValue('jumble_seed_') <= 0 || ((getValue('jumble_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
return false;
}
}
// times
// weights
// weight_file
// user_tree
if (getValue('user_tree_') && getValue('jumble_')) {
alert('you cannot randomize (jumble) your dataset and give a user tree at the same time');
return false;
}
// tree_file
// multiple_dataset
// weightsordata
// datasets_nb
if (getValue('multiple_dataset_')) {
if ((getValue('datasets_nb_') > 1000) || (getValue('datasets_nb_') < 0)) {
alert('enter a value > 0 ; there must be no more than 1000 datasets for this server');
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
// print_tree
// print_step
// print_states
// print_treefile
// printdata
// indent_tree
// use_threshold
// threshold
if (getValue('use_threshold_')) {
if ((getValue('threshold_').match("^\d+(\.\==nulld+)?")) || (getValue('threshold_') < 1)) {
alert('You must enter a numeric value, greater than 1');
return false;
}
}
// outgroup
if (getValue('outgroup_') < 1) {
alert('Please enter a value greater than 0');
return false;
}
return issueWarning();
}
function issueWarning() {
// interleavedinfile
// search_opt
// save_trees
// jumble
// jumble_seed
// times
// weights
// weight_file
// user_tree
// tree_file
// multiple_dataset
// weightsordata
// datasets_nb
// multi_seed
// multi_times
// print_tree
// print_step
// print_states
// print_treefile
// printdata
// indent_tree
// use_threshold
// threshold
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
var element = document.forms['pars'].elements[parameter];
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
var element = document.forms['pars'].elements[parameter];
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
var element = document.forms['pars'].elements[parameter];
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