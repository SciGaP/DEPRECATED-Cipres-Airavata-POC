<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Sixpack</title>
<h2>Sixpack: Display 6-frame translation and ORFs </h2>
<s:form action="sixpack" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Code to use -- Genetic codes (-<A HREF="javascript:help.slidedownandjump('#table')">table</A>)
<font color="red" size="3">*</font>
<s:select name="table_" list="#{ '0':'Standard' , '1':'Standard (with alternative initiation codons)' , '2':'Vertebrate Mitochondrial' , '3':'Yeast Mitochondrial' , '4':'Mold, Protozoan, Coelenterate Mitochondrial and Mycoplasma/Spiroplasma' , '5':'Invertebrate Mitochondrial' , '6':'Ciliate Macronuclear and Dasycladacean' , '9':'Echinoderm Mitochondrial' , '10':'Euplotid Nuclear' , '11':'Bacterial' , '12':'Alternative Yeast Nuclear' , '13':'Ascidian Mitochondrial' , '14':'Flatworm Mitochondrial' , '15':'Blepharisma Macronuclear' , '16':'Chlorophycean Mitochondrial' , '21':'Trematode Mitochondrial' , '22':'Scenedesmus obliquus' , '23':'Thraustochytrium Mitochondrial' }" onchange="resolveParameters()"/>
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
<A name=input><h2><A HREF="javascript:help.slidedownandjump('#input_comment')">Input section</A></H2>
<hr/>
<A name=advanced><h2><A HREF="javascript:help.slidedownandjump('#advanced_comment')">Advanced section</A></H2>
ORF at the beginning of the sequence (-<A HREF="javascript:help.slidedownandjump('#firstorf')">firstorf</A>)
<font color="red" size="3">*</font>
<s:checkbox name="firstorf_" onclick="resolveParameters()"/>
<br/>
ORF at the end of the sequence (-<A HREF="javascript:help.slidedownandjump('#lastorf')">lastorf</A>)
<font color="red" size="3">*</font>
<s:checkbox name="lastorf_" onclick="resolveParameters()"/>
<br/>
ORF start with an M (-<A HREF="javascript:help.slidedownandjump('#mstart')">mstart</A>)
<font color="red" size="3">*</font>
<s:checkbox name="mstart_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=output><h2><A HREF="javascript:help.slidedownandjump('#output_comment')">Output section</A></H2>
Output format for output sequences
<s:select name="outseq_sformat_" headerKey='' headerValue='' list="#{ 'fasta':'fasta' , 'gcg':'gcg' , 'ncbi':'ncbi' , 'nbrf':'nbrf' , 'text':'text' }" onchange="resolveParameters()"/>
<br/>
<br/>
Display translation of reverse sense (-<A HREF="javascript:help.slidedownandjump('#reverse')">reverse</A>)
<font color="red" size="3">*</font>
<s:checkbox name="reverse_" onclick="resolveParameters()"/>
<br/>
Minimum size of ORFs (-<A HREF="javascript:help.slidedownandjump('#orfminsize')">orfminsize</A>)
<font color="red" size="3">*</font>
<s:textfield name="orfminsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#uppercase')">Regions to put in uppercase (eg: 4-57,78-94) (only works if your input is lower case)</A>
<font color="red" size="3">*</font>
<s:textfield name="uppercase_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Number the sequences (-<A HREF="javascript:help.slidedownandjump('#number')">number</A>)
<font color="red" size="3">*</font>
<s:checkbox name="number_" onclick="resolveParameters()"/>
<br/>
Width of sequence to display (-<A HREF="javascript:help.slidedownandjump('#width')">width</A>)
<font color="red" size="3">*</font>
<s:textfield name="width_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Line length of page (0 for indefinite) (-length)
<font color="red" size="3">*</font>
<s:textfield name="length_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Margin around sequence for numbering. (-margin)
<font color="red" size="3">*</font>
<s:textfield name="margin_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Display sequence ID (-<A HREF="javascript:help.slidedownandjump('#name')">name</A>)
<font color="red" size="3">*</font>
<s:checkbox name="name_" onclick="resolveParameters()"/>
<br/>
Display description (-<A HREF="javascript:help.slidedownandjump('#description')">description</A>)
<font color="red" size="3">*</font>
<s:checkbox name="description_" onclick="resolveParameters()"/>
<br/>
Offset to start numbering the sequence from (-<A HREF="javascript:help.slidedownandjump('#offset')">offset</A>)
<font color="red" size="3">*</font>
<s:textfield name="offset_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Use HTML formatting (-html)
<font color="red" size="3">*</font>
<s:checkbox name="html_" onclick="resolveParameters()"/>
<br/>
Regions to colour in HTML (eg: 4-57red78-94green) (-<A HREF="javascript:help.slidedownandjump('#highlight')">highlight</A>)
<font color="red" size="3">+</font>
<s:textfield name="highlight_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=advanced_comment><i><b>Advanced section</b></i></a></dt>
<dt><a name=table><i>Code to use -- Genetic codes (-table)</i></a></dt>
<dd>Genetic code used for the translation</dd>
<dt><a name=firstorf><i>ORF at the beginning of the sequence (-firstorf)</i></a></dt>
<dd>Count the beginning of a sequence as a possible open reading frame (ORF), even if it is less than
the minimal specified ORF size.</dd>
<dt><a name=lastorf><i>ORF at the end of the sequence (-lastorf)</i></a></dt>
<dd>Count the end of a sequence as a possible ORF, even if it does not end with a STOP codon,
and/or is less than the specified minimal ORF size.</dd>
<dt><a name=mstart><i>ORF start with an M (-mstart)</i></a></dt>
<dd>Displays only ORFs starting with an M.</dd>
<br></br>
<dt><a name=output_comment><i><b>Output section</b></i></a></dt>
<dt><a name=reverse><i>Display translation of reverse sense (-reverse)</i></a></dt>
<dd>Also, display the translation of the DNA sequence in the 3 reverse frames</dd>
<dt><a name=orfminsize><i>Minimum size of ORFs (-orfminsize)</i></a></dt>
<dd>Specifies the minimum size of ORFs to display in the translations.</dd>
<dt><a name=uppercase><i>Regions to put in uppercase (eg: 4-57,78-94) (only works if your input is lower case)</i></a></dt>
<dd> To use this option, regions in the sequence to be places in uppercase are specified as pairs of positions.
The positions are supplied as integers separated by any non-digit, non-alphabetical character.
Examples of valid region specifications are:</dd><dd>24-45, 56-78</dd><dd>1:45</dd><dd>67=99</dd><dd>765..888 </dd><dd>1,5,8,10,23,45,57,99</dd>
<dt><a name=number><i>Number the sequences (-number)</i></a></dt>
<dd>Number the sequence at the beginning and the end of each line.</dd>
<dt><a name=width><i>Width of sequence to display (-width)</i></a></dt>
<dd>Number of nucleotides displayed on each line</dd>
<dt><a name=name><i>Display sequence ID (-name)</i></a></dt>
<dd>Uncheck this box if you do not wish to display the ID name of the sequence.</dd>
<dt><a name=description><i>Display description (-description)</i></a></dt>
<dd>Uncheck this box if you do not wish to display the sequence description.</dd>
<dt><a name=offset><i>Offset to start numbering the sequence from (-offset)</i></a></dt>
<dd>Designate the number of the first nucleotide in your DNA sequence</dd>
<dt><a name=highlight><i>Regions to colour in HTML (eg: 4-57red78-94green) (-highlight)</i></a></dt>
<dd>Regions to colour if formatting for HTML can be specified by providing delimiting pair values along with
any valid HTML font colour. No spaces are permitted. Examples of legal region specifications are:
</dd><dd>24-45blue56-78orange</dd><dd>1-100green120-156red</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// table
// firstorf
// lastorf
// mstart
// outseq_sformat
// reverse
// orfminsize
// uppercase
// number
// width
// length
// margin
// name
// description
// offset
// html
// highlight
if (getValue('html_'))
enable('highlight_');
else disable('highlight_');
}
function validateControl() {
// table
// firstorf
// lastorf
// mstart
// outseq_sformat
// reverse
// orfminsize
// uppercase
// number
// width
// length
// margin
// name
// description
// offset
// html
// highlight
return issueWarning();
}
function issueWarning() {
// table
// firstorf
// lastorf
// mstart
// outseq_sformat
// reverse
// orfminsize
// uppercase
// number
// width
// length
// margin
// name
// description
// offset
// html
// highlight
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
var element = document.forms['sixpack'].elements[parameter];
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
var element = document.forms['sixpack'].elements[parameter];
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
var element = document.forms['sixpack'].elements[parameter];
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