<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RPSBlast</title>
<h2>RPSBlast: Compare PS to a DB of Conserved Domains (<a href="#REFERENCE">Sergei Shavirin</a>)</h2>
<s:form action="rpsblast" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#protein_db')">protein db (-d )</A>
<font color="red" size="3">*</font>
<s:select name="protein_db_" list="#{ 'Cdd':'CDD' , 'Cog':'COG' , 'Kog':'KOG' , 'Pfam':'PFAM' , 'Prk':'PRK' , 'Smart':'SMART' }" onchange="resolveParameters()"/>
<br/>
<br/>
Expectation Value (-e)
<s:textfield name="Expect_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Alignment view options (-m)
<s:select name="view_alignments_" headerKey='' headerValue='' list="#{ '0':'0: pairwise' , '1':'1: query-anchored showing identities' , '2':'2: query-anchored no identities' , '3':'3: flat query-anchored, show identities' , '4':'4: flat query-anchored, no identities' , '5':'5: query-anchored no identities and blunt ends' , '6':'6: flat query-anchored, no identities and blunt ends' , '7':'7: XML Blast output' , '8':'8: Tabular output' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff_y')">Dropoff for blast ungapped extensions in bits (-y)</A>
<s:textfield name="dropoff_y_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff')">X dropoff value for gapped alignment (in bits) (-X)</A>
<s:textfield name="dropoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Filter query sequence with SEG (-F)
<s:checkbox name="filter_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#trigger')">Number of bits to trigger gapping (-N)</A>
<s:textfield name="trigger_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Believe the query defline (-J)
<s:checkbox name="believe_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#dropoff_z')">X dropoff value for final gapped alignment (in bits) (-Z)</A>
<s:textfield name="dropoff_z_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Alignments')">How many alignments? (-b)</A>
<s:textfield name="Alignments_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Descriptions')">How many short descriptions? (-v)</A>
<s:textfield name="Descriptions_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=dropoff_y><i>Dropoff for blast ungapped extensions in bits (-y)</i></a></dt>
<dd>This parameter controls the dropoff at ungapped extension stage. See also the -X parameter.</dd>
<dt><a name=dropoff><i>X dropoff value for gapped alignment (in bits) (-X)</i></a></dt>
<dd>This value controls the path graph region explored by Blast during a gapped extension (Xg in the NAR paper).</dd>
<dt><a name=trigger><i>Number of bits to trigger gapping (-N)</i></a></dt>
<dd>Blast first performs an ungapped extension of the hit to make an HSP. The gapped extension is triggered when the HSP score reaches this value (Sg in the NAR paper).</dd>
<dt><a name=seqalign_file><i>SeqAlign file (-J option must be true) (-O)</i></a></dt>
<dd>SeqAlign is in ASN.1 format so it can be read with NCBI tools (such as sequin). This allows one to view the results in different formats.</dd>
<dt><a name=dropoff_z><i>X dropoff value for final gapped alignment (in bits) (-Z)</i></a></dt>
<dd>This parameter controls the dropoff for the final reported alignment. See also the -X parameter.</dd>
<dt><a name=Alignments><i>How many alignments? (-b)</i></a></dt>
<dd>Maximum number of database sequences for which high-scoring segment pairs will be reported (-b).</dd>
<dt><a name=Descriptions><i>How many short descriptions? (-v)</i></a></dt>
<dd>Maximum number of database sequences for which one-line descriptions will be reported (-v).</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// protein_db
// Expect
// view_alignments
// dropoff_y
// dropoff
// filter
// trigger
// believe
// dropoff_z
// Alignments
// Descriptions
}
function validateControl() {
// protein_db
// Expect
// view_alignments
// dropoff_y
// dropoff
// filter
// trigger
// believe
// dropoff_z
// Alignments
// Descriptions
return issueWarning();
}
function issueWarning() {
// protein_db
// Expect
// view_alignments
// dropoff_y
// dropoff
// filter
// trigger
// believe
// dropoff_z
// Alignments
// Descriptions
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
var element = document.forms['rpsblast'].elements[parameter];
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
var element = document.forms['rpsblast'].elements[parameter];
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
var element = document.forms['rpsblast'].elements[parameter];
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