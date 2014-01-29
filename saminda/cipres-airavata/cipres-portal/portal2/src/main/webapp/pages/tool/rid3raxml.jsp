<%@ taglib prefix="s" uri="/struts-tags" %>
<title>RID3Raxml</title>
<h2>RID3Raxml: Recursive-Iterative-DCM3 algorithm with RaxmlHPC search. (<a href="#REFERENCE">Terri Liebowitz, Mark Holder, Usman Roshan. Alexandros Stamatakis is the author of RaxmlHPC.</a>)</h2>
<s:form action="rid3raxml" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#maxtaxasubsetsize')">Subset size (do inference when subset is this size or smaller)</A>
<s:textfield name="maxtaxasubsetsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#maxtaxasubsetpercent')">Subset Percent (do inference when subset contains specified percent of the total number of taxa, or less).</A>
<s:textfield name="maxtaxasubsetpercent_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum recursion depth, before doing inference. Leave blank if not using depth as limit.
<s:textfield name="maxrecursionlevels_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of iterations. Leave blank if no iteration limit.
<s:textfield name="maxiterations_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of hours to run.
<s:textfield name="maxanalysistime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ignore branch lengths in starting tree.
<font color="red" size="3">*</font>
<s:radio name="ignorestartedgelen_"
list="#{ 'yes':'yes' , 'no':'no' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=decompose_paragraph><h2><A HREF="javascript:help.slidedownandjump('#decompose_paragraph_comment')">Decomposition Settings</A></H2>
Break ties randomly?
<font color="red" size="3">*</font>
<s:radio name="breakties_"
list="#{ 'no':'no' , 'yes':'yes' }" onclick="resolveParameters()"/>
<br/>
Seed for random number generator.
<s:textfield name="seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=large_tree_inference_paragraph><h2><A HREF="javascript:help.slidedownandjump('#large_tree_inference_paragraph_comment')">Raxml Settings for Large Tree Search</A></H2>
Number of rate categories.
<font color="red" size="3">*</font>
<s:textfield name="numcat_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Model (use a GTR... model with dna, or a PROT... model with protein).
<font color="red" size="3">*</font>
<s:select name="model_" list="#{ 'GTRCAT':'DNA GTR model with Cat CAT model (rates and assignments estimated)' , 'GTRGAMMA':'DNA GTR model with GAMMA distributed rate het. (4 categories)' , 'GTRMIX':'DNA GTR model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDAYHOFF':'PROT DAYHOFF model with CAT model (rates and assignments estimated)' , 'PROTGAMMADAYHOFF':'PROT DAYHOFF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDAYHOFF':'PROT DAYHOFF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDAYHOFFF':'PROT DAYHOFFF model with CAT model (rates and assignments estimated)' , 'PROTGAMMADAYHOFFF':'PROT DAYHOFFF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDAYHOFFF':'PROT DAYHOFFF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDCMUT':'PROT DCMUT model with CAT model (rates and assignments estimated)' , 'PROTGAMMADCMUT':'PROT DCMUT model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDCMUT':'PROT DCMUT model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDCMUTF':'PROT DCMUTF model with CAT model (rates and assignments estimated)' , 'PROTGAMMADCMUTF':'PROT DCMUTF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDCMUTF':'PROT DCMUTF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATJTT':'PROT JTT model with CAT model (rates and assignments estimated)' , 'PROTGAMMAJTT':'PROT JTT model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXJTT':'PROT JTT model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATJTTF':'PROT JTTF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAJTTF':'PROT JTTF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXJTTF':'PROT JTTF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTREV':'PROT MTREV model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTREV':'PROT MTREV model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTREV':'PROT MTREV model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTREVF':'PROT MTREVF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTREVF':'PROT MTREVF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTREVF':'PROT MTREVF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATWAG':'PROT WAG model with CAT model (rates and assignments estimated)' , 'PROTGAMMAWAG':'PROT WAG model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXWAG':'PROT WAG model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATWAGF':'PROT WAGF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAWAGF':'PROT WAGF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXWAGF':'PROT WAGF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATRTREV':'PROT RTREV model with CAT model (rates and assignments estimated)' , 'PROTGAMMARTREV':'PROT RTREV model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXRTREV':'PROT RTREV model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATRTREVF':'PROT RTREVF model with CAT model (rates and assignments estimated)' , 'PROTGAMMARTREVF':'PROT RTREVF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXRTREVF':'PROT RTREVF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATCPREV':'PROT CPREV model with CAT model (rates and assignments estimated)' , 'PROTGAMMACPREV':'PROT CPREV model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXCPREV':'PROT CPREV model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATCPREVF':'PROT CPREVF model with CAT model (rates and assignments estimated)' , 'PROTGAMMACPREVF':'PROT CPREVF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXCPREVF':'PROT CPREVF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATVT':'PROT VT model with CAT model (rates and assignments estimated)' , 'PROTGAMMAVT':'PROT VT model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXVT':'PROT VT model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATVTF':'PROT VTF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAVTF':'PROT VTF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXVTF':'PROT VTF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATBLOSUM62':'PROT BLOSUM62 model with CAT model (rates and assignments estimated)' , 'PROTGAMMABLOSUM62':'PROT BLOSUM62 model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXBLOSUM62':'PROT BLOSUM62 model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATBLOSUM62F':'PROT BLOSUM62F model with CAT model (rates and assignments estimated)' , 'PROTGAMMABLOSUM62F':'PROT BLOSUM62F model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXBLOSUM62F':'PROT BLOSUM62F model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTMAM':'PROT MTMAM model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTMAM':'PROT MTMAM model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTMAM':'PROT MTMAM model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTMAMF':'PROT MTMAMF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTMAMF':'PROT MTMAMF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTMAMF':'PROT MTMAMF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATGTR':'PROT GTR model with CAT model (rates and assignments estimated)' , 'PROTGAMMAGTR':'PROT GTR model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXGTR':'PROT GTR model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATGTRF':'PROT GTRF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAGTRF':'PROT GTRF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXGTRF':'PROT GTRF model with MIXed rate het. (search under CAT, return GAMMA score)' }" onchange="resolveParameters()"/>
<br/>
<br/>
Initial rearrangement limit
<font color="red" size="3">*</font>
<s:textfield name="initrearrange_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=small_tree_inference_paragraph><h2><A HREF="javascript:help.slidedownandjump('#small_tree_inference_paragraph_comment')">Raxml Settings for Small Tree Search</A></H2>
Number of rate categories.
<font color="red" size="3">*</font>
<s:textfield name="s_numcat_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Model (use a GTR... model with dna, or a PROT... model with protein).
<font color="red" size="3">*</font>
<s:select name="s_model_" list="#{ 'GTRCAT':'DNA GTR model with Cat CAT model (rates and assignments estimated)' , 'GTRGAMMA':'DNA GTR model with GAMMA distributed rate het. (4 categories)' , 'GTRMIX':'DNA GTR model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDAYHOFF':'PROT DAYHOFF model with CAT model (rates and assignments estimated)' , 'PROTGAMMADAYHOFF':'PROT DAYHOFF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDAYHOFF':'PROT DAYHOFF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDAYHOFFF':'PROT DAYHOFFF model with CAT model (rates and assignments estimated)' , 'PROTGAMMADAYHOFFF':'PROT DAYHOFFF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDAYHOFFF':'PROT DAYHOFFF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDCMUT':'PROT DCMUT model with CAT model (rates and assignments estimated)' , 'PROTGAMMADCMUT':'PROT DCMUT model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDCMUT':'PROT DCMUT model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATDCMUTF':'PROT DCMUTF model with CAT model (rates and assignments estimated)' , 'PROTGAMMADCMUTF':'PROT DCMUTF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXDCMUTF':'PROT DCMUTF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATJTT':'PROT JTT model with CAT model (rates and assignments estimated)' , 'PROTGAMMAJTT':'PROT JTT model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXJTT':'PROT JTT model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATJTTF':'PROT JTTF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAJTTF':'PROT JTTF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXJTTF':'PROT JTTF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTREV':'PROT MTREV model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTREV':'PROT MTREV model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTREV':'PROT MTREV model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTREVF':'PROT MTREVF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTREVF':'PROT MTREVF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTREVF':'PROT MTREVF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATWAG':'PROT WAG model with CAT model (rates and assignments estimated)' , 'PROTGAMMAWAG':'PROT WAG model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXWAG':'PROT WAG model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATWAGF':'PROT WAGF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAWAGF':'PROT WAGF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXWAGF':'PROT WAGF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATRTREV':'PROT RTREV model with CAT model (rates and assignments estimated)' , 'PROTGAMMARTREV':'PROT RTREV model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXRTREV':'PROT RTREV model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATRTREVF':'PROT RTREVF model with CAT model (rates and assignments estimated)' , 'PROTGAMMARTREVF':'PROT RTREVF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXRTREVF':'PROT RTREVF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATCPREV':'PROT CPREV model with CAT model (rates and assignments estimated)' , 'PROTGAMMACPREV':'PROT CPREV model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXCPREV':'PROT CPREV model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATCPREVF':'PROT CPREVF model with CAT model (rates and assignments estimated)' , 'PROTGAMMACPREVF':'PROT CPREVF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXCPREVF':'PROT CPREVF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATVT':'PROT VT model with CAT model (rates and assignments estimated)' , 'PROTGAMMAVT':'PROT VT model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXVT':'PROT VT model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATVTF':'PROT VTF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAVTF':'PROT VTF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXVTF':'PROT VTF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATBLOSUM62':'PROT BLOSUM62 model with CAT model (rates and assignments estimated)' , 'PROTGAMMABLOSUM62':'PROT BLOSUM62 model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXBLOSUM62':'PROT BLOSUM62 model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATBLOSUM62F':'PROT BLOSUM62F model with CAT model (rates and assignments estimated)' , 'PROTGAMMABLOSUM62F':'PROT BLOSUM62F model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXBLOSUM62F':'PROT BLOSUM62F model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTMAM':'PROT MTMAM model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTMAM':'PROT MTMAM model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTMAM':'PROT MTMAM model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATMTMAMF':'PROT MTMAMF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAMTMAMF':'PROT MTMAMF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXMTMAMF':'PROT MTMAMF model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATGTR':'PROT GTR model with CAT model (rates and assignments estimated)' , 'PROTGAMMAGTR':'PROT GTR model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXGTR':'PROT GTR model with MIXed rate het. (search under CAT, return GAMMA score)' , 'PROTCATGTRF':'PROT GTRF model with CAT model (rates and assignments estimated)' , 'PROTGAMMAGTRF':'PROT GTRF model with GAMMA-distributed rate het. (4 categories)' , 'PROTMIXGTRF':'PROT GTRF model with MIXed rate het. (search under CAT, return GAMMA score)' }" onchange="resolveParameters()"/>
<br/>
<br/>
Initial rearrangement limit
<font color="red" size="3">*</font>
<s:textfield name="s_initrearrange_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=maxtaxasubsetsize><i>Subset size (do inference when subset is this size or smaller)</i></a></dt>
<dd>
It is normally recommended that you use Subset Percent instead of Subset Size.
</dd>
<dt><a name=maxtaxasubsetpercent><i>Subset Percent (do inference when subset contains specified percent of the total number of taxa, or less).</i></a></dt>
<dd>
The recommended Subset Percent depends on the number of taxa in the dataset. For datasets with
500 - 1000 taxa, use 50%. For 1001 - 2000 taxa, use 25 %, for 2001 - 3000, use 16 %, for
3001-5000 use 12.5% and for more than 5000 taxa use 6.25%.
Rec-i-dcm3 with raxmlHPC is not recommended for use on datasets smaller than 500 taxa.
</dd>
<br></br>
<dt><a name=decompose_paragraph_comment><i><b>Decomposition Settings</b></i></a></dt>
<br></br>
<dt><a name=large_tree_inference_paragraph_comment><i><b>Raxml Settings for Large Tree Search</b></i></a></dt>
<br></br>
<dt><a name=small_tree_inference_paragraph_comment><i><b>Raxml Settings for Small Tree Search</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// maxtaxasubsetsize
if (! getValue('maxtaxasubsetpercent_'))
enable('maxtaxasubsetsize_');
else disable('maxtaxasubsetsize_');
// maxtaxasubsetpercent
if (! getValue('maxtaxasubsetsize_'))
enable('maxtaxasubsetpercent_');
else disable('maxtaxasubsetpercent_');
// maxrecursionlevels
// maxiterations
// maxanalysistime
// ignorestartedgelen
// breakties
// seed
if ( getValue('breakties_') && getValue('breakties_')=="yes")
enable('seed_');
else disable('seed_');
// numcat
// model
// initrearrange
// s_numcat
// s_model
// s_initrearrange
}
function validateControl() {
// maxtaxasubsetsize
if (! getValue('maxtaxasubsetpercent_')) {
if (getValue('maxtaxasubsetsize_') != "" && getValue('maxtaxasubsetsize_') <= 0) {
alert('Subset size must be greater than 0 or blank.');
return false;
}
}
// maxtaxasubsetpercent
if (! getValue('maxtaxasubsetsize_')) {
if (getValue('maxtaxasubsetpercent_') != "" && getValue('maxtaxasubsetpercent_') <= 0) {
alert('Subset percent must be a decimal number greater than 0. For example, 25.5, means stop recursing when a subset contains 25.5% of the total number of taxa.');
return false;
}
}
// maxrecursionlevels
if (getValue('maxrecursionlevels_') != "" && getValue('maxrecursionlevels_') <= 0) {
alert('Maximum recursion depth must be blank or an integer greater than zero.');
return false;
}
// maxiterations
if (getValue('maxiterations_') != "" && getValue('maxiterations_') <= 0) {
alert('Maximum iterations must be blank or an integer greater than zero.');
return false;
}
// maxanalysistime
if (getValue('maxanalysistime_') != "" && getValue('maxanalysistime_') <= 0) {
alert('Maximum analysis time must be blank or an integer greater than zero.');
return false;
}
// ignorestartedgelen
// breakties
// seed
if ( getValue('breakties_') && getValue('breakties_')=="yes") {
if (getValue('seed_') < 0) {
alert('Seed must be greater than or equal to 0.');
return false;
}
}
// numcat
if (getValue('numcat_') < 0) {
alert('Number of rate categories must be greater than 0.');
return false;
}
// model
// initrearrange
if (getValue('initrearrange_') <= 0) {
alert('Initial rearrangement limit must be greater than 0.');
return false;
}
// s_numcat
if (getValue('s_numcat_') < 0) {
alert('Number of rate categories must be greater than 0.');
return false;
}
// s_model
// s_initrearrange
if (getValue('s_initrearrange_') <= 0) {
alert('Initial rearrangement limit must be greater than 0.');
return false;
}
return issueWarning();
}
function issueWarning() {
// maxtaxasubsetsize
// maxtaxasubsetpercent
// maxrecursionlevels
// maxiterations
// maxanalysistime
// ignorestartedgelen
// breakties
// seed
// numcat
// model
// initrearrange
// s_numcat
// s_model
// s_initrearrange
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
var element = document.forms['rid3raxml'].elements[parameter];
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
var element = document.forms['rid3raxml'].elements[parameter];
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
var element = document.forms['rid3raxml'].elements[parameter];
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