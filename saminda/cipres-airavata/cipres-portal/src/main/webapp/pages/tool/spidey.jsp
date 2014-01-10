<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Spidey</title>
<h2>Spidey: Aligns mRNA sequences to a single genomic sequence (<a href="#REFERENCE">Sarah J. Wheelan</a>)</h2>
<s:form action="spidey" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#query2')">Genomic Sequence File (FASTA, ASN.1, or GenBank)</A>
<font color="red" size="3">*</font>
<s:select name="query2_" headerKey='' headerValue='' list="%{ getDataForParameter('query2_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setgmodels')">Number of gene models (Optional)</A>
<s:textfield name="setgmodels_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setgorg')">Organism (genomic sequence)</A>
<font color="red" size="3">*</font>
<s:select name="setgorg_" list="#{ 'v':'Vertebrate' , 'd':'Drosophila' , 'p':'Plants' , 'c':'C. elegans' }" onchange="resolveParameters()"/>
<br/>
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
<A name=outputoptions><h2><A HREF="javascript:help.slidedownandjump('#outputoptions_comment')">Advanced Run Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#setfirstpass')">First pass e-value</A>
<font color="red" size="3">*</font>
<s:textfield name="setfirstpass_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setsecondpass')">Second pass e-value</A>
<font color="red" size="3">*</font>
<s:textfield name="setsecondpass_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setthirdpass')">Third pass e-value</A>
<font color="red" size="3">*</font>
<s:textfield name="setthirdpass_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#setcutoff')">Percent Identity Cutoff </A>
<s:textfield name="setcutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#lengthcutoff')">Length Identity Cutoff</A>
<font color="red" size="3">*</font>
<s:textfield name="lengthcutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#interspeciesalign')">Interspecies alignment</A>
<font color="red" size="3">*</font>
<s:checkbox name="interspeciesalign_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mrnamasked')">Is the input mRNA masked (lowercase)? </A>
<font color="red" size="3">*</font>
<s:checkbox name="mrnamasked_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#startinterval')">Start of genomic interval desired (from) </A>
<font color="red" size="3">*</font>
<s:textfield name="startinterval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stopinterval')">Stop of genomic interval desired (to)</A>
<s:textfield name="stopinterval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#multialign')">Make a multiple alignment of all input mRNAs</A>
<font color="red" size="3">*</font>
<s:checkbox name="multialign_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#largeintron')">Use extra-large intron sizes</A>
<font color="red" size="3">*</font>
<s:checkbox name="largeintron_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=outputoptions><h2><A HREF="javascript:help.slidedownandjump('#outputoptions_comment')">Output Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#printalign')">Print the following documents:</A>
<s:select name="printalign_" headerKey='' headerValue='' list="#{ '0':'summary and alignments in one file' , '1':'summary only' , '2':'alignments only' , '3':'summary and alignments in different files' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#printoutasn')">Print out ASN.1 alignments</A>
<font color="red" size="3">*</font>
<s:checkbox name="printoutasn_" onclick="resolveParameters()"/>
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
<dt><a name=first_sequence><i>mRNA Sequence (FASTA, ASN.1, or GenBank)</i></a></dt>
<dd>The input to this option should be 1) the name of a file containing one or more FASTA, ASN.1, or GenBank flatfile sequences, we do not yet support we do not yet support
use of a genomic accession or gi.</dd>
<dt><a name=query2><i>Genomic Sequence File (FASTA, ASN.1, or GenBank)</i></a></dt>
<dd>Spidey currently only accepts a single genomic sequence at a time. The input to this option should be
the name of a file containing a FASTA, ASN.1, or GenBank flatfile genomic record; we do not yet support
use of a genomic accession or gi. </dd>
<dt><a name=setgmodels><i>Number of gene models (Optional)</i></a></dt>
<dd>Spidey can return multiple models for each input mRNA. You can set the maximum number of models to return per mRNA; if not enough models fall above the cutoffs, some of the models may be 'no alignment found'. If this option is not set, the default is to return the single best model for each mRNA.</dd>
<dt><a name=setgorg><i>Organism (genomic sequence)</i></a></dt>
<dd>Spidey needs to know what organism the genomic sequence comes from, so that it knows which splice matrices to use. The options are v for vertebrate, d for drosophila, p for plants, and c for C. elegans. The default is vertebrate.</dd>
<br></br>
<dt><a name=outputoptions_comment><i><b>Advanced Run Options</b></i></a></dt>
<dt><a name=setfirstpass><i>First pass e-value</i></a></dt>
<dd>This is the expectation value for the first BLAST run that Spidey does. The higher the value, the faster the run, but the greater the chance of missing something important. Default is 0.0000001.
</dd>
<dt><a name=setsecondpass><i>Second pass e-value</i></a></dt>
<dd>This is the expectation value for the second, more careful BLAST run that Spidey performs on regions that look promising from the first BLAST. Again, this is a balance between speed and sensitivity. Default is 0.001.
</dd>
<dt><a name=setthirdpass><i>Third pass e-value</i></a></dt>
<dd>This is the expectation value cutoff for the third and final BLAST that Spidey does to fill in any remaining spaces between adjacent exons. Since this search is so constrained, speed is not really an issue, so this value has been set rather high - the default is 10.
</dd>
<dt><a name=setcutoff><i>Percent Identity Cutoff </i></a></dt>
<dd>For quality control, you may want to return only those models which fall above a certain percent identity overall. In that case, set this value to something nonzero (the default value is 0) and Spidey will report 'no alignment' if it could not find any models above the cutoff.
</dd>
<dt><a name=lengthcutoff><i>Length Identity Cutoff</i></a></dt>
<dd>If this option is set above zero (default is 0), Spidey will only return models in which the percentage of the length of the mRNA that is contained in the alignment is above the cutoff.
interspecies alignment (Optional) type: T/F flag: -sf.
</dd>
<dt><a name=interspeciesalign><i>Interspecies alignment</i></a></dt>
<dd>If this option is set to true (T/t), Spidey will adjust its gap opening and gap extension parameters to encourage longer, gappier alignments like those that you see between species. The default is false.
</dd>
<dt><a name=mrnamasked><i>Is the input mRNA masked (lowercase)? </i></a></dt>
<dd>If the mRNA input is masked FASTA sequence, you may want to retain that masking by setting this option to T/t. If this option is F/f (default), any lowercase characters in the mRNA input are treated as regular sequence characters.
</dd>
<dt><a name=startinterval><i>Start of genomic interval desired (from) </i></a></dt>
<dd>If you know that the mRNA is contained in a certain interval of the genomic sequence, you may restrict Spidey's search to that interval to increase speed and sensitivity. If nothing is entered here, Spidey will search the genomic sequence starting at 0.
</dd>
<dt><a name=stopinterval><i>Stop of genomic interval desired (to)</i></a></dt>
<dd>If you know that the mRNA is contained in a certain interval of the genomic sequence, you may restrict Spidey's search to that interval to increase speed and sensitivity. If nothing is entered here, Spidey will search to the end of the genomic sequence.
</dd>
<dt><a name=multialign><i>Make a multiple alignment of all input mRNAs</i></a></dt>
<dd>If you have multiple mRNAs and they overlap on the genomic sequence, Spidey can print a multiple alignment of all mRNAs, exon by exon as they overlap. If the mRNAs do not overlap you will get an error message.
</dd>
<dt><a name=largeintron><i>Use extra-large intron sizes</i></a></dt>
<dd>The maximum intron size is set at 35kb, with the maximum first and last intron sizes at 100kb. If you have an mRNA with introns larger than these limits, iset -X T to get a maximum internal intron size of 120kb and a maximum first and last intron size of 240kb. Using this option will often result in significantly longer compute times.
</dd>
<br></br>
<dt><a name=outputoptions_comment><i><b>Output Options</b></i></a></dt>
<dt><a name=printalign><i>Print the following documents:</i></a></dt>
<dd>You can choose to print a text summary of the alignment, the alignment itself, both, or neither. The output for choices 0-2 will go to the output file specified by the -o option, or to stdout if nothing is chosen. For choice #3, the summary will appear in the output file (-o) and the alignment will appear in the alignment file (-a).</dd>
<dt><a name=printoutasn><i>Print out ASN.1 alignments</i></a></dt>
<dd>If this option is set to true (T/t), Spidey will print the ASN.1 Seq-align(s) corresponding to the mRNA alignment(s). See the next option for information about how to control where the output goes. Default is false.</dd>
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
// setgmodels
// setgorg
// setfirstpass
// setsecondpass
// setthirdpass
// setcutoff
// lengthcutoff
// interspeciesalign
// mrnamasked
// startinterval
// stopinterval
// multialign
// largeintron
// printalign
// printoutasn
}
function validateControl() {
// query2
// setgmodels
// setgorg
// setfirstpass
// setsecondpass
// setthirdpass
// setcutoff
// lengthcutoff
// interspeciesalign
// mrnamasked
// startinterval
// stopinterval
// multialign
// largeintron
// printalign
// printoutasn
return issueWarning();
}
function issueWarning() {
// query2
// setgmodels
// setgorg
// setfirstpass
// setsecondpass
// setthirdpass
// setcutoff
// lengthcutoff
// interspeciesalign
// mrnamasked
// startinterval
// stopinterval
// multialign
// largeintron
// printalign
// printoutasn
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
var element = document.forms['spidey'].elements[parameter];
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
var element = document.forms['spidey'].elements[parameter];
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
var element = document.forms['spidey'].elements[parameter];
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