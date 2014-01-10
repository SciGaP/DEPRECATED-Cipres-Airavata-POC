<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RESTRICT</title>
<h2>RESTRICT: Finds restriction enzyme cleavage sites (EMBOSS) </h2>
<s:form action="restrict" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Minimum recognition site length (-<A HREF="javascript:help.slidedownandjump('#sitelen')">sitelen</A>)
<font color="red" size="3">*</font>
<s:textfield name="sitelen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Comma separated enzyme list (-<A HREF="javascript:help.slidedownandjump('#enzymes')">enzymes</A>)
<font color="red" size="3">*</font>
<s:textfield name="enzymes_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=input><h2><A HREF="javascript:help.slidedownandjump('#input_comment')">Input section</A></H2>
<hr/>
<A name=required><h2><A HREF="javascript:help.slidedownandjump('#required_comment')">Required section</A></H2>
<hr/>
<A name=advanced><h2><A HREF="javascript:help.slidedownandjump('#advanced_comment')">Advanced section</A></H2>
Minimum cuts per RE (-<A HREF="javascript:help.slidedownandjump('#min')">min</A>)
<font color="red" size="3">*</font>
<s:textfield name="min_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum cuts per RE (-<A HREF="javascript:help.slidedownandjump('#max')">max</A>)
<font color="red" size="3">*</font>
<s:textfield name="max_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
List individual enzymes with their fragments (-<A HREF="javascript:help.slidedownandjump('#solofragment')">solofragment</A>)
<font color="red" size="3">*</font>
<s:checkbox name="solofragment_" onclick="resolveParameters()"/>
<br/>
Force single site only cuts (-<A HREF="javascript:help.slidedownandjump('#single')">single</A>)
<font color="red" size="3">*</font>
<s:checkbox name="single_" onclick="resolveParameters()"/>
<br/>
Allow blunt end cutters (-<A HREF="javascript:help.slidedownandjump('#blunt')">blunt</A>)
<font color="red" size="3">*</font>
<s:checkbox name="blunt_" onclick="resolveParameters()"/>
<br/>
Allow sticky end cutters (-<A HREF="javascript:help.slidedownandjump('#sticky')">sticky</A>)
<font color="red" size="3">*</font>
<s:checkbox name="sticky_" onclick="resolveParameters()"/>
<br/>
Allow ambiguous matches (-<A HREF="javascript:help.slidedownandjump('#ambiguity')">ambiguity</A>)
<font color="red" size="3">*</font>
<s:checkbox name="ambiguity_" onclick="resolveParameters()"/>
<br/>
Allow circular DNA (-<A HREF="javascript:help.slidedownandjump('#plasmid')">plasmid</A>)
<font color="red" size="3">*</font>
<s:checkbox name="plasmid_" onclick="resolveParameters()"/>
<br/>
Only enzymes with suppliers (-<A HREF="javascript:help.slidedownandjump('#commercial')">commercial</A>)
<font color="red" size="3">*</font>
<s:checkbox name="commercial_" onclick="resolveParameters()"/>
<br/>
Alternative RE data file (-datafile)
<font color="red" size="3">*</font>
<s:textfield name="datafile_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output section</A></H2>
Limits reports to one isoschizomer (-<A HREF="javascript:help.slidedownandjump('#limit')">limit</A>)
<font color="red" size="3">*</font>
<s:checkbox name="limit_" onclick="resolveParameters()"/>
<br/>
Sort output alphabetically (-alphabetic)
<font color="red" size="3">*</font>
<s:checkbox name="alphabetic_" onclick="resolveParameters()"/>
<br/>
Show fragment lengths (-<A HREF="javascript:help.slidedownandjump('#fragments')">fragments</A>)
<font color="red" size="3">*</font>
<s:checkbox name="fragments_" onclick="resolveParameters()"/>
<br/>
Show sequence name (-name)
<font color="red" size="3">*</font>
<s:checkbox name="name_" onclick="resolveParameters()"/>
<br/>
Display score (-rscore)
<s:checkbox name="rscore_" onclick="resolveParameters()"/>
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
<dt><a name=input_comment><i><b>Input section</b></i></a></dt>
<br></br>
<dt><a name=required_comment><i><b>Required section</b></i></a></dt>
<dt><a name=sitelen><i>Minimum recognition site length (-sitelen)</i></a></dt>
<dd>This sets the minimum length of the restriction enzyme recognition site. Any enzymes with sites shorter than this will be ignored.</dd>
<dt><a name=enzymes><i>Comma separated enzyme list (-enzymes)</i></a></dt>
<dd>The name 'all' reads in all enzyme names from the REBASE database. You can specify enzymes by giving their names with commas between then, such as: 'HincII,hinfI,ppiI,hindiii'. <BR> The case of the names is not important. You can specify a file of enzyme names to read in by giving the name of the file holding the enzyme names with a '\@' character in front of it, for example, '\@enz.list'. <BR> Blank lines and lines starting with a hash character or '!' are ignored and all other lines are concatenated together with a comma character ',' and then treated as the list of enzymes to search for. <BR> An example of a file of enzyme names is: <BR> ! my enzymes <BR> HincII, ppiII <BR> ! other enzymes <BR> hindiii <BR> HinfI <BR> PpiI</dd>
<br></br>
<dt><a name=advanced_comment><i><b>Advanced section</b></i></a></dt>
<dt><a name=min><i>Minimum cuts per RE (-min)</i></a></dt>
<dd>This sets the minimum number of cuts for any restriction enzyme that will be considered. Any enzymes that cut fewer times than this will be ignored.</dd>
<dt><a name=max><i>Maximum cuts per RE (-max)</i></a></dt>
<dd>This sets the maximum number of cuts for any restriction enzyme that will be considered. Any enzymes that cut more times than this will be ignored.</dd>
<dt><a name=solofragment><i>List individual enzymes with their fragments (-solofragment)</i></a></dt>
<dd>This gives the fragment lengths of the forward sense strand produced by complete restriction by each restriction enzyme on it own. Results are added to the tail section of the report.</dd>
<dt><a name=single><i>Force single site only cuts (-single)</i></a></dt>
<dd>If this is set then this forces the values of the mincuts and maxcuts qualifiers to both be 1. Any other value you may have set them to will be ignored.</dd>
<dt><a name=blunt><i>Allow blunt end cutters (-blunt)</i></a></dt>
<dd>This allows those enzymes which cut at the same position on the forward and reverse strands to be considered.</dd>
<dt><a name=sticky><i>Allow sticky end cutters (-sticky)</i></a></dt>
<dd>This allows those enzymes which cut at different positions on the forward and reverse strands, leaving an overhang, to be considered.</dd>
<dt><a name=ambiguity><i>Allow ambiguous matches (-ambiguity)</i></a></dt>
<dd>This allows those enzymes which have one or more 'N' ambiguity codes in their pattern to be considered</dd>
<dt><a name=plasmid><i>Allow circular DNA (-plasmid)</i></a></dt>
<dd>If this is set then this allows searches for restriction enzyme recognition site and cut postions that span the end of the sequence to be considered.</dd>
<dt><a name=commercial><i>Only enzymes with suppliers (-commercial)</i></a></dt>
<dd>If this is set, then only those enzymes with a commercial supplier will be searched for. This qualifier is ignored if you have specified an explicit list of enzymes to search for, rather than searching through 'all' the enzymes in the REBASE database. It is assumed that, if you are asking for an explicit enzyme, then you probably know where to get it from and so all enzymes names that you have asked to be searched for, and which cut, will be reported whether or not they have a commercial supplier.</dd>
<br></br>
<dt><a name=output_comment><i><b>Output section</b></i></a></dt>
<dt><a name=limit><i>Limits reports to one isoschizomer (-limit)</i></a></dt>
<dd>This limits the reporting of enzymes to just one enzyme from each group of isoschizomers. The enzyme chosen to represent an isoschizomer group is the prototype indicated in the data file 'embossre.equ', which is created by the program 'rebaseextract'. If you prefer different prototypes to be used, make a copy of embossre.equ in your home directory and edit it. If this value is set to be false then all of the input enzymes will be reported. You might like to set this to false if you are supplying an explicit set of enzymes rather than searching 'all' of them.</dd>
<dt><a name=fragments><i>Show fragment lengths (-fragments)</i></a></dt>
<dd>This gives the fragment lengths of the forward sense strand produced by complete restriction using all of the input enzymes together. Results are added to the tail section of the report.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// sitelen
// enzymes
// min
// max
// solofragment
// single
// blunt
// sticky
// ambiguity
// plasmid
// commercial
// datafile
// limit
// alphabetic
// fragments
// name
// rscore
}
function validateControl() {
// sitelen
// enzymes
// min
// max
// solofragment
// single
// blunt
// sticky
// ambiguity
// plasmid
// commercial
// datafile
// limit
// alphabetic
// fragments
// name
// rscore
return issueWarning();
}
function issueWarning() {
// sitelen
// enzymes
// min
// max
// solofragment
// single
// blunt
// sticky
// ambiguity
// plasmid
// commercial
// datafile
// limit
// alphabetic
// fragments
// name
// rscore
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
var element = document.forms['restrict'].elements[parameter];
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
var element = document.forms['restrict'].elements[parameter];
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
var element = document.forms['restrict'].elements[parameter];
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