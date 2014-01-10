<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Phyml</title>
<h2>Phyml: Maximum likelihood phylogenies from PS and NS (<a href="#REFERENCE">S. Guindon and O. Gascuel</a>)</h2>
<s:form action="phyml" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Data type
<font color="red" size="3">*</font>
<s:radio name="data_type_"
list="#{ '0':'DNA' , '1':'Amino-Acids' }" onclick="resolveParameters()"/>
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
<A name=inputopt><h2><A HREF="javascript:help.slidedownandjump('#inputopt_comment')">Input Options</A></H2>
Format
<font color="red" size="3">*</font>
<s:radio name="format_"
list="#{ 'i':'interleaved' , 's':'sequential' }" onclick="resolveParameters()"/>
<br/>
Number of data sets to analyse
<font color="red" size="3">*</font>
<s:textfield name="datasets_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of bootstraps sets to analyse (only works with one data set to analyse)
<font color="red" size="3">*</font>
<s:textfield name="bootstrap_sets_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=control_opt><h2><A HREF="javascript:help.slidedownandjump('#control_opt_comment')">Control Options</A></H2>
Substitution model
<font color="red" size="3">*</font>
<s:select name="model_" list="#{ 'JC69':'JC69 (DNA)' , 'K2P':'K2P (DNA)' , 'F81':'F81 (DNA)' , 'HKY':'HKY (DNA)' , 'F84':'F84 (DNA)' , 'TN93':'TN93 (DNA)' , 'GTR':'GTR (DNA)' , 'JTT':'JTT (Amino-Acids)' , 'MtREV':'MtREV (Amino-Acids)' , 'Dayhoff':'Dayhoff (Amino-Acids)' , 'WAG':'WAG (Amino-Acids)' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#kappa')">Transition/transversion ratio (only for DNA sequences)</A>
<font color="red" size="3">+</font>
<s:textfield name="kappa_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#kappa_e')">Estimate Transition/transversion ratio? (only for DNA sequences)</A>
<s:checkbox name="kappa_e_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#invar')">Proportion of invariable sites</A>
<font color="red" size="3">+</font>
<s:textfield name="invar_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#invar_e')">Estimate proportion of invariable sites?</A>
<s:checkbox name="invar_e_" onclick="resolveParameters()"/>
<br/>
number of relative substitution rate categories (ex:4)
<font color="red" size="3">*</font>
<s:textfield name="nb_categ_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#alpha')">Gamma distribution parameter</A>
<font color="red" size="3">+</font>
<s:textfield name="alpha_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#alpha_e')">Estimate Gamma distribution parameter?</A>
<s:checkbox name="alpha_e_" onclick="resolveParameters()"/>
<br/>
Optimise tree topology?
<s:checkbox name="opt_topology_" onclick="resolveParameters()"/>
<br/>
Optimise branch lengths and rate parameters?
<s:checkbox name="opt_lengths_" onclick="resolveParameters()"/>
<br/>
Starting tree?
<s:checkbox name="user_tree_" onclick="resolveParameters()"/>
<br/>
Starting tree filename (Newick format)
<s:select name="user_tree_file_" headerKey='' headerValue='' list="%{ getDataForParameter('user_tree_file_')}" onchange="resolveParameters()"/>
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
<dt><a name=inputopt_comment><i><b>Input Options</b></i></a></dt>
<br></br>
<dt><a name=control_opt_comment><i><b>Control Options</b></i></a></dt>
<dt><a name=kappa><i>Transition/transversion ratio (only for DNA sequences)</i></a></dt>
<dd>Either enter a value or ask for an estimate
(see following option).</dd>
<dt><a name=kappa_e><i>Estimate Transition/transversion ratio? (only for DNA sequences)</i></a></dt>
<dd>Either enter a value for the ratio (see previous option) or ask for an estimate.</dd>
<dt><a name=invar><i>Proportion of invariable sites</i></a></dt>
<dd>Either enter a value or ask for an estimate (see following option).</dd>
<dt><a name=invar_e><i>Estimate proportion of invariable sites?</i></a></dt>
<dd>Either enter a value for the proportion of invariable sites (see previous option) or ask for an
estimate.</dd>
<dt><a name=alpha><i>Gamma distribution parameter</i></a></dt>
<dd>Either enter a value or ask for an estimate (see following option).</dd>
<dt><a name=alpha_e><i>Estimate Gamma distribution parameter?</i></a></dt>
<dd>Either enter a value for the gamma distribution (see previous option) or ask for an estimate.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// data_type
// format
// datasets
// bootstrap_sets
// model
// kappa
if (getValue('data_type_') == 0 && not getValue('kappa_e_'))
enable('kappa_');
else disable('kappa_');
// kappa_e
if (getValue('data_type_') == 0)
enable('kappa_e_');
else disable('kappa_e_');
// invar
if (not getValue('invar_e_'))
enable('invar_');
else disable('invar_');
// invar_e
// nb_categ
// alpha
if (not getValue('alpha_e_'))
enable('alpha_');
else disable('alpha_');
// alpha_e
// opt_topology
// opt_lengths
// user_tree
// user_tree_file
if (getValue('user_tree_'))
enable('user_tree_file_');
else disable('user_tree_file_');
}
function validateControl() {
// data_type
// format
// datasets
// bootstrap_sets
// model
// kappa
// kappa_e
// invar
// invar_e
// nb_categ
// alpha
// alpha_e
// opt_topology
// opt_lengths
// user_tree
// user_tree_file
return issueWarning();
}
function issueWarning() {
// data_type
// format
// datasets
// bootstrap_sets
// model
// kappa
// kappa_e
// invar
// invar_e
// nb_categ
// alpha
// alpha_e
// opt_topology
// opt_lengths
// user_tree
// user_tree_file
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
var element = document.forms['phyml'].elements[parameter];
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
var element = document.forms['phyml'].elements[parameter];
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
var element = document.forms['phyml'].elements[parameter];
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