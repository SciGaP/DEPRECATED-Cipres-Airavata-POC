<%@ taglib prefix="s" uri="/struts-tags" %>
<title>ePESTfind</title>
<h2>ePESTfind: Finds PEST motifs as potential proteolytic cleavage sites. (<a href="#REFERENCE">Michael K. Schuster and Martin Grabner</a>)</h2>
<s:form action="epestfind" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Minimum distance between positively charged amino acids (-window)
<s:textfield name="min_dist_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A HREF="javascript:help.slidedownandjump('#threshold_value')">Threshold value to discriminate weak from potential PEST motifs. (-threshold)</A>
<s:textfield name="threshold_value_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=choose_aa_params><h2><A HREF="javascript:help.slidedownandjump('#choose_aa_params_comment')">Set Amino Acid Parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#usemy_aadata')">Provide a custom file of amino acid properties and molecular masses. (-aadata)</A>
<s:checkbox name="usemy_aadata_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#my_aadata_upload')">File of amino acid properties and molecular masses. (-aadata)</A>
<s:select name="my_aadata_upload_" headerKey='' headerValue='' list="%{ getDataForParameter('my_aadata_upload_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=print_options><h2><A HREF="javascript:help.slidedownandjump('#print_options_comment')">Print Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#no_potential')">Should potential PEST motifs should be printed? (-potential)</A>
<s:checkbox name="no_potential_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_poor')">Should poor PEST motifs should be printed? (-poor)</A>
<s:checkbox name="no_poor_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_invalid')">Should invalid PEST motifs should be printed? (-invalid)</A>
<s:checkbox name="no_invalid_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_map')">Should potential PEST motifs be mapped to the sequence? (-potential)</A>
<s:checkbox name="no_map_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=seq_associated_params><h2><A HREF="javascript:help.slidedownandjump('#seq_associated_params_comment')">Sequence associated parameters</A></H2>
First residue to use
<s:textfield name="sbegin1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Last residue to use
<s:textfield name="send1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=out_associated_params><h2><A HREF="javascript:help.slidedownandjump('#out_associated_params_comment')">Output configuration parameters</A></H2>
<font color="red" size="3">*</font>
<s:radio name="sort_order_"
list="#{ 'length':'Length' , 'position':'Position' , 'score':'Score' }" onclick="resolveParameters()"/>
<br/>
Output Graph type (-graph)
<font color="red" size="3">*</font>
<s:radio name="graph_type_"
list="#{ 'postscript':'PostScript' , 'png':'.png' , 'none':'None' }" onclick="resolveParameters()"/>
<br/>
Graph subtitle
<s:textfield name="gsubtitle_input_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=threshold_value><i>Threshold value to discriminate weak from potential PEST motifs. (-threshold)</i></a></dt>
<dd>Threshold value to discriminate weak from potential PEST motifs. Valid PEST motifs are discriminated into 'poor' and 'potential' motifs depending on this threshold score. By default, the default value is set to +5.0 based on experimental data. Alterations are not recommended since significance is a matter of biology, not mathematics. Allowed values are from -55.00 to 55.00</dd>
<br></br>
<dt><a name=choose_aa_params_comment><i><b>Set Amino Acid Parameters</b></i></a></dt>
<dt><a name=usemy_aadata><i>Provide a custom file of amino acid properties and molecular masses. (-aadata)</i></a></dt>
<dd>File of amino acid properties and molecular masses. Any test data is accepted, so be careful when changing this parameter</dd>
<dt><a name=my_aadata_upload><i>File of amino acid properties and molecular masses. (-aadata)</i></a></dt>
<dd>File of amino acid properties and molecular masses. See the ePESTfind help page for the format of this file.</dd>
<br></br>
<dt><a name=print_options_comment><i><b>Print Options</b></i></a></dt>
<dt><a name=no_potential><i>Should potential PEST motifs should be printed? (-potential)</i></a></dt>
<dd>All retreived motifs are considered "potential"; potential is further divided into valid and poor, depending on the whether they score above or below the user specified "threshold", respectively</dd>
<dt><a name=no_poor><i>Should poor PEST motifs should be printed? (-poor)</i></a></dt>
<dd>Poor motifs score below the user specified "threshold"</dd>
<dt><a name=no_invalid><i>Should invalid PEST motifs should be printed? (-invalid)</i></a></dt>
<dd>By default, the algorithm requires that all 'valid' PEST regions contain at least one proline (P), one acidic amino acid [aspartate (D) or glutamate (E)] and at least one serine (S) or threonine(T). Sequences that do not meet these criteria are classified as 'invalid' PEST motifs. This parameter can be used to show the invalud motifs that were excluded.</dd>
<dt><a name=no_map><i>Should potential PEST motifs be mapped to the sequence? (-potential)</i></a></dt>
<dd></dd>
<br></br>
<dt><a name=seq_associated_params_comment><i><b>Sequence associated parameters</b></i></a></dt>
<br></br>
<dt><a name=out_associated_params_comment><i><b>Output configuration parameters</b></i></a></dt>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// min_dist
// threshold_value
// usemy_aadata
// my_aadata_upload
if (getValue('usemy_aadata_'))
enable('my_aadata_upload_');
else disable('my_aadata_upload_');
// no_potential
// no_poor
// no_invalid
// no_map
// sbegin1
// send1
// sort_order
// graph_type
// gsubtitle_input
}
function validateControl() {
// min_dist
// threshold_value
if (getValue('threshold_value_') > 55.00 || getValue('threshold_value_') < -55.00 ) {
alert('Please select a value between -55.00 and 55.00');
return false;
}
// usemy_aadata
// my_aadata_upload
// no_potential
// no_poor
// no_invalid
// no_map
// sbegin1
// send1
// sort_order
// graph_type
// gsubtitle_input
return issueWarning();
}
function issueWarning() {
// min_dist
// threshold_value
// usemy_aadata
// my_aadata_upload
// no_potential
// no_poor
// no_invalid
// no_map
// sbegin1
// send1
// sort_order
// graph_type
// gsubtitle_input
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
var element = document.forms['epestfind'].elements[parameter];
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
var element = document.forms['epestfind'].elements[parameter];
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
var element = document.forms['epestfind'].elements[parameter];
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