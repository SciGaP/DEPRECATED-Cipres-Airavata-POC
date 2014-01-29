<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Seqboot</title>
<h2>Seqboot: Bootstrap, Jackknife, or Permutation Resampling (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="seqboot" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Input Sequences Interleaved
<s:checkbox name="interleaved_" onclick="resolveParameters()"/>
<br/>
Data type (D)
<font color="red" size="3">*</font>
<s:select name="data_type_" list="#{ 'sequence':'Molecular sequences' , 'morph':'Discrete Morphology' , 'rest':'Restriction Sites' , 'freq':'Gene Frequencies' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#method')">Resampling methods (J)</A>
<font color="red" size="3">*</font>
<s:radio name="method_"
list="#{ 'bootstrap':'Bootstrap' , 'jackknife':'Delete-half jackknife' , 'permute':'Permute species for each character' }" onclick="resolveParameters()"/>
<br/>
Random number seed (must be odd)
<font color="red" size="3">*</font>
<s:textfield name="seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
How many replicates (R)
<s:textfield name="replicates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=freq_opt><h2><A HREF="javascript:help.slidedownandjump('#freq_opt_comment')">Genes Frequencies options</A></H2>
All alleles present at each locus (default: no, one absent at each locus) (A)
<s:checkbox name="alleles_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#percentage')">what fraction of the characters</A>
<s:textfield name="percentage_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Bbootstrap')">Block Bootstrap</A>
<s:textfield name="Bbootstrap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#weights')">Weights</A>
<s:checkbox name="weights_" onclick="resolveParameters()"/>
<br/>
Weights Input File
<s:select name="weights_file_" headerKey='' headerValue='' list="%{ getDataForParameter('weights_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#categories')">Categories</A>
<s:checkbox name="categories_" onclick="resolveParameters()"/>
<br/>
Categories Input File
<s:select name="categories_file_" headerKey='' headerValue='' list="%{ getDataForParameter('categories_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#multiple_weights')">Produce multiple weights file</A>
<s:checkbox name="multiple_weights_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=rest_opt><h2><A HREF="javascript:help.slidedownandjump('#rest_opt_comment')">Restriction enzymes options</A></H2>
Number of enzymes: not present in input file (E)
<s:checkbox name="enzymes_nb_" onclick="resolveParameters()"/>
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
<dt><a name=runtime><i>Maximum Hours to Run (click here for help setting this correctly)</i></a></dt>
<dd>
Estimate the maximum time your job will need to run (up to 72 hrs). Your job will be killed if it doesn't finish within the time you specify, however jobs with shorter maximum run times are often scheduled sooner than longer jobs.
</dd>
<dt><a name=method><i>Resampling methods (J)</i></a></dt>
<dd>1. The bootstrap. Bootstrapping was invented by Bradley Efron in 1979, and its use in phylogeny estimation was introduced by me (Felsenstein, 1985b). It involves creating a new data set by sampling N characters randomly with replacement, so that the resulting data set has the same size as the original, but some characters have been left out and others are duplicated. The random variation of the results from analyzing these bootstrapped data sets can be shown statistically to be typical of the variation that you would get from collecting new data sets. The method assumes that the characters evolve independently, an assumption that may not be realistic for many kinds of data.</dd><dd>2. Delete-half-jackknifing. This alternative to the bootstrap involves sampling a random half of the characters, and including them in the data but dropping the others. The resulting data sets are half the size of the original, and no characters are duplicated. The random variation from doing this should be very similar to that obtained from the bootstrap. The method is advocated by Wu (1986).</dd><dd>3. Permuting species within characters. This method of resampling (well, OK, it may not be best to call it resampling) was introduced by Archie (1989) and Faith (1990; see also Faith and Cranston, 1991). It involves permuting the columns of the data matrix separately. This produces data matrices that have the same number and kinds of characters but no taxonomic structure. It is used for different purposes than the bootstrap, as it tests not the variation around an estimated tree but the hypothesis that there is no taxonomic structure in the data: if a statistic such as number of steps is significantly smaller in the actual data than it is in replicates that are permuted, then we can argue that there is some taxonomic structure in the data (though perhaps it might be just a pair of sibling species).</dd>
<br></br>
<dt><a name=freq_opt_comment><i><b>Genes Frequencies options</b></i></a></dt>
<dt><a name=percentage><i>what fraction of the characters</i></a></dt>
<dd> The % option allows the user control over what fraction of the characters are sampled in the bootstrap
and jackknife methods. Normally the bootstrap samples a number of times equal to the number of characters,
and the jackknife samples half that number. This option permits you to specify a smaller fraction of characters
to be sampled. Note that doing so is "statistically incorrect", but it is available here for whatever other
purposes you may have in mind. Note that the fraction you will be asked to enter is the fraction of characters sampled,
not the fraction left out. If you specify 100 as the fraction of sites retained and are using the jackknife,
the data set will simply be rewritten. Note (as mentioned below) that this can
be used together with the W (Weights) option to rewrite a data set while omitting a particular set of sites.
</dd>
<dt><a name=Bbootstrap><i>Block Bootstrap</i></a></dt>
<dd> The B option selects the Block Bootstrap. When you select option B the program will ask you to enter the block length.
When the block length is 1, this means that we are doing regular bootstrapping rather than block-bootstrapping.
</dd>
<dt><a name=weights><i>Weights</i></a></dt>
<dd> The W (Weights) option allows weights to be read from a file whose default name is "weights".
The weights follow the format described in the Phylip main documentation file. Weights can only be 0 or 1,
and act to select the characters (or sites) that will be used in the resampling,
the others being ignored and always omitted from the output data sets.
If you use W together with the S (just weights) option, you write a file of weights
(whose default name is "outweights"). In that file, any character whose original weight is 0 will have weight 0,
the other weights varying according to the resampling. Note that if you write out data sets rather than weights
(not using the S option), this output weights file is not written, as the characters are written different numbers of
times in the data output file Note that with restriction sites, the weights are not used by some of the programs.
Writing out files of weights will not be helpful with those programs. For the moment, with all gene frequencies programs
the weights are also not used.
</dd>
<dt><a name=categories><i>Categories</i></a></dt>
<dd> The C (Categories) option can be used with molecular sequence programs to allow assignment of sites or amino acid
positions to user-defined rate categories. The assignment of rates to sites is then made by reading a file whose default name is "categories".
It should contain a string of digits 1 through 9. A new line or a blank can occur after any character in this string.
Thus the categories file might look like this:</dd><dd>122231111122411155</dd><dd>1155333333444</dd><dd>The only use of the Categories information in Seqboot is that they are sampled along with the sites (or amino acid positions)
and are written out onto a file whose default name is "outcategories", which has one set of categories
information for each bootstrap or jackknife replicate.</dd>
<br></br>
<dt><a name=rest_opt_comment><i><b>Restriction enzymes options</b></i></a></dt>
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
// interleaved
// data_type
// method
// seed
// replicates
// alleles
if (getValue('data_type_')=="freq")
enable('alleles_');
else disable('alleles_');
// percentage
// Bbootstrap
// weights
// weights_file
if (getValue('weights_'))
enable('weights_file_');
else disable('weights_file_');
// categories
// categories_file
if (getValue('categories_'))
enable('categories_file_');
else disable('categories_file_');
// multiple_weights
// enzymes_nb
if (getValue('data_type_')=="rest")
enable('enzymes_nb_');
else disable('enzymes_nb_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// interleaved
// data_type
// method
// seed
// replicates
if (getValue('replicates_') > 1000) {
alert('this server allows no more than 1000 replicates');
return false;
}
// alleles
// percentage
// Bbootstrap
// weights
// weights_file
// categories
// categories_file
// multiple_weights
// enzymes_nb
return issueWarning();
}
function issueWarning() {
// runtime
// interleaved
// data_type
// method
// seed
// replicates
// alleles
// percentage
// Bbootstrap
// weights
// weights_file
// categories
// categories_file
// multiple_weights
// enzymes_nb
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
var element = document.forms['seqboot'].elements[parameter];
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
var element = document.forms['seqboot'].elements[parameter];
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
var element = document.forms['seqboot'].elements[parameter];
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