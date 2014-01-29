<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Dollop</title>
<h2>Dollop: Dollo and Polymorphism Parsimony (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="dollop" theme="simple">
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
<A name=dollop_opt><h2><A HREF="javascript:help.slidedownandjump('#dollop_opt_comment')">Dollop options</A></H2>
<A HREF="javascript:help.slidedownandjump('#dollop_method')">Use Parsimony method (P)</A>
<s:checkbox name="dollop_method_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_ancestral_state')">Use ancestral states in input file (A)</A>
<s:checkbox name="use_ancestral_state_" onclick="resolveParameters()"/>
<br/>
Ancestors state filefile
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
Random number seed (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="tree_jumble_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
Use Threshold parsimony (T)
<s:checkbox name="use_threshold_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#threshold')">Threshold value (if use threshold parsimony)</A>
<font color="red" size="3">+</font>
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=dollop_opt_comment><i><b>Dollop options</b></i></a></dt>
<dt><a name=dollop_method><i>Use Parsimony method (P)</i></a></dt>
<dd>The Dollo parsimony method (default value) was first suggested in print by Le Quesne (1974) and was
first well-specified by Farris (1977). It allows up to one forward change0-->1 and as many reversions
1-->0 as are necessary to explain the pattern of states seen. The program attempts to minimize the number
of 1-->0 reversions necessary. The assumptions of this method are in effect:</dd><dd>1. We know which state is the ancestral one(state 0).</dd><dd>2. The characters are evolving independently.</dd><dd>3. Different lineages evolve independently.</dd><dd>4. The probability of a forward change (0-->1) is small over the evolutionary times involved.</dd><dd>5. The probability of a reversion (1-->0) is also small, but still far larger than the probability of a forward change, so that many reversions are easier to envisage than even one extra forward change.</dd><dd>6. Retention of polymorphism for both states (0 and 1) is highly improbable.</dd><dd>7. The lengths of the segments of the true tree are not so unequal that two changes in a long segment are as
probable as one in a short segment.</dd><dd>One problem can arise when using additive binary recoding to represent a multistate character as a
series of two-state characters. Unlike the Camin-Sokal, Wagner, and Polymorphism methods, the Dollo method
can reconstruct ancestral states which do not exist. An example is given in Felsenstein's 1979 paper. It
will be necessary to check the output to make sure that this has not occurred.</dd><dd>The polymorphism parsimony method was first used by me, and the results published (without a clear specification of the method) by Inger (1967). The method was independently published by Farris (1978a) and by Felsenstein (1979). The method assumes that we can explain the pattern of states by no more than one origination (0-->1) of state 1, followed by retention of polymorphism along as many segments of the tree as are necessary, followed by loss of state 0 or of state 1 where necessary. The program tries to minimize the total number of polymorphic characters, where each polymorphism is counted once for each segment of the tree in which it is retained. The assumptions of the polymorphism parsimony method are in effect:</dd><dd>1. The ancestral state (state 0) is known in each character. </dd><dd>2. The characters are evolving independently of each other. </dd><dd>3. Different lineages are evolving independently. </dd><dd>4. Forward change (0-->1) is highly improbable over the length of time involved in the evolution of the group. </dd><dd>5. Retention of polymorphism is also improbable, but far more probable that forward change, so that we can more easily envisage much polymorhism than even one additional forward change. </dd><dd>6. Once state 1 is reached, reoccurrence of state 0 is very improbable, much less probable than multiple retentions of polymorphism. </dd><dd>7. The lengths of segments in the true tree are not so unequal that we can more easily envisage retention events occurring in both of two long segments than one retention in a short segment. </dd><dd>That these are the assumptions of parsimony methods has been documented in a series of papers of mine: (1973a, 1978b, 1979, 1981b, 1983b, 1988b). For an opposing view arguing that the parsimony methods make no substantive assumptions such as these, see the papers by Farris (1983) and Sober (1983a, 1983b), but also read the exchange between Felsenstein and Sober (1986).</dd>
<dt><a name=use_ancestral_state><i>Use ancestral states in input file (A)</i></a></dt>
<dd>The A (Ancestral states) option. This indicates that we are specifying the ancestral states for each
character. In the menu the ancestors (A) option must be selected. An ancestral states input file is read,
whose default name is ancestors. It contains a line or lines giving the ancestral states for each character.
These may be 0, 1 or ?, the latter indicating that the ancestral state is unknown. </dd><dd>An example is: </dd><dd>001??11 </dd><dd>The ancestor information can be continued to a new line and can have blanks between any of the characters
in the same way that species character data can. The program will infer, for any character whose ancestral
state is unknown ("?") whether the ancestral state 0 or 1 will give the best tree. If these are tied, then it
may not be possible for the program to infer the state in the internal nodes, and these will all be printed
as ".". If this has happened and you want to know more about the states at the internal nodes, you will find
helpful to use Dolmove to display the tree and examine its interior states, as the algorithm in Dolmove shows
all that can be known in this case about the interior states, including where there is and is not amibiguity.
The algorithm in Dollop gives up more easily on displaying these states.</dd>
<br></br>
<dt><a name=jumble_opt_comment><i><b>Randomize options</b></i></a></dt>
<dt><a name=jumble><i>Randomize (jumble) input order (J)</i></a></dt>
<dd>The J (Jumble) option. In most tree construction programs, the search of different trees depends on the order of input of species. The J option tells the program to use a random number generator to choose the input order of species. If you select Jumble, you must provide a "seed" for the random number generator. The seed should be an integer between 1 and be of form 4n+1. Each different seed leads to a different sequence of addition of species. By simply changing the random number seed and re-running the programs one can look for other, and better trees.</dd><dd>Using the Jumble option, you must specify how many times you want to restart the process. The value 10 causes ten different orders of species to be used in constructing the trees, and the results printed out will reflect this entire search process (that is, the best trees found among all 10 runs will be printed out, not the best trees from each individual run).</dd>
<br></br>
<dt><a name=user_tree_opt_comment><i><b>User tree options</b></i></a></dt>
<dt><a name=user_tree><i>Use User tree (default: no, search for best tree) (U)</i></a></dt>
<dd>The U (User tree) option. This option toggles between the default setting, which allows the program to
search for the best tree, and the User tree setting, which reads a tree or trees ("user trees") from an input
tree file. The input tree file default name is intree.</dd><dd>((Alligator,Bear),((Cow,(Dog,Elephant)),Ferret));</dd><dd>((Alligator,Bear),(((Cow,Dog),Elephant),Ferret));</dd><dd>((Alligator,Bear),((Cow,Dog),(Elephant,Ferret)));</dd><dd>Multifurcating trees are permitted. You must then enter the number of trees submitted. In using the
user tree option, check the pattern of parentheses carefully. The programs do not always detect whether
the tree makes sense, and if it does not there will probably be a crash (hopefully, but not inevitably,
with an error message indicating the nature of the problem). Trees written out by programs are typically
in the proper form.
</dd>
<dt><a name=tree_file><i>User Tree file</i></a></dt>
<dd>Specify your tree file.</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Multiple Datasets: </b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M), e.g. from Seqboot; infer Consensus Trees with the output using Consense</i></a></dt>
<dd>The M (Multiple data sets) option allows bootstrapping. The M (multiple data sets option) will ask you whether you want to use multiple sets of weights (from the weights file) or multiple data sets. The ability to use a single data set with multiple weights means that much less disk space will be used for this input data. The bootstrapping and jackknifing tool Seqboot has the ability to create a weights file with multiple weights. The present version of the package allows bootstrapping with the useof Seqboot and Consense. Currently, in SWAMI, these programs must be run separately, rather than invoking it from this interface.</dd><dd>Here is a (very small) sample input file with two five-species data sets: </dd><dd></dd><dd>5 6</dd><dd>Alpha CCACCA</dd><dd>Beta CCAAAA</dd><dd>Gamma CAACCA</dd><dd>Delta AACAAC</dd><dd>Epsilon AACCCA</dd><dd>5 6</dd><dd>Alpha CACACA</dd><dd>Beta CCAACC</dd><dd>Gamma CAACAC</dd><dd>Delta GCCTGG</dd><dd>Epsilon TGCAAT</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (6)</i></a></dt>
<dd>Tells the program to save the tree in a treefile (a standard representation of trees where the tree is specified by a nested pairs of parentheses, enclosing names and separated by commas).</dd>
<br></br>
<dt><a name=pars_opt_comment><i><b>Parsimony options</b></i></a></dt>
<dt><a name=threshold><i>Threshold value (if use threshold parsimony)</i></a></dt>
<dd>Setting T at or below 1.0 but above 0 causes the criterion to become compatibility rather
than polymorphism parsimony. There is no advantage to using this program instead of MIX to do a compatibility
method. Setting the threshold value higher brings about an intermediate between the Dollo or polymorphism
parsimony methods and the compatibility method. Since the Dollo and polymorphism methods produces a rooted
tree, the user-defined trees required by the U option have two-way forks at each level.</dd><dd>By using a threshold value of 1.0 or lower, but above 0, one can obtain a rooted
(or, if the A option is used with ancestral states of "?", unrooted) compatibility criterion, but there
is no particular advantage to using this program for that instead of MIX. Higher threshold values are of
course meaningful and provide intermediates between Dollo and compatibility methods.</dd><dd>©Copyright 1980-2007. University of Washington.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// dollop_method
// use_ancestral_state
// ancestral_state_file
if (getValue('use_ancestral_state_'))
enable('ancestral_state_file_');
else disable('ancestral_state_file_');
// jumble
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
// tree_jumble_seed
if (getValue('user_tree_'))
enable('tree_jumble_seed_');
else disable('tree_jumble_seed_');
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
}
function validateControl() {
// dollop_method
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
// tree_jumble_seed
if (getValue('user_tree_')) {
if (getValue('tree_jumble_seed_') <= 0 || ((getValue('tree_jumble_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
return false;
}
}
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
alert('You must enter a numeric value greater than 1');
return false;
}
}
return issueWarning();
}
function issueWarning() {
// dollop_method
// use_ancestral_state
// ancestral_state_file
// jumble
// jumble_seed
// times
// user_tree
// tree_file
// tree_jumble_seed
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
var element = document.forms['dollop'].elements[parameter];
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
var element = document.forms['dollop'].elements[parameter];
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
var element = document.forms['dollop'].elements[parameter];
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