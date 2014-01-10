<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Protdist</title>
<h2>Protdist: Compute distance matrix from PS (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="protdist" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#method')">Distance model (P)</A>
<s:select name="method_" headerKey='' headerValue='' list="#{ 'J':'Jones-Taylor-Thornton matrix' , 'D':'Dayhoff PAM matrix' , 'K':'Kimura formula' , 'S':'Similarity table' , 'C':'Categories model' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gamma_dist')">Gamma distribution of rates among positions (G)</A>
<s:radio name="gamma_dist_"
list="#{ '': '[Not Mandatory]', 'N':'No' , 'Y':'Yes' , 'G':'Gamma+Invariant' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Bootstrap options</A></H2>
<A HREF="javascript:help.slidedownandjump('#seqboot')">Perform a bootstrap before analysis</A>
<s:checkbox name="seqboot_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#resamp_method')">Resampling methods</A>
<font color="red" size="3">+</font>
<s:radio name="resamp_method_"
list="#{ 'bootstrap':'Bootstrap' , 'jackknife':'Delete-half jackknife' , 'permute':'Permute species for each character' }" onclick="resolveParameters()"/>
<br/>
Random number seed (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="seqboot_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
How many replicates
<s:textfield name="replicates_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
Print out the data at start of run (1)
<s:checkbox name="printdata_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=categ_opt><h2><A HREF="javascript:help.slidedownandjump('#categ_opt_comment')">Categories model options</A></H2>
Genetic code (U)
<s:select name="code_" headerKey='' headerValue='' list="#{ 'U':'U: Universal' , 'M':'M: Mitochondrial' , 'V':'V: Vertebrate mitochondrial' , 'F':'F: Fly mitochondrial' , 'Y':'Y: Yeast mitochondrial' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#categorization')">Categorization of amino acids (A)</A>
<s:radio name="categorization_"
list="#{ '': '[Not Mandatory]', 'G':'G: George/Hunt/Barker' , 'C':'C: Chemical' , 'H':'H: Hall' }" onclick="resolveParameters()"/>
<br/>
Prob change category (1.0=easy) (E)
<s:textfield name="change_prob_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Transition/transversion ratio (T)
<s:textfield name="ratio_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=method><i>Distance model (P)</i></a></dt>
<dd>The P option selects one of the five distance methods, or the similarity table.
The default method, if none is specified, is the Jones-Taylor-Thornton model. If the Categories
distance is selected, the option T allows the user to supply the Transition/Transversion ratio
that should be assumed at the underlying DNA level, and the option C, which allows the user to
select among various nuclear and mitochondrial genetic codes. The transition/transversion ratio
can be any number from 0.5 upwards.</dd>
<dt><a name=gamma_dist><i>Gamma distribution of rates among positions (G)</i></a></dt>
<dd>The G option chooses Gamma distributed rates of evolution across amino acid positions.
The program will prompt you for the Coefficient of Variation of rates. This is 1/sqrt(alpha),
where alpha is the more familiar "shape coefficient" of the Gamma distribution. If the "G" option is not selected,
the program defaults to having no variation of rates among sites.</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Bootstrap options</b></i></a></dt>
<dt><a name=seqboot><i>Perform a bootstrap before analysis</i></a></dt>
<dd>This option sends the sequence file to seqboot for bootstrapping. The -M option is not available
here, so don't provide a bootstrapped file to the program.!</dd>
<dt><a name=resamp_method><i>Resampling methods</i></a></dt>
<dd>1. The bootstrap. Bootstrapping was invented by Bradley Efron in 1979, and its use in phylogeny
estimation was introduced by me (Felsenstein, 1985b). It involves creating a new data set by sampling N
characters randomly with replacement, so that the resulting data set has the same size as the original,
but some characters have been left out and others are duplicated. The random variation of the results from
analyzing these bootstrapped data sets can be shown statistically to be typical of the variation that you
would get from collecting new data sets. The method assumes that the characters evolve independently, an
assumption that may not be realistic for many kinds of data.</dd><dd>2. Delete-half-jackknifing. This alternative to the bootstrap involves sampling a random half of the
characters, and including them in the data but dropping the others. The resulting data sets are half the size
of the original, and no characters are duplicated. The random variation from doing this should be very similar
to that obtained from the bootstrap. The method is advocated by Wu (1986).</dd><dd>3. Permuting species within characters. This method of resampling (well, OK, it may not be best to call
it resampling) was introduced by Archie (1989) and Faith (1990; see also Faith and Cranston, 1991). It
involves permuting the columns of the data matrix separately. This produces data matrices that have the
same number and kinds of characters but no taxonomic structure. It is used for different purposes than the
bootstrap, as it tests not the variation around an estimated tree but the hypothesis that there is no
taxonomic structure in the data: if a statistic such as number of steps is significantly smaller in the
actual data than it is in replicates that are permuted, then we can argue that there is some taxonomic
structure in the data (though perhaps it might be just a pair of sibling species).</dd>
<br></br>
<dt><a name=weight_opt_comment><i><b>Weight options</b></i></a></dt>
<dt><a name=weights><i>Use weights for sites (W)</i></a></dt>
<dd>
The W (Weights) option. This allows the user to read in a series of weights that tell how many times each character is to be counted.
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
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<br></br>
<dt><a name=categ_opt_comment><i><b>Categories model options</b></i></a></dt>
<dt><a name=categorization><i>Categorization of amino acids (A)</i></a></dt>
<dd>All have groups: (Glu Gln Asp Asn), (Lys Arg His), (Phe Tyr Trp) plus:</dd><dd>George/Hunt/Barker: (Cys), (Met Val Leu Ileu), (Gly Ala Ser Thr Pro)</dd><dd>Chemical: (Cys Met), (Val Leu Ileu Gly Ala Ser Thr), (Pro)</dd><dd>Hall: (Cys), (Met Val Leu Ileu), (Gly Ala Ser Thr), (Pro)</dd><dd>©Copyright 1980-2007. University of Washington.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// method
// gamma_dist
if (getValue('method_')=="J" || getValue('method_')=="D" || getValue('method_')=="C")
enable('gamma_dist_');
else disable('gamma_dist_');
// seqboot
// resamp_method
if (getValue('seqboot_'))
enable('resamp_method_');
else disable('resamp_method_');
// seqboot_seed
if (getValue('seqboot_'))
enable('seqboot_seed_');
else disable('seqboot_seed_');
// replicates
if (getValue('seqboot_'))
enable('replicates_');
else disable('replicates_');
// weights
// weights_file
if (getValue('weights_'))
enable('weights_file_');
else disable('weights_file_');
// printdata
// code
if (getValue('method_')=="C")
enable('code_');
else disable('code_');
// categorization
if (getValue('method_')=="C")
enable('categorization_');
else disable('categorization_');
// change_prob
if (getValue('method_')=="C")
enable('change_prob_');
else disable('change_prob_');
// ratio
if (getValue('method_')=="C")
enable('ratio_');
else disable('ratio_');
}
function validateControl() {
// method
// gamma_dist
// seqboot
// resamp_method
// seqboot_seed
if (getValue('seqboot_')) {
if (getValue('seqboot_seed_') <= 0 || ((getValue('seqboot_seed_') % 2) == 0)) {
alert('Random number seed must be odd');
return false;
}
}
// replicates
if (getValue('seqboot_')) {
if (getValue('replicates_') > 1000) {
alert('this server allows no more than 1000 replicates');
return false;
}
}
// weights
// weights_file
// printdata
// code
// categorization
// change_prob
if (getValue('method_')=="C") {
if (getValue('change_prob_') < 0.0 || getValue('change_prob_') > 1.0) {
alert('Enter a value between 0.0 and 1.0');
return false;
}
}
// ratio
return issueWarning();
}
function issueWarning() {
// method
// gamma_dist
// seqboot
// resamp_method
// seqboot_seed
// replicates
// weights
// weights_file
// printdata
// code
// categorization
// change_prob
// ratio
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
var element = document.forms['protdist'].elements[parameter];
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
var element = document.forms['protdist'].elements[parameter];
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
var element = document.forms['protdist'].elements[parameter];
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