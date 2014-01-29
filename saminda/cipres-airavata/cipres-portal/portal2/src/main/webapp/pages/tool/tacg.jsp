<%@ taglib prefix="s" uri="/struts-tags" %>
<title>TACG</title>
<h2>TACG: Find Restriction Enzyme Sites (<a href="#REFERENCE">H. J. Mangalam</a>)</h2>
<s:form action="tacg" theme="simple">
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
<A name=input_options><h2><A HREF="javascript:help.slidedownandjump('#input_options_comment')">Input options</A></H2>
Beginning of a subsequence in your sequence (-b)
<s:textfield name="beginning_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
End of a subsequence in your sequence (-e)
<s:textfield name="end_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Form (or topology) of DNA (-f)
<s:radio name="topology_"
list="#{ '': '[Not Mandatory]', '0':'0: circular' , '1':'1: linear' }" onclick="resolveParameters()"/>
<br/>
Degeneracy flag - controls input and analysis of degenerate sequence input (-D)
<s:select name="degeneracy_" headerKey='' headerValue='' list="#{ '0':'0: FORCES excl n of degens in seq; only acgtu accepted' , '1':'1: cut as NONdegen unless degen found; then cut as (-D3)' , '2':'2: degen OK; ignore in KEY, but match outside of KEY' , '3':'3: degen OK; expand in KEY, find only EXACT matches' , '4':'4: degen OK; expand in KEY, find ALL POSSIBLE matches' }" onchange="resolveParameters()"/>
<br/>
<br/>
Codon Usage table to use for translation (-C)
<s:select name="codon_" headerKey='' headerValue='' list="#{ '0':'0: Universal' , '1':'1: Mito_Vertebrates' , '2':'2: Mito_Drosophila' , '3':'3: Mito_S_Cervisiae' , '4':'4: Mito_S_Pombe' , '5':'5: Mito_N_crassa' , '6':'6: Mito_Higher_Plants' , '7':'7: Ciliates' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=output_options><h2><A HREF="javascript:help.slidedownandjump('#output_options_comment')">Output options</A></H2>
Order the output by number of cuts/fragments (-c)
<s:checkbox name="order_by_cut_" onclick="resolveParameters()"/>
<br/>
Output width (between 60 and 210) (-w)
<s:textfield name="width_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Histogram output (-G)
<s:radio name="graphic_"
list="#{ '': '[Not Mandatory]', 'X':'X: horizontal X axis' , 'Y':'Y: vertical X axis' , 'Z':'Z: long output' }" onclick="resolveParameters()"/>
<br/>
Step size in histogram
<font color="red" size="3">+</font>
<s:textfield name="binsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=selection_options><h2><A HREF="javascript:help.slidedownandjump('#selection_options_comment')">Enzymes Selection options</A></H2>
Enzymes selection list (separated by comma)
<s:textfield name="enzymes_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of cuts allowed in sequence (-M)
<s:textfield name="max_cut_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum number of cuts in sequence for the enzyme to be selected (-m)
<s:textfield name="min_cut_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#magnitude')">Select enzymes by magnitude of recognition site (-n)</A>
<s:select name="magnitude_" headerKey='' headerValue='' list="#{ '3':'3' , '4':'4' , '5':'5' , '6':'6' , '7':'7' , '8':'8' }" onchange="resolveParameters()"/>
<br/>
<br/>
Select enzymes by overhang generated (-o)
<s:select name="overhang_" headerKey='' headerValue='' list="#{ '5':'5: 5 overhang' , '3':'3: 3' , '0':'0: blunt (no overhang)' , '1':'1: all' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=analyses><h2><A HREF="javascript:help.slidedownandjump('#analyses_comment')">Analyses</A></H2>
Summary of site information (-s)
<s:checkbox name="summary_" onclick="resolveParameters()"/>
<br/>
Table of fragments (-F)
<s:select name="print_fragments_" headerKey='' headerValue='' list="#{ '0':'0: do not print fragments' , '1':'1: by sites' , '2':'2: sorted by sizes' , '3':'3: both' }" onchange="resolveParameters()"/>
<br/>
<br/>
Table of actual cut sites (a la Strider) (-S)
<s:checkbox name="sites_" onclick="resolveParameters()"/>
<br/>
Ladder map of selected enzymes (-l)
<s:checkbox name="ladder_map_" onclick="resolveParameters()"/>
<br/>
Pseudo-graphic gel map (-g)
<s:checkbox name="gel_map_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#cutoff')">Low-end cutoff in number of bases for gel map (>= 10) </A>
<font color="red" size="3">+</font>
<s:textfield name="cutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=linear_map_options><h2><A HREF="javascript:help.slidedownandjump('#linear_map_options_comment')">Linear map</A></H2>
Linear map a la Strider (-L)
<s:checkbox name="linear_map_" onclick="resolveParameters()"/>
<br/>
Linear co-translation (-t,-T)
<s:checkbox name="translation_" onclick="resolveParameters()"/>
<br/>
Translation in how many frames
<font color="red" size="3">+</font>
<s:radio name="translation_frames_"
list="#{ '1':'1 frame' , '3':'3 frames' , '6':'6 frames' }" onclick="resolveParameters()"/>
<br/>
Translation in 3-letter code (-T)
<s:checkbox name="three_letter_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=orf_options><h2><A HREF="javascript:help.slidedownandjump('#orf_options_comment')">Open Reading Frames</A></H2>
Do an ORF analysis
<s:checkbox name="orf_" onclick="resolveParameters()"/>
<br/>
Frames to search
<font color="red" size="3">+</font>
<s:select name="frame_" multiple="true" list="#{ '1':'1' , '2':'2' , '3':'3' , '4':'4' , '5':'5' , '6':'6' }" onchange="resolveParameters()"/>
<br/>
<br/>
Min ORF size
<font color="red" size="3">+</font>
<s:textfield name="min_size_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=pattern_search_options><h2><A HREF="javascript:help.slidedownandjump('#pattern_search_options_comment')">Pattern Search</A></H2>
Do a pattern search (-p)
<s:checkbox name="pattern_search_" onclick="resolveParameters()"/>
<br/>
Pattern (<30 IUPAC character)
<font color="red" size="3">+</font>
<s:textfield name="pattern_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Max number of errors that are tolerated (<6) (-p)
<font color="red" size="3">+</font>
<s:textfield name="errors_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Label of pattern
<font color="red" size="3">+</font>
<s:textfield name="name_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=proximity_options><h2><A HREF="javascript:help.slidedownandjump('#proximity_options_comment')">Search for spatial relationships between factors (-P)</A></H2>
Do a proximity search
<s:checkbox name="proximity_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#distance')">Distance between factors</A>
<font color="red" size="3">+</font>
<s:textfield name="distance_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nameA')">Name of first factor (nameA)</A>
<font color="red" size="3">+</font>
<s:textfield name="nameA_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name of second factor (nameB)
<font color="red" size="3">+</font>
<s:textfield name="nameB_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=input_options_comment><i><b>Input options</b></i></a></dt>
<br></br>
<dt><a name=output_options_comment><i><b>Output options</b></i></a></dt>
<br></br>
<dt><a name=selection_options_comment><i><b>Enzymes Selection options</b></i></a></dt>
<dt><a name=magnitude><i>Select enzymes by magnitude of recognition site (-n)</i></a></dt>
<dd>The 'magnitude' of the recognition sequence depends on the number of defined bases that make up the site. Degenerate bases can also contribute:</dd><dd>acgt each count '1' magnitude point</dd><dd>yrwsmk each count '1/2' magnitude point</dd><dd>bdhu each count '1/4' magnitude point</dd><dd>n doesn't count at all</dd><dd>Those enzymes sequences' patterns that 'sum' to the equivalent of at least the given magnitude pass the test</dd><dd>Examples: tgca=4, tgyrca=5, tgcnnngca=6, etc...</dd><dd>The values are upwardly inclusive (5=5,6,7,8 6=6,7,8 ...)</dd>
<br></br>
<dt><a name=analyses_comment><i><b>Analyses</b></i></a></dt>
<dt><a name=cutoff><i>Low-end cutoff in number of bases for gel map (>= 10) </i></a></dt>
<dd>You can cut off any size in 10^n increments (as you might want to cut off very large fragments if you were doing chromosomal digests).</dd>
<br></br>
<dt><a name=linear_map_options_comment><i><b>Linear map</b></i></a></dt>
<br></br>
<dt><a name=orf_options_comment><i><b>Open Reading Frames</b></i></a></dt>
<br></br>
<dt><a name=pattern_search_options_comment><i><b>Pattern Search</b></i></a></dt>
<br></br>
<dt><a name=proximity_options_comment><i><b>Search for spatial relationships between factors (-P)</b></i></a></dt>
<dt><a name=distance><i>Distance between factors</i></a></dt>
<dd>Distance specification: [+-][lg]Dist_Lo[-Dist_Hi</dd><dd>+ NameA is DOWNSTREAM of NameB (default is either)</dd><dd>- NameA is UPSTREAM of NameB (ditto)</dd><dd>l NameA is LESS THAN Dist_Lo from NameB (default)</dd><dd>g NameA is GREATER THAN Dist_Lo from NameB</dd><dd>examples:</dd><dd>HindIII,350,bamhi: Matches HindIII sites within 350 bp of BamHI sites</dd><dd>Pit1,-30-2500,Tataa: Match Pit1 sites 30 to 2500 bp UPSTREAM of a Tataa site</dd>
<dt><a name=nameA><i>Name of first factor (nameA)</i></a></dt>
<dd>NameA and NameB must be enzymes names (Rebase db)</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// beginning
// end
// topology
// degeneracy
// codon
// order_by_cut
if (getValue('print_fragments_') || getValue('sites_') || getValue('ladder_map_') || getValue('gel_map_'))
enable('order_by_cut_');
else disable('order_by_cut_');
// width
// graphic
// binsize
if (getValue('graphic_'))
enable('binsize_');
else disable('binsize_');
// enzymes
// max_cut
// min_cut
// magnitude
// overhang
// summary
// print_fragments
// sites
// ladder_map
// gel_map
// cutoff
if (getValue('gel_map_'))
enable('cutoff_');
else disable('cutoff_');
// linear_map
// translation
if (getValue('linear_map_'))
enable('translation_');
else disable('translation_');
// translation_frames
if (getValue('translation_'))
enable('translation_frames_');
else disable('translation_frames_');
// three_letter
if (getValue('translation_'))
enable('three_letter_');
else disable('three_letter_');
// orf
// frame
if (getValue('orf_'))
enable('frame_');
else disable('frame_');
// min_size
if (getValue('orf_'))
enable('min_size_');
else disable('min_size_');
// pattern_search
// pattern
if (getValue('pattern_search_'))
enable('pattern_');
else disable('pattern_');
// errors
if (getValue('pattern_search_'))
enable('errors_');
else disable('errors_');
// name
if (getValue('pattern_search_'))
enable('name_');
else disable('name_');
// proximity
// distance
if (getValue('proximity_'))
enable('distance_');
else disable('distance_');
// nameA
if (getValue('proximity_'))
enable('nameA_');
else disable('nameA_');
// nameB
if (getValue('proximity_'))
enable('nameB_');
else disable('nameB_');
}
function validateControl() {
// beginning
// end
// topology
// degeneracy
// codon
// order_by_cut
// width
// graphic
// binsize
if (getValue('graphic_')) {
if (! getValue('binsize_')) {
alert('You must enter a Step Size value');
return false;
}
}
if (getValue('graphic_')) {
if (getValue('binsize_') < 0) {
alert('The the Step Size Value Must be Greater than 0');
return false;
}
}
// enzymes
// max_cut
// min_cut
// magnitude
// overhang
// summary
// print_fragments
// sites
// ladder_map
// gel_map
// cutoff
if (getValue('gel_map_')) {
if (! getValue('cutoff_')) {
alert('You must enter a Low-end cutoff value');
return false;
}
}
// linear_map
// translation
// translation_frames
// three_letter
// orf
// frame
// min_size
// pattern_search
// pattern
// errors
// name
// proximity
// distance
// nameA
// nameB
return issueWarning();
}
function issueWarning() {
// beginning
// end
// topology
// degeneracy
// codon
// order_by_cut
// width
// graphic
// binsize
// enzymes
// max_cut
// min_cut
// magnitude
// overhang
// summary
// print_fragments
// sites
// ladder_map
// gel_map
// cutoff
// linear_map
// translation
// translation_frames
// three_letter
// orf
// frame
// min_size
// pattern_search
// pattern
// errors
// name
// proximity
// distance
// nameA
// nameB
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
var element = document.forms['tacg'].elements[parameter];
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
var element = document.forms['tacg'].elements[parameter];
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
var element = document.forms['tacg'].elements[parameter];
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