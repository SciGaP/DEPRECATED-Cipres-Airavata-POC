<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Boxshade</title>
<h2>Boxshade: Pretty printing of aligned PS or DS (<a href="#REFERENCE">Hofmann, Baron</a>)</h2>
<s:form action="boxshade" theme="simple">
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
<A name=output_params><h2><A HREF="javascript:help.slidedownandjump('#output_params_comment')">Output parameters</A></H2>
Output format
<font color="red" size="3">*</font>
<s:select name="output_format_" list="#{ '1':'( 1) POSTSCRIPT' , '2':'( 2) encapsulated POSTSCRIPT' , '3':'( 3) HPGL' , '4':'( 4) RTF (Rich Text Format)' , '6':'( 6) ANSI-screen (PC-version)' , '7':'( 7) VT100-screen (DEC-version)' , '8':'( 8) ReGIS-screen (25 lines each)' , '9':'( 9) ReGIS-file (without breaks)' , 'a':'( a) LJ250-printer file' , 'c':'( c) FIG file (for XFIG)' , 'd':'( d) PICT file' , 'e':'( e) HTML' }" onchange="resolveParameters()"/>
<br/>
<br/>
Should sequence name be printed
<s:checkbox name="print_name_" onclick="resolveParameters()"/>
<br/>
Display ruler line
<s:checkbox name="ruler_" onclick="resolveParameters()"/>
<br/>
How many spaces between name and sequence
<s:textfield name="space_between_name_sequence_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number of gaps to be ignored when shading (-1: none)
<s:textfield name="ignored_gaps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
How many sequence characters per line
<s:textfield name="sequence_characters_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
How many lines between two sequence blocks
<s:textfield name="lines_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character size in Points (except for HTML and ASCII output formats)
<s:textfield name="character_size_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Save Shading/Text
<font color="red" size="3">+</font>
<s:radio name="save_shading_"
list="#{ 'S':'Save shading (S)' , 'T':'Save Shading+Text (T)' }" onclick="resolveParameters()"/>
<br/>
Rotate plot
<s:checkbox name="rotate_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=sequence_params><h2><A HREF="javascript:help.slidedownandjump('#sequence_params_comment')">Sequence properties</A></H2>
Special label for similar residues
<s:checkbox name="label_similar_" onclick="resolveParameters()"/>
<br/>
Special label for identical residues in all sequences
<s:checkbox name="label_identical_" onclick="resolveParameters()"/>
<br/>
Display consensus line
<s:checkbox name="consensus_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#threshold')">Identity threshold</A>
<s:textfield name="threshold_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=letters><h2><A HREF="javascript:help.slidedownandjump('#letters_comment')">Letters foreground and background colors</A></H2>
Background for different residues
<font color="red" size="3">+</font>
<s:select name="different_background_" list="#{ 'B':'(B) black' , 'W':'(W) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 (darkest)' , 'R':'(R) Red' , 'G':'(G) Green' , 'L':'(L) Blue' , 'Y':'(Y) Yellow' , 'M':'(M) Magenta' , 'C':'(C) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Foreground for different residues (lowercase choices mean lowercase letters in the sequence)
<font color="red" size="3">*</font>
<s:select name="different_foreground_" list="#{ 'B':'(B) black' , 'b':'(b) black' , 'W':'(W) white' , 'w':'(w) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 = darkest' , '5':'gray value: 5 (lowercase)' , '6':'gray value: 6 (lowercase)' , '7':'gray value: 7 (lowercase)' , '8':'gray value: 8 = darkest (lowercase)' , 'R':'(R) Red' , 'r':'(r) Red' , 'G':'(G) Green' , 'g':'(g) Green' , 'L':'(L) Blue' , 'l':'(l) Blue' , 'Y':'(Y) Yellow' , 'y':'(y) Yellow' , 'M':'(M) Magenta' , 'm':'(m) Magenta' , 'C':'(C) Cyan' , 'c':'(c) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Background for identical residues
<font color="red" size="3">+</font>
<s:select name="identical_background_" list="#{ 'B':'(B) black' , 'W':'(W) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 (darkest)' , 'R':'(R) Red' , 'G':'(G) Green' , 'L':'(L) Blue' , 'Y':'(Y) Yellow' , 'M':'(M) Magenta' , 'C':'(C) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Foreground for identical residues (lowercase choices mean lowercase letters in the sequence)
<font color="red" size="3">*</font>
<s:select name="identical_foreground_" list="#{ 'B':'(B) black' , 'b':'(b) black' , 'W':'(W) white' , 'w':'(w) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 = darkest' , '5':'gray value: 5 (lowercase)' , '6':'gray value: 6 (lowercase)' , '7':'gray value: 7 (lowercase)' , '8':'gray value: 8 = darkest (lowercase)' , 'R':'(R) Red' , 'r':'(r) Red' , 'G':'(G) Green' , 'g':'(g) Green' , 'L':'(L) Blue' , 'l':'(l) Blue' , 'Y':'(Y) Yellow' , 'y':'(y) Yellow' , 'M':'(M) Magenta' , 'm':'(m) Magenta' , 'C':'(C) Cyan' , 'c':'(c) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Background for similar residues
<font color="red" size="3">+</font>
<s:select name="similar_background_" list="#{ 'B':'(B) black' , 'W':'(W) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 (darkest)' , 'R':'(R) Red' , 'G':'(G) Green' , 'L':'(L) Blue' , 'Y':'(Y) Yellow' , 'M':'(M) Magenta' , 'C':'(C) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Foreground for similar residues (lowercase choices mean lowercase letters in the sequence)
<font color="red" size="3">+</font>
<s:select name="similar_foreground_" list="#{ 'B':'(B) black' , 'b':'(b) black' , 'W':'(W) white' , 'w':'(w) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 = darkest' , '5':'gray value: 5 (lowercase)' , '6':'gray value: 6 (lowercase)' , '7':'gray value: 7 (lowercase)' , '8':'gray value: 8 = darkest (lowercase)' , 'R':'(R) Red' , 'r':'(r) Red' , 'G':'(G) Green' , 'g':'(g) Green' , 'L':'(L) Blue' , 'l':'(l) Blue' , 'Y':'(Y) Yellow' , 'y':'(y) Yellow' , 'M':'(M) Magenta' , 'm':'(m) Magenta' , 'C':'(C) Cyan' , 'c':'(c) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Background for conserved residues (if special label for identical residues)
<font color="red" size="3">+</font>
<s:select name="conserved_background_" list="#{ 'B':'(B) black' , 'W':'(W) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 (darkest)' , 'R':'(R) Red' , 'G':'(G) Green' , 'L':'(L) Blue' , 'Y':'(Y) Yellow' , 'M':'(M) Magenta' , 'C':'(C) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
Foreground for conserved residues (lowercase choices mean lowercase letters in the sequence)
<font color="red" size="3">+</font>
<s:select name="conserved_foreground_" list="#{ 'B':'(B) black' , 'b':'(b) black' , 'W':'(W) white' , 'w':'(w) white' , '1':'gray value: 1' , '2':'gray value: 2' , '3':'gray value: 3' , '4':'gray value: 4 = darkest' , '5':'gray value: 5 (lowercase)' , '6':'gray value: 6 (lowercase)' , '7':'gray value: 7 (lowercase)' , '8':'gray value: 8 = darkest (lowercase)' , 'R':'(R) Red' , 'r':'(r) Red' , 'G':'(G) Green' , 'g':'(g) Green' , 'L':'(L) Blue' , 'l':'(l) Blue' , 'Y':'(Y) Yellow' , 'y':'(y) Yellow' , 'M':'(M) Magenta' , 'm':'(m) Magenta' , 'C':'(C) Cyan' , 'c':'(c) Cyan' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=single_comparison><h2><A HREF="javascript:help.slidedownandjump('#single_comparison_comment')">Comparison to a single sequence</A></H2>
Similarity to a single sequence
<s:checkbox name="single_" onclick="resolveParameters()"/>
<br/>
Which sequence (give its number)
<font color="red" size="3">+</font>
<s:textfield name="seq_no_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Hide this sequence
<s:checkbox name="hide_" onclick="resolveParameters()"/>
<br/>
Show this sequence in all-normal rendition
<s:checkbox name="show_normal_" onclick="resolveParameters()"/>
<br/>
Create identity / similarity matrix
<s:checkbox name="matrix_" onclick="resolveParameters()"/>
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
<dt><a name=output_params_comment><i><b>Output parameters</b></i></a></dt>
<br></br>
<dt><a name=sequence_params_comment><i><b>Sequence properties</b></i></a></dt>
<dt><a name=threshold><i>Identity threshold</i></a></dt>
<dd>The threshold is the fraction of residues that must be identical or similar for shading to occur.</dd>
<br></br>
<dt><a name=letters_comment><i><b>Letters foreground and background colors</b></i></a></dt>
<br></br>
<dt><a name=single_comparison_comment><i><b>Comparison to a single sequence</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// output_format
// print_name
// ruler
// space_between_name_sequence
if (getValue('print_name_'))
enable('space_between_name_sequence_');
else disable('space_between_name_sequence_');
// ignored_gaps
if (getValue('output_format_')!="b")
enable('ignored_gaps_');
else disable('ignored_gaps_');
// sequence_characters
// lines
// character_size
if (getValue('output_format_')!="b" && getValue('output_format_')!="e")
enable('character_size_');
else disable('character_size_');
// save_shading
if (getValue('output_format_')=="d")
enable('save_shading_');
else disable('save_shading_');
// rotate
if (getValue('output_format_')=="1" || getValue('output_format_')=="2" || getValue('output_format_')=="d" || getValue('output_format_')=="3" )
enable('rotate_');
else disable('rotate_');
// label_similar
// label_identical
// consensus
// threshold
if (getValue('output_format_')!="b")
enable('threshold_');
else disable('threshold_');
// different_background
if (getValue('output_format_')!="b")
enable('different_background_');
else disable('different_background_');
// different_foreground
// identical_background
if (getValue('output_format_')!="b")
enable('identical_background_');
else disable('identical_background_');
// identical_foreground
// similar_background
if (getValue('label_similar_') && getValue('output_format_')!="b")
enable('similar_background_');
else disable('similar_background_');
// similar_foreground
if (getValue('label_similar_'))
enable('similar_foreground_');
else disable('similar_foreground_');
// conserved_background
if (getValue('label_identical_') && getValue('output_format_')!="b")
enable('conserved_background_');
else disable('conserved_background_');
// conserved_foreground
if (getValue('label_identical_'))
enable('conserved_foreground_');
else disable('conserved_foreground_');
// single
if (getValue('output_format_')!="b")
enable('single_');
else disable('single_');
// seq_no
if (getValue('single_'))
enable('seq_no_');
else disable('seq_no_');
// hide
if (getValue('single_'))
enable('hide_');
else disable('hide_');
// show_normal
if (getValue('single_'))
enable('show_normal_');
else disable('show_normal_');
// matrix
}
function validateControl() {
// output_format
// print_name
// ruler
// space_between_name_sequence
// ignored_gaps
// sequence_characters
if (getValue('sequence_characters_') > 254) {
alert('maximum is 254');
return false;
}
// lines
if ( getValue('lines_') < 1) {
alert('Enter a value > 0');
return false;
}
// character_size
// save_shading
// rotate
// label_similar
// label_identical
// consensus
// threshold
if (getValue('output_format_')!="b") {
if ( (getValue('threshold_') <= 0 || getValue('threshold_') > 1)) {
alert('The fraction must be between 0 and 1');
return false;
}
}
// different_background
// different_foreground
// identical_background
// identical_foreground
// similar_background
// similar_foreground
// conserved_background
// conserved_foreground
// single
// seq_no
if (getValue('single_')) {
if ((getValue('seq_no_').match("^\\d+"))==null) {
alert('Give a sequence NUMBER');
return false;
}
}
if (getValue('single_')) {
if ((getValue('seq_no_').match("^\\d+"))==null) {
alert('Give a sequence NUMBER');
return false;
}
}
// hide
// show_normal
// matrix
return issueWarning();
}
function issueWarning() {
// output_format
// print_name
// ruler
// space_between_name_sequence
// ignored_gaps
// sequence_characters
// lines
// character_size
// save_shading
// rotate
// label_similar
// label_identical
// consensus
// threshold
// different_background
// different_foreground
// identical_background
// identical_foreground
// similar_background
// similar_foreground
// conserved_background
// conserved_foreground
// single
// seq_no
// hide
// show_normal
// matrix
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
var element = document.forms['boxshade'].elements[parameter];
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
var element = document.forms['boxshade'].elements[parameter];
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
var element = document.forms['boxshade'].elements[parameter];
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