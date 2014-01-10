<%@ taglib prefix="s" uri="/struts-tags" %>
<title>Drawgram</title>
<h2>Drawgram: Plots a cladogram- or phenogram- rooted tree (<a href="#REFERENCE">Felsenstein</a>)</h2>
<s:form action="drawgram" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=options><h2><A HREF="javascript:help.slidedownandjump('#options_comment')">Drawgram options</A></H2>
Which plotter or printer will the tree be drawn on
<s:select name="plotter_" headerKey='' headerValue='' list="#{ 'L':'L: Postscript printer file format' , 'M':'M: PICT format' , 'J':'J: HP Laserjet PCL file format' , 'W':'W: MS-Windows Bitmap' , 'K':'K: TeKtronix 4010 graphics terminal' , 'H':'H: Hewlett-Packard pen plotter (HPGL)' , 'D':'D: DEC ReGIS graphics (VT240 terminal)' , 'B':'B: Houston Instruments plotter' , 'E':'E: Epson MX-80 dot-matrix printer' , 'C':'C: Prowriter/Imagewriter dot-matrix printer' , 'O':'O: Okidata dot-matrix printer' , 'T':'T: Toshiba 24-pin dot-matrix printer' , 'P':'P: PCX file format' , 'X':'X: X Bitmap format' , 'F':'F: FIG 2.0 format' , 'A':'A: Idraw drawing program format' , 'Z':'Z: VRML Virtual Reality Markup Language file' , 'V':'V: POVRAY 3D rendering program file' , 'R':'R: Rayshade 3D rendering program file' }" onchange="resolveParameters()"/>
<br/>
<br/>
<hr/>
<A name=xbitmap_options><h2><A HREF="javascript:help.slidedownandjump('#xbitmap_options_comment')">Bitmap options</A></H2>
X resolution
<font color="red" size="3">+</font>
<s:textfield name="xres_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Y resolution
<font color="red" size="3">+</font>
<s:textfield name="yres_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=laserjet_options><h2><A HREF="javascript:help.slidedownandjump('#laserjet_options_comment')">Laserjet options</A></H2>
Laserjet resolution
<font color="red" size="3">+</font>
<s:radio name="laserjet_resolution_"
list="#{ '1':'1: 75 DPI' , '2':'2: 150 DPI' , '3':'3: 300 DPI' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=pcx_options><h2><A HREF="javascript:help.slidedownandjump('#pcx_options_comment')">Paintbrush options</A></H2>
Paintbrush PCX resolution
<font color="red" size="3">+</font>
<s:radio name="pcx_resolution_"
list="#{ '1':'1: EGA 640 X 350' , '2':'2: VGA 800 X 600' , '3':'3: VGA 1024 X 768' }" onclick="resolveParameters()"/>
<br/>
Tree grows...
<s:radio name="grows_"
list="#{ '': '[Not Mandatory]', 'Vertically':'Vertically' , 'Horizontally':'Horizontally' }" onclick="resolveParameters()"/>
<br/>
Tree style
<s:select name="tree_style_" headerKey='' headerValue='' list="#{ 'C':'C: Cladogram' , 'P':'P: Phenogram' , 'V':'V: Curvogram' , 'E':'E: Eurogram' , 'S':'S: Swoopogram' , 'O':'O: Circular tree' }" onchange="resolveParameters()"/>
<br/>
<br/>
Use branch lengths
<s:checkbox name="branch_lengths_" onclick="resolveParameters()"/>
<br/>
Horizontal margins
<s:textfield name="horizontal_margins_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Vertical margins
<s:textfield name="vertical_margins_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Scale of branch length (default: Automatically rescaled)
<s:textfield name="scale_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Depth/Breadth of tree
<s:textfield name="depth_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stem')">Stem-length/tree-depth</A>
<s:textfield name="stem_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#character_height')">Character ht / tip space</A>
<s:textfield name="character_height_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ancestral nodes
<s:select name="ancestral_" headerKey='' headerValue='' list="#{ 'I':'I: Intermediate' , 'W':'W: Weighted' , 'C':'C: Centered' , 'N':'N: Inner' , 'V':'V: So tree is V-shaped' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#font')">Font (PostScript only)</A>
<s:textfield name="font_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=runtime><i>Maximum Hours to Run (click here for help setting this correctly)</i></a></dt>
<dd>
Estimate the maximum time your job will need to run (up to 72 hrs). Your job will be killed if it doesn't finish within the time you specify, however jobs with shorter maximum run times are often scheduled sooner than longer jobs.
</dd>
<br></br>
<dt><a name=options_comment><i><b>Drawgram options</b></i></a></dt>
<br></br>
<dt><a name=xbitmap_options_comment><i><b>Bitmap options</b></i></a></dt>
<br></br>
<dt><a name=laserjet_options_comment><i><b>Laserjet options</b></i></a></dt>
<br></br>
<dt><a name=pcx_options_comment><i><b>Paintbrush options</b></i></a></dt>
<dt><a name=stem><i>Stem-length/tree-depth</i></a></dt>
<dd>Enter the stem length as fraction of tree depth (a value between 0 and 1).</dd>
<dt><a name=character_height><i>Character ht / tip space</i></a></dt>
<dd>Enter character height as fraction of tip spacing.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// runtime
// plotter
// xres
if (getValue('plotter_')=="X" || getValue('plotter_')=="W")
enable('xres_');
else disable('xres_');
// yres
if (getValue('plotter_')=="X" || getValue('plotter_')=="W")
enable('yres_');
else disable('yres_');
// laserjet_resolution
if (getValue('plotter_')=="J")
enable('laserjet_resolution_');
else disable('laserjet_resolution_');
// pcx_resolution
if (getValue('plotter_')=="P")
enable('pcx_resolution_');
else disable('pcx_resolution_');
// grows
// tree_style
// branch_lengths
// horizontal_margins
// vertical_margins
// scale
// depth
// stem
// character_height
// ancestral
// font
if (getValue('plotter_')=="L")
enable('font_');
else disable('font_');
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// plotter
// xres
// yres
// laserjet_resolution
// pcx_resolution
// grows
// tree_style
// branch_lengths
// horizontal_margins
// vertical_margins
// scale
// depth
// stem
if (getValue('stem_') < 0 || getValue('stem_') >= 1) {
alert('Please enter a value between 0 and 1.');
return false;
}
// character_height
// ancestral
// font
return issueWarning();
}
function issueWarning() {
// runtime
// plotter
// xres
// yres
// laserjet_resolution
// pcx_resolution
// grows
// tree_style
// branch_lengths
// horizontal_margins
// vertical_margins
// scale
// depth
// stem
// character_height
// ancestral
// font
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
var element = document.forms['drawgram'].elements[parameter];
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
var element = document.forms['drawgram'].elements[parameter];
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
var element = document.forms['drawgram'].elements[parameter];
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