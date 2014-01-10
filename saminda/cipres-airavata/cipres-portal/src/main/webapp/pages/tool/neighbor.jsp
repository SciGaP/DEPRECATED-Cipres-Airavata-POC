<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Neighbor</title>
<h2>Neighbor: Neighbor-Joining and UPGMA methods (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="neighbor" theme="simple">
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
Distance method
<font color="red" size="3">*</font>
<s:radio name="distance_method_"
list="#{ 'neighbor':'Neighbor-joining' , 'upgma':'UPGMA' }" onclick="resolveParameters()"/>
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
<hr/>
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Multiple Datasets (e.g from Seqboot): Save your output and use Consense to get a Consensus tree</A></H2>
<A HREF="javascript:help.slidedownandjump('#multiple_dataset')">Analyze multiple data sets (M)</A>
<s:checkbox name="multiple_dataset_" onclick="resolveParameters()"/>
<br/>
How many data sets
<font color="red" size="3">+</font>
<s:textfield name="datasets_nb_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Random number seed for multiple dataset (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="multiple_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#print_tree')">Print out tree (3)</A>
<s:checkbox name="print_tree_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#print_treefile')">Write out trees onto tree file (4)</A>
<s:checkbox name="print_treefile_" onclick="resolveParameters()"/>
<br/>
Indent treefile
<s:checkbox name="indent_tree_" onclick="resolveParameters()"/>
<br/>
Print out the data at start of run (1)
<s:checkbox name="printdata_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=other_options><h2><A HREF="javascript:help.slidedownandjump('#other_options_comment')">Other options</A></H2>
Outgroup species (default, use as outgroup species 1) (O)
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Matrix format
<s:radio name="triangular_"
list="#{ '': '[Not Mandatory]', 'square':'Square' , 'lower':'Lower-triangular' , 'upper':'Upper-triangular' }" onclick="resolveParameters()"/>
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
<dt><a name=bootstrap_comment><i><b>Multiple Datasets (e.g from Seqboot): Save your output and use Consense to get a Consensus tree</b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M)</i></a></dt>
<dd>The M (Multiple data sets) option allows bootstrapping. Using the program Seqboot, one can take any DNA, protein, restriction sites, gene frequency or binary
character data set and make multiple data sets by bootstrapping. Trees can be produced for all of these using the M option. They will be written on the tree output file if that option is left in force. The
program Consense can take the multi-tree output file and create a majority rule consensus tree that can be used to make confidence intervals. The present version of the package allows bootstrapping with the use of Seqboot and Consense and the M option. Currently, in SWAMI, Consense must be run separately, rather than invoking it from this interface.</dd><dd>Here is a (very small) sample input file with two five-species data sets: </dd><dd></dd><dd> 5 6</dd><dd>Alpha CCACCA</dd><dd>Beta CCAAAA</dd><dd>Gamma CAACCA</dd><dd>Delta AACAAC</dd><dd>Epsilon AACCCA</dd><dd>5 6</dd><dd>Alpha CACACA</dd><dd>Beta CCAACC</dd><dd>Gamma CAACAC</dd><dd>Delta GCCTGG</dd><dd>Epsilon TGCAAT</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
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
// distance_method
// jumble
if (! getValue('multiple_dataset_'))
enable('jumble_');
else disable('jumble_');
// jumble_seed
if (getValue('jumble_'))
enable('jumble_seed_');
else disable('jumble_seed_');
// multiple_dataset
// datasets_nb
if (getValue('multiple_dataset_'))
enable('datasets_nb_');
else disable('datasets_nb_');
// multiple_seed
if (getValue('multiple_dataset_'))
enable('multiple_seed_');
else disable('multiple_seed_');
// print_tree
// print_treefile
// indent_tree
// printdata
// outgroup
if (getValue('distance_method_')=="neighbor")
enable('outgroup_');
else disable('outgroup_');
// triangular
}
function validateControl() {
// distance_method
// jumble
// jumble_seed
if (getValue('jumble_')) {
if (getValue('jumble_seed_') <= 0 || ((getValue('jumble_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
return false;
}
}
// multiple_dataset
// datasets_nb
if (getValue('multiple_dataset_')) {
if (getValue('datasets_nb_') > 1000) {
alert('there must be no more than 1000 datasets for this server');
return false;
}
}
// multiple_seed
if (getValue('multiple_dataset_')) {
if (getValue('multiple_seed_') <= 0 || ((getValue('multiple_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
return false;
}
}
// print_tree
// print_treefile
// indent_tree
// printdata
// outgroup
if (getValue('distance_method_')=="neighbor") {
if ( getValue('outgroup_') < 1) {
alert('Please enter a value greater than 0');
return false;
}
}
// triangular
return issueWarning();
}
function issueWarning() {
// distance_method
// jumble
// jumble_seed
// multiple_dataset
// datasets_nb
// multiple_seed
// print_tree
// print_treefile
// indent_tree
// printdata
// outgroup
// triangular
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
var element = document.forms['neighbor'].elements[parameter];
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
var element = document.forms['neighbor'].elements[parameter];
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
var element = document.forms['neighbor'].elements[parameter];
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