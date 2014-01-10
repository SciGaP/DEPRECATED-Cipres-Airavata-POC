<%@ taglib prefix="s" uri="/struts-tags" %>
<title>PRSS</title>
<h2>PRSS: Evaluate significance of PS similarity match (<a href="#REFERENCE">W. Pearson</a>)</h2>
<s:form action="prss" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
sequence to shuffle
<font color="red" size="3">*</font>
<s:select name="query2_" headerKey='' headerValue='' list="%{ getDataForParameter('query2_')}" onchange="resolveParameters()"/>
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
<A name=slectivity_opt><h2><A HREF="javascript:help.slidedownandjump('#slectivity_opt_comment')">Selectivity options</A></H2>
Number of random shuffles(100 by default .) (-d)
<s:textfield name="shufflenum_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Scoring matrix file (-s)
<s:select name="matrix_" headerKey='' headerValue='' list="#{ 'BL50':'BLOSUM50' , 'BL62':'BLOSUM62' , 'BL80':'BLOSUM80' , 'P20':'PAM20' , 'P40':'PAM40' , 'P120':'PAM120' , 'P250':'PAM250' , 'M10':'MDM_10' , 'M20':'MDM_20' , 'M40':'MDM_40' }" onchange="resolveParameters()"/>
<br/>
<br/>
Penalty for the first residue in a gap(-12 by default for proteins, -16 for DNA) (-f)
<s:textfield name="gapinit_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Penalty for additional residues in a gap(-2 by default for proteins, -4 for DNA) (-g)
<s:textfield name="gapext_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=shuffle_opt><h2><A HREF="javascript:help.slidedownandjump('#shuffle_opt_comment')">Shuffle options</A></H2>
Use local window(w) shuffle with a window size of (10 by default.) (-w)
<s:textfield name="shuffle_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=slectivity_opt_comment><i><b>Selectivity options</b></i></a></dt>
<dd>
</dd><dd>PRSS3 is used to evaluate the significance of a protein or DNA sequence similarity score
by comparing two sequences and calculating optimal similarity scores, and then repeatedly shuffling
the second sequence, and calculating optimal similarity scores using the Smith-Waterman algorithm.
An extreme value distribution is then fit to the shuffled-sequence scores. The characteristic parameters
of the extreme value distribution are then used to estimate the probability that each of the unshuffled
sequence scores would be obtained by chance in one sequence, or in a number of sequences equal to the
number of shuffles. This program is derived from rdf2, described by Pearson and Lipman, PNAS (1988) 85:2444-2448,
and Pearson (Meth. Enz. 183:63-98). Use of the extreme value distribution for estimating the probabilities
of similarity scores was described by Altshul and Karlin, PNAS (1990) 87:2264-2268. The and expectations calculated
by prdf. prss3 uses calculates optimal scores using the same rigorous Smith-Waterman algorithm (Smith and
Waterman, J. Mol. Biol. (1983) 147:195-197) used by the ssearch3 program. prss3 also allows a more sophisticated
shuffling method: residues can be shuffled within a local window, so that the order of residues 1-10, 11-20, etc,
is destroyed but a residue in the first 10 is never swapped with a residue outside the first ten, and so on for each local window.
</dd><dd>
</dd>
<br></br>
<dt><a name=shuffle_opt_comment><i><b>Shuffle options</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// query2
// shufflenum
// matrix
// gapinit
// gapext
// shuffle
}
function validateControl() {
// query2
// shufflenum
// matrix
// gapinit
// gapext
// shuffle
return issueWarning();
}
function issueWarning() {
// query2
// shufflenum
// matrix
// gapinit
// gapext
// shuffle
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
var element = document.forms['prss'].elements[parameter];
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
var element = document.forms['prss'].elements[parameter];
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
var element = document.forms['prss'].elements[parameter];
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