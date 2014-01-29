<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Mix</title>
<h2>Mix: Mixed method parsimony (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="mix" theme="simple">
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
<hr/>
<A name=mix_opt><h2><A HREF="javascript:help.slidedownandjump('#mix_opt_comment')">Mix options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_mixed')">Use Mixture method (X)</A>
<s:checkbox name="use_mixed_" onclick="resolveParameters()"/>
<br/>
Input Mixture File
<s:select name="mixture_file_" headerKey='' headerValue='' list="%{ getDataForParameter('mixture_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#parsimony_method')">Parsimony method (P)</A>
<font color="red" size="3">+</font>
<s:radio name="parsimony_method_"
list="#{ 'wagner':'Wagner' , 'camin':'Camin-Sokal' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_ancestral_state')">Use ancestral states in input file (A)</A>
<s:checkbox name="use_ancestral_state_" onclick="resolveParameters()"/>
<br/>
Ancestors state file
<s:select name="ancestral_state_file_" headerKey='' headerValue='' list="%{ getDataForParameter('ancestral_state_file_')}" onchange="resolveParameters()"/>
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
<A name=user_tree_opt><h2><A HREF="javascript:help.slidedownandjump('#user_tree_opt_comment')">User tree options</A></H2>
<A HREF="javascript:help.slidedownandjump('#user_tree')">Use User tree (default: no, search for best tree) (U)</A>
<s:checkbox name="user_tree_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#tree_file')">User Tree file</A>
<s:select name="tree_file_" headerKey='' headerValue='' list="%{ getDataForParameter('tree_file_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Multiple Dataset Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#multiple_dataset')">Analyze multiple data sets (M)</A>
<s:checkbox name="multiple_dataset_" onclick="resolveParameters()"/>
<br/>
How many data sets
<font color="red" size="3">+</font>
<s:textfield name="datasets_nb_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Compute a consensus tree
<s:checkbox name="consense_" onclick="resolveParameters()"/>
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
<A name=pars_opt><h2><A HREF="javascript:help.slidedownandjump('#pars_opt_comment')">Parsimony options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_threshold')">Use Threshold parsimony (T)</A>
<s:checkbox name="use_threshold_" onclick="resolveParameters()"/>
<br/>
Threshold value (if use threshold parsimony)
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
<dd>Example input file:</dd><dd>    5    6</dd><dd>Alpha     110110</dd><dd>Beta      110000</dd><dd>Gamma     100110</dd><dd>Delta     001001</dd><dd>Epsilon   001110</dd>
<br></br>
<dt><a name=mix_opt_comment><i><b>Mix options</b></i></a></dt>
<dt><a name=use_mixed><i>Use Mixture method (X)</i></a></dt>
<dd>Mix is a general parsimony program that carries out the Wagner and Camin-Sokal parsimony methods in
mixture, where each character can have its method specified separately. The program defaults to carrying out
Wagner parsimony.</dd><dd>The Camin-Sokal parsimony method explains the data by assuming that changes 0 --> 1 are allowed but not changes
1 --> 0. Wagner parsimony allows both kinds of changes. (This under the assumption that 0 is the ancestral state,
though the program allows reassignment of the ancestral state, in which case we must reverse the state numbers 0 and
1 throughout this discussion). The criterion is to find the tree which requires the minimum number of changes. The
Camin-Sokal method is due to Camin and Sokal (1965) and the Wagner method to Eck and Dayhoff (1966) and to Kluge and
Farris (1969).</dd><dd>Here are the assumptions of these two methods: </dd><dd>Ancestral states are known (Camin-Sokal) or unknown (Wagner). </dd><dd>Different characters evolve independently. </dd><dd>Different lineages evolve independently. </dd><dd>Changes 0 --> 1 are much more probable than changes 1 --> 0 (Camin-Sokal) or equally probable (Wagner). </dd><dd>Both of these kinds of changes are a priori improbable over the evolutionary time spans involved in the differentiation of the group in question.</dd><dd>Other kinds of evolutionary event such as retention of polymorphism are far less probable than 0 --> 1 changes. </dd><dd>Rates of evolution in different lineages are sufficiently low that two changes in a long segment of the tree are far less probable than one change in a short segment. </dd><dd>That these are the assumptions of parsimony methods has been documented in a series of papers of mine:
(1973a, 1978b, 1979, 1981b, 1983b, 1988b). For an opposing view arguing that the parsimony methods make no substantive
assumptions such as these, see the papers by Farris (1983) and Sober (1983a, 1983b), but also read the exchange between
Felsenstein and Sober (1986).</dd><dd>To use the Mixture method, uncheck the box, and upload a file containing one letter for each character.
These letters are C or S if the character is to be reconstructed according to Camin-Sokal parsimony.
The letters are W or ? if the character is to be reconstructed according to Wagner parsimony. So if there are
10 characters the line giving the mixture might look like this:</dd><dd>Mixture WWWCC WWCWC</dd><dd>Blank spaces, and line breaks are ignored.</dd>
<dt><a name=use_ancestral_state><i>Use ancestral states in input file (A)</i></a></dt>
<dd>The A (Ancestral states) option. This specifies the ancestral states for each character. An ancestral
states input file is read, whose default name = ancestors. It contains a line or lines giving the ancestral
states for each character. These may be 0, 1 or ?, the latter indicating that the ancestral state is unknown.
If the A option is invoked, the ancestor is not to be counted as one of the species.</dd><dd>An example is: </dd><dd>001??11 </dd><dd>The ancestor information can be continued to a new line and can have blanks between any of the characters.
</dd>
<br></br>
<dt><a name=jumble_opt_comment><i><b>Randomize options</b></i></a></dt>
<dt><a name=jumble><i>Randomize (jumble) input order (J)</i></a></dt>
<dd>The J (Jumble) option. In most tree construction programs, the search of different trees depends on
the order of input of species. The J option tells the program to use a random number generator to choose the
input order of species. If you select Jumble, you must provide a "seed" for the random number generator. The
seed should be an integer between 1 and be of form 4n+1. Each different seed leads to a different sequence
of addition of species. By simply changing the random number seed and re-running the programs one can look
for other, and better trees.</dd><dd>Using the Jumble option, you must specify how many times you want to restart the process. The value 10 causes
ten different orders of species to be used in constructing the trees, and the results printed out will reflect this
entire search process (that is, the best trees found among all 10 runs will be printed out, not the best trees from
each individual run).
</dd>
<br></br>
<dt><a name=user_tree_opt_comment><i><b>User tree options</b></i></a></dt>
<dt><a name=user_tree><i>Use User tree (default: no, search for best tree) (U)</i></a></dt>
<dd>The U (User tree) option. This option toggles between the default setting, which allows the program to
search for the best tree, and the User tree setting, which reads a tree or trees ("user trees") from an input
tree file. The input tree file default name is intree.</dd><dd>((Alligator,Bear),((Cow,(Dog,Elephant)),Ferret));</dd><dd>((Alligator,Bear),(((Cow,Dog),Elephant),Ferret));</dd><dd>((Alligator,Bear),((Cow,Dog),(Elephant,Ferret)));</dd><dd>User-defined trees must be given as rooted trees with two-way splits (bifurcations).</dd><dd>You must then enter the number of trees submitted.</dd><dd>In using the user tree option, check the pattern of parentheses carefully. The programs do not always detect
whether the tree makes sense, and if it does not there will probably be a crash (hopefully, but not inevitably, with
an error message indicating the nature of the problem). Trees written out by programs are typically in the proper form.
</dd>
<dt><a name=tree_file><i>User Tree file</i></a></dt>
<dd>Give a tree whenever the infile does not already contain the tree.</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Multiple Dataset Options</b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M)</i></a></dt>
<dd>The M (Multiple data sets) option allows bootstrapping.
Using the program Seqboot, one can take any DNA, protein, restriction sites, gene frequency or binary
character data set and make multiple data sets by bootstrapping. Trees can be produced for all of these
using the M option. They will be written on the tree output file if that option is left in force. The
program Consense can take the multi-tree output file ands create a majority rule consensus tree that can
be used to make confidence intervals. The present version of the package allows bootstrapping with the use
of Seqboot and Consense and the M option.</dd><dd>Here is a (very small) sample input file with two five-species data sets: </dd><dd>    5   6</dd><dd>Alpha     110110</dd><dd>Beta      110000</dd><dd>Gamma     100110</dd><dd>Delta     001001C</dd><dd>Epsilon   001110</dd><dd>    5   6</dd><dd>Alpha     110110</dd><dd>Beta      110000</dd><dd>Gamma     100110</dd><dd>Delta     001001C</dd><dd>Epsilon   001110</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (6)</i></a></dt>
<dd>Tells the program to save the tree in a Newick treefile.</dd>
<br></br>
<dt><a name=pars_opt_comment><i><b>Parsimony options</b></i></a></dt>
<dt><a name=use_threshold><i>Use Threshold parsimony (T)</i></a></dt>
<dd>The T (Threshold) option. This sets a threshold for the parsimony programs such that if the
number of steps counted in a character is higher than the threshold, it will be taken to be the threshold
value rather than the actual number of steps. The default is a threshold so high that it will never be
surpassed (in which case the steps will simply be counted). If you select the T option, you must also supply
a threshold. This will be a positive real number greater than 1. The T option is an important and
underutilized one: it is, for example, the only way in the Phylip package to do a compatibility analysis
when there are missing data. It is a method of de-weighting characters that evolve rapidly.</dd>
<br></br>
<dt><a name=other_options_comment><i><b>Other options</b></i></a></dt>
<dt><a name=outgroup><i>Outgroup root (default, use as outgroup species 1) (O)</i></a></dt>
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
// use_mixed
// mixture_file
if (getValue('use_mixed_'))
enable('mixture_file_');
else disable('mixture_file_');
// parsimony_method
if (! getValue('use_mixed_'))
enable('parsimony_method_');
else disable('parsimony_method_');
// use_ancestral_state
// ancestral_state_file
if (getValue('use_ancestral_state_'))
enable('ancestral_state_file_');
else disable('ancestral_state_file_');
// jumble
if (getValue('jumble_'))
enable('jumble_');
else disable('jumble_');
// jumble_seed
if (getValue('jumble_'))
enable('jumble_seed_');
else disable('jumble_seed_');
// times
// user_tree
// tree_file
if (getValue('user_tree_'))
enable('tree_file_');
else disable('tree_file_');
// multiple_dataset
// datasets_nb
if (getValue('multiple_dataset_'))
enable('datasets_nb_');
else disable('datasets_nb_');
// consense
if (getValue('multiple_dataset_') && getValue('print_treefile_'))
enable('consense_');
else disable('consense_');
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
// use_mixed
// mixture_file
// parsimony_method
// use_ancestral_state
// ancestral_state_file
// jumble
// jumble_seed
if (getValue('jumble_')) {
if (getValue('jumble_seed_') <= 0 || ((getValue('jumble_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
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
// multiple_dataset
// datasets_nb
if (getValue('multiple_dataset_')) {
if ((getValue('datasets_nb_') > 1000) || (getValue('datasets_nb_') < 0)) {
alert('enter a value > 0 ');
return false;
}
}
// consense
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
alert('Please enter a numeric value for threshold, greater than 1');
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
// use_mixed
// mixture_file
// parsimony_method
// use_ancestral_state
// ancestral_state_file
// jumble
// jumble_seed
// times
// user_tree
// tree_file
// multiple_dataset
// datasets_nb
// consense
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
var element = document.forms['mix'].elements[parameter];
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
var element = document.forms['mix'].elements[parameter];
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
var element = document.forms['mix'].elements[parameter];
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