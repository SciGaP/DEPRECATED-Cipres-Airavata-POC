<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Clique</title>
<h2>Clique: Compatibility for Two State Characters (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="clique" theme="simple">
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
<A name=clique_opt><h2><A HREF="javascript:help.slidedownandjump('#clique_opt_comment')">Clique options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_ancestral_state')">Upload an Ancestral states file</A>
<s:checkbox name="use_ancestral_state_" onclick="resolveParameters()"/>
<br/>
Ancestors state filefile
<s:select name="ancestral_state_file_" headerKey='' headerValue='' list="%{ getDataForParameter('ancestral_state_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#spec_min_clique_size')">Specify minimum clique size? (C)</A>
<s:checkbox name="spec_min_clique_size_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#min_clique_size')">Minimum clique size</A>
<font color="red" size="3">+</font>
<s:textfield name="min_clique_size_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Multiple Data Options</A></H2>
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
Print out compatibility matrix (3)
<s:checkbox name="print_matrix_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#print_tree')">Print out tree (4)</A>
<s:checkbox name="print_tree_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#print_treefile')">Write out trees onto tree file (5)</A>
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
<dt><a name=clique_opt_comment><i><b>Clique options</b></i></a></dt>
<dt><a name=use_ancestral_state><i>Upload an Ancestral states file</i></a></dt>
<dd>The A (Ancestral states) option allows the user to specify ancestral states for each character. These may be 0, 1 or ?, the latter indicating that the ancestral state is unknown.</dd><dd>In the program Clique the ancestor is included explicitly as a species in the character matrix (it is a distinct file in other Phylip programs).</dd>
<dt><a name=spec_min_clique_size><i>Specify minimum clique size? (C)</i></a></dt>
<dd>The C (Clique Size) option allows the user to specify a minimum clique size and print out all cliques (and their associated trees) greater than or equal to than that size.
The program prompts you for the minimum clique size. Thus by setting the minimum clique size to 1, all cliques (each with their respective trees)
can be shown. If the largest clique has 23 characters, you run the program with a minimum clique size of 18 to list all cliques within 5 characters of the largest one.</dd>
<dt><a name=min_clique_size><i>Minimum clique size</i></a></dt>
<dd>This option specifies a minimum clique size, and prints out all cliques (and their associated trees) greater than or equal to than that size.</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Multiple Data Options</b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M)</i></a></dt>
<dd>The M (Multiple data sets) option. This option is included to allow bootstrapping. Using the program Seqboot, one can take any DNA, protein, restriction sites, gene frequency or binary character data set and make multiple data sets by bootstrapping.
Trees can be produced for all bootstrapped data sets using the M option.
These can be written to the tree output file if that option is left in force.
The multi-tree output file can be routed to the program Consense to create a majority rule consensus tree
that can be used to make confidence intervals. The present version of the package allows bootstrapping
with Seqboot and Consense.</dd><dd>Here is a (very small) sample input file with two five-species data sets:</dd><dd>    5   6</dd><dd>Alpha     CCACCA</dd><dd>Beta      CCAAAA</dd><dd>Gamma     CAACCA</dd><dd>Delta     AACAAC</dd><dd>Epsilon   AACCCA</dd><dd>    5   6</dd><dd>Alpha     CCACCA</dd><dd>Beta      CCAAAA</dd><dd>Gamma     CAACCA</dd><dd>Delta     AACAAC</dd><dd>Epsilon   AACCCA</dd><dd>The program can take multiple weights instead of multiple data sets.
It can do bootstrapping by reading in one data set,
together with a file of weights that show how the characters (or sites) are to be reweighted in each bootstrap sample.
Thus a site that is omitted in a bootstrap sample has effectively been given weight 0, while a site that has been
duplicated has effectively been given weight 2. The required weights file can be produced using Seqboot,
by setting the option to produce a wieghts file instead instead of producing a file of multiple data sets.
It can be saved and used as the input weights file.</dd><dd>The main use of this option will be to allow all of the methods in these programs to be bootstrapped.
Using the program Seqboot one can take any DNA, protein, restriction sites, gene frequency or binary character
data set and make multiple data sets by bootstrapping.
Trees can be produced for all of these using the M option.
They will be written to the tree output file if that option is left in force.
The program Consense can be used to create a majority rule consensus tree which can be used to make confidence intervals.
</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (4)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (5)</i></a></dt>
<dd>Saves the tree in a treefile (a standard Newick representation of trees).</dd>
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
// use_ancestral_state
// ancestral_state_file
if (getValue('use_ancestral_state_'))
enable('ancestral_state_file_');
else disable('ancestral_state_file_');
// spec_min_clique_size
// min_clique_size
if (getValue('spec_min_clique_size_'))
enable('min_clique_size_');
else disable('min_clique_size_');
// multiple_dataset
// datasets_nb
if (getValue('multiple_dataset_'))
enable('datasets_nb_');
else disable('datasets_nb_');
// consense
if (getValue('multiple_dataset_') && getValue('print_treefile_'))
enable('consense_');
else disable('consense_');
// print_matrix
// print_tree
// print_treefile
// printdata
// indent_tree
// outgroup
}
function validateControl() {
// use_ancestral_state
// ancestral_state_file
// spec_min_clique_size
// min_clique_size
if (getValue('spec_min_clique_size_')) {
if ((getValue('min_clique_size_').match("^\d+(\.\==nulld+)?")) || (getValue('min_clique_size_') < 0)) {
alert('You must enter a numeric value, greater than 0');
return false;
}
}
// multiple_dataset
// datasets_nb
if (getValue('multiple_dataset_')) {
if ((getValue('datasets_nb_') > 1000) || (getValue('datasets_nb_') < 0)) {
alert('enter a value > 0 ; there must be no more than 1000 datasets for this server');
return false;
}
}
// consense
// print_matrix
// print_tree
// print_treefile
// printdata
// indent_tree
// outgroup
if (getValue('outgroup_') < 1) {
alert('Please enter a value greater than 0');
return false;
}
return issueWarning();
}
function issueWarning() {
// use_ancestral_state
// ancestral_state_file
// spec_min_clique_size
// min_clique_size
// multiple_dataset
// datasets_nb
// consense
// print_matrix
// print_tree
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
var element = document.forms['clique'].elements[parameter];
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
var element = document.forms['clique'].elements[parameter];
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
var element = document.forms['clique'].elements[parameter];
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