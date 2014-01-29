<%@ taglib prefix="s" uri="/struts-tags" %>
<title>ClustalW_Tree</title>
<h2>ClustalW_Tree: Infer Phylogenetic Tree from a Multiple Sequence Alignment (<a href="#REFERENCE">Des Higgins</a>)</h2>
<s:form action="clustalw_tree" theme="simple">
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
list="#{ '-tree':'-tree: calculate NJ tree' , '-bootstrap':'-bootstrap: bootstrap a NJ tree' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=trees><h2><A HREF="javascript:help.slidedownandjump('#trees_comment')">Tree parameters</A></H2>
Use Kimura's correction (multiple substitutions) ? (-<A HREF="javascript:help.slidedownandjump('#kimura')">kimura</A>)
<s:checkbox name="kimura_" onclick="resolveParameters()"/>
<br/>
Ignore positions with gaps ? (-<A HREF="javascript:help.slidedownandjump('#tossgaps')">tossgaps</A>)
<s:checkbox name="tossgaps_" onclick="resolveParameters()"/>
<br/>
Bootstrap a NJ tree (give the number of bootstraps, 0 for none) (-<A HREF="javascript:help.slidedownandjump('#bootstrap')">bootstrap</A>)
<s:textfield name="bootstrap_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Phylip bootstrap positions (-<A HREF="javascript:help.slidedownandjump('#bootlabels')">bootlabels</A>)
<s:radio name="bootlabels_"
list="#{ '': '[Not Mandatory]', 'node':'NODE labels' , 'branch':'BRANCH labels' }" onclick="resolveParameters()"/>
<br/>
Seed number for bootstraps (-seed)
<s:textfield name="seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Output tree/distance format (-<A HREF="javascript:help.slidedownandjump('#outputtree')">outputtree</A>)
<s:radio name="outputtree_"
list="#{ '': '[Not Mandatory]', 'NJ':'Clustal format' , 'PHYLIP':'Phylip format tree' , 'NEXUS':'NEXUS format tree' }" onclick="resolveParameters()"/>
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
<dt><a name=bootstrap><i>Bootstrap a NJ tree (give the number of bootstraps, 0 for none) (-bootstrap)</i></a></dt>
<dd>BOOTSTRAPPING is a method for deriving confidence values for the groupings in a tree (first adapted for trees by Joe Felsenstein). It involves making N random samples of sites from the alignment (N should be LARGE, e.g. 500 - 1000); drawing N trees (1 from each sample) and counting how many times each grouping from the original tree occurs in the sample trees. You must supply a seed number for the random number generator. Different runs with the same seed will give the same answer. See the documentation for details.</dd>
<dt><a name=bootlabels><i>Phylip bootstrap positions (-bootlabels)</i></a></dt>
<dd>The bootstrap values written in the phylip tree file format can be assigned either to branches or nodes. The default is to write the values on the nodes, as this can be read by several commonly-used tree display programs. But note that this can lead to confusion if the tree is rooted and the bootstraps may be better attached to the internal branches: Software developers should ensure they can read the branch label format.</dd>
<dt><a name=outputtree><i>Output tree/distance format (-outputtree)</i></a></dt>
<dd>Clustal format output: This format is verbose and lists all of the distances between the sequences and the number of alignment positions used for each. The tree is described at the end of the file. It lists the sequences that are joined at each alignment step and the branch lengths. After two sequences are joined, it is referred to later as a NODE. The number of a NODE is the number of the lowest sequence in that NODE. </dd><dd>Phylip format tree output: This format is the New Hampshire format, used by many phylogenetic analysis packages. It consists of a series of nested parentheses, describing the branching order, with the sequence names and branch lengths. It can be used by the RETREE, DRAWGRAM and DRAWTREE programs of the PHYLIP package to see the trees graphically. This is the same format used during multiple alignment for the guide trees. </dd><dd>The distance matrix only: This format just outputs a matrix of all the pairwise distances in a format that can be used by the Phylip package. It used to be useful when one could not produce distances from protein sequences in the Phylip package but is now redundant (Protdist of Phylip 3.5 now does this). </dd><dd>NEXUS format tree: This format is used by several popular phylogeny programs, including PAUP and MacClade. </dd>
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
// bootstrap
if ( (getValue('actions_').match("bootstrap")) )
enable('bootstrap_');
else disable('bootstrap_');
// bootlabels
if ( (getValue('actions_').match("bootstrap")) )
enable('bootlabels_');
else disable('bootlabels_');
// seed
if ( (getValue('actions_').match("bootstrap")) )
enable('seed_');
else disable('seed_');
// outputtree
if ( (getValue('actions_').match("tree")) )
enable('outputtree_');
else disable('outputtree_');
}
function validateControl() {
// actions
// kimura
// tossgaps
// bootstrap
// bootlabels
// seed
// outputtree
return issueWarning();
}
function issueWarning() {
// actions
// kimura
// tossgaps
// bootstrap
// bootlabels
// seed
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
var element = document.forms['clustalw_tree'].elements[parameter];
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
var element = document.forms['clustalw_tree'].elements[parameter];
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
var element = document.forms['clustalw_tree'].elements[parameter];
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