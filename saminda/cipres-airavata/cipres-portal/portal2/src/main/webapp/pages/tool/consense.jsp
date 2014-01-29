<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Consense</title>
<h2>Consense: Find A Consensus Tree (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="consense" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#type')">Consensus type</A>
<s:select name="type_" headerKey='' headerValue='' list="#{ 'MRE':'Majority rule (extended)' , 'S':'Strict' , 'MR':'Majority rule' , 'ML':'Ml (M-sub-L)' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output options</A></H2>
<A HREF="javascript:help.slidedownandjump('#print_tree')">Print out tree (3)</A>
<s:checkbox name="print_tree_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#print_treefile')">Write out trees onto tree file (4)</A>
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
<A HREF="javascript:help.slidedownandjump('#outgroup')">Outgroup (default, use as outgroup species 1) (O)</A>
<s:textfield name="outgroup_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#rooted')">Trees to be treated as rooted</A>
<s:checkbox name="rooted_" onclick="resolveParameters()"/>
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
<dt><a name=type><i>Consensus type</i></a></dt>
<dd>The Consensus method input selects which of four methods the program uses.
Extended Majority Rule, Strict, Majority Rule, and Ml are all allowed methods.
In each case the fraction of times a set appears among the input trees is counted by weighting by the weights
of the trees (the numbers like [0.6000] that appear at the ends of trees in some cases).</dd><dd>Majority Rule, extended (Default Method): Any set of species that appears in more than 50% of the trees is included.
The program then considers the other sets of species in order of the frequency of their appearance.
These are added to the consensus tree if they are compatible with it, until the tree is fully resolved.
</dd><dd>Strict: A set of species must appear in all input trees to be included in the strict consensus tree.</dd><dd>Ml: The user is asked for a threshold fraction (between 0.5 and 1), and any set of species that occurs among
the input trees more than the specified fraction of the time is included in the consensus tree. The Strict consensus
and the Majority Rule consensus are extreme cases of the Ml consensus, being for fractions of 1 and 0.5 respectively.</dd><dd>Majority Rule: A set of species is included in the consensus tree if it is present in more than 0.5 of all input trees.</dd>
<br></br>
<dt><a name=output_comment><i><b>Output options</b></i></a></dt>
<dt><a name=print_tree><i>Print out tree (3)</i></a></dt>
<dd>Tells the program to print a semi-graphical picture of the tree in the outfile.</dd>
<dt><a name=print_treefile><i>Write out trees onto tree file (4)</i></a></dt>
<dd>Tells the program to save the tree in Newick format.</dd>
<br></br>
<dt><a name=other_options_comment><i><b>Other options</b></i></a></dt>
<dt><a name=rooted><i>Trees to be treated as rooted</i></a></dt>
<dd>The rooted option specifies that the tree is to be treated as a rooted tree and not re-rooted. Otherwise the tree will be treated as outgroup-rooted and will be re-rooted automatically at the first species encountered on the first tree (or at a species designated by the Outgroup option).</dd>
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
// type
// print_tree
// print_treefile
// printdata
// indent_tree
// outgroup
// rooted
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// type
// print_tree
// print_treefile
// printdata
// indent_tree
// outgroup
if (getValue('outgroup_') < 1) {
alert('Please enter a value greater than 0');
return false;
}
// rooted
return issueWarning();
}
function issueWarning() {
// runtime
// type
// print_tree
// print_treefile
// printdata
// indent_tree
// outgroup
// rooted
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
var element = document.forms['consense'].elements[parameter];
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
var element = document.forms['consense'].elements[parameter];
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
var element = document.forms['consense'].elements[parameter];
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