<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Blimps</title>
<h2>Blimps: Search BLOCKS DB for Motifs (<a href="#REFERENCE">Wallace, Henikoff</a>)</h2>
<s:form action="blimps" theme="simple">
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
<A HREF="javascript:help.slidedownandjump('#action')">Action</A>
<font color="red" size="3">*</font>
<s:radio name="action_"
list="#{ 'block':'block: score a query sequence against Blocks database' , 'matrix':'matrix: score a block or matrix against a database of sequences' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=block_parameters><h2><A HREF="javascript:help.slidedownandjump('#block_parameters_comment')">Parameters for sequence against Block db (action=block)</A></H2>
Blocks database
<font color="red" size="3">+</font>
<s:radio name="blocks_db_"
list="#{ 'blocks.dat':'blocks.dat' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=matrix_parameters><h2><A HREF="javascript:help.slidedownandjump('#matrix_parameters_comment')">Parameters for block against sequences db (action=matrix)</A></H2>
Sequences database
<font color="red" size="3">+</font>
<br/>
Block file filename
<s:select name="block_file_" headerKey='' headerValue='' list="%{ getDataForParameter('block_file_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#matrix_file')">A precomputed site specific scoring matrix file</A>
<s:select name="matrix_file_" headerKey='' headerValue='' list="%{ getDataForParameter('matrix_file_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=control_parameters><h2><A HREF="javascript:help.slidedownandjump('#control_parameters_comment')">Control parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#conversion')">Conversion method for converting a block to a matrix</A>
<font color="red" size="3">*</font>
<s:radio name="conversion_"
list="#{ '0':'Clustering' , '1':'patmat method' , '2':'Sequence weighing' }" onclick="resolveParameters()"/>
<br/>
The Genetic code to use
<s:select name="genetic_code_" headerKey='' headerValue='' list="#{ '0':'0 - Standard (default)' , '1':'1 - Vertebrate Mitochondrial' , '2':'2 - Yeast Mitochondrial' , '3':'3 - Mold Mitochondrial and Mycoplasma' , '4':'4 - Invertebrate Mitochondrial' , '5':'5 - Ciliate Macronuclear' , '6':'6 - Protozoan Mitochondrial' , '7':'7 - Plant Mitochondrial' , '8':'8 - Echinodermate Mitochondrial' }" onchange="resolveParameters()"/>
<br/>
<br/>
both strands to be searched
<s:checkbox name="strand_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=output_parameters><h2><A HREF="javascript:help.slidedownandjump('#output_parameters_comment')">Output parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#error')">Error level to report at</A>
<s:select name="error_" headerKey='' headerValue='' list="#{ '1':'1 - info ' , '2':'2 - warning' , '3':'3 - serious' , '4':'4 - program error' , '5':'5 - fatal error' }" onchange="resolveParameters()"/>
<br/>
<br/>
Print the histogram values in the output file
<s:checkbox name="histogram_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#scores_number')">Number of scores to report.</A>
<s:textfield name="scores_number_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Repeats are allowed in the scoring list
<s:checkbox name="repeats_" onclick="resolveParameters()"/>
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
<dt><a name=action><i>Action</i></a></dt>
<dd>To score a query sequence against a database of blocks, specify the query sequence file name and the blocks database name. The query can be either a protein or DNA sequence. BLIMPS converts each block in the database to a position-specific scoring matrix and scores every possible alignment between each block and the query. If the query is DNA, alignments can be scored in all six translation frames or just the reading frames of the given strand, depending on the ST field in the configuration file.</dd><dd>To score a block query against a database of sequences, specify the block file name and the sequence database name. The sequence database can be either a protein or DNA database. BLIMPS converts the query block to a position-specific scoring matrix and scores every possible alignment between it and every sequence in the database. If the database is DNA, alignments can be scored in all six translation frames or just the reading frames of the given strand.</dd>
<br></br>
<dt><a name=block_parameters_comment><i><b>Parameters for sequence against Block db (action=block)</b></i></a></dt>
<br></br>
<dt><a name=matrix_parameters_comment><i><b>Parameters for block against sequences db (action=matrix)</b></i></a></dt>
<dt><a name=matrix_file><i>A precomputed site specific scoring matrix file</i></a></dt>
<dd>Blimps will accept a matrix file, or a block file, Blimps will convert block files to position-specific scoring matrices.</dd><dd>Export to a matrix file is allowed only when scoring a block query against a database of sequences (matrix).</dd>
<br></br>
<dt><a name=control_parameters_comment><i><b>Control parameters</b></i></a></dt>
<dt><a name=conversion><i>Conversion method for converting a block to a matrix</i></a></dt>
<dd>The field value is a number. Allowed values are:</dd><dd>0 - Clustering. Same as the original method, but cleaner and without negative fields in the frequency file. It also does a weighted average of D & N to get B and of E & Q to get Z. If a B or Z is encountered, it is split between D & N or E & Q.</dd><dd>1 - uses patmat's method, needs -1 and -2 in the frequency file - can give weird numbers due to division by zero if there are zeros in the frequency file.</dd><dd>2 - Sequence weighing. (default method) This method is the same as Clustering, except the weights of the sequences are taken explicitly from user-provided weight values, rather than implicitly from the clustering.</dd>
<br></br>
<dt><a name=output_parameters_comment><i><b>Output parameters</b></i></a></dt>
<dt><a name=error><i>Error level to report at</i></a></dt>
<dd>Errors value less than the user-defined error level are not reported. The program will always handle a fatal error regardless of the error level setting.</dd>
<dt><a name=export_matrix><i>Export matrix/(matrices) to this filename</i></a></dt>
<dd>Not allowed for action = block.</dd>
<dt><a name=scores_number><i>Number of scores to report.</i></a></dt>
<dd>If the value=0 (default), the number reported is based on the query block or sequence. A number less than zero causes the program to report all scores. A value greater than zero forces the program to report exactly that number.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// action
// blocks_db
if (getValue('action_')=="block")
enable('blocks_db_');
else disable('blocks_db_');
// sequence_db
if (getValue('action_')=="matrix")
enable('sequence_db_');
else disable('sequence_db_');
// block_file
if (getValue('action_')=="matrix")
enable('block_file_');
else disable('block_file_');
// matrix_file
if (getValue('action_')=="matrix")
enable('matrix_file_');
else disable('matrix_file_');
// conversion
// genetic_code
// strand
// error
// histogram
// scores_number
// repeats
}
function validateControl() {
// action
// blocks_db
// sequence_db
// block_file
if (getValue('action_')=="matrix") {
if (getValue('matrix_file_') && getValue('block_file_')) {
alert('only one of the block or the matrix files is required');
return false;
}
}
// matrix_file
if (getValue('action_')=="matrix") {
if (getValue('matrix_file_') && getValue('block_file_')) {
alert('only one of the block or the matrix files is required');
return false;
}
}
// conversion
// genetic_code
// strand
// error
// histogram
// scores_number
// repeats
return issueWarning();
}
function issueWarning() {
// action
// blocks_db
// sequence_db
// block_file
// matrix_file
// conversion
// genetic_code
// strand
// error
// histogram
// scores_number
// repeats
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
var element = document.forms['blimps'].elements[parameter];
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
var element = document.forms['blimps'].elements[parameter];
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
var element = document.forms['blimps'].elements[parameter];
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