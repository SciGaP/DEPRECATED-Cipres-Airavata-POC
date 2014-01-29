<%@ taglib prefix="s" uri="/struts-tags" %>
<title>ClustalW_Dist</title>
<h2>ClustalW_Dist: Infer Distance Matrix from Multiple Alignments (<a href="#REFERENCE">Des Higgins</a>)</h2>
<s:form action="clustalw_dist" theme="simple">
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
Actions
<font color="red" size="3">*</font>
<s:radio name="actions_"
list="#{ '-tree':'-tree: calculate NJ tree' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=trees><h2><A HREF="javascript:help.slidedownandjump('#trees_comment')">Tree parameters</A></H2>
Use Kimura's correction (multiple substitutions) ? (-<A HREF="javascript:help.slidedownandjump('#kimura')">kimura</A>)
<s:checkbox name="kimura_" onclick="resolveParameters()"/>
<br/>
Ignore positions with gaps ? (-<A HREF="javascript:help.slidedownandjump('#tossgaps')">tossgaps</A>)
<s:checkbox name="tossgaps_" onclick="resolveParameters()"/>
<br/>
Output tree/distance format (-<A HREF="javascript:help.slidedownandjump('#outputtree')">outputtree</A>)
<font color="red" size="3">+</font>
<s:radio name="outputtree_"
list="#{ 'DIST':'Phylip format distance matrix' }" onclick="resolveParameters()"/>
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
<dt><a name=trees_comment><i><b>Tree parameters</b></i></a></dt>
<dd>
</dd><dd>If you ask for an alignment, the program automatic computes the tree as well; but you can also ask for a tree, given an alignment (file .aln), with specific options.</dd><dd>
</dd><dd>The method used is the NJ (Neighbour Joining) method of Saitou and Nei. First you calculate distances (percent divergence) between all pairs of sequence from a multiple alignment; second you apply the NJ method to the distance matrix.</dd><dd>
</dd>
<dt><a name=kimura><i>Use Kimura's correction (multiple substitutions) ? (-kimura)</i></a></dt>
<dd>For small divergence (say <10%) this option makes no difference. For greater divergence, this option corrects for the fact that observed distances underestimate actual evolutionary distances. This is because, as sequences diverge, more than one substitution will happen at many sites. However, you only see one difference when you look at the present day sequences. Therefore, this option has the effect of stretching (for DNA or proteins) are both due to Motoo Kimura. See the documentation for details. </dd><dd>For VERY divergent sequences, the distances cannot be reliably corrected. You will be warned if this happens. Even if none of the distances in a data set exceed the reliable threshold, if you bootstrap the data, some of the bootstrap distances may randomly exceed the safe limit.</dd>
<dt><a name=tossgaps><i>Ignore positions with gaps ? (-tossgaps)</i></a></dt>
<dd>With this option, any alignment positions where ANY of the sequences have a gap will be ignored. This means that 'like' will be compared to 'like' in all distances. It also, automatically throws away the most ambiguous parts of the alignment, which are concentrated around gaps (usually). The disadvantage is that you may throw away much of the data if there are many gaps. </dd>
<dt><a name=outputtree><i>Output tree/distance format (-outputtree)</i></a></dt>
<dd>The distance matrix only: This format just outputs a matrix of all the pairwise distances in a format that can be used by the Phylip package. It used to be useful when one could not produce distances from protein sequences in the Phylip package but is now redundant (Protdist of Phylip 3.5 now does this). </dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// actions
// kimura
if ( (getValue('actions_').match("tree")) )
enable('kimura_');
else disable('kimura_');
// tossgaps
if ( (getValue('actions_').match("tree")) )
enable('tossgaps_');
else disable('tossgaps_');
// outputtree
if ( (getValue('actions_').match("tree")) )
enable('outputtree_');
else disable('outputtree_');
}
function validateControl() {
// actions
// kimura
// tossgaps
// outputtree
return issueWarning();
}
function issueWarning() {
// actions
// kimura
// tossgaps
// outputtree
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
var element = document.forms['clustalw_dist'].elements[parameter];
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
var element = document.forms['clustalw_dist'].elements[parameter];
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
var element = document.forms['clustalw_dist'].elements[parameter];
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