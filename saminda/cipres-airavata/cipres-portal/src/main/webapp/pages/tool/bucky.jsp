<%@ taglib prefix="s" uri="/struts-tags" %>
<title>BUCKy</title>
<h2>BUCKy: Bayesian Untangling of Concordance Knots (applied to yeast and other organisms) (<a href="#REFERENCE">C. Ané, B. Larget, D.A. Baum, S.D. Smith, A. Rokas</a>)</h2>
<s:form action="bucky" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#num_files')">How many files do you wish to combine?</A>
<s:textfield name="num_files_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Second Input file for mbsum
<s:select name="bb_infile2_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile2_')}" onchange="resolveParameters()"/>
<br/>
Third Input file for mbsum
<s:select name="bb_infile3_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile3_')}" onchange="resolveParameters()"/>
<br/>
Fourth Input file for mbsum
<s:select name="bb_infile4_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile4_')}" onchange="resolveParameters()"/>
<br/>
Fifth Input file for mbsum
<s:select name="bb_infile5_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile5_')}" onchange="resolveParameters()"/>
<br/>
Sixth Input file for mbsum
<s:select name="bb_infile6_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile6_')}" onchange="resolveParameters()"/>
<br/>
Seventh Input file for mbsum
<s:select name="bb_infile7_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile7_')}" onchange="resolveParameters()"/>
<br/>
Eighth Input file for mbsum
<s:select name="bb_infile8_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile8_')}" onchange="resolveParameters()"/>
<br/>
Ninth Input file for mbsum
<s:select name="bb_infile9_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile9_')}" onchange="resolveParameters()"/>
<br/>
Tenth Input file for mbsum
<s:select name="bb_infile10_" headerKey='' headerValue='' list="%{ getDataForParameter('bb_infile10_')}" onchange="resolveParameters()"/>
<br/>
Specify the output file name
<s:textfield name="set_outfile_name_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<A name=mcmcmc><h2><A HREF="javascript:help.slidedownandjump('#mcmcmc_comment')">MCMCMC runs</A></H2>
<A HREF="javascript:help.slidedownandjump('#set_nchains')">Set the number of chains (-c)</A>
<s:textfield name="set_nchains_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_mcmcmcrate')">Set the MCMCMC rate (-r)</A>
<s:textfield name="set_mcmcmcrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_alphamult')">Set the alpha-multiplier (-m)</A>
<s:textfield name="set_alphamult_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=adv_params><h2><A HREF="javascript:help.slidedownandjump('#adv_params_comment')">Advanced Run configuration</A></H2>
<A HREF="javascript:help.slidedownandjump('#set_ngen')">Set the number of updates (-n)</A>
<s:textfield name="set_ngen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Set the number of independent analyses (-k)
<s:textfield name="set_nanalyses_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Set alpha, the a priori level of discordance among loci. (-a)
<s:textfield name="set_alpha_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Set seed1 (-s1)
<s:textfield name="set_seed1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Set seed2 (-s2)
<s:textfield name="set_seed2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_cfcutoff')">Set cf cutoff (-cf)</A>
<s:textfield name="set_cfcutoff_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#prune_table')">Upload file to indicate which taxa should be retained in the analysis (-p)</A>
<s:select name="prune_table_" headerKey='' headerValue='' list="%{ getDataForParameter('prune_table_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#calc_pairs')">Calculate the posterior probability that pairs of loci share the same tree. (--calculate-pairs)</A>
<s:checkbox name="calc_pairs_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_independence_prior')">Assume that loci choose their trees independently of each other. (--use-independence-prior)</A>
<s:checkbox name="use_independence_prior_" onclick="resolveParameters()"/>
<br/>
Disable the update that changes the tree of all loci in a group in a single update. ( --do-not-use-update-groups )
<s:checkbox name="do_not_use_update_groups_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=output_files><h2><A HREF="javascript:help.slidedownandjump('#output_files_comment')">Specify Output files</A></H2>
Save samples of gene-to-tree maps. Can slow program (--create-sample-file)
<s:checkbox name="create_sample_file_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_subsamprate')">Set the subsample-rate (-s)</A>
<s:textfield name="set_subsamprate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Create a .joint file. (--create-joint-file)
<s:checkbox name="create_joint_file_" onclick="resolveParameters()"/>
<br/>
Create a .single file. (--create-single-file)
<s:checkbox name="create_single_" onclick="resolveParameters()"/>
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
<dt><a name=num_files><i>How many files do you wish to combine?</i></a></dt>
<dd>Use mbsum to summarize all files from the same locus. You want mbsum to create a file .in
for each locus. The extension .in just means input (for later analysis by bucky). Output files *.in from mbsum will typically look like the following,
containing a list of tree topologies and a tally representing the trees' posterior probabilities from a given locus (as obtained in the frst step of BCA). </dd>
<br></br>
<dt><a name=mcmcmc_comment><i><b>MCMCMC runs</b></i></a></dt>
<dt><a name=set_nchains><i>Set the number of chains (-c)</i></a></dt>
<dd>Use this option to run Metropolis coupled MCMC (or MCMCMC), whereby hot chains are run in addition to the standard (cold) chain.
These chains occasionally swap states, so as to improve their mixing. The option sets the total number of chains, including the cold one.
Default is 1, i.e. no heated chains</dd>
<dt><a name=set_mcmcmcrate><i>Set the MCMCMC rate (-r)</i></a></dt>
<dd>When Metropolis coupled MCMC is used, -r controls the rate r with which chains try to swap states: a swap is proposed once every r updates.
Default is 100.</dd>
<dt><a name=set_alphamult><i>Set the alpha-multiplier (-m)</i></a></dt>
<dd>In MCMCMC, warm and hot chains use higher values of alpha than does the cold chain.The cold chain uses the alpha value given by the option -a. warmer chains will use parameters m(alpha), m2(alpha), . . . , mc-1(alpha).
Default m is 10. The independence prior corresponds to alpha = infinity so MCMCMC is not used with this prior.</dd>
<br></br>
<dt><a name=adv_params_comment><i><b>Advanced Run configuration</b></i></a></dt>
<dt><a name=set_ngen><i>Set the number of updates (-n)</i></a></dt>
<dd>Use the -n option to increase the number of updates (default: 100,000). An extra number of updates will actually be performed for burnin.
This number will be 10% of the desired number n of post-burning updates. The default, then, is to perform 10,000 updates for burnin, which will be discarded, and then 100,000 more updates</dd>
<dt><a name=set_cfcutoff><i>Set cf cutoff (-cf)</i></a></dt>
<dd>All splits with estimated sample-wide CF above this cutoff will be included in the list to have their summary information and their genome-wide CF displayed. Default is 0.05.</dd>
<dt><a name=prune_table><i>Upload file to indicate which taxa should be retained in the analysis (-p)</i></a></dt>
<dd>While the default is to only consider taxa common to all genes, and prune all other taxa from the trees, this option allows the user to indicate which taxa should be retained in the analysis.
These taxa can be specifed by uploading a standard translate table.</dd>
<dt><a name=calc_pairs><i>Calculate the posterior probability that pairs of loci share the same tree. (--calculate-pairs)</i></a></dt>
<dd>While the default is to only consider taxa common to all genes, and prune all other taxa from the trees, this option allows the user to indicate which taxa should be retained in the analysis.
These taxa can be specifed by uploading a standard translate table.</dd>
<dt><a name=use_independence_prior><i>Assume that loci choose their trees independently of each other. (--use-independence-prior)</i></a></dt>
<dd>Use this option to assume a priori that loci choose their trees independently of each other. This is equivalent to setting alpha = infinity.</dd>
<br></br>
<dt><a name=output_files_comment><i><b>Specify Output files</b></i></a></dt>
<dt><a name=set_subsamprate><i>Set the subsample-rate (-s)</i></a></dt>
<dd>Use the -s option for thinning the sample. All post-burnin samples will be used for summarizing the posterior distribution of gene-to-tree maps, but you may choose to save just a
sub-sample of these gene-to-tree maps. One sample will be saved every s updates. This option will have an effect only if option **create-sample-file is chosen. Default is 1: no thinning..</dd>
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
// num_files
// bb_infile2
if (getValue('num_files_') > 1)
enable('bb_infile2_');
else disable('bb_infile2_');
// bb_infile3
if (getValue('num_files_') > 2)
enable('bb_infile3_');
else disable('bb_infile3_');
// bb_infile4
if (getValue('num_files_') > 3)
enable('bb_infile4_');
else disable('bb_infile4_');
// bb_infile5
if (getValue('num_files_') > 4)
enable('bb_infile5_');
else disable('bb_infile5_');
// bb_infile6
if (getValue('num_files_') > 5)
enable('bb_infile6_');
else disable('bb_infile6_');
// bb_infile7
if (getValue('num_files_') > 6)
enable('bb_infile7_');
else disable('bb_infile7_');
// bb_infile8
if (getValue('num_files_') > 7)
enable('bb_infile8_');
else disable('bb_infile8_');
// bb_infile9
if (getValue('num_files_') > 8)
enable('bb_infile9_');
else disable('bb_infile9_');
// bb_infile10
if (getValue('num_files_') > 9)
enable('bb_infile10_');
else disable('bb_infile10_');
// set_outfile_name
// set_nchains
if (!getValue('use_independence_prior_'))
enable('set_nchains_');
else disable('set_nchains_');
// set_mcmcmcrate
if (getValue('set_nchains_')!=1 && !getValue('use_independence_prior_'))
enable('set_mcmcmcrate_');
else disable('set_mcmcmcrate_');
// set_alphamult
if (getValue('set_nchains_')!=1 && !getValue('use_independence_prior_'))
enable('set_alphamult_');
else disable('set_alphamult_');
// set_ngen
// set_nanalyses
// set_alpha
// set_seed1
// set_seed2
// set_cfcutoff
// prune_table
// calc_pairs
// use_independence_prior
// do_not_use_update_groups
// create_sample_file
// set_subsamprate
if (getValue('create_sample_file_'))
enable('set_subsamprate_');
else disable('set_subsamprate_');
// create_joint_file
// create_single
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// num_files
if (getValue('num_files_') < 1) {
alert('Sorry, you must chose between 1 and 10 files for analysis');
return false;
}
if (getValue('num_files_') > 10) {
alert('Sorry, you cannot select more than 10 files for analysis');
return false;
}
// bb_infile2
// bb_infile3
// bb_infile4
// bb_infile5
// bb_infile6
// bb_infile7
// bb_infile8
// bb_infile9
// bb_infile10
// set_outfile_name
// set_nchains
// set_mcmcmcrate
// set_alphamult
// set_ngen
// set_nanalyses
// set_alpha
// set_seed1
// set_seed2
// set_cfcutoff
// prune_table
// calc_pairs
// use_independence_prior
if (getValue('set_nchains_')!=1 && getValue('use_independence_prior_')) {
alert('Sorry, you cannot choose both the independence prior and MCMCMC');
return false;
}
// do_not_use_update_groups
// create_sample_file
// set_subsamprate
// create_joint_file
// create_single
return issueWarning();
}
function issueWarning() {
// runtime
// num_files
// bb_infile2
// bb_infile3
// bb_infile4
// bb_infile5
// bb_infile6
// bb_infile7
// bb_infile8
// bb_infile9
// bb_infile10
// set_outfile_name
// set_nchains
// set_mcmcmcrate
// set_alphamult
// set_ngen
// set_nanalyses
// set_alpha
// set_seed1
// set_seed2
// set_cfcutoff
// prune_table
// calc_pairs
// use_independence_prior
// do_not_use_update_groups
// create_sample_file
// set_subsamprate
// create_joint_file
// create_single
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
var element = document.forms['bucky'].elements[parameter];
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
var element = document.forms['bucky'].elements[parameter];
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
var element = document.forms['bucky'].elements[parameter];
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