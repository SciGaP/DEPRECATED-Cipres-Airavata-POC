<%@ taglib prefix="s" uri="/struts-tags" %>
<title>DNAdist</title>
<h2>DNAdist: Compute distance matrix from NS (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="dnadist" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Input sequences interleaved?
<font color="red" size="3">*</font>
<s:radio name="interleavedinfile_"
list="#{ 'yes':'Yes' , 'no':'No' }" onclick="resolveParameters()"/>
<br/>
Print out the data at start of run (1)
<font color="red" size="3">*</font>
<s:checkbox name="printdata_" onclick="resolveParameters()"/>
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
<A name=dnadist_opt><h2><A HREF="javascript:help.slidedownandjump('#dnadist_opt_comment')">dnadist options</A></H2>
Distance (D)
<s:select name="distance_" headerKey='' headerValue='' list="#{ 'F84':'F84' , 'K':'Kimura 2-parameter' , 'JC':'Jukes-Cantor' , 'LogDet':'LogDet' , 'Similarity':'Similarity table' }" onchange="resolveParameters()"/>
<br/>
<br/>
Transition/transversion ratio (T)
<s:textfield name="ratio_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gamma distributed rates across sites (G)
<s:radio name="gamma_"
list="#{ '': '[Not Mandatory]', '0':'No' , '1':'Yes' , 'GI':'Gamma+Invariant' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#variation_coeff')">Coefficient of variation of substitution rate among sites (must be positive) (if Gamma)</A>
<font color="red" size="3">+</font>
<s:textfield name="variation_coeff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Fraction of invariant sites (if Gamma)
<font color="red" size="3">+</font>
<s:textfield name="invariant_sites_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use empirical base frequencies (F)
<s:checkbox name="empirical_frequencies_" onclick="resolveParameters()"/>
<br/>
Base frequencies for A, C, G, T/U (if not empirical) (separated by space)
<font color="red" size="3">+</font>
<s:textfield name="base_frequencies_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=categ_opt><h2><A HREF="javascript:help.slidedownandjump('#categ_opt_comment')">Categories options</A></H2>
One category of substitution rates (C)
<s:checkbox name="one_category_" onclick="resolveParameters()"/>
<br/>
Number of categories (1 to 9)
<font color="red" size="3">+</font>
<s:textfield name="n_categ_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Rate for each category (separated by commas)
<font color="red" size="3">+</font>
<s:textfield name="categ_rates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Categories file
<font color="red" size="3">+</font>
<s:select name="categ_file_" headerKey='' headerValue='' list="%{ getDataForParameter('categ_file_')}" onchange="resolveParameters()"/>
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
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Multiple Datasets: Use Seqboot to create multiple data or weights, Use Consense to get a Consensus tree</A></H2>
<A HREF="javascript:help.slidedownandjump('#multiple_dataset')">Analyze multiple data sets (M)</A>
<s:checkbox name="multiple_dataset_" onclick="resolveParameters()"/>
<br/>
Multiple data sets or multiple weights?
<font color="red" size="3">+</font>
<s:radio name="weightsordata_"
list="#{ 'data':'Data' , 'weights':'Weights' }" onclick="resolveParameters()"/>
<br/>
How many data sets?
<font color="red" size="3">+</font>
<s:textfield name="datasets_nb_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#matrix_form')">Lower-triangular distance matrix (L)</A>
<s:checkbox name="matrix_form_" onclick="resolveParameters()"/>
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
<dt><a name=dnadist_opt_comment><i><b>dnadist options</b></i></a></dt>
<dt><a name=variation_coeff><i>Coefficient of variation of substitution rate among sites (must be positive) (if Gamma)</i></a></dt>
<dd>In gamma distribution parameters, this is 1/(square root of alpha)</dd>
<br></br>
<dt><a name=categ_opt_comment><i><b>Categories options</b></i></a></dt>
<dd>
</dd><dd>To use this option, uncheck the box, specify the number of categories, and specify the rate associated with each.
The values cannot be negative but can be zero. These numbers are defined relative to each other, so that if rates for
three categories are set to 1 : 3 : 2.5 this would have the same meaning as setting them to 2 : 6 : 5.
The assignment of rates to sites is made by reading a file. It should contain a string of digits 1 through 9.
A new line or a blank can occur after any character in this string. Thus the categories file might look like this:</dd><dd>
</dd><dd>122231111122411155</dd><dd>
</dd><dd>1155333333444</dd><dd>
</dd><dd>If both user-assigned rate categories and Gamma-distributed rates are allowed,
the program assumes that the actual rate at a site is the product of the user-assigned category rate and the
Gamma-distributed rate. This allows you to specify that certain sites have higher or lower rates of change while
also allowing the program to allow variation of rates in addition to that.
(This may not always make perfect biological sense: it would be more natural to assume some upper bound to the rate,
as we have discussed in the Felsenstein and Churchill paper). Nevertheless you may want to use both types of rate
variation.</dd><dd>
</dd>
<br></br>
<dt><a name=weight_opt_comment><i><b>Weight options</b></i></a></dt>
<dt><a name=weights><i>Use weights for sites (W)</i></a></dt>
<dd> The W (Weights) option. This allows the user to read in a series of weights that tell how many times each character is to be counted.
If the weight for a character is zero (0) then that character is effectvely omitted when the tree is evaluated. If it is (1),
the character is to be counted once.
A value greater than one means the character is counted as if it were present that many times, a weight of 4 means
the character is counted 4 times. The values 0-9 give weights 0 through 9, while values A-Z give weights 10 through 35.</dd><dd>
Weights are used to analyze subsets of characters, and can also be used for resampling of the data as in bootstrap and jackknife
resampling. For programs that allow weights to be greater than 1, they can also be used to emphasize information from some characters
more strongly than others. Of course, you must have some rationale for doing this. </dd><dd>Weights are provided as a sequence of digits. For example:</dd><dd>10011111100010100011110001100 </dd><dd>The weights are to be provided in an input file. The weights in it are a simple string of digits or letters. Blanks in the
weightfile are skipped over and ignored, and new lines are ignored.
</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Multiple Datasets: Use Seqboot to create multiple data or weights, Use Consense to get a Consensus tree</b></i></a></dt>
<dt><a name=multiple_dataset><i>Analyze multiple data sets (M)</i></a></dt>
<dd>The M (multiple data sets) option will ask you whether you want to use multiple sets of weights (from the weights file)
or multiple data sets from the input file. The ability to use a single data set with multiple weights means that much less disk
space will be used for this input data. The bootstrapping and jackknifing tool Seqboot has the ability to create a weights file
with multiple weights. Note also that when we use multiple weights for bootstrapping we can also then maintain different rate
categories for different sites in a meaningful way. You should not use the multiple data sets option without using multiple weights,
you should not at the same time use the user-defined rate categories option (option C). If you use the multiple data sets option without
using multiple weights, you should not at the same time use the user-defined rate categories option (option C). The reason for this
restriction is: that if you use the M option and use multiple weights, then you have the possibility of associating categories (C)
with sites as well. But if you use multiple data sets rather than multiple weights, then the categories cannot be appropriately associated
with the sites because the sites (if you have bootstrapped) can move around.
Using the program Seqboot, one can take any DNA (or other) data set and make multiple data sets by bootstrapping.
Trees can be produced for all of these using the M option. They will be written on the tree output file if that option is left in force.
The program Consense can take the multi-tree output file and create a majority rule consensus tree that can be used to make confidence intervals.
The present version of the package allows bootstrapping with the use
of Seqboot and Consense. Currently, in SWAMI, Consense must be run separately, rather than invoking them from this interface.</dd><dd>Here is a (very small) sample input file with two five-species data sets: </dd><dd></dd><dd>5 6</dd><dd>Alpha CCACCA</dd><dd>Beta CCAAAA</dd><dd>Gamma CAACCA</dd><dd>Delta AACAAC</dd><dd>Epsilon AACCCA</dd><dd>5 6</dd><dd>Alpha CACACA</dd><dd>Beta CCAACC</dd><dd>Gamma CAACAC</dd><dd>Delta GCCTGG</dd><dd>Epsilon TGCAAT</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=matrix_form><i>Lower-triangular distance matrix (L)</i></a></dt>
<dd>The output file contains on its first line the number of species. The distance matrix is then printed in
standard form, with each species starting on a new line with the species name, followed by the distances to the species
in order. These continue onto a new line after every nine distances. If the L option is used, the matrix or distances is
in lower triangular form, so that only the distances to the other species that precede each species are printed. Otherwise
the distance matrix is square with zero distances on the diagonal. In general the format of the distance matrix is such
that it can serve as input to any of the distance matrix programs.</dd><dd>If the C (Categories) option is used a table of the relative rates of expected substitution at each category of
sites is printed, and a listing of the categories each site is in.</dd><dd>Then follow the equilibrium frequencies of the four bases. If the Jukes-Cantor or Kimura distances are used,
these will necessarily be 0.25 : 0.25 : 0.25 : 0.25. The output then shows the transition/transversion ratio that
was specified or used by default. In the case of the Jukes-Cantor distance this will always be 0.5.
The transition-transversion parameter (as opposed to the ratio) is also printed out: this is used within the program
and can be ignored. There then follow the data sequences, with the base sequences printed in groups of ten bases along
the lines of the Genbank and GBMAM formats.</dd><dd>The distances printed out are scaled in terms of expected numbers of substitutions, counting both transitions and
transversions but not replacements of a base by itself, and scaled so that the average rate of change, averaged over all
sites analyzed, is set to 1.0 if there are multiple categories of sites. This means that whether or not there are multiple
categories of sites, the expected fraction of change for very small branches is equal to the branch length. Of course,
when a branch is twice as long this does not mean that there will be twice as much net change expected along it, since
some of the changes may occur in the same site and overlie or even reverse each other. The branch lengths estimates
here are in terms of the expected underlying numbers of changes. That means that a branch of length 0.26 is 26 times
as long as one which would show a 1% difference between the nucleotide sequences at the beginning and end of the branch. But we would not expect the sequences at the beginning and end of the branch to be 26% different, as there would be some overlaying of changes.
</dd><dd>©Copyright 1980-2007. University of Washington.</dd>
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
// printdata
// distance
// ratio
if (getValue('distance_')=="F84" || getValue('distance_')=="K")
enable('ratio_');
else disable('ratio_');
// gamma
if (getValue('distance_')=="F84" || getValue('distance_')=="K" || getValue('distance_')=="JC")
enable('gamma_');
else disable('gamma_');
// variation_coeff
if (getValue('gamma_'))
enable('variation_coeff_');
else disable('variation_coeff_');
// invariant_sites
if (getValue('gamma_')=="GI")
enable('invariant_sites_');
else disable('invariant_sites_');
// empirical_frequencies
// base_frequencies
if (! getValue('empirical_frequencies_'))
enable('base_frequencies_');
else disable('base_frequencies_');
// one_category
if (getValue('distance_')=="F84" || getValue('distance_')=="K" || getValue('distance_')=="JC")
enable('one_category_');
else disable('one_category_');
// n_categ
if (! getValue('one_category_'))
enable('n_categ_');
else disable('n_categ_');
// categ_rates
if (! getValue('one_category_'))
enable('categ_rates_');
else disable('categ_rates_');
// categ_file
if (! getValue('one_category_'))
enable('categ_file_');
else disable('categ_file_');
// weights
// weights_file
if (getValue('weights_'))
enable('weights_file_');
else disable('weights_file_');
// multiple_dataset
// weightsordata
if (getValue('multiple_dataset_'))
enable('weightsordata_');
else disable('weightsordata_');
// datasets_nb
if (getValue('multiple_dataset_'))
enable('datasets_nb_');
else disable('datasets_nb_');
// matrix_form
}
function validateControl() {
// interleavedinfile
// printdata
// distance
// ratio
// gamma
// variation_coeff
// invariant_sites
// empirical_frequencies
// base_frequencies
if (! getValue('empirical_frequencies_')) {
if (! getValue('base_frequencies_').match(",")) {
alert('Please check your base_frequencies entry, values should be separated by space');
return false;
}
}
// one_category
// n_categ
if (! getValue('one_category_')) {
if (getValue('n_categ_') > 9) {
alert('there must be no more than 9 categories');
return false;
}
}
if (! getValue('one_category_')) {
if (getValue('n_categ_') < 1) {
alert('there must be at least one category');
return false;
}
}
// categ_rates
if (! getValue('one_category_')) {
if (! getValue('categ_rates_').match(",")) {
alert('The rate must be non-negative and greater than 0');
return false;
}
}
// categ_file
// weights
// weights_file
// multiple_dataset
// weightsordata
// datasets_nb
if (getValue('multiple_dataset_')) {
if (getValue('datasets_nb_') > 1000) {
alert('there must be no more than 1000 datasets for this server');
return false;
}
}
// matrix_form
return issueWarning();
}
function issueWarning() {
// interleavedinfile
// printdata
// distance
// ratio
// gamma
// variation_coeff
// invariant_sites
// empirical_frequencies
// base_frequencies
// one_category
// n_categ
// categ_rates
// categ_file
// weights
// weights_file
// multiple_dataset
// weightsordata
// datasets_nb
// matrix_form
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
var element = document.forms['dnadist'].elements[parameter];
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
var element = document.forms['dnadist'].elements[parameter];
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
var element = document.forms['dnadist'].elements[parameter];
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