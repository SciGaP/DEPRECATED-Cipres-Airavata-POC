<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Protpars</title>
<h2>Protpars: Protein Sequence Parsimony (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="protpars" theme="simple">
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
<A name=protpars_opt><h2><A HREF="javascript:help.slidedownandjump('#protpars_opt_comment')">Parsimony options</A></H2>
<A HREF="javascript:help.slidedownandjump('#use_threshold')">Use Threshold parsimony (T)</A>
<s:checkbox name="use_threshold_" onclick="resolveParameters()"/>
<br/>
Threshold value (if use threshold parsimony)
<font color="red" size="3">+</font>
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#code')">Genetic code (U)</A>
<s:select name="code_" headerKey='' headerValue='' list="#{ 'U':'U: Universal' , 'M':'M: Mitochondrial' , 'V':'V: Vertebrate mitochondrial' , 'F':'F: Fly mitochondrial' , 'Y':'Y: Yeast mitochondrial' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=jumble_opt><h2><A HREF="javascript:help.slidedownandjump('#jumble_opt_comment')">Randomize options</A></H2>
<A HREF="javascript:help.slidedownandjump('#jumble')">Randomize (jumble) input order of sequences (J)</A>
<s:checkbox name="jumble_" onclick="resolveParameters()"/>
<br/>
Jumble random number seed (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="jumble_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of times to jumble
<s:textfield name="times_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=bootstrap><h2><A HREF="javascript:help.slidedownandjump('#bootstrap_comment')">Bootstrap options</A></H2>
Perform a bootstrap before analysis
<s:checkbox name="seqboot_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#method')">Resampling methods</A>
<font color="red" size="3">+</font>
<s:radio name="method_"
list="#{ 'bootstrap':'Bootstrap' , 'jackknife':'Delete-half jackknife' , 'permute':'Permute species for each character' }" onclick="resolveParameters()"/>
<br/>
Random number seed (must be odd)
<font color="red" size="3">+</font>
<s:textfield name="seqboot_seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
How many replicates
<s:textfield name="replicates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Compute a consensus tree
<s:checkbox name="consense_" onclick="resolveParameters()"/>
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
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#print_tree')">Print out tree (3)</A>
<s:checkbox name="print_tree_" onclick="resolveParameters()"/>
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
Print out steps in each site (4)
<s:checkbox name="print_steps_" onclick="resolveParameters()"/>
<br/>
Indent treefile
<s:checkbox name="indent_tree_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=other_options><h2><A HREF="javascript:help.slidedownandjump('#other_options_comment')">Other options</A></H2>
Outgroup species (default, use as outgroup species 1) (O)
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
<br></br>
<dt><a name=protpars_opt_comment><i><b>Parsimony options</b></i></a></dt>
<dt><a name=use_threshold><i>Use Threshold parsimony (T)</i></a></dt>
<dd>This program infers an unrooted phylogeny from protein sequences, using a method that is intermediate
between the approaches of Eck and Dayhoff (1966) and Fitch (1971). Eck and Dayhoff (1966) allowed any amino
acid to change to any other, and counted the number of such changes needed to evolve the protein sequences
on each given phylogeny. This has the problem that it allows replacements that are not consistent with the
genetic code, counting them equally with replacements that are consistent. Fitch, on the other hand, counted
the minimum number of nucleotide substitutions that would be needed to achieve the given protein sequences.
This counts silent changes equally with those that change the amino acid. </dd><dd>The present method insists that any changes of amino acid be consistent with the genetic code. For
example, lysine is allowed to change to methionine but not to proline. However, changes between two amino
acids via a third amino acid are allowed and counted as two changes if each of the two replacements is individually allowed.
This sometimes allows changes that you would think should be outlawed. Thus we can change from
phenylalanine to glutamine via leucine, but two steps are required. Consulting the genetic code, there
is a leucine codon one step away from a phenylalanine codon, and a leucine codon one step away from glutamine.
But they are not the same leucine codon. It actually takes three base substitutions to get from either of the
phenylalanine codons TTT and TTC to either of the glutamine codons CAA or CAG. Why then does this program count
only two? Recent DNA sequence comparisons seem to show synonymous changes are considerably
faster and easier than ones that change the amino acid. The underlying (and hidden) assumption is that synonymous
changes occur so quickly that they impose no barrier, and need not be counted. Thus, in the chain of changes TTT
(Phe) --> CTT (Leu) --> CTA (Leu)--> CAA (Glu), the change CTT (Leu) --> CTA (Leu) is not counted because it does
not change the amino acid (leucine).</dd><dd>Other assumptions</dd><dd>To maintain consistency with the genetic code, the program treats serine as two separate states
(ser1 and ser2) since the two groups of serine codons are not adjacent in the code.</dd><dd>Changes to the state "deletion" are counted as three steps to prevent the algorithm from assuming
unnecessary deletions.</dd><dd>The state "unknown" is simply taken to mean that the unknown amino acid will be whichever one causes the fewest steps.</dd><dd>The assumptions of this method (which has not been described in the literature), are thus something like
this: </dd><dd>Change in different sites is independent.</dd><dd>Change in different lineages is independent.</dd><dd>The probability of a base substitution that changes the amino acid sequence is small over the lengths of time
involved in a branch of the phylogeny.</dd><dd>The expected amounts of change in different branches of the phylogeny do not vary by so much that
two changes in a high-rate branch are more probable than one change in a low-rate branch.</dd><dd>The expected amounts of change do not vary enough among sites that two changes in one site are
more probable than one change in another.</dd><dd>The probability of a base change that is synonymous is much higher than the probability of a
change that is not synonymous. </dd><dd>That these are the assumptions of parsimony methods has been documented in a series of papers by
Felsenstein: (1973a, 1978b, 1979, 1981b, 1983b, 1988b). For an opposing view arguing that the parsimony methods make
no substantive assumptions such as these, see the works by Farris (1983) and Sober (1983a, 1983b, 1988), but also read
the exchange between Felsenstein and Sober (1986).</dd>
<dt><a name=code><i>Genetic code (U)</i></a></dt>
<dd>Option C allows the user to select among various nuclear and mitochondrial genetic codes.
There is no provision for coping with data where different genetic codes have been used in different organisms.</dd>
<br></br>
<dt><a name=jumble_opt_comment><i><b>Randomize options</b></i></a></dt>
<dt><a name=jumble><i>Randomize (jumble) input order of sequences (J)</i></a></dt>
<dd>The J (Jumble) option. In most tree construction programs, the search of different trees
depends on the order of input of species. The J option tells the program to use a random number generator
to choose the input order of species. If you select Jumble, you must provide a "seed" for the random number
generator. The seed should be an integer between 1 and be of form 4n+1. Each different seed leads to a
different sequence of addition of species. By simply changing the random number seed and re-running the
programs one can look for other, and better trees.</dd><dd>Using the Jumble option, you must specify how many times you want to restart the process.
The value 10 causes ten different orders of species to be used in constructing the trees, and the results printed
out will reflect this entire search process (that is, the best trees found among all 10 runs will be printed out,
not the best trees from each individual run).
</dd>
<br></br>
<dt><a name=bootstrap_comment><i><b>Bootstrap options</b></i></a></dt>
<dt><a name=method><i>Resampling methods</i></a></dt>
<dd>1. The bootstrap. Bootstrapping was invented by Bradley Efron in 1979, and its use in phylogeny estimation was introduced by me (Felsenstein, 1985b). It involves creating a new data set by sampling N characters randomly with replacement, so that the resulting data set has the same size as the original, but some characters have been left out and others are duplicated. The random variation of the results from analyzing these bootstrapped data sets can be shown statistically to be typical of the variation that you would get from collecting new data sets. The method assumes that the characters evolve independently, an assumption that may not be realistic for many kinds of data.</dd><dd>2. Delete-half-jackknifing. This alternative to the bootstrap involves sampling a random half of the characters, and including them in the data but dropping the others. The resulting data sets are half the size of the original, and no characters are duplicated. The random variation from doing this should be very similar to that obtained from the bootstrap. The method is advocated by Wu (1986).</dd><dd>3. Permuting species within characters. This method of resampling (well, OK, it may not be best to call it resampling) was introduced by Archie (1989) and Faith (1900; see also Faith and Cranston, 1901). It involves permuting the columns of the data matrix separately. This produces data matrices that have the same number and kinds of characters but no taxonomic structure. It is used for different purposes than the bootstrap, as it tests not the variation around an estimated tree but the hypothesis that there is no taxonomic structure in the data: if a statistic such as number of steps is significantly smaller in the actual data than it is in replicates that are permuted, then we can argue that there is some taxonomic structure in the data (though perhaps it might be just a pair of sibling species).</dd>
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
<dd>Give a tree whenever the infile does not already contain the tree.</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (6)</i></a></dt>
<dd>Tells the program to save the tree in a Newick tree file (outtree).</dd>
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
// use_threshold
// threshold
if (getValue('use_threshold_'))
enable('threshold_');
else disable('threshold_');
// code
// jumble
// jumble_seed
if (getValue('jumble_'))
enable('jumble_seed_');
else disable('jumble_seed_');
// times
if (getValue('jumble_'))
enable('times_');
else disable('times_');
// seqboot
// method
if (getValue('seqboot_'))
enable('method_');
else disable('method_');
// seqboot_seed
if (getValue('seqboot_'))
enable('seqboot_seed_');
else disable('seqboot_seed_');
// replicates
if (getValue('seqboot_'))
enable('replicates_');
else disable('replicates_');
// consense
if (getValue('seqboot_') && getValue('print_treefile_'))
enable('consense_');
else disable('consense_');
// user_tree
// tree_file
if (getValue('user_tree_'))
enable('tree_file_');
else disable('tree_file_');
// print_tree
// print_sequences
// print_treefile
// printdata
// print_steps
// indent_tree
// outgroup
}
function validateControl() {
// use_threshold
// threshold
if (getValue('use_threshold_')) {
if (getValue('threshold_') < 1) {
alert('Please enter a numeric value for threshold, greater than 1');
return false;
}
}
// code
// jumble
// jumble_seed
if (getValue('jumble_')) {
if (getValue('jumble_seed_') <= 0 || ((getValue('jumble_seed_') % 2) == 0)) {
alert('Jumble seed must be odd');
return false;
}
}
// times
// seqboot
// method
// seqboot_seed
if (getValue('seqboot_')) {
if (getValue('seqboot_seed_') <= 0 || ((getValue('seqboot_seed_') % 2) == 0)) {
alert('Random seed must be odd');
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
// consense
// user_tree
if (getValue('user_tree_') && getValue('seqboot_')) {
alert('you cannot bootstrap your dataset and give a user tree at the same time');
return false;
}
if (getValue('user_tree_') && getValue('jumble_')) {
alert('you cannot randomize (jumble) your dataset and give a user tree at the same time');
return false;
}
// tree_file
// print_tree
// print_sequences
// print_treefile
// printdata
// print_steps
// indent_tree
// outgroup
if (getValue('outgroup_') < 1) {
alert('Please enter a value greater than 0');
return false;
}
return issueWarning();
}
function issueWarning() {
// use_threshold
// threshold
// code
// jumble
// jumble_seed
// times
// seqboot
// method
// seqboot_seed
// replicates
// consense
// user_tree
// tree_file
// print_tree
// print_sequences
// print_treefile
// printdata
// print_steps
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
var element = document.forms['protpars'].elements[parameter];
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
var element = document.forms['protpars'].elements[parameter];
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
var element = document.forms['protpars'].elements[parameter];
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