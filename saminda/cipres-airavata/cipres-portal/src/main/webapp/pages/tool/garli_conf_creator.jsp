<%@ taglib prefix="s" uri="/struts-tags" %>
<title>GARLI.conf Creator</title>
<h2>GARLI.conf Creator: Creates a Garli.conf file for up to five partitions (<a href="#REFERENCE">Mark Miller</a>)</h2>
<s:form action="garli_conf_creator" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
The input is a Nexus file that specifies at least two partitions
<s:checkbox name="is_partitioned_" onclick="resolveParameters()"/>
<br/>
I would like to evaluate all partitions under a single model
<s:checkbox name="linkmodels_" onclick="resolveParameters()"/>
<br/>
I would like to specify model parameters for each partition
<s:checkbox name="configure_partitions_" onclick="resolveParameters()"/>
<br/>
How many partitions does your data set have?
<s:textfield name="numparts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#subsetspecificrates')">Infer overall rate multipliers for each data partition</A>
<s:checkbox name="subsetspecificrates_" onclick="resolveParameters()"/>
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
<A name=model><h2><A HREF="javascript:help.slidedownandjump('#model_comment')">Model Parameters (For Unpartitioned Data, or Applied to All Partitions)</A></H2>
<A HREF="javascript:help.slidedownandjump('#datatype_value')">The type of data (datatype)</A>
<font color="red" size="3">+</font>
<s:select name="datatype_value_" list="#{ 'nucleotide':'nucleotide' , 'aminoacid':'amino acid' , 'codon-aminoacid':'codon-aminoacid' , 'codon':'codon' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#geneticcode_value')">Select the Genetic Code (geneticcode)</A>
<font color="red" size="3">+</font>
<s:radio name="geneticcode_value_"
list="#{ 'standard':'Standard' , 'vertmito':'Vertebrate Mitochondria' , 'invertmito':'Invertebrate Mitochondria' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_nucleotide><h2><A HREF="javascript:help.slidedownandjump('#model_nucleotide_comment')">Nucleotide Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#d_ratematrix')">Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="d_ratematrix_" list="#{ '1rate':'All Rates Equal (1rate)' , '2rate':'HKY (2rate)' , '6rate':'General time-reversible (6 rate)' , 'fixed':'fixed rate' , 'custom_string':'User Specified' }" onchange="resolveParameters()"/>
<br/>
<br/>
User specified AC substitution rates (custom ratematrix)
<s:textfield name="ACsubrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AG substitution rates (custom ratematrix)
<s:textfield name="AGsubrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AT substitution rates (custom ratematrix)
<s:textfield name="ATsubrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CG substitution rates (custom ratematrix)
<s:textfield name="CGsubrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CT subsitution rates (custom ratematrix)
<s:textfield name="CTsubrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified GT substitution rates (custom ratematrix)
<s:textfield name="GTsubrates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Base Frequencies (statefrequencies)
<font color="red" size="3">+</font>
<s:select name="d_statefrequencies_" list="#{ 'equal':'equal' , 'empirical':'empirical' , 'estimate':'estimate' , 'fixed':'fixed' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_invariantsites')">Proportion of invariant sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="d_invariantsites_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_ratehetmodel')">The model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="d_ratehetmodel_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_numratecats')">Number of rate categories (numratecats)</A>
<s:textfield name="d_numratecats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_protein><h2><A HREF="javascript:help.slidedownandjump('#model_protein_comment')">Protein Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#p_ratematrix')">Protein Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="p_ratematrix_" list="#{ 'poisson':'Poisson' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_statefrequencies')">Amino Acid Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="p_statefrequencies_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'estimate':'estimate' , 'fixed':'fixed' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_invariantsites')">Proportion of invariable sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="p_invariantsites_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_ratehetmodel')">Model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="p_ratehetmodel_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_numratecats')">Number of rate categories (numratecats; set at no more than 8)</A>
<s:textfield name="p_numratecats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_codon><h2><A HREF="javascript:help.slidedownandjump('#model_codon_comment')">Codon Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#c_ratematrix')">Codon Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="c_ratematrix_" list="#{ '1rate':'1rate' , '2rate':'2rate' , '6rate':'6rate' , 'fixed':'fixed' , 'custom':'custom' , 'string':'string' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_statefrequencies')">Codon Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="c_statefrequencies_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'f1x4':'F1x4' , 'f3x4':'F3x4' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_ratehetmodel')">dN/dS categories (or Omega) (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="c_ratehetmodel_"
list="#{ 'none':'A single dN/dS parameter (none)' , 'nonsynonymous':'discrete or M3 model (nonsynonymous)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_numratecats')">Number of dN/dS parameter categories (numratecats)</A>
<s:textfield name="c_numratecats_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model1><h2><A HREF="javascript:help.slidedownandjump('#model1_comment')">Model Parameters for Partition 1</A></H2>
<A HREF="javascript:help.slidedownandjump('#datatype_value1')">The type of data (datatype)</A>
<font color="red" size="3">+</font>
<s:select name="datatype_value1_" list="#{ 'nucleotide':'nucleotide' , 'aminoacid':'amino acid' , 'codon-aminoacid':'codon-aminoacid' , 'codon':'codon' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#geneticcode_value1')">Select the Genetic Code (geneticcode)</A>
<font color="red" size="3">+</font>
<s:radio name="geneticcode_value1_"
list="#{ 'standard':'Standard' , 'vertmito':'Vertebrate Mitochondria' , 'invertmito':'Invertebrate Mitochondria' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_nucleotide1><h2><A HREF="javascript:help.slidedownandjump('#model_nucleotide1_comment')">Nucleotide Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#d_ratematrix1')">Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="d_ratematrix1_" list="#{ '1rate':'All Rates Equal (1rate)' , '2rate':'HKY (2rate)' , '6rate':'General time-reversible (6 rate)' , 'fixed':'fixed rate' , 'custom_string':'User Specified' }" onchange="resolveParameters()"/>
<br/>
<br/>
User specified AC substitution rates (custom ratematrix)
<s:textfield name="ACsubrates1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AG substitution rates (custom ratematrix)
<s:textfield name="AGsubrates1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AT substitution rates (custom ratematrix)
<s:textfield name="ATsubrates1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CG substitution rates (custom ratematrix)
<s:textfield name="CGsubrates1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CT subsitution rates (custom ratematrix)
<s:textfield name="CTsubrates1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified GT substitution rates (custom ratematrix)
<s:textfield name="GTsubrates1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Base Frequencies (statefrequencies)
<font color="red" size="3">+</font>
<s:select name="d_statefrequencies1_" list="#{ 'equal':'equal' , 'empirical':'empirical' , 'estimate':'estimate' , 'fixed':'fixed' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_invariantsites1')">Proportion of invariant sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="d_invariantsites1_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_ratehetmodel1')">The model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="d_ratehetmodel1_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_numratecats1')">Number of rate categories (numratecats)</A>
<s:textfield name="d_numratecats1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_protein1><h2><A HREF="javascript:help.slidedownandjump('#model_protein1_comment')">Protein Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#p_ratematrix1')">Protein Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="p_ratematrix1_" list="#{ 'poisson':'Poisson' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_statefrequencies1')">Amino Acid Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="p_statefrequencies1_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'estimate':'estimate' , 'fixed':'fixed' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_invariantsites1')">Proportion of invariable sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="p_invariantsites1_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_ratehetmodel1')">Model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="p_ratehetmodel1_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_numratecats1')">Number of rate categories (numratecats; set at no more than 8)</A>
<s:textfield name="p_numratecats1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_codon1><h2><A HREF="javascript:help.slidedownandjump('#model_codon1_comment')">Codon Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#c_ratematrix1')">Codon Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="c_ratematrix1_" list="#{ '1rate':'1rate' , '2rate':'2rate' , '6rate':'6rate' , 'fixed':'fixed' , 'custom':'custom' , 'string':'string' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_statefrequencies1')">Codon Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="c_statefrequencies1_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'f1x4':'F1x4' , 'f3x4':'F3x4' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_ratehetmodel1')">dN/dS categories (or Omega) (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="c_ratehetmodel1_"
list="#{ 'none':'A single dN/dS parameter (none)' , 'nonsynonymous':'discrete or M3 model (nonsynonymous)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_numratecats1')">Number of dN/dS parameter categories (numratecats)</A>
<s:textfield name="c_numratecats1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model2><h2><A HREF="javascript:help.slidedownandjump('#model2_comment')">Model Parameters for Partition 2</A></H2>
<A HREF="javascript:help.slidedownandjump('#datatype_value2')">The type of data (datatype)</A>
<font color="red" size="3">+</font>
<s:select name="datatype_value2_" list="#{ 'nucleotide':'nucleotide' , 'aminoacid':'amino acid' , 'codon-aminoacid':'codon-aminoacid' , 'codon':'codon' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#geneticcode_value2')">Select the Genetic Code (geneticcode)</A>
<font color="red" size="3">+</font>
<s:radio name="geneticcode_value2_"
list="#{ 'standard':'Standard' , 'vertmito':'Vertebrate Mitochondria' , 'invertmito':'Invertebrate Mitochondria' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_nucleotide2><h2><A HREF="javascript:help.slidedownandjump('#model_nucleotide2_comment')">Nucleotide Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#d_ratematrix2')">Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="d_ratematrix2_" list="#{ '1rate':'All Rates Equal (1rate)' , '2rate':'HKY (2rate)' , '6rate':'General time-reversible (6 rate)' , 'fixed':'fixed rate' , 'custom_string':'User Specified' }" onchange="resolveParameters()"/>
<br/>
<br/>
User specified AC substitution rates (custom ratematrix)
<s:textfield name="ACsubrates2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AG substitution rates (custom ratematrix)
<s:textfield name="AGsubrates2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AT substitution rates (custom ratematrix)
<s:textfield name="ATsubrates2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CG substitution rates (custom ratematrix)
<s:textfield name="CGsubrates2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CT subsitution rates (custom ratematrix)
<s:textfield name="CTsubrates2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified GT substitution rates (custom ratematrix)
<s:textfield name="GTsubrates2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Base Frequencies (statefrequencies)
<font color="red" size="3">+</font>
<s:select name="d_statefrequencies2_" list="#{ 'equal':'equal' , 'empirical':'empirical' , 'estimate':'estimate' , 'fixed':'fixed' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_invariantsites2')">Proportion of invariant sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="d_invariantsites2_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_ratehetmodel2')">The model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="d_ratehetmodel2_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_numratecats2')">Number of rate categories (numratecats)</A>
<s:textfield name="d_numratecats2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_protein2><h2><A HREF="javascript:help.slidedownandjump('#model_protein2_comment')">Protein Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#p_ratematrix2')">Protein Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="p_ratematrix2_" list="#{ 'poisson':'Poisson' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_statefrequencies2')">Amino Acid Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="p_statefrequencies2_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'estimate':'estimate' , 'fixed':'fixed' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_invariantsites2')">Proportion of invariable sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="p_invariantsites2_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_ratehetmodel2')">Model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="p_ratehetmodel2_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_numratecats2')">Number of rate categories (numratecats; set at no more than 8)</A>
<s:textfield name="p_numratecats2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_codon2><h2><A HREF="javascript:help.slidedownandjump('#model_codon2_comment')">Codon Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#c_ratematrix2')">Codon Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="c_ratematrix2_" list="#{ '1rate':'1rate' , '2rate':'2rate' , '6rate':'6rate' , 'fixed':'fixed' , 'custom':'custom' , 'string':'string' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_statefrequencies2')">Codon Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="c_statefrequencies2_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'f1x4':'F1x4' , 'f3x4':'F3x4' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_ratehetmodel2')">dN/dS categories (or Omega) (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="c_ratehetmodel2_"
list="#{ 'none':'A single dN/dS parameter (none)' , 'nonsynonymous':'discrete or M3 model (nonsynonymous)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_numratecats2')">Number of dN/dS parameter categories (numratecats)</A>
<s:textfield name="c_numratecats2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model3><h2><A HREF="javascript:help.slidedownandjump('#model3_comment')">Model Parameters for Partition 3</A></H2>
<A HREF="javascript:help.slidedownandjump('#datatype_value3')">The type of data (datatype)</A>
<font color="red" size="3">+</font>
<s:select name="datatype_value3_" list="#{ 'nucleotide':'nucleotide' , 'aminoacid':'amino acid' , 'codon-aminoacid':'codon-aminoacid' , 'codon':'codon' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#geneticcode_value3')">Select the Genetic Code (geneticcode)</A>
<font color="red" size="3">+</font>
<s:radio name="geneticcode_value3_"
list="#{ 'standard':'Standard' , 'vertmito':'Vertebrate Mitochondria' , 'invertmito':'Invertebrate Mitochondria' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_nucleotide3><h2><A HREF="javascript:help.slidedownandjump('#model_nucleotide3_comment')">Nucleotide Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#d_ratematrix3')">Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="d_ratematrix3_" list="#{ '1rate':'All Rates Equal (1rate)' , '2rate':'HKY (2rate)' , '6rate':'General time-reversible (6 rate)' , 'fixed':'fixed rate' , 'custom_string':'User Specified' }" onchange="resolveParameters()"/>
<br/>
<br/>
User specified AC substitution rates (custom ratematrix)
<s:textfield name="ACsubrates3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AG substitution rates (custom ratematrix)
<s:textfield name="AGsubrates3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AT substitution rates (custom ratematrix)
<s:textfield name="ATsubrates3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CG substitution rates (custom ratematrix)
<s:textfield name="CGsubrates3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CT subsitution rates (custom ratematrix)
<s:textfield name="CTsubrates3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified GT substitution rates (custom ratematrix)
<s:textfield name="GTsubrates3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Base Frequencies (statefrequencies)
<font color="red" size="3">+</font>
<s:select name="d_statefrequencies3_" list="#{ 'equal':'equal' , 'empirical':'empirical' , 'estimate':'estimate' , 'fixed':'fixed' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_invariantsites3')">Proportion of invariant sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="d_invariantsites3_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_ratehetmodel3')">The model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="d_ratehetmodel3_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_numratecats3')">Number of rate categories (numratecats)</A>
<s:textfield name="d_numratecats3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_protein3><h2><A HREF="javascript:help.slidedownandjump('#model_protein3_comment')">Protein Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#p_ratematrix3')">Protein Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="p_ratematrix3_" list="#{ 'poisson':'Poisson' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_statefrequencies3')">Amino Acid Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="p_statefrequencies3_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'estimate':'estimate' , 'fixed':'fixed' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_invariantsites3')">Proportion of invariable sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="p_invariantsites3_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_ratehetmodel3')">Model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="p_ratehetmodel3_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_numratecats3')">Number of rate categories (numratecats; set at no more than 8)</A>
<s:textfield name="p_numratecats3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_codon3><h2><A HREF="javascript:help.slidedownandjump('#model_codon3_comment')">Codon Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#c_ratematrix3')">Codon Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="c_ratematrix3_" list="#{ '1rate':'1rate' , '2rate':'2rate' , '6rate':'6rate' , 'fixed':'fixed' , 'custom':'custom' , 'string':'string' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_statefrequencies3')">Codon Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="c_statefrequencies3_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'f1x4':'F1x4' , 'f3x4':'F3x4' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_ratehetmodel3')">dN/dS categories (or Omega) (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="c_ratehetmodel3_"
list="#{ 'none':'A single dN/dS parameter (none)' , 'nonsynonymous':'discrete or M3 model (nonsynonymous)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_numratecats3')">Number of dN/dS parameter categories (numratecats)</A>
<s:textfield name="c_numratecats3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model4><h2><A HREF="javascript:help.slidedownandjump('#model4_comment')">Model Parameters for Partition 4</A></H2>
<A HREF="javascript:help.slidedownandjump('#datatype_value4')">The type of data (datatype)</A>
<font color="red" size="3">+</font>
<s:select name="datatype_value4_" list="#{ 'nucleotide':'nucleotide' , 'aminoacid':'amino acid' , 'codon-aminoacid':'codon-aminoacid' , 'codon':'codon' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#geneticcode_value4')">Select the Genetic Code (geneticcode)</A>
<font color="red" size="3">+</font>
<s:radio name="geneticcode_value4_"
list="#{ 'standard':'Standard' , 'vertmito':'Vertebrate Mitochondria' , 'invertmito':'Invertebrate Mitochondria' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_nucleotide4><h2><A HREF="javascript:help.slidedownandjump('#model_nucleotide4_comment')">Nucleotide Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#d_ratematrix4')">Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="d_ratematrix4_" list="#{ '1rate':'All Rates Equal (1rate)' , '2rate':'HKY (2rate)' , '6rate':'General time-reversible (6 rate)' , 'fixed':'fixed rate' , 'custom_string':'User Specified' }" onchange="resolveParameters()"/>
<br/>
<br/>
User specified AC substitution rates (custom ratematrix)
<s:textfield name="ACsubrates4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AG substitution rates (custom ratematrix)
<s:textfield name="AGsubrates4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AT substitution rates (custom ratematrix)
<s:textfield name="ATsubrates4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CG substitution rates (custom ratematrix)
<s:textfield name="CGsubrates4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CT subsitution rates (custom ratematrix)
<s:textfield name="CTsubrates4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified GT substitution rates (custom ratematrix)
<s:textfield name="GTsubrates4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Base Frequencies (statefrequencies)
<font color="red" size="3">+</font>
<s:select name="d_statefrequencies4_" list="#{ 'equal':'equal' , 'empirical':'empirical' , 'estimate':'estimate' , 'fixed':'fixed' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_invariantsites4')">Proportion of invariant sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="d_invariantsites4_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_ratehetmodel4')">The model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="d_ratehetmodel4_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_numratecats4')">Number of rate categories (numratecats)</A>
<s:textfield name="d_numratecats4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_protein4><h2><A HREF="javascript:help.slidedownandjump('#model_protein4_comment')">Protein Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#p_ratematrix4')">Protein Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="p_ratematrix4_" list="#{ 'poisson':'Poisson' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_statefrequencies4')">Amino Acid Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="p_statefrequencies4_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'estimate':'estimate' , 'fixed':'fixed' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_invariantsites4')">Proportion of invariable sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="p_invariantsites4_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_ratehetmodel4')">Model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="p_ratehetmodel4_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_numratecats4')">Number of rate categories (numratecats; set at no more than 8)</A>
<s:textfield name="p_numratecats4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_codon4><h2><A HREF="javascript:help.slidedownandjump('#model_codon4_comment')">Codon Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#c_ratematrix4')">Codon Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="c_ratematrix4_" list="#{ '1rate':'1rate' , '2rate':'2rate' , '6rate':'6rate' , 'fixed':'fixed' , 'custom':'custom' , 'string':'string' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_statefrequencies4')">Codon Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="c_statefrequencies4_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'f1x4':'F1x4' , 'f3x4':'F3x4' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_ratehetmodel4')">dN/dS categories (or Omega) (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="c_ratehetmodel4_"
list="#{ 'none':'A single dN/dS parameter (none)' , 'nonsynonymous':'discrete or M3 model (nonsynonymous)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_numratecats4')">Number of dN/dS parameter categories (numratecats)</A>
<s:textfield name="c_numratecats4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model5><h2><A HREF="javascript:help.slidedownandjump('#model5_comment')">Model Parameters for Partition 5</A></H2>
<A HREF="javascript:help.slidedownandjump('#datatype_value5')">The type of data (datatype)</A>
<font color="red" size="3">+</font>
<s:select name="datatype_value5_" list="#{ 'nucleotide':'nucleotide' , 'aminoacid':'amino acid' , 'codon-aminoacid':'codon-aminoacid' , 'codon':'codon' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#geneticcode_value5')">Select the Genetic Code (geneticcode)</A>
<font color="red" size="3">+</font>
<s:radio name="geneticcode_value5_"
list="#{ 'standard':'Standard' , 'vertmito':'Vertebrate Mitochondria' , 'invertmito':'Invertebrate Mitochondria' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_nucleotide5><h2><A HREF="javascript:help.slidedownandjump('#model_nucleotide5_comment')">Nucleotide Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#d_ratematrix5')">Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="d_ratematrix5_" list="#{ '1rate':'All Rates Equal (1rate)' , '2rate':'HKY (2rate)' , '6rate':'General time-reversible (6 rate)' , 'fixed':'fixed rate' , 'custom_string':'User Specified' }" onchange="resolveParameters()"/>
<br/>
<br/>
User specified AC substitution rates (custom ratematrix)
<s:textfield name="ACsubrates5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AG substitution rates (custom ratematrix)
<s:textfield name="AGsubrates5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified AT substitution rates (custom ratematrix)
<s:textfield name="ATsubrates5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CG substitution rates (custom ratematrix)
<s:textfield name="CGsubrates5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified CT subsitution rates (custom ratematrix)
<s:textfield name="CTsubrates5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
User specified GT substitution rates (custom ratematrix)
<s:textfield name="GTsubrates5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Base Frequencies (statefrequencies)
<font color="red" size="3">+</font>
<s:select name="d_statefrequencies5_" list="#{ 'equal':'equal' , 'empirical':'empirical' , 'estimate':'estimate' , 'fixed':'fixed' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_invariantsites5')">Proportion of invariant sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="d_invariantsites5_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_ratehetmodel5')">The model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="d_ratehetmodel5_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#d_numratecats5')">Number of rate categories (numratecats)</A>
<s:textfield name="d_numratecats5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_protein5><h2><A HREF="javascript:help.slidedownandjump('#model_protein5_comment')">Protein Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#p_ratematrix5')">Protein Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="p_ratematrix5_" list="#{ 'poisson':'Poisson' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_statefrequencies5')">Amino Acid Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="p_statefrequencies5_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'estimate':'estimate' , 'fixed':'fixed' , 'jones':'Jones' , 'dayhoff':'Dayhoff' , 'wag':'WAG' , 'mtmam':'mtMAM' , 'mtrev':'mtREV' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_invariantsites5')">Proportion of invariable sites (invariantsites)</A>
<font color="red" size="3">+</font>
<s:radio name="p_invariantsites5_"
list="#{ 'none':'none' , 'estimate':'estimate' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_ratehetmodel5')">Model of rate heterogeneity (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="p_ratehetmodel5_"
list="#{ 'none':'Equal Rates For All Sites (none)' , 'gamma':'Gamma Distribution (gamma)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#p_numratecats5')">Number of rate categories (numratecats; set at no more than 8)</A>
<s:textfield name="p_numratecats5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_codon5><h2><A HREF="javascript:help.slidedownandjump('#model_codon5_comment')">Codon Model</A></H2>
<A HREF="javascript:help.slidedownandjump('#c_ratematrix5')">Codon Rate Matrix (ratematrix)</A>
<font color="red" size="3">+</font>
<s:select name="c_ratematrix5_" list="#{ '1rate':'1rate' , '2rate':'2rate' , '6rate':'6rate' , 'fixed':'fixed' , 'custom':'custom' , 'string':'string' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_statefrequencies5')">Codon Frequencies (statefequencies)</A>
<font color="red" size="3">+</font>
<s:select name="c_statefrequencies5_" list="#{ 'equal':'equal' , 'empirical':'empirical (+F)' , 'f1x4':'F1x4' , 'f3x4':'F3x4' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_ratehetmodel5')">dN/dS categories (or Omega) (ratehetmodel)</A>
<font color="red" size="3">+</font>
<s:radio name="c_ratehetmodel5_"
list="#{ 'none':'A single dN/dS parameter (none)' , 'nonsynonymous':'discrete or M3 model (nonsynonymous)' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#c_numratecats5')">Number of dN/dS parameter categories (numratecats)</A>
<s:textfield name="c_numratecats5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=model_trees><h2><A HREF="javascript:help.slidedownandjump('#model_trees_comment')">Run Configuration</A></H2>
<A HREF="javascript:help.slidedownandjump('#streefname_choose')">Specify where the starting tree topology comes from (streefname)</A>
<font color="red" size="3">*</font>
<s:radio name="streefname_choose_"
list="#{ 'random':'random' , 'stepwise':'stepwise' , 'upload':'upload' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#attachments_val')">Specify the number of attachment branches evaluated for each taxon (attachmentspertaxon)</A>
<font color="red" size="3">+</font>
<s:textfield name="attachments_val_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#searchreps_value')">Specify the number of independent search replicates to perform during a program execution.(searchreps)</A>
<font color="red" size="3">*</font>
<s:textfield name="searchreps_value_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Bootstrap Repetitions (-<A HREF="javascript:help.slidedownandjump('#bootstrapreps')">bootstrapreps</A>)
<font color="red" size="3">+</font>
<s:textfield name="bootstrapreps_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#outgroup_tax')">Outgroup taxa numbers, separated by spaces (outgroup)</A>
<s:textfield name="outgroup_tax_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Collapse minimum length branches (effectively zero length) branch upon output of the final tree
<s:checkbox name="collapsebranches_g_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#constraintfile')">I want to use a Constraint File (constraintfile; Newick format)</A>
<s:checkbox name="constraintfile_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=model_initialization><h2><A HREF="javascript:help.slidedownandjump('#model_initialization_comment')">Initialization</A></H2>
<A HREF="javascript:help.slidedownandjump('#refinestart')">Perform Initial Rough Optimization (refinestart)</A>
<s:checkbox name="refinestart_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#randseed')">Random Seed ( -1 means it will be chosen for you) </A>
<s:textfield name="randseed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=algorithm><h2><A HREF="javascript:help.slidedownandjump('#algorithm_comment')">Genetic Algorithm</A></H2>
<hr/>
<A name=algorithm_population><h2><A HREF="javascript:help.slidedownandjump('#algorithm_population_comment')">Population</A></H2>
<A HREF="javascript:help.slidedownandjump('#selectionintensity')">Selection Intensity (0.01 to 5.0) (selectionintensity)</A>
<s:textfield name="selectionintensity_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nindivs')">Number of Individuals (nindivs 2 to 100)</A>
<s:textfield name="nindivs_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=algorithm_brlen><h2><A HREF="javascript:help.slidedownandjump('#algorithm_brlen_comment')">Branch-length Optimization</A></H2>
Starting Precision (startoptprec: 0.005 - 5.0)
<s:textfield name="startoptprec_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum Precision (minoptprec: 0.001 - 0.01)
<s:textfield name="minoptprec_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#numberofprecreductions')">Number of Precision Reductions (0 - 100)</A>
<s:textfield name="numberofprecreductions_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=algorithm_mutation_prior_weighting><h2><A HREF="javascript:help.slidedownandjump('#algorithm_mutation_prior_weighting_comment')">Mutation Prior Weighting</A></H2>
<A HREF="javascript:help.slidedownandjump('#modweight')">Model Mutations (modweight)</A>
<s:textfield name="modweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#brlenweight')">Branch-length Mutations (brlenweight)</A>
<s:textfield name="brlenweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#topoweight')">All Topology Mutations (topoweight)</A>
<s:textfield name="topoweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#randnniweight')">NNI Mutations (randnniweight)</A>
<s:textfield name="randnniweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#randsprweight')">SPR Mutations (randsprweight)</A>
<s:textfield name="randsprweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#limsprweight')">Limited SPR Mutations (limsprweight)</A>
<s:textfield name="limsprweight_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=algorithm_mutation_details><h2><A HREF="javascript:help.slidedownandjump('#algorithm_mutation_details_comment')">Mutation Details</A></H2>
<A HREF="javascript:help.slidedownandjump('#limsprrange')">Max Limited SPR Branch Movement (limsprrange)</A>
<s:textfield name="limsprrange_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Unique Swap Bias (uniqueswapbias)
<s:textfield name="uniqueswapbias_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=general_logs><h2><A HREF="javascript:help.slidedownandjump('#general_logs_comment')">Logs</A></H2>
Save best tree with interval (saveevery)
<s:textfield name="saveevery_g_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Output current best tree at "savevery" interval (outputcurrentbesttopology)
<s:checkbox name="outputcurrentbesttopology_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#logevery_g')">Save best score with interval (logevery)</A>
<s:textfield name="logevery_g_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#outputeachbettertopology_g')">Save each improved topology (outputeachbettertopology; can result in a very large file)</A>
<s:checkbox name="outputeachbettertopology_g_" onclick="resolveParameters()"/>
<br/>
Output state probabilities of internal nodes (inferinternalstateprobs)
<s:checkbox name="inferinternalstateprobs_g_" onclick="resolveParameters()"/>
<br/>
Output PHYLIP-format tree (outputphyliptree)
<s:checkbox name="outputphyliptree_g_" onclick="resolveParameters()"/>
<br/>
Output files of questionable utility
<s:checkbox name="outputmostlyuselessfiles_g_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=general_run><h2><A HREF="javascript:help.slidedownandjump('#general_run_comment')"> Run Termination</A></H2>
Automatically terminate run (enforcetermconditions; recommended)
<s:checkbox name="enforcetermconditions_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#genthreshfortopoterm')">Generations without improving topology (genthreshfortopoterm)</A>
<s:textfield name="genthreshfortopoterm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#significanttopochange')">lnL increase for significantly better topology (significanttopochange)</A>
<s:textfield name="significanttopochange_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#scorethreshforterm')">Score improvement threshold (scorethreshforterm)</A>
<s:textfield name="scorethreshforterm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stopgen')">Limit generations to maximum of (stopgen)</A>
<s:textfield name="stopgen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stoptime')">Limit run time to maximum of (stoptime, in seconds)</A>
<s:textfield name="stoptime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#resampleproportion')">Resampling where the pseudoreplicate datasets have a different number of alignment columns than the real data (resampleproportion)</A>
<s:textfield name="resampleproportion_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=subsetspecificrates><i>Infer overall rate multipliers for each data partition</i></a></dt>
<dd>The parameter subsetspecificrates means to infer overall rate multipliers for each data subset.
This is equivalent to *prset ratepr=variable* in MrBayes. So, there are 4 possible combinations:
linkmodels = 0 subsetspecificrates= 0 meaning different models, branch lengths equal
linkmodels = 0 subsetspecificrates= 1 meaning different models, different subset rates
linkmodels = 1 subsetspecificrates= 0 meaning single model, one set of branch lengths (equivalent to non-partitioned analysis)
linkmodels = 1 subsetspecificrates= 1 meaning single model, different subset rates (like site-specific rates model in PAUP*)
</dd>
<br></br>
<dt><a name=model_comment><i><b>Model Parameters (For Unpartitioned Data, or Applied to All Partitions)</b></i></a></dt>
<dt><a name=datatype_value><i>The type of data (datatype)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set.</dd>
<dt><a name=geneticcode_value><i>Select the Genetic Code (geneticcode)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set. </dd>
<br></br>
<dt><a name=model_nucleotide_comment><i><b>Nucleotide Model</b></i></a></dt>
<dd>
</dd><dd>JC (Jukes-Cantor model): Rate Matrix = 1 rate, Base Frequencies = equal</dd><dd>
</dd><dd>K2P (Kimura 2-Parameter model): Rate Matrix = 2 rate, Base Frequencies = equal</dd><dd>
</dd><dd>F81 (Felsenstein 1981 model): Rate Matrix = 1 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>HKY (Hasegawa, Kishino and Yano model): Rate Matrix = 2 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>GTR (General Time-Reversible model): Rate Matrix = 6 rate, Base Frequencies = estimate</dd><dd>
</dd>
<dt><a name=d_ratematrix><i>Rate Matrix (ratematrix)</i></a></dt>
<dd>New in version 0.96, parameters for any submodel of the GTR model may now be estimated. The format for specifying this is very similar to that used in the rclass setting of PAUP*. Within parentheses, six letters are specified, with spaces between them. The six letters represent the rates of substitution between the six pairs of nucleotides, with the order being A-C, A-G, A-T, C-G, C-T and G-T. Letters within the parentheses that are the same mean that a single parameter is shared by multiple nucleotide pairs. For example, ratematrix = (a b a a b a) would specify the HKY 2-rate model (equivalent to ratematrix = 2rate). This entry, ratematrix = (a b c c b a) would specify 3 estimated rates of substitution, with one rate shared by A-C and G-T substitutions, another rate shared by A-G and C-T substitutions, and the final rate shared by A-T and C-G substitutions.</dd>
<dt><a name=d_invariantsites><i>Proportion of invariant sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=d_ratehetmodel><i>The model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=d_numratecats><i>Number of rate categories (numratecats)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_protein_comment><i><b>Protein Model</b></i></a></dt>
<dd>
</dd><dd>dayhoff Dayhoff, Schwartz and Orcutt. 1978 </dd><dd>
</dd><dd>jones Jones, Taylor and Thornton (JTT), 1992 </dd><dd>
</dd><dd>WAG Whelan and Goldman, 2001 </dd><dd>
</dd><dd>mtREV Adachi and Hasegawa, 1996 </dd><dd>
</dd><dd>mtmam Yang, Nielsen and Hasegawa. 1998 </dd><dd>
</dd>
<dt><a name=p_ratematrix><i>Protein Rate Matrix (ratematrix)</i></a></dt>
<dd>You should use the matrix that gives the best likelihood, and could use a program like PROTTEST (very much like MODELTEST, but for amino acid models) to determine which fits best for your data. Poisson assumes a single rate of substitution between all amino acid pairs, and is a very poor model.</dd>
<dt><a name=p_statefrequencies><i>Amino Acid Frequencies (statefequencies)</i></a></dt>
<dd>Specifies how the equilibrium state frequencies of the 20 amino acids are treated. The empirical option fixes the frequencies at their observed proportions (when describing a model this is often termed +F).</dd>
<dt><a name=p_invariantsites><i>Proportion of invariable sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=p_ratehetmodel><i>Model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=p_numratecats><i>Number of rate categories (numratecats; set at no more than 8)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_codon_comment><i><b>Codon Model</b></i></a></dt>
<dd>
</dd><dd>The codon models are built with three components: (1) parameters describing
the process of individual nucleotide substitutions, (2) equilibrium codon
frequencies, and (3) parameters describing the relative rate of nonsynonymous to
synonymous substitutions. The nucleotide substitution parameters within the codon
models are exactly the same as those possible with standard nucleotide models in
GARLI, and are specified with the ratematrix configuration entry. Thus, they can
be of the 2rate variety (inferring different rates for transitions and transversions,
K2P or HKY-like), the 6rate variety (inferring different rates for all nucleotide
pairs, GTR-like) or any other sub-model of GTR. The options for codon frequencies are
specified with the statefrequencies configuration entry. The options are to use
equal frequencies (not a good option), the frequencies observed in your dataset
(termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4
methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately. The final component of the codon models is the nonsynonymous to synonymous relative rate parameters (aka dN/dS or omega parameters). The default is to infer a single dN/dS value. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is
the discrete or M3 model in PAML's terminology.</dd><dd>
</dd><dd>From the Author: No stop codons under the chosen genetic code are allowed.
These are: standard code (TAG, TAA and TGA); vertebrate mitochondria
(TAG, TAA, AGA and AGG); invertebrate mitochondria (TAG and TAA).
One might argue that stop codons should just be ignored and treated as missing,
but this can be dangerous. Sometimes they will come from a sequencing error, but
more often from an alignment problem, an incorrectly chosen genetic code, or a
sequence that is not really coding (e.g. an intron). In any case, error should be examined and
resolved consciously by the user.
</dd><dd>
One thing to note is that codon models for tree inference require that you align
the protein coding sequences along a correct reading frame; (e.g., gaps of 1 or 2
bases will impair the analysis). Maintaining the reading frame makes alignment
much easier even if your analysis will be at the nucleotide level. Just running
sequences through a sequence alignment program without looking is almost guaranteed
to return an alignment that will not work for codon based inference.</dd><dd>
</dd><dd>The other important restriction to note is that GARLI expects the alignment to begin on the first base of a codon. It can't figure out where the reading frame is, so if the alignment starts with a partial codon it needs to be removed or excluded from the alignment. Version 0.96 does allow normal NEXUS exclusions through an assumptions block, so the following would work to exclude the first two bases of an alignment and tell GARLI that the reading frame starts on the third.
begin assumptions;
exset * myexset = 1 2;
end;.
</dd><dd>
</dd>
<dt><a name=c_ratematrix><i>Codon Rate Matrix (ratematrix)</i></a></dt>
<dd>This determines the relative rates of nucleotide substitution assumed by the codon model. The options are exactly the same as those allowed under a normal nucleotide model. A codon model with ratematrix = 2rate specifies the standard Goldman and Yang (1994) model, with different substitution rates for transitions and transversions.</dd>
<dt><a name=c_statefrequencies><i>Codon Frequencies (statefequencies)</i></a></dt>
<dd>The options are to use equal codon frequencies (not a good option), the frequencies observed in your dataset (termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4 methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately.</dd>
<dt><a name=c_ratehetmodel><i>dN/dS categories (or Omega) (ratehetmodel)</i></a></dt>
<dd>For codon models, the default is to infer a single dN/dS parameter. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is the discrete or M3 model of Yang et al. (2000).</dd>
<dt><a name=c_numratecats><i>Number of dN/dS parameter categories (numratecats)</i></a></dt>
<dd>When ratehetmodel = nonsynonymous, this is the number of dN/dS parameter categories. </dd>
<br></br>
<dt><a name=model1_comment><i><b>Model Parameters for Partition 1</b></i></a></dt>
<dt><a name=datatype_value1><i>The type of data (datatype)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set.</dd>
<dt><a name=geneticcode_value1><i>Select the Genetic Code (geneticcode)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set. </dd>
<br></br>
<dt><a name=model_nucleotide1_comment><i><b>Nucleotide Model</b></i></a></dt>
<dd>
</dd><dd>JC (Jukes-Cantor model): Rate Matrix = 1 rate, Base Frequencies = equal</dd><dd>
</dd><dd>K2P (Kimura 2-Parameter model): Rate Matrix = 2 rate, Base Frequencies = equal</dd><dd>
</dd><dd>F81 (Felsenstein 1981 model): Rate Matrix = 1 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>HKY (Hasegawa, Kishino and Yano model): Rate Matrix = 2 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>GTR (General Time-Reversible model): Rate Matrix = 6 rate, Base Frequencies = estimate</dd><dd>
</dd>
<dt><a name=d_ratematrix1><i>Rate Matrix (ratematrix)</i></a></dt>
<dd>New in version 0.96, parameters for any submodel of the GTR model may now be estimated. The format for specifying this is very similar to that used in the rclass setting of PAUP*. Within parentheses, six letters are specified, with spaces between them. The six letters represent the rates of substitution between the six pairs of nucleotides, with the order being A-C, A-G, A-T, C-G, C-T and G-T. Letters within the parentheses that are the same mean that a single parameter is shared by multiple nucleotide pairs. For example, ratematrix = (a b a a b a) would specify the HKY 2-rate model (equivalent to ratematrix = 2rate). This entry, ratematrix = (a b c c b a) would specify 3 estimated rates of substitution, with one rate shared by A-C and G-T substitutions, another rate shared by A-G and C-T substitutions, and the final rate shared by A-T and C-G substitutions.</dd>
<dt><a name=d_invariantsites1><i>Proportion of invariant sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=d_ratehetmodel1><i>The model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=d_numratecats1><i>Number of rate categories (numratecats)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_protein1_comment><i><b>Protein Model</b></i></a></dt>
<dd>
</dd><dd>dayhoff Dayhoff, Schwartz and Orcutt. 1978 </dd><dd>
</dd><dd>jones Jones, Taylor and Thornton (JTT), 1992 </dd><dd>
</dd><dd>WAG Whelan and Goldman, 2001 </dd><dd>
</dd><dd>mtREV Adachi and Hasegawa, 1996 </dd><dd>
</dd><dd>mtmam Yang, Nielsen and Hasegawa. 1998 </dd><dd>
</dd>
<dt><a name=p_ratematrix1><i>Protein Rate Matrix (ratematrix)</i></a></dt>
<dd>You should use the matrix that gives the best likelihood, and could use a program like PROTTEST (very much like MODELTEST, but for amino acid models) to determine which fits best for your data. Poisson assumes a single rate of substitution between all amino acid pairs, and is a very poor model.</dd>
<dt><a name=p_statefrequencies1><i>Amino Acid Frequencies (statefequencies)</i></a></dt>
<dd>Specifies how the equilibrium state frequencies of the 20 amino acids are treated. The empirical option fixes the frequencies at their observed proportions (when describing a model this is often termed +F).</dd>
<dt><a name=p_invariantsites1><i>Proportion of invariable sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=p_ratehetmodel1><i>Model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=p_numratecats1><i>Number of rate categories (numratecats; set at no more than 8)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_codon1_comment><i><b>Codon Model</b></i></a></dt>
<dd>
</dd><dd>The codon models are built with three components: (1) parameters describing
the process of individual nucleotide substitutions, (2) equilibrium codon
frequencies, and (3) parameters describing the relative rate of nonsynonymous to
synonymous substitutions. The nucleotide substitution parameters within the codon
models are exactly the same as those possible with standard nucleotide models in
GARLI, and are specified with the ratematrix configuration entry. Thus, they can
be of the 2rate variety (inferring different rates for transitions and transversions,
K2P or HKY-like), the 6rate variety (inferring different rates for all nucleotide
pairs, GTR-like) or any other sub-model of GTR. The options for codon frequencies are
specified with the statefrequencies configuration entry. The options are to use
equal frequencies (not a good option), the frequencies observed in your dataset
(termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4
methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately. The final component of the codon models is the nonsynonymous to synonymous relative rate parameters (aka dN/dS or omega parameters). The default is to infer a single dN/dS value. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is
the discrete or M3 model in PAML's terminology.</dd><dd>
</dd><dd>From the Author: No stop codons under the chosen genetic code are allowed.
These are: standard code (TAG, TAA and TGA); vertebrate mitochondria
(TAG, TAA, AGA and AGG); invertebrate mitochondria (TAG and TAA).
One might argue that stop codons should just be ignored and treated as missing,
but this can be dangerous. Sometimes they will come from a sequencing error, but
more often from an alignment problem, an incorrectly chosen genetic code, or a
sequence that is not really coding (e.g. an intron). In any case, error should be examined and
resolved consciously by the user.
</dd><dd>
One thing to note is that codon models for tree inference require that you align
the protein coding sequences along a correct reading frame; (e.g., gaps of 1 or 2
bases will impair the analysis). Maintaining the reading frame makes alignment
much easier even if your analysis will be at the nucleotide level. Just running
sequences through a sequence alignment program without looking is almost guaranteed
to return an alignment that will not work for codon based inference.</dd><dd>
</dd><dd>The other important restriction to note is that GARLI expects the alignment to begin on the first base of a codon. It can't figure out where the reading frame is, so if the alignment starts with a partial codon it needs to be removed or excluded from the alignment. Version 0.96 does allow normal NEXUS exclusions through an assumptions block, so the following would work to exclude the first two bases of an alignment and tell GARLI that the reading frame starts on the third.
begin assumptions;
exset * myexset = 1 2;
end;.
</dd><dd>
</dd>
<dt><a name=c_ratematrix1><i>Codon Rate Matrix (ratematrix)</i></a></dt>
<dd>This determines the relative rates of nucleotide substitution assumed by the codon model. The options are exactly the same as those allowed under a normal nucleotide model. A codon model with ratematrix = 2rate specifies the standard Goldman and Yang (1994) model, with different substitution rates for transitions and transversions.</dd>
<dt><a name=c_statefrequencies1><i>Codon Frequencies (statefequencies)</i></a></dt>
<dd>The options are to use equal codon frequencies (not a good option), the frequencies observed in your dataset (termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4 methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately.</dd>
<dt><a name=c_ratehetmodel1><i>dN/dS categories (or Omega) (ratehetmodel)</i></a></dt>
<dd>For codon models, the default is to infer a single dN/dS parameter. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is the discrete or M3 model of Yang et al. (2000).</dd>
<dt><a name=c_numratecats1><i>Number of dN/dS parameter categories (numratecats)</i></a></dt>
<dd>When ratehetmodel = nonsynonymous, this is the number of dN/dS parameter categories. </dd>
<br></br>
<dt><a name=model2_comment><i><b>Model Parameters for Partition 2</b></i></a></dt>
<dt><a name=datatype_value2><i>The type of data (datatype)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set.</dd>
<dt><a name=geneticcode_value2><i>Select the Genetic Code (geneticcode)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set. </dd>
<br></br>
<dt><a name=model_nucleotide2_comment><i><b>Nucleotide Model</b></i></a></dt>
<dd>
</dd><dd>JC (Jukes-Cantor model): Rate Matrix = 1 rate, Base Frequencies = equal</dd><dd>
</dd><dd>K2P (Kimura 2-Parameter model): Rate Matrix = 2 rate, Base Frequencies = equal</dd><dd>
</dd><dd>F81 (Felsenstein 1981 model): Rate Matrix = 1 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>HKY (Hasegawa, Kishino and Yano model): Rate Matrix = 2 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>GTR (General Time-Reversible model): Rate Matrix = 6 rate, Base Frequencies = estimate</dd><dd>
</dd>
<dt><a name=d_ratematrix2><i>Rate Matrix (ratematrix)</i></a></dt>
<dd>New in version 0.96, parameters for any submodel of the GTR model may now be estimated. The format for specifying this is very similar to that used in the rclass setting of PAUP*. Within parentheses, six letters are specified, with spaces between them. The six letters represent the rates of substitution between the six pairs of nucleotides, with the order being A-C, A-G, A-T, C-G, C-T and G-T. Letters within the parentheses that are the same mean that a single parameter is shared by multiple nucleotide pairs. For example, ratematrix = (a b a a b a) would specify the HKY 2-rate model (equivalent to ratematrix = 2rate). This entry, ratematrix = (a b c c b a) would specify 3 estimated rates of substitution, with one rate shared by A-C and G-T substitutions, another rate shared by A-G and C-T substitutions, and the final rate shared by A-T and C-G substitutions.</dd>
<dt><a name=d_invariantsites2><i>Proportion of invariant sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=d_ratehetmodel2><i>The model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=d_numratecats2><i>Number of rate categories (numratecats)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_protein2_comment><i><b>Protein Model</b></i></a></dt>
<dd>
</dd><dd>dayhoff Dayhoff, Schwartz and Orcutt. 1978 </dd><dd>
</dd><dd>jones Jones, Taylor and Thornton (JTT), 1992 </dd><dd>
</dd><dd>WAG Whelan and Goldman, 2001 </dd><dd>
</dd><dd>mtREV Adachi and Hasegawa, 1996 </dd><dd>
</dd><dd>mtmam Yang, Nielsen and Hasegawa. 1998 </dd><dd>
</dd>
<dt><a name=p_ratematrix2><i>Protein Rate Matrix (ratematrix)</i></a></dt>
<dd>You should use the matrix that gives the best likelihood, and could use a program like PROTTEST (very much like MODELTEST, but for amino acid models) to determine which fits best for your data. Poisson assumes a single rate of substitution between all amino acid pairs, and is a very poor model.</dd>
<dt><a name=p_statefrequencies2><i>Amino Acid Frequencies (statefequencies)</i></a></dt>
<dd>Specifies how the equilibrium state frequencies of the 20 amino acids are treated. The empirical option fixes the frequencies at their observed proportions (when describing a model this is often termed +F).</dd>
<dt><a name=p_invariantsites2><i>Proportion of invariable sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=p_ratehetmodel2><i>Model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=p_numratecats2><i>Number of rate categories (numratecats; set at no more than 8)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_codon2_comment><i><b>Codon Model</b></i></a></dt>
<dd>
</dd><dd>The codon models are built with three components: (1) parameters describing
the process of individual nucleotide substitutions, (2) equilibrium codon
frequencies, and (3) parameters describing the relative rate of nonsynonymous to
synonymous substitutions. The nucleotide substitution parameters within the codon
models are exactly the same as those possible with standard nucleotide models in
GARLI, and are specified with the ratematrix configuration entry. Thus, they can
be of the 2rate variety (inferring different rates for transitions and transversions,
K2P or HKY-like), the 6rate variety (inferring different rates for all nucleotide
pairs, GTR-like) or any other sub-model of GTR. The options for codon frequencies are
specified with the statefrequencies configuration entry. The options are to use
equal frequencies (not a good option), the frequencies observed in your dataset
(termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4
methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately. The final component of the codon models is the nonsynonymous to synonymous relative rate parameters (aka dN/dS or omega parameters). The default is to infer a single dN/dS value. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is
the discrete or M3 model in PAML's terminology.</dd><dd>
</dd><dd>From the Author: No stop codons under the chosen genetic code are allowed.
These are: standard code (TAG, TAA and TGA); vertebrate mitochondria
(TAG, TAA, AGA and AGG); invertebrate mitochondria (TAG and TAA).
One might argue that stop codons should just be ignored and treated as missing,
but this can be dangerous. Sometimes they will come from a sequencing error, but
more often from an alignment problem, an incorrectly chosen genetic code, or a
sequence that is not really coding (e.g. an intron). In any case, error should be examined and
resolved consciously by the user.
</dd><dd>
One thing to note is that codon models for tree inference require that you align
the protein coding sequences along a correct reading frame; (e.g., gaps of 1 or 2
bases will impair the analysis). Maintaining the reading frame makes alignment
much easier even if your analysis will be at the nucleotide level. Just running
sequences through a sequence alignment program without looking is almost guaranteed
to return an alignment that will not work for codon based inference.</dd><dd>
</dd><dd>The other important restriction to note is that GARLI expects the alignment to begin on the first base of a codon. It can't figure out where the reading frame is, so if the alignment starts with a partial codon it needs to be removed or excluded from the alignment. Version 0.96 does allow normal NEXUS exclusions through an assumptions block, so the following would work to exclude the first two bases of an alignment and tell GARLI that the reading frame starts on the third.
begin assumptions;
exset * myexset = 1 2;
end;.
</dd><dd>
</dd>
<dt><a name=c_ratematrix2><i>Codon Rate Matrix (ratematrix)</i></a></dt>
<dd>This determines the relative rates of nucleotide substitution assumed by the codon model. The options are exactly the same as those allowed under a normal nucleotide model. A codon model with ratematrix = 2rate specifies the standard Goldman and Yang (1994) model, with different substitution rates for transitions and transversions.</dd>
<dt><a name=c_statefrequencies2><i>Codon Frequencies (statefequencies)</i></a></dt>
<dd>The options are to use equal codon frequencies (not a good option), the frequencies observed in your dataset (termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4 methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately.</dd>
<dt><a name=c_ratehetmodel2><i>dN/dS categories (or Omega) (ratehetmodel)</i></a></dt>
<dd>For codon models, the default is to infer a single dN/dS parameter. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is the discrete or M3 model of Yang et al. (2000).</dd>
<dt><a name=c_numratecats2><i>Number of dN/dS parameter categories (numratecats)</i></a></dt>
<dd>When ratehetmodel = nonsynonymous, this is the number of dN/dS parameter categories. </dd>
<br></br>
<dt><a name=model3_comment><i><b>Model Parameters for Partition 3</b></i></a></dt>
<dt><a name=datatype_value3><i>The type of data (datatype)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set.</dd>
<dt><a name=geneticcode_value3><i>Select the Genetic Code (geneticcode)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set. </dd>
<br></br>
<dt><a name=model_nucleotide3_comment><i><b>Nucleotide Model</b></i></a></dt>
<dd>
</dd><dd>JC (Jukes-Cantor model): Rate Matrix = 1 rate, Base Frequencies = equal</dd><dd>
</dd><dd>K2P (Kimura 2-Parameter model): Rate Matrix = 2 rate, Base Frequencies = equal</dd><dd>
</dd><dd>F81 (Felsenstein 1981 model): Rate Matrix = 1 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>HKY (Hasegawa, Kishino and Yano model): Rate Matrix = 2 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>GTR (General Time-Reversible model): Rate Matrix = 6 rate, Base Frequencies = estimate</dd><dd>
</dd>
<dt><a name=d_ratematrix3><i>Rate Matrix (ratematrix)</i></a></dt>
<dd>New in version 0.96, parameters for any submodel of the GTR model may now be estimated. The format for specifying this is very similar to that used in the rclass setting of PAUP*. Within parentheses, six letters are specified, with spaces between them. The six letters represent the rates of substitution between the six pairs of nucleotides, with the order being A-C, A-G, A-T, C-G, C-T and G-T. Letters within the parentheses that are the same mean that a single parameter is shared by multiple nucleotide pairs. For example, ratematrix = (a b a a b a) would specify the HKY 2-rate model (equivalent to ratematrix = 2rate). This entry, ratematrix = (a b c c b a) would specify 3 estimated rates of substitution, with one rate shared by A-C and G-T substitutions, another rate shared by A-G and C-T substitutions, and the final rate shared by A-T and C-G substitutions.</dd>
<dt><a name=d_invariantsites3><i>Proportion of invariant sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=d_ratehetmodel3><i>The model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=d_numratecats3><i>Number of rate categories (numratecats)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_protein3_comment><i><b>Protein Model</b></i></a></dt>
<dd>
</dd><dd>dayhoff Dayhoff, Schwartz and Orcutt. 1978 </dd><dd>
</dd><dd>jones Jones, Taylor and Thornton (JTT), 1992 </dd><dd>
</dd><dd>WAG Whelan and Goldman, 2001 </dd><dd>
</dd><dd>mtREV Adachi and Hasegawa, 1996 </dd><dd>
</dd><dd>mtmam Yang, Nielsen and Hasegawa. 1998 </dd><dd>
</dd>
<dt><a name=p_ratematrix3><i>Protein Rate Matrix (ratematrix)</i></a></dt>
<dd>You should use the matrix that gives the best likelihood, and could use a program like PROTTEST (very much like MODELTEST, but for amino acid models) to determine which fits best for your data. Poisson assumes a single rate of substitution between all amino acid pairs, and is a very poor model.</dd>
<dt><a name=p_statefrequencies3><i>Amino Acid Frequencies (statefequencies)</i></a></dt>
<dd>Specifies how the equilibrium state frequencies of the 20 amino acids are treated. The empirical option fixes the frequencies at their observed proportions (when describing a model this is often termed +F).</dd>
<dt><a name=p_invariantsites3><i>Proportion of invariable sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=p_ratehetmodel3><i>Model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=p_numratecats3><i>Number of rate categories (numratecats; set at no more than 8)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_codon3_comment><i><b>Codon Model</b></i></a></dt>
<dd>
</dd><dd>The codon models are built with three components: (1) parameters describing
the process of individual nucleotide substitutions, (2) equilibrium codon
frequencies, and (3) parameters describing the relative rate of nonsynonymous to
synonymous substitutions. The nucleotide substitution parameters within the codon
models are exactly the same as those possible with standard nucleotide models in
GARLI, and are specified with the ratematrix configuration entry. Thus, they can
be of the 2rate variety (inferring different rates for transitions and transversions,
K2P or HKY-like), the 6rate variety (inferring different rates for all nucleotide
pairs, GTR-like) or any other sub-model of GTR. The options for codon frequencies are
specified with the statefrequencies configuration entry. The options are to use
equal frequencies (not a good option), the frequencies observed in your dataset
(termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4
methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately. The final component of the codon models is the nonsynonymous to synonymous relative rate parameters (aka dN/dS or omega parameters). The default is to infer a single dN/dS value. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is
the discrete or M3 model in PAML's terminology.</dd><dd>
</dd><dd>From the Author: No stop codons under the chosen genetic code are allowed.
These are: standard code (TAG, TAA and TGA); vertebrate mitochondria
(TAG, TAA, AGA and AGG); invertebrate mitochondria (TAG and TAA).
One might argue that stop codons should just be ignored and treated as missing,
but this can be dangerous. Sometimes they will come from a sequencing error, but
more often from an alignment problem, an incorrectly chosen genetic code, or a
sequence that is not really coding (e.g. an intron). In any case, error should be examined and
resolved consciously by the user.
</dd><dd>
One thing to note is that codon models for tree inference require that you align
the protein coding sequences along a correct reading frame; (e.g., gaps of 1 or 2
bases will impair the analysis). Maintaining the reading frame makes alignment
much easier even if your analysis will be at the nucleotide level. Just running
sequences through a sequence alignment program without looking is almost guaranteed
to return an alignment that will not work for codon based inference.</dd><dd>
</dd><dd>The other important restriction to note is that GARLI expects the alignment to begin on the first base of a codon. It can't figure out where the reading frame is, so if the alignment starts with a partial codon it needs to be removed or excluded from the alignment. Version 0.96 does allow normal NEXUS exclusions through an assumptions block, so the following would work to exclude the first two bases of an alignment and tell GARLI that the reading frame starts on the third.
begin assumptions;
exset * myexset = 1 2;
end;.
</dd><dd>
</dd>
<dt><a name=c_ratematrix3><i>Codon Rate Matrix (ratematrix)</i></a></dt>
<dd>This determines the relative rates of nucleotide substitution assumed by the codon model. The options are exactly the same as those allowed under a normal nucleotide model. A codon model with ratematrix = 2rate specifies the standard Goldman and Yang (1994) model, with different substitution rates for transitions and transversions.</dd>
<dt><a name=c_statefrequencies3><i>Codon Frequencies (statefequencies)</i></a></dt>
<dd>The options are to use equal codon frequencies (not a good option), the frequencies observed in your dataset (termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4 methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately.</dd>
<dt><a name=c_ratehetmodel3><i>dN/dS categories (or Omega) (ratehetmodel)</i></a></dt>
<dd>For codon models, the default is to infer a single dN/dS parameter. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is the discrete or M3 model of Yang et al. (2000).</dd>
<dt><a name=c_numratecats3><i>Number of dN/dS parameter categories (numratecats)</i></a></dt>
<dd>When ratehetmodel = nonsynonymous, this is the number of dN/dS parameter categories. </dd>
<br></br>
<dt><a name=model4_comment><i><b>Model Parameters for Partition 4</b></i></a></dt>
<dt><a name=datatype_value4><i>The type of data (datatype)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set.</dd>
<dt><a name=geneticcode_value4><i>Select the Genetic Code (geneticcode)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set. </dd>
<br></br>
<dt><a name=model_nucleotide4_comment><i><b>Nucleotide Model</b></i></a></dt>
<dd>
</dd><dd>JC (Jukes-Cantor model): Rate Matrix = 1 rate, Base Frequencies = equal</dd><dd>
</dd><dd>K2P (Kimura 2-Parameter model): Rate Matrix = 2 rate, Base Frequencies = equal</dd><dd>
</dd><dd>F81 (Felsenstein 1981 model): Rate Matrix = 1 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>HKY (Hasegawa, Kishino and Yano model): Rate Matrix = 2 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>GTR (General Time-Reversible model): Rate Matrix = 6 rate, Base Frequencies = estimate</dd><dd>
</dd>
<dt><a name=d_ratematrix4><i>Rate Matrix (ratematrix)</i></a></dt>
<dd>New in version 0.96, parameters for any submodel of the GTR model may now be estimated. The format for specifying this is very similar to that used in the rclass setting of PAUP*. Within parentheses, six letters are specified, with spaces between them. The six letters represent the rates of substitution between the six pairs of nucleotides, with the order being A-C, A-G, A-T, C-G, C-T and G-T. Letters within the parentheses that are the same mean that a single parameter is shared by multiple nucleotide pairs. For example, ratematrix = (a b a a b a) would specify the HKY 2-rate model (equivalent to ratematrix = 2rate). This entry, ratematrix = (a b c c b a) would specify 3 estimated rates of substitution, with one rate shared by A-C and G-T substitutions, another rate shared by A-G and C-T substitutions, and the final rate shared by A-T and C-G substitutions.</dd>
<dt><a name=d_invariantsites4><i>Proportion of invariant sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=d_ratehetmodel4><i>The model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=d_numratecats4><i>Number of rate categories (numratecats)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_protein4_comment><i><b>Protein Model</b></i></a></dt>
<dd>
</dd><dd>dayhoff Dayhoff, Schwartz and Orcutt. 1978 </dd><dd>
</dd><dd>jones Jones, Taylor and Thornton (JTT), 1992 </dd><dd>
</dd><dd>WAG Whelan and Goldman, 2001 </dd><dd>
</dd><dd>mtREV Adachi and Hasegawa, 1996 </dd><dd>
</dd><dd>mtmam Yang, Nielsen and Hasegawa. 1998 </dd><dd>
</dd>
<dt><a name=p_ratematrix4><i>Protein Rate Matrix (ratematrix)</i></a></dt>
<dd>You should use the matrix that gives the best likelihood, and could use a program like PROTTEST (very much like MODELTEST, but for amino acid models) to determine which fits best for your data. Poisson assumes a single rate of substitution between all amino acid pairs, and is a very poor model.</dd>
<dt><a name=p_statefrequencies4><i>Amino Acid Frequencies (statefequencies)</i></a></dt>
<dd>Specifies how the equilibrium state frequencies of the 20 amino acids are treated. The empirical option fixes the frequencies at their observed proportions (when describing a model this is often termed +F).</dd>
<dt><a name=p_invariantsites4><i>Proportion of invariable sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=p_ratehetmodel4><i>Model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=p_numratecats4><i>Number of rate categories (numratecats; set at no more than 8)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_codon4_comment><i><b>Codon Model</b></i></a></dt>
<dd>
</dd><dd>The codon models are built with three components: (1) parameters describing
the process of individual nucleotide substitutions, (2) equilibrium codon
frequencies, and (3) parameters describing the relative rate of nonsynonymous to
synonymous substitutions. The nucleotide substitution parameters within the codon
models are exactly the same as those possible with standard nucleotide models in
GARLI, and are specified with the ratematrix configuration entry. Thus, they can
be of the 2rate variety (inferring different rates for transitions and transversions,
K2P or HKY-like), the 6rate variety (inferring different rates for all nucleotide
pairs, GTR-like) or any other sub-model of GTR. The options for codon frequencies are
specified with the statefrequencies configuration entry. The options are to use
equal frequencies (not a good option), the frequencies observed in your dataset
(termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4
methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately. The final component of the codon models is the nonsynonymous to synonymous relative rate parameters (aka dN/dS or omega parameters). The default is to infer a single dN/dS value. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is
the discrete or M3 model in PAML's terminology.</dd><dd>
</dd><dd>From the Author: No stop codons under the chosen genetic code are allowed.
These are: standard code (TAG, TAA and TGA); vertebrate mitochondria
(TAG, TAA, AGA and AGG); invertebrate mitochondria (TAG and TAA).
One might argue that stop codons should just be ignored and treated as missing,
but this can be dangerous. Sometimes they will come from a sequencing error, but
more often from an alignment problem, an incorrectly chosen genetic code, or a
sequence that is not really coding (e.g. an intron). In any case, error should be examined and
resolved consciously by the user.
</dd><dd>
One thing to note is that codon models for tree inference require that you align
the protein coding sequences along a correct reading frame; (e.g., gaps of 1 or 2
bases will impair the analysis). Maintaining the reading frame makes alignment
much easier even if your analysis will be at the nucleotide level. Just running
sequences through a sequence alignment program without looking is almost guaranteed
to return an alignment that will not work for codon based inference.</dd><dd>
</dd><dd>The other important restriction to note is that GARLI expects the alignment to begin on the first base of a codon. It can't figure out where the reading frame is, so if the alignment starts with a partial codon it needs to be removed or excluded from the alignment. Version 0.96 does allow normal NEXUS exclusions through an assumptions block, so the following would work to exclude the first two bases of an alignment and tell GARLI that the reading frame starts on the third.
begin assumptions;
exset * myexset = 1 2;
end;.
</dd><dd>
</dd>
<dt><a name=c_ratematrix4><i>Codon Rate Matrix (ratematrix)</i></a></dt>
<dd>This determines the relative rates of nucleotide substitution assumed by the codon model. The options are exactly the same as those allowed under a normal nucleotide model. A codon model with ratematrix = 2rate specifies the standard Goldman and Yang (1994) model, with different substitution rates for transitions and transversions.</dd>
<dt><a name=c_statefrequencies4><i>Codon Frequencies (statefequencies)</i></a></dt>
<dd>The options are to use equal codon frequencies (not a good option), the frequencies observed in your dataset (termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4 methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately.</dd>
<dt><a name=c_ratehetmodel4><i>dN/dS categories (or Omega) (ratehetmodel)</i></a></dt>
<dd>For codon models, the default is to infer a single dN/dS parameter. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is the discrete or M3 model of Yang et al. (2000).</dd>
<dt><a name=c_numratecats4><i>Number of dN/dS parameter categories (numratecats)</i></a></dt>
<dd>When ratehetmodel = nonsynonymous, this is the number of dN/dS parameter categories. </dd>
<br></br>
<dt><a name=model5_comment><i><b>Model Parameters for Partition 5</b></i></a></dt>
<dt><a name=datatype_value5><i>The type of data (datatype)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set.</dd>
<dt><a name=geneticcode_value5><i>Select the Genetic Code (geneticcode)</i></a></dt>
<dd>The codon-aminoacid datatype means that the data will be supplied as a nucleotide alignment, but will be internally translated and analyzed using an amino acid model. The codon and codon-aminoacid datatypes require nucleotide sequence that is aligned in the correct reading frame. In other words, all gaps in the alignment should be a multiple of 3 in length, and the alignment should start at the first position of a codon. If the alignment has extra columns at the start, middle or end, they should be removed or excluded with a Nexus exset (see the FAQ for an example of exset usage). The correct geneticcode must also be set. </dd>
<br></br>
<dt><a name=model_nucleotide5_comment><i><b>Nucleotide Model</b></i></a></dt>
<dd>
</dd><dd>JC (Jukes-Cantor model): Rate Matrix = 1 rate, Base Frequencies = equal</dd><dd>
</dd><dd>K2P (Kimura 2-Parameter model): Rate Matrix = 2 rate, Base Frequencies = equal</dd><dd>
</dd><dd>F81 (Felsenstein 1981 model): Rate Matrix = 1 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>HKY (Hasegawa, Kishino and Yano model): Rate Matrix = 2 rate, Base Frequencies = estimate</dd><dd>
</dd><dd>GTR (General Time-Reversible model): Rate Matrix = 6 rate, Base Frequencies = estimate</dd><dd>
</dd>
<dt><a name=d_ratematrix5><i>Rate Matrix (ratematrix)</i></a></dt>
<dd>New in version 0.96, parameters for any submodel of the GTR model may now be estimated. The format for specifying this is very similar to that used in the rclass setting of PAUP*. Within parentheses, six letters are specified, with spaces between them. The six letters represent the rates of substitution between the six pairs of nucleotides, with the order being A-C, A-G, A-T, C-G, C-T and G-T. Letters within the parentheses that are the same mean that a single parameter is shared by multiple nucleotide pairs. For example, ratematrix = (a b a a b a) would specify the HKY 2-rate model (equivalent to ratematrix = 2rate). This entry, ratematrix = (a b c c b a) would specify 3 estimated rates of substitution, with one rate shared by A-C and G-T substitutions, another rate shared by A-G and C-T substitutions, and the final rate shared by A-T and C-G substitutions.</dd>
<dt><a name=d_invariantsites5><i>Proportion of invariant sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=d_ratehetmodel5><i>The model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=d_numratecats5><i>Number of rate categories (numratecats)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_protein5_comment><i><b>Protein Model</b></i></a></dt>
<dd>
</dd><dd>dayhoff Dayhoff, Schwartz and Orcutt. 1978 </dd><dd>
</dd><dd>jones Jones, Taylor and Thornton (JTT), 1992 </dd><dd>
</dd><dd>WAG Whelan and Goldman, 2001 </dd><dd>
</dd><dd>mtREV Adachi and Hasegawa, 1996 </dd><dd>
</dd><dd>mtmam Yang, Nielsen and Hasegawa. 1998 </dd><dd>
</dd>
<dt><a name=p_ratematrix5><i>Protein Rate Matrix (ratematrix)</i></a></dt>
<dd>You should use the matrix that gives the best likelihood, and could use a program like PROTTEST (very much like MODELTEST, but for amino acid models) to determine which fits best for your data. Poisson assumes a single rate of substitution between all amino acid pairs, and is a very poor model.</dd>
<dt><a name=p_statefrequencies5><i>Amino Acid Frequencies (statefequencies)</i></a></dt>
<dd>Specifies how the equilibrium state frequencies of the 20 amino acids are treated. The empirical option fixes the frequencies at their observed proportions (when describing a model this is often termed +F).</dd>
<dt><a name=p_invariantsites5><i>Proportion of invariable sites (invariantsites)</i></a></dt>
<dd>Specifies whether a parameter representing the proportion of sites that are unable to change (i.e. have a substitution rate of zero) will be included. This is typically referred to as invariant sites, but would better be termed invariable sites.</dd>
<dt><a name=p_ratehetmodel5><i>Model of rate heterogeneity (ratehetmodel)</i></a></dt>
<dd>The model of rate heterogeneity assumed. gammafixed requires that the alpha shape parameter is provided, and a setting of gamma estimates it.</dd>
<dt><a name=p_numratecats5><i>Number of rate categories (numratecats; set at no more than 8)</i></a></dt>
<dd>The number of categories of variable rates (not including the invariant site class if it is being used). Must be set to 1 if ratehetmodel is set to none. Note that runtimes and memory usage scale linearly with this setting.</dd>
<br></br>
<dt><a name=model_codon5_comment><i><b>Codon Model</b></i></a></dt>
<dd>
</dd><dd>The codon models are built with three components: (1) parameters describing
the process of individual nucleotide substitutions, (2) equilibrium codon
frequencies, and (3) parameters describing the relative rate of nonsynonymous to
synonymous substitutions. The nucleotide substitution parameters within the codon
models are exactly the same as those possible with standard nucleotide models in
GARLI, and are specified with the ratematrix configuration entry. Thus, they can
be of the 2rate variety (inferring different rates for transitions and transversions,
K2P or HKY-like), the 6rate variety (inferring different rates for all nucleotide
pairs, GTR-like) or any other sub-model of GTR. The options for codon frequencies are
specified with the statefrequencies configuration entry. The options are to use
equal frequencies (not a good option), the frequencies observed in your dataset
(termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4
methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately. The final component of the codon models is the nonsynonymous to synonymous relative rate parameters (aka dN/dS or omega parameters). The default is to infer a single dN/dS value. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is
the discrete or M3 model in PAML's terminology.</dd><dd>
</dd><dd>From the Author: No stop codons under the chosen genetic code are allowed.
These are: standard code (TAG, TAA and TGA); vertebrate mitochondria
(TAG, TAA, AGA and AGG); invertebrate mitochondria (TAG and TAA).
One might argue that stop codons should just be ignored and treated as missing,
but this can be dangerous. Sometimes they will come from a sequencing error, but
more often from an alignment problem, an incorrectly chosen genetic code, or a
sequence that is not really coding (e.g. an intron). In any case, error should be examined and
resolved consciously by the user.
</dd><dd>
One thing to note is that codon models for tree inference require that you align
the protein coding sequences along a correct reading frame; (e.g., gaps of 1 or 2
bases will impair the analysis). Maintaining the reading frame makes alignment
much easier even if your analysis will be at the nucleotide level. Just running
sequences through a sequence alignment program without looking is almost guaranteed
to return an alignment that will not work for codon based inference.</dd><dd>
</dd><dd>The other important restriction to note is that GARLI expects the alignment to begin on the first base of a codon. It can't figure out where the reading frame is, so if the alignment starts with a partial codon it needs to be removed or excluded from the alignment. Version 0.96 does allow normal NEXUS exclusions through an assumptions block, so the following would work to exclude the first two bases of an alignment and tell GARLI that the reading frame starts on the third.
begin assumptions;
exset * myexset = 1 2;
end;.
</dd><dd>
</dd>
<dt><a name=c_ratematrix5><i>Codon Rate Matrix (ratematrix)</i></a></dt>
<dd>This determines the relative rates of nucleotide substitution assumed by the codon model. The options are exactly the same as those allowed under a normal nucleotide model. A codon model with ratematrix = 2rate specifies the standard Goldman and Yang (1994) model, with different substitution rates for transitions and transversions.</dd>
<dt><a name=c_statefrequencies5><i>Codon Frequencies (statefequencies)</i></a></dt>
<dd>The options are to use equal codon frequencies (not a good option), the frequencies observed in your dataset (termed empirical in GARLI), or the codon frequencies implied by the F1x4 or F3x4 methods (using PAML's terminology). These last two options calculate the codon frequencies as the product of the frequencies of the three nucleotides that make up each codon. In the F1x4 case the nucleotide frequencies are those observed in the dataset across all codon positions, while the F3x4 option uses the nucleotide frequencies observed in the data at each codon position separately.</dd>
<dt><a name=c_ratehetmodel5><i>dN/dS categories (or Omega) (ratehetmodel)</i></a></dt>
<dd>For codon models, the default is to infer a single dN/dS parameter. Alternatively, a model can be specified that infers a given number of dN/dS categories, with the dN/dS values and proportions falling in each category estimated (ratehetmodel = nonsynonymous). This is the discrete or M3 model of Yang et al. (2000).</dd>
<dt><a name=c_numratecats5><i>Number of dN/dS parameter categories (numratecats)</i></a></dt>
<dd>When ratehetmodel = nonsynonymous, this is the number of dN/dS parameter categories. </dd>
<br></br>
<dt><a name=model_trees_comment><i><b>Run Configuration</b></i></a></dt>
<dt><a name=streefname_choose><i>Specify where the starting tree topology comes from (streefname)</i></a></dt>
<dd>streefname Specifies where the starting tree topology and/or model parameters will come from. The tree topology may be a completely random topology (constraints will be enforced), a tree provided by the user in a file, or a tree generated by the program using a fast ML stepwise-addition algorithm (see attachmentspertaxon below). The author recommends stepwise over random. This will give it a much better starting point; on large datasets this can both reduce runtimes and improve results.Starting or fixed model parameter values may also be provided in the specified file, with or without a tree topology.</dd><dd>Some notes on starting trees/models: Nexus starting trees are allowed. Specified starting trees may have polytomies, which will be arbitrarily resolved before the run begins. Allowed Starting tree formats: Plain newick tree string (with taxon numbers or names, with or without branch lengths) or NEXUS trees block. The trees block can appear in the same file as a NEXUS data or characters block that contains the alignment, but it must specfied a second time in this box. If multiple trees appear in the specified file and multiple search replicates are specified (see searchreps setting), then the first tree is used in the first replicate, the second in the second replicate, etc.</dd>
<dt><a name=attachments_val><i>Specify the number of attachment branches evaluated for each taxon (attachmentspertaxon)</i></a></dt>
<dd>New Param for V 0.96. The number of attachment branches evaluated for each taxon to be added to the tree during the creation of an ML stepwise-addition starting tree. Briefly, stepwise addition is an algorithm used to make a tree, and involves adding taxa in a random order to a growing tree. For each taxon to be added, a number of randomly chosen attachment branches are tried and scored, and then the best scoring one is chosen as the location of that taxon. The attachmentspertaxon setting controls how many attachment points are evaluated for each taxon to be added. A value of one is equivalent to a completely random tree (only one randomly chosen location is evaluated). A value of greater than 2 times the number of taxa in the dataset means that all attachment points will be evaluated for each taxon, and will result in very good starting trees (but may take a while on large datasets). Even fairly small values (less than 10) can result in starting trees that are much, much better than random, but still fairly different from one another. </dd>
<dt><a name=searchreps_value><i>Specify the number of independent search replicates to perform during a program execution.(searchreps)</i></a></dt>
<dd>The number of independent search replicates to perform during a program execution. You should always either do multiple search replicates or multiple program executions with any dataset to get a feel for whether you are getting consistent results, which suggests that the program is doing a decent job of searching. Note that if this is greater than 1 and you are performing a bootstrap analysis, this is the number of search replicates to be done per bootstrap replicate. That can increase the chance of finding the best tree per bootstrap replicate, but will also increase bootstrap runtimes enormously. When you specify multiple searchreps or multiple bootstraps, we will automatically run garli multiple times in parallel.</dd>
<dt><a name=bootstrapreps><i>Bootstrap Repetitions (-bootstrapreps)</i></a></dt>
<dd>The number of bootstrap reps to perform. If the value entered is 0,normal searching will be performed. If a value greater than 0 is entered,
normal searching will not be performed. The resulting bootstrap trees (one per rep) will be output to a file named ofprefix.boot.tre.
To obtain the bootstrap proportions they will then need to be read into PAUP* or a similar program to obtain a majority rule consensus.
Note that it is probably safe to reduce the strictness of the termination conditions during bootstrapping (perhaps halve
genthreshfortopoterm), which will greatly speed up the bootstrapping process with negligible effects on the results.
When multiple bootstrapreps or multiple searchreps are specified we will automatically run garli multiple times in parallel.
</dd>
<dt><a name=outgroup_tax><i>Outgroup taxa numbers, separated by spaces (outgroup)</i></a></dt>
<dd>The outgroup option allow for orienting tree topologies in a consistent way when they are written to file. Note that this has NO effect whatsoever on the actual inference and the specified outgroup is NOT constrained to be present in the inferred trees. If multiple outgroup taxa are specified and they do not form a monophyletic group, this setting will be ignored. If you specify a single outgroup taxon it will always be present, and the tree will always be consistently oriented. To specify an outgroup consisting of taxa 1, 3 and 5 the format is this: outgroup = 1 3 5</dd>
<dt><a name=constraintfile><i>I want to use a Constraint File (constraintfile; Newick format)</i></a></dt>
<dd>The constraint file is in Newick format, and contains any topology constraint specifications, or none if there are no constraints. With Version 0.96, backbone constraints can be uploaded.
A backbone constraint is the same as any other constraint file, but not all taxa need be represented. Format: Consider a dataset of 8 taxa, in which your constraint consists of grouping taxa 1, 3 and 5. You may specify either positive constraints (inferred tree MUST contain constrained group) or negative constraints (also called converse constraints, inferred tree CANNOT contain constrained group).
These are specified with either a + or a - at the beginning of the constraint specification, for positive and negative constraints, respectively.
For a positive constraint on a grouping of taxa 1, 3 and 5: +((1,3,5), 2, 4, 6, 7, 8); For a negative constraint on a grouping on taxa 1, 3 and 5:
-((1,3,5), 2, 4, 6, 7, 8); (Note that there are many other equivalent parenthetical representations of this constraint.)
GARLI also accepts another constraint format that may be easier to use in some cases. This involves specifying a single branch to be constrained
with a string of * (asterisk) and . (period) characters, with one character per taxon. Each taxon specified with a * falls on one side of the
constrained branch, and all those specified with a . fall on the other. This should be familiar to anyone who has looked at PAUP* bootstrap output.
With this format, a positive constraint on a grouping of taxa 1, 3 and 5 would look like this: +*.*.*... or alternatively like this: +.*.*.***
With this format each line only designates a single branch, so multiple constrained branches may be specified as multiple lines in the file.</dd>
<br></br>
<dt><a name=model_initialization_comment><i><b>Initialization</b></i></a></dt>
<dt><a name=refinestart><i>Perform Initial Rough Optimization (refinestart)</i></a></dt>
<dd>Specifies whether some initial rough optimization is performed on the starting branch lengths and alpha parameter. This is always recommended.
</dd>
<dt><a name=randseed><i>Random Seed ( -1 means it will be chosen for you) </i></a></dt>
<dd>The random number seed used by the random number generator. Specify -1 to have a seed chosen for you.
Specifying the same seed number in multiple runs will result in exactly identical runs, if all other parameters are also identical.</dd>
<br></br>
<dt><a name=algorithm_comment><i><b>Genetic Algorithm</b></i></a></dt>
<br></br>
<dt><a name=algorithm_population_comment><i><b>Population</b></i></a></dt>
<dt><a name=selectionintensity><i>Selection Intensity (0.01 to 5.0) (selectionintensity)</i></a></dt>
<dd>Controls the strength of selection, with larger numbers denoting stronger selection. The relative probability of reproduction of two
individuals depends on the difference in their log likelihoods (delta lnL) and is formulated very similarly to the procedure of calculating Akaike
weights. The relative probability of reproduction of the less fit individual is equal to:
In general this setting does not seem to have much of an effect on the progress of a run. In theory higher values should cause scores to
increase more quickly, but make the search more likely to be entrapped in a local optimum. The following table gives the relative probabilities
of reproduction for different values of the selection intensity when the difference in log likelihood is 1.0
Selection intensity Ratio of probabilities of reproduction
0.05 0.95:1.0
0.1 0.90:1.0
0.25 0.78:1.0
0.5 0.61:1.0
0.75 0.47:1.0
1 0.37:1.0
2 0.14:1.0
</dd>
<dt><a name=nindivs><i>Number of Individuals (nindivs 2 to 100)</i></a></dt>
<dd>The number of individuals in the population. This may be increased, but generally seems to slow the rate of score increase.</dd>
<br></br>
<dt><a name=algorithm_brlen_comment><i><b>Branch-length Optimization</b></i></a></dt>
<dt><a name=numberofprecreductions><i>Number of Precision Reductions (0 - 100)</i></a></dt>
<dd>Specify the number of steps that it will take for the optimization precision to decrease from startoptprec to minoptprec.
In version 0.95, the reduction from startoptprec to minoptprec is linear, rather than geometric. </dd>
<br></br>
<dt><a name=algorithm_mutation_prior_weighting_comment><i><b>Mutation Prior Weighting</b></i></a></dt>
<dt><a name=modweight><i>Model Mutations (modweight)</i></a></dt>
<dd>The prior weight assigned to the class of model mutations. Note that setting this at 0.0 fixes the model during the run. </dd>
<dt><a name=brlenweight><i>Branch-length Mutations (brlenweight)</i></a></dt>
<dd>The prior weight assigned to branch-length mutations. </dd>
<dt><a name=topoweight><i>All Topology Mutations (topoweight)</i></a></dt>
<dd>The prior weight assigned to the class of topology mutations (NNI, SPR and limSPR).</dd>
<dt><a name=randnniweight><i>NNI Mutations (randnniweight)</i></a></dt>
<dd>The prior weight assigned to NNI mutations.</dd>
<dt><a name=randsprweight><i>SPR Mutations (randsprweight)</i></a></dt>
<dd>randsprweight (0 to infinity, 0.3) -The prior weight assigned to random SPR mutations.
For very large datasets it is often best to set this to 0.0, as random SPR mutations essentially never result in score increases.
</dd>
<dt><a name=limsprweight><i>Limited SPR Mutations (limsprweight)</i></a></dt>
<dd>The prior weight assigned to SPR mutations with the reconnection branch limited to being a maximum of limsprrange
branches away from where the branch was detached.</dd>
<br></br>
<dt><a name=algorithm_mutation_details_comment><i><b>Mutation Details</b></i></a></dt>
<dt><a name=limsprrange><i>Max Limited SPR Branch Movement (limsprrange)</i></a></dt>
<dd>The maximum number of branches away from its original location that a branch may be reattached during a limited SPR move.
Setting this too high (> 10) can seriously degrade performance. </dd>
<br></br>
<dt><a name=general_logs_comment><i><b>Logs</b></i></a></dt>
<dt><a name=logevery_g><i>Save best score with interval (logevery)</i></a></dt>
<dd>The frequency with which the best score is written to the log file. </dd>
<dt><a name=outputeachbettertopology_g><i>Save each improved topology (outputeachbettertopology; can result in a very large file)</i></a></dt>
<dd>If true, each new topology encountered with a better score than the previous best is written to file. In some cases this can result in really big files, possibly hundreds of MB, especially for random starting topologies on large datasets. Note that this file is interesting to get an idea of how the topology changed as the searches progressed, but the collection of trees should NOT be interpreted in any meaningful way. This option is not available while bootstrapping.</dd>
<br></br>
<dt><a name=general_run_comment><i><b> Run Termination</b></i></a></dt>
<dt><a name=genthreshfortopoterm><i>Generations without improving topology (genthreshfortopoterm)</i></a></dt>
<dd>This specifies the first part of the termination condition. When no new significantly better scoring topology see significanttopochange below) has been encountered in greater than this number of generations, this condition is met. Increasing this parameter may improve the lnL scores obtained (especially on large datasets), but will also increase runtimes. </dd>
<dt><a name=significanttopochange><i>lnL increase for significantly better topology (significanttopochange)</i></a></dt>
<dd>The lnL increase required for a new topology to be considered significant as far as the termination condition is concerned. It probably doesn't need to be played with, but you might try increasing it slightly if your runs reach a stable score and then take a very long time to terminate due to very minor changes in topology.</dd>
<dt><a name=scorethreshforterm><i>Score improvement threshold (scorethreshforterm)</i></a></dt>
<dd>The second part of the termination condition. When the total improvement in score over the last intervallength x intervalstostore generations (default is 500 generations, see below) is less than this value, this condition is met. This does not usually need to be changed. </dd>
<dt><a name=stopgen><i>Limit generations to maximum of (stopgen)</i></a></dt>
<dd>The maximum number of generations to run. Note that this supersedes the automated stopping criterion (see enforcetermconditions above), and should therefore be set to a very large value if automatic termination is desired.</dd>
<dt><a name=stoptime><i>Limit run time to maximum of (stoptime, in seconds)</i></a></dt>
<dd>The maximum number of seconds for the run to continue. Note that this supersedes the automated stopping criterion (see enforcetermconditions above), and should therefore be set to a very large value if automatic termination is desired. </dd>
<dt><a name=resampleproportion><i>Resampling where the pseudoreplicate datasets have a different number of alignment columns than the real data (resampleproportion)</i></a></dt>
<dd>When bootstrapreps is greater than 0, this setting allows for bootstrap-like resampling, but with the pseudoreplicate datasets having a different number of alignment columns than the real data. Setting values less than 1.0 is akin to jackknifing
</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// is_partitioned
// linkmodels
if (getValue('is_partitioned_') && !getValue('configure_partitions_'))
enable('linkmodels_');
else disable('linkmodels_');
// configure_partitions
if (getValue('is_partitioned_') && !getValue('linkmodels_'))
enable('configure_partitions_');
else disable('configure_partitions_');
// numparts
if (getValue('is_partitioned_') && getValue('configure_partitions_'))
enable('numparts_');
else disable('numparts_');
// subsetspecificrates
if (getValue('is_partitioned_'))
enable('subsetspecificrates_');
else disable('subsetspecificrates_');
// datatype_value
if (!getValue('configure_partitions_'))
enable('datatype_value_');
else disable('datatype_value_');
// geneticcode_value
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="codon" || getValue('datatype_value_')=="codon-aminoacid"))
enable('geneticcode_value_');
else disable('geneticcode_value_');
// d_ratematrix
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide")
enable('d_ratematrix_');
else disable('d_ratematrix_');
// ACsubrates
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratematrix_')=="custom_string")
enable('ACsubrates_');
else disable('ACsubrates_');
// AGsubrates
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratematrix_')=="custom_string")
enable('AGsubrates_');
else disable('AGsubrates_');
// ATsubrates
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratematrix_')=="custom_string")
enable('ATsubrates_');
else disable('ATsubrates_');
// CGsubrates
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratematrix_')=="custom_string")
enable('CGsubrates_');
else disable('CGsubrates_');
// CTsubrates
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratematrix_')=="custom_string")
enable('CTsubrates_');
else disable('CTsubrates_');
// GTsubrates
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratematrix_')=="custom_string")
enable('GTsubrates_');
else disable('GTsubrates_');
// d_statefrequencies
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide")
enable('d_statefrequencies_');
else disable('d_statefrequencies_');
// d_invariantsites
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide")
enable('d_invariantsites_');
else disable('d_invariantsites_');
// d_ratehetmodel
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide")
enable('d_ratehetmodel_');
else disable('d_ratehetmodel_');
// d_numratecats
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratehetmodel_')=="gamma")
enable('d_numratecats_');
else disable('d_numratecats_');
// p_ratematrix
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="aminoacid" || getValue('datatype_value_')=="codon-aminoacid"))
enable('p_ratematrix_');
else disable('p_ratematrix_');
// p_statefrequencies
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="aminoacid" || getValue('datatype_value_')=="codon-aminoacid"))
enable('p_statefrequencies_');
else disable('p_statefrequencies_');
// p_invariantsites
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="aminoacid" || getValue('datatype_value_')=="codon-aminoacid"))
enable('p_invariantsites_');
else disable('p_invariantsites_');
// p_ratehetmodel
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="aminoacid" || getValue('datatype_value_')=="codon-aminoacid"))
enable('p_ratehetmodel_');
else disable('p_ratehetmodel_');
// p_numratecats
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="aminoacid" || getValue('datatype_value_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" )
enable('p_numratecats_');
else disable('p_numratecats_');
// c_ratematrix
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="codon")
enable('c_ratematrix_');
else disable('c_ratematrix_');
// c_statefrequencies
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="codon")
enable('c_statefrequencies_');
else disable('c_statefrequencies_');
// c_ratehetmodel
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="codon")
enable('c_ratehetmodel_');
else disable('c_ratehetmodel_');
// c_numratecats
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="codon" && getValue('c_ratehetmodel_')=="nonsynonymous")
enable('c_numratecats_');
else disable('c_numratecats_');
// datatype_value1
if (getValue('configure_partitions_'))
enable('datatype_value1_');
else disable('datatype_value1_');
// geneticcode_value1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="codon" || getValue('datatype_value1_')=="codon-aminoacid"))
enable('geneticcode_value1_');
else disable('geneticcode_value1_');
// d_ratematrix1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide")
enable('d_ratematrix1_');
else disable('d_ratematrix1_');
// ACsubrates1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratematrix1_')=="custom_string")
enable('ACsubrates1_');
else disable('ACsubrates1_');
// AGsubrates1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratematrix1_')=="custom_string")
enable('AGsubrates1_');
else disable('AGsubrates1_');
// ATsubrates1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratematrix1_')=="custom_string")
enable('ATsubrates1_');
else disable('ATsubrates1_');
// CGsubrates1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratematrix1_')=="custom_string")
enable('CGsubrates1_');
else disable('CGsubrates1_');
// CTsubrates1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratematrix1_')=="custom_string")
enable('CTsubrates1_');
else disable('CTsubrates1_');
// GTsubrates1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratematrix1_')=="custom_string")
enable('GTsubrates1_');
else disable('GTsubrates1_');
// d_statefrequencies1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide")
enable('d_statefrequencies1_');
else disable('d_statefrequencies1_');
// d_invariantsites1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide")
enable('d_invariantsites1_');
else disable('d_invariantsites1_');
// d_ratehetmodel1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide")
enable('d_ratehetmodel1_');
else disable('d_ratehetmodel1_');
// d_numratecats1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratehetmodel1_')=="gamma")
enable('d_numratecats1_');
else disable('d_numratecats1_');
// p_ratematrix1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="aminoacid" || getValue('datatype_value1_')=="codon-aminoacid"))
enable('p_ratematrix1_');
else disable('p_ratematrix1_');
// p_statefrequencies1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="aminoacid" || getValue('datatype_value1_')=="codon-aminoacid"))
enable('p_statefrequencies1_');
else disable('p_statefrequencies1_');
// p_invariantsites1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="aminoacid" || getValue('datatype_value1_')=="codon-aminoacid"))
enable('p_invariantsites1_');
else disable('p_invariantsites1_');
// p_ratehetmodel1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="aminoacid" || getValue('datatype_value1_')=="codon-aminoacid"))
enable('p_ratehetmodel1_');
else disable('p_ratehetmodel1_');
// p_numratecats1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="aminoacid" || getValue('datatype_value1_')=="codon-aminoacid") && getValue('p_ratehetmodel1_')=="gamma" )
enable('p_numratecats1_');
else disable('p_numratecats1_');
// c_ratematrix1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="codon")
enable('c_ratematrix1_');
else disable('c_ratematrix1_');
// c_statefrequencies1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="codon")
enable('c_statefrequencies1_');
else disable('c_statefrequencies1_');
// c_ratehetmodel1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="codon")
enable('c_ratehetmodel1_');
else disable('c_ratehetmodel1_');
// c_numratecats1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="codon" && getValue('c_ratehetmodel1_')=="nonsynonymous")
enable('c_numratecats1_');
else disable('c_numratecats1_');
// datatype_value2
if (getValue('configure_partitions_'))
enable('datatype_value2_');
else disable('datatype_value2_');
// geneticcode_value2
if (getValue('datatype_value2_')=="codon" || getValue('datatype_value2_')=="codon-aminoacid")
enable('geneticcode_value2_');
else disable('geneticcode_value2_');
// d_ratematrix2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide")
enable('d_ratematrix2_');
else disable('d_ratematrix2_');
// ACsubrates2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratematrix2_')=="custom_string")
enable('ACsubrates2_');
else disable('ACsubrates2_');
// AGsubrates2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratematrix2_')=="custom_string")
enable('AGsubrates2_');
else disable('AGsubrates2_');
// ATsubrates2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratematrix2_')=="custom_string")
enable('ATsubrates2_');
else disable('ATsubrates2_');
// CGsubrates2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratematrix2_')=="custom_string")
enable('CGsubrates2_');
else disable('CGsubrates2_');
// CTsubrates2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratematrix2_')=="custom_string")
enable('CTsubrates2_');
else disable('CTsubrates2_');
// GTsubrates2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratematrix2_')=="custom_string")
enable('GTsubrates2_');
else disable('GTsubrates2_');
// d_statefrequencies2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide")
enable('d_statefrequencies2_');
else disable('d_statefrequencies2_');
// d_invariantsites2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide")
enable('d_invariantsites2_');
else disable('d_invariantsites2_');
// d_ratehetmodel2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide")
enable('d_ratehetmodel2_');
else disable('d_ratehetmodel2_');
// d_numratecats2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratehetmodel2_')=="gamma")
enable('d_numratecats2_');
else disable('d_numratecats2_');
// p_ratematrix2
if (getValue('configure_partitions_') && (getValue('datatype_value2_')=="aminoacid" || getValue('datatype_value2_')=="codon-aminoacid"))
enable('p_ratematrix2_');
else disable('p_ratematrix2_');
// p_statefrequencies2
if (getValue('configure_partitions_') && (getValue('datatype_value2_')=="aminoacid" || getValue('datatype_value2_')=="codon-aminoacid"))
enable('p_statefrequencies2_');
else disable('p_statefrequencies2_');
// p_invariantsites2
if (getValue('configure_partitions_') && (getValue('datatype_value2_')=="aminoacid" || getValue('datatype_value2_')=="codon-aminoacid"))
enable('p_invariantsites2_');
else disable('p_invariantsites2_');
// p_ratehetmodel2
if (getValue('configure_partitions_') && (getValue('datatype_value2_')=="aminoacid" || getValue('datatype_value2_')=="codon-aminoacid"))
enable('p_ratehetmodel2_');
else disable('p_ratehetmodel2_');
// p_numratecats2
if (getValue('configure_partitions_') && (getValue('datatype_value2_')=="aminoacid" || getValue('datatype_value2_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" )
enable('p_numratecats2_');
else disable('p_numratecats2_');
// c_ratematrix2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="codon")
enable('c_ratematrix2_');
else disable('c_ratematrix2_');
// c_statefrequencies2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="codon")
enable('c_statefrequencies2_');
else disable('c_statefrequencies2_');
// c_ratehetmodel2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="codon")
enable('c_ratehetmodel2_');
else disable('c_ratehetmodel2_');
// c_numratecats2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="codon" && getValue('c_ratehetmodel2_')=="nonsynonymous")
enable('c_numratecats2_');
else disable('c_numratecats2_');
// datatype_value3
if (getValue('numparts_') > 2)
enable('datatype_value3_');
else disable('datatype_value3_');
// geneticcode_value3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="codon" || getValue('datatype_value3_')=="codon-aminoacid"))
enable('geneticcode_value3_');
else disable('geneticcode_value3_');
// d_ratematrix3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide")
enable('d_ratematrix3_');
else disable('d_ratematrix3_');
// ACsubrates3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratematrix3_')=="custom_string")
enable('ACsubrates3_');
else disable('ACsubrates3_');
// AGsubrates3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratematrix3_')=="custom_string")
enable('AGsubrates3_');
else disable('AGsubrates3_');
// ATsubrates3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratematrix3_')=="custom_string")
enable('ATsubrates3_');
else disable('ATsubrates3_');
// CGsubrates3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratematrix3_')=="custom_string")
enable('CGsubrates3_');
else disable('CGsubrates3_');
// CTsubrates3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratematrix3_')=="custom_string")
enable('CTsubrates3_');
else disable('CTsubrates3_');
// GTsubrates3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratematrix3_')=="custom_string")
enable('GTsubrates3_');
else disable('GTsubrates3_');
// d_statefrequencies3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide")
enable('d_statefrequencies3_');
else disable('d_statefrequencies3_');
// d_invariantsites3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide")
enable('d_invariantsites3_');
else disable('d_invariantsites3_');
// d_ratehetmodel3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide")
enable('d_ratehetmodel3_');
else disable('d_ratehetmodel3_');
// d_numratecats3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratehetmodel3_')=="gamma")
enable('d_numratecats3_');
else disable('d_numratecats3_');
// p_ratematrix3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="aminoacid" || getValue('datatype_value3_')=="codon-aminoacid"))
enable('p_ratematrix3_');
else disable('p_ratematrix3_');
// p_statefrequencies3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="aminoacid" || getValue('datatype_value3_')=="codon-aminoacid"))
enable('p_statefrequencies3_');
else disable('p_statefrequencies3_');
// p_invariantsites3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="aminoacid" || getValue('datatype_value3_')=="codon-aminoacid"))
enable('p_invariantsites3_');
else disable('p_invariantsites3_');
// p_ratehetmodel3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="aminoacid" || getValue('datatype_value3_')=="codon-aminoacid"))
enable('p_ratehetmodel3_');
else disable('p_ratehetmodel3_');
// p_numratecats3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="aminoacid" || getValue('datatype_value3_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" )
enable('p_numratecats3_');
else disable('p_numratecats3_');
// c_ratematrix3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="codon")
enable('c_ratematrix3_');
else disable('c_ratematrix3_');
// c_statefrequencies3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="codon")
enable('c_statefrequencies3_');
else disable('c_statefrequencies3_');
// c_ratehetmodel3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="codon")
enable('c_ratehetmodel3_');
else disable('c_ratehetmodel3_');
// c_numratecats3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="codon" && getValue('c_ratehetmodel3_')=="nonsynonymous")
enable('c_numratecats3_');
else disable('c_numratecats3_');
// datatype_value4
if (getValue('numparts_') > 3)
enable('datatype_value4_');
else disable('datatype_value4_');
// geneticcode_value4
if (getValue('datatype_value4_')=="codon" || getValue('datatype_value4_')=="codon-aminoacid")
enable('geneticcode_value4_');
else disable('geneticcode_value4_');
// d_ratematrix4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide")
enable('d_ratematrix4_');
else disable('d_ratematrix4_');
// ACsubrates4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratematrix4_')=="custom_string")
enable('ACsubrates4_');
else disable('ACsubrates4_');
// AGsubrates4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratematrix4_')=="custom_string")
enable('AGsubrates4_');
else disable('AGsubrates4_');
// ATsubrates4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratematrix4_')=="custom_string")
enable('ATsubrates4_');
else disable('ATsubrates4_');
// CGsubrates4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratematrix4_')=="custom_string")
enable('CGsubrates4_');
else disable('CGsubrates4_');
// CTsubrates4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratematrix4_')=="custom_string")
enable('CTsubrates4_');
else disable('CTsubrates4_');
// GTsubrates4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratematrix4_')=="custom_string")
enable('GTsubrates4_');
else disable('GTsubrates4_');
// d_statefrequencies4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide")
enable('d_statefrequencies4_');
else disable('d_statefrequencies4_');
// d_invariantsites4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide")
enable('d_invariantsites4_');
else disable('d_invariantsites4_');
// d_ratehetmodel4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide")
enable('d_ratehetmodel4_');
else disable('d_ratehetmodel4_');
// d_numratecats4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratehetmodel4_')=="gamma")
enable('d_numratecats4_');
else disable('d_numratecats4_');
// p_ratematrix4
if (getValue('numparts_') > 3 && (getValue('datatype_value4_')=="aminoacid" || getValue('datatype_value4_')=="codon-aminoacid"))
enable('p_ratematrix4_');
else disable('p_ratematrix4_');
// p_statefrequencies4
if (getValue('numparts_') > 3 && (getValue('datatype_value4_')=="aminoacid" || getValue('datatype_value4_')=="codon-aminoacid"))
enable('p_statefrequencies4_');
else disable('p_statefrequencies4_');
// p_invariantsites4
if (getValue('numparts_') > 3 && (getValue('datatype_value4_')=="aminoacid" || getValue('datatype_value4_')=="codon-aminoacid"))
enable('p_invariantsites4_');
else disable('p_invariantsites4_');
// p_ratehetmodel4
if (getValue('numparts_') > 3 && (getValue('datatype_value4_')=="aminoacid" || getValue('datatype_value4_')=="codon-aminoacid"))
enable('p_ratehetmodel4_');
else disable('p_ratehetmodel4_');
// p_numratecats4
if (getValue('numparts_') > 3 && (getValue('datatype_value4_')=="aminoacid" || getValue('datatype_value4_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" )
enable('p_numratecats4_');
else disable('p_numratecats4_');
// c_ratematrix4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="codon")
enable('c_ratematrix4_');
else disable('c_ratematrix4_');
// c_statefrequencies4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="codon")
enable('c_statefrequencies4_');
else disable('c_statefrequencies4_');
// c_ratehetmodel4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="codon")
enable('c_ratehetmodel4_');
else disable('c_ratehetmodel4_');
// c_numratecats4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="codon" && getValue('c_ratehetmodel4_')=="nonsynonymous")
enable('c_numratecats4_');
else disable('c_numratecats4_');
// datatype_value5
if (getValue('numparts_') > 4)
enable('datatype_value5_');
else disable('datatype_value5_');
// geneticcode_value5
if (getValue('datatype_value5_')=="codon" || getValue('datatype_value5_')=="codon-aminoacid")
enable('geneticcode_value5_');
else disable('geneticcode_value5_');
// d_ratematrix5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide")
enable('d_ratematrix5_');
else disable('d_ratematrix5_');
// ACsubrates5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratematrix5_')=="custom_string")
enable('ACsubrates5_');
else disable('ACsubrates5_');
// AGsubrates5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratematrix5_')=="custom_string")
enable('AGsubrates5_');
else disable('AGsubrates5_');
// ATsubrates5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratematrix5_')=="custom_string")
enable('ATsubrates5_');
else disable('ATsubrates5_');
// CGsubrates5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratematrix5_')=="custom_string")
enable('CGsubrates5_');
else disable('CGsubrates5_');
// CTsubrates5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratematrix5_')=="custom_string")
enable('CTsubrates5_');
else disable('CTsubrates5_');
// GTsubrates5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratematrix5_')=="custom_string")
enable('GTsubrates5_');
else disable('GTsubrates5_');
// d_statefrequencies5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide")
enable('d_statefrequencies5_');
else disable('d_statefrequencies5_');
// d_invariantsites5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide")
enable('d_invariantsites5_');
else disable('d_invariantsites5_');
// d_ratehetmodel5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide")
enable('d_ratehetmodel5_');
else disable('d_ratehetmodel5_');
// d_numratecats5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratehetmodel5_')=="gamma")
enable('d_numratecats5_');
else disable('d_numratecats5_');
// p_ratematrix5
if (getValue('numparts_') > 4 && (getValue('datatype_value5_')=="aminoacid" || getValue('datatype_value5_')=="codon-aminoacid"))
enable('p_ratematrix5_');
else disable('p_ratematrix5_');
// p_statefrequencies5
if (getValue('numparts_') > 4 && (getValue('datatype_value5_')=="aminoacid" || getValue('datatype_value5_')=="codon-aminoacid"))
enable('p_statefrequencies5_');
else disable('p_statefrequencies5_');
// p_invariantsites5
if (getValue('numparts_') > 4 && (getValue('datatype_value5_')=="aminoacid" || getValue('datatype_value5_')=="codon-aminoacid"))
enable('p_invariantsites5_');
else disable('p_invariantsites5_');
// p_ratehetmodel5
if (getValue('numparts_') > 4 && (getValue('datatype_value5_')=="aminoacid" || getValue('datatype_value5_')=="codon-aminoacid"))
enable('p_ratehetmodel5_');
else disable('p_ratehetmodel5_');
// p_numratecats5
if (getValue('numparts_') > 4 && (getValue('datatype_value5_')=="aminoacid" || getValue('datatype_value5_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" )
enable('p_numratecats5_');
else disable('p_numratecats5_');
// c_ratematrix5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="codon")
enable('c_ratematrix5_');
else disable('c_ratematrix5_');
// c_statefrequencies5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="codon")
enable('c_statefrequencies5_');
else disable('c_statefrequencies5_');
// c_ratehetmodel5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="codon")
enable('c_ratehetmodel5_');
else disable('c_ratehetmodel5_');
// c_numratecats5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="codon" && getValue('c_ratehetmodel5_')=="nonsynonymous")
enable('c_numratecats5_');
else disable('c_numratecats5_');
// streefname_choose
// attachments_val
if (getValue('streefname_choose_')=="stepwise")
enable('attachments_val_');
else disable('attachments_val_');
// searchreps_value
// bootstrapreps
if (!getValue('inferinternalstateprobs_g_'))
enable('bootstrapreps_');
else disable('bootstrapreps_');
// outgroup_tax
// collapsebranches_g
// constraintfile
// refinestart
// randseed
// selectionintensity
// nindivs
// startoptprec
// minoptprec
// numberofprecreductions
// modweight
// brlenweight
// topoweight
// randnniweight
// randsprweight
// limsprweight
// limsprrange
// uniqueswapbias
// saveevery_g
// outputcurrentbesttopology
if (!getValue('user_conffile_'))
enable('outputcurrentbesttopology_');
else disable('outputcurrentbesttopology_');
// logevery_g
// outputeachbettertopology_g
// inferinternalstateprobs_g
if (getValue('bootstrapreps_')==0)
enable('inferinternalstateprobs_g_');
else disable('inferinternalstateprobs_g_');
// outputphyliptree_g
// outputmostlyuselessfiles_g
// enforcetermconditions
// genthreshfortopoterm
if (getValue('enforcetermconditions_'))
enable('genthreshfortopoterm_');
else disable('genthreshfortopoterm_');
// significanttopochange
if (getValue('enforcetermconditions_'))
enable('significanttopochange_');
else disable('significanttopochange_');
// scorethreshforterm
if (getValue('enforcetermconditions_'))
enable('scorethreshforterm_');
else disable('scorethreshforterm_');
// stopgen
// stoptime
// resampleproportion
if (getValue('bootstrapreps_') > 0)
enable('resampleproportion_');
else disable('resampleproportion_');
}
function validateControl() {
// is_partitioned
// linkmodels
// configure_partitions
// numparts
if (getValue('is_partitioned_') && getValue('configure_partitions_')) {
if (getValue('numparts_') < 2) {
alert('Please enter a value between two and 5 for the number of partitions');
return false;
}
}
if (getValue('is_partitioned_') && getValue('configure_partitions_')) {
if (getValue('numparts_') > 5) {
alert('Sorry, this interface supports configuration for a maximum of 5 partitions. However, you can download and edit the file created here to support as many parititions as you like. Please see the GARLI manual or home page for more information');
return false;
}
}
// subsetspecificrates
// datatype_value
// geneticcode_value
// d_ratematrix
// ACsubrates
// AGsubrates
// ATsubrates
// CGsubrates
// CTsubrates
// GTsubrates
// d_statefrequencies
// d_invariantsites
// d_ratehetmodel
// d_numratecats
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="nucleotide" && getValue('d_ratehetmodel_')=="gamma") {
if (getValue('d_numratecats_') < 2 || getValue('d_numratecats_') > 20) {
alert(':Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// p_ratematrix
// p_statefrequencies
// p_invariantsites
// p_ratehetmodel
// p_numratecats
if (!getValue('configure_partitions_') && (getValue('datatype_value_')=="aminoacid" || getValue('datatype_value_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" ) {
if (getValue('p_numratecats_') < 2 || getValue('p_numratecats_') > 20) {
alert('Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// c_ratematrix
// c_statefrequencies
// c_ratehetmodel
// c_numratecats
if (!getValue('configure_partitions_') && getValue('datatype_value_')=="codon" && getValue('c_ratehetmodel_')=="nonsynonymous") {
if (getValue('c_numratecats_') < 1 || getValue('c_numratecats_') > 8) {
alert('Number of rate categories: must be an integer between 1 and 8');
return false;
}
}
// datatype_value1
// geneticcode_value1
// d_ratematrix1
// ACsubrates1
// AGsubrates1
// ATsubrates1
// CGsubrates1
// CTsubrates1
// GTsubrates1
// d_statefrequencies1
// d_invariantsites1
// d_ratehetmodel1
// d_numratecats1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="nucleotide" && getValue('d_ratehetmodel1_')=="gamma") {
if (getValue('d_numratecats1_') < 2 || getValue('d_numratecats1_') > 20) {
alert(':Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// p_ratematrix1
// p_statefrequencies1
// p_invariantsites1
// p_ratehetmodel1
// p_numratecats1
if (getValue('configure_partitions_') && (getValue('datatype_value1_')=="aminoacid" || getValue('datatype_value1_')=="codon-aminoacid") && getValue('p_ratehetmodel1_')=="gamma" ) {
if (getValue('p_numratecats1_') < 2 || getValue('p_numratecats1_') > 20) {
alert('Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// c_ratematrix1
// c_statefrequencies1
// c_ratehetmodel1
// c_numratecats1
if (getValue('configure_partitions_') && getValue('datatype_value1_')=="codon" && getValue('c_ratehetmodel1_')=="nonsynonymous") {
if (getValue('c_numratecats1_') < 1 || getValue('c_numratecats1_') > 8) {
alert('Number of rate categories: must be an integer between 1 and 8');
return false;
}
}
// datatype_value2
// geneticcode_value2
// d_ratematrix2
// ACsubrates2
// AGsubrates2
// ATsubrates2
// CGsubrates2
// CTsubrates2
// GTsubrates2
// d_statefrequencies2
// d_invariantsites2
// d_ratehetmodel2
// d_numratecats2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="nucleotide" && getValue('d_ratehetmodel2_')=="gamma") {
if (getValue('d_numratecats2_') < 2 || getValue('d_numratecats2_') > 20) {
alert(':Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// p_ratematrix2
// p_statefrequencies2
// p_invariantsites2
// p_ratehetmodel2
// p_numratecats2
if (getValue('configure_partitions_') && (getValue('datatype_value2_')=="aminoacid" || getValue('datatype_value2_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" ) {
if (getValue('p_numratecats2_') < 2 || getValue('p_numratecats2_') > 20) {
alert('Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// c_ratematrix2
// c_statefrequencies2
// c_ratehetmodel2
// c_numratecats2
if (getValue('configure_partitions_') && getValue('datatype_value2_')=="codon" && getValue('c_ratehetmodel2_')=="nonsynonymous") {
if (getValue('c_numratecats2_') < 1 || getValue('c_numratecats2_') > 8) {
alert('Number of rate categories: must be an integer between 1 and 8');
return false;
}
}
// datatype_value3
// geneticcode_value3
// d_ratematrix3
// ACsubrates3
// AGsubrates3
// ATsubrates3
// CGsubrates3
// CTsubrates3
// GTsubrates3
// d_statefrequencies3
// d_invariantsites3
// d_ratehetmodel3
// d_numratecats3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="nucleotide" && getValue('d_ratehetmodel3_')=="gamma") {
if (getValue('d_numratecats3_') < 2 || getValue('d_numratecats3_') > 20) {
alert(':Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// p_ratematrix3
// p_statefrequencies3
// p_invariantsites3
// p_ratehetmodel3
// p_numratecats3
if (getValue('numparts_') > 2 && (getValue('datatype_value3_')=="aminoacid" || getValue('datatype_value3_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" ) {
if (getValue('p_numratecats3_') < 2 || getValue('p_numratecats3_') > 20) {
alert('Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// c_ratematrix3
// c_statefrequencies3
// c_ratehetmodel3
// c_numratecats3
if (getValue('numparts_') > 2 && getValue('datatype_value3_')=="codon" && getValue('c_ratehetmodel3_')=="nonsynonymous") {
if (getValue('c_numratecats3_') < 1 || getValue('c_numratecats3_') > 8) {
alert('Number of rate categories: must be an integer between 1 and 8');
return false;
}
}
// datatype_value4
// geneticcode_value4
// d_ratematrix4
// ACsubrates4
// AGsubrates4
// ATsubrates4
// CGsubrates4
// CTsubrates4
// GTsubrates4
// d_statefrequencies4
// d_invariantsites4
// d_ratehetmodel4
// d_numratecats4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="nucleotide" && getValue('d_ratehetmodel4_')=="gamma") {
if (getValue('d_numratecats4_') < 2 || getValue('d_numratecats4_') > 20) {
alert(':Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// p_ratematrix4
// p_statefrequencies4
// p_invariantsites4
// p_ratehetmodel4
// p_numratecats4
if (getValue('numparts_') > 3 && (getValue('datatype_value4_')=="aminoacid" || getValue('datatype_value4_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" ) {
if (getValue('p_numratecats4_') < 2 || getValue('p_numratecats4_') > 20) {
alert('Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// c_ratematrix4
// c_statefrequencies4
// c_ratehetmodel4
// c_numratecats4
if (getValue('numparts_') > 3 && getValue('datatype_value4_')=="codon" && getValue('c_ratehetmodel4_')=="nonsynonymous") {
if (getValue('c_numratecats4_') < 1 || getValue('c_numratecats4_') > 8) {
alert('Number of rate categories: must be an integer between 1 and 8');
return false;
}
}
// datatype_value5
// geneticcode_value5
// d_ratematrix5
// ACsubrates5
// AGsubrates5
// ATsubrates5
// CGsubrates5
// CTsubrates5
// GTsubrates5
// d_statefrequencies5
// d_invariantsites5
// d_ratehetmodel5
// d_numratecats5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="nucleotide" && getValue('d_ratehetmodel5_')=="gamma") {
if (getValue('d_numratecats5_') < 2 || getValue('d_numratecats5_') > 20) {
alert(':Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// p_ratematrix5
// p_statefrequencies5
// p_invariantsites5
// p_ratehetmodel5
// p_numratecats5
if (getValue('numparts_') > 4 && (getValue('datatype_value5_')=="aminoacid" || getValue('datatype_value5_')=="codon-aminoacid") && getValue('p_ratehetmodel_')=="gamma" ) {
if (getValue('p_numratecats5_') < 2 || getValue('p_numratecats5_') > 20) {
alert('Number of rate categories: must be an integer between 1 and 20');
return false;
}
}
// c_ratematrix5
// c_statefrequencies5
// c_ratehetmodel5
// c_numratecats5
if (getValue('numparts_') > 4 && getValue('datatype_value5_')=="codon" && getValue('c_ratehetmodel5_')=="nonsynonymous") {
if (getValue('c_numratecats5_') < 1 || getValue('c_numratecats5_') > 8) {
alert('Number of rate categories: must be an integer between 1 and 8');
return false;
}
}
// streefname_choose
// attachments_val
// searchreps_value
if (getValue('searchreps_value_') < 1) {
alert('The value for ths parameter cannot be less than 1');
return false;
}
if (getValue('searchreps_value_') < 2 && getValue('bootstrapreps_') < 2) {
alert('You must specify multiple searchreps and/or multiple bootstrapreps to do a parallel run on teragrid.');
return false;
}
if (getValue('searchreps_value_') > 8) {
alert('Sorry, the number of searchreps must be no more than 8.');
return false;
}
// bootstrapreps
if (!getValue('inferinternalstateprobs_g_')) {
if (getValue('bootstrapreps_') < 0 || getValue('bootstrapreps_') == 1) {
alert('Bootstrap Repititions must be 0 or an integer 2 or greater for parallel runs on teragrid.');
return false;
}
}
if (!getValue('inferinternalstateprobs_g_')) {
if (getValue('bootstrapreps_') > 100 ) {
alert('Sorry, the number of bootstrapreps must be no more than 100.');
return false;
}
}
if (!getValue('inferinternalstateprobs_g_')) {
if (getValue('searchreps_value_') * getValue('bootstrapreps_') > 100 ) {
alert('Sorry, the number of bootstrap reps times the number of searchreps must be no more than 100. Please decrease the number of searchreps, and/or the number bootstrapreps to meet this criterion. You may make addtional identical runs, if you require more bootstrapreps.');
return false;
}
}
// outgroup_tax
// collapsebranches_g
// constraintfile
// refinestart
// randseed
// selectionintensity
if (getValue('selectionintensity_') < 0.01 || getValue('selectionintensity_') > 5.0) {
alert('Selection Intensity must be between 0.01 - 5.0');
return false;
}
// nindivs
if (getValue('nindivs_') < 2 || getValue('nindivs_') > 100) {
alert('Number of individuals must be between 2 - 100');
return false;
}
// startoptprec
if (getValue('startoptprec_') < 0.005 || getValue('startoptprec_') > 5.0) {
alert('Starting Precision must be between 0.005 - 5.0');
return false;
}
// minoptprec
if (getValue('minoptprec_') < 0.001 || getValue('minoptprec_') > 0.01) {
alert('Minimum Precision must be between 0.001 - 0.01');
return false;
}
// numberofprecreductions
if (getValue('minoptprec_') < 0 || getValue('minoptprec_') > 100) {
alert('Number of Precision Reductions must be between 0 - 100');
return false;
}
// modweight
if (getValue('modweight_') < 0) {
alert('Model Mutations must be 0 or greater.');
return false;
}
// brlenweight
if (getValue('brlenweight_') < 0) {
alert('Branch-length Mutations must be 0 or greater.');
return false;
}
// topoweight
if (getValue('topoweight_') < 0) {
alert(':All Topology Mutations: must be 0 or greater.');
return false;
}
// randnniweight
if (getValue('randnniweight_') < 0) {
alert('NNI Mutations must be 0 or greater.');
return false;
}
// randsprweight
if (getValue('randsprweight_') < 0) {
alert('SPR Mutations must be 0 or greater.');
return false;
}
// limsprweight
if (getValue('limsprweight_') < 0) {
alert('Limited SPR Mutations must be 0 or greater.');
return false;
}
// limsprrange
if (getValue('limsprrange_') < 0) {
alert('Limited SPR Branch Movement must be 0 or greater.');
return false;
}
// uniqueswapbias
if (getValue('uniqueswapbias_') < 0.01 || getValue('uniqueswapbias_') > 1.0) {
alert('Unique Swap Bias must be between 0.01 - 1.0');
return false;
}
// saveevery_g
if (getValue('saveevery_g_') < 1) {
alert('Save best tree with interval must be greater than 1');
return false;
}
// outputcurrentbesttopology
// logevery_g
if (getValue('logevery_g_') < 1) {
alert('Save best score with interval must be greater than 1');
return false;
}
// outputeachbettertopology_g
// inferinternalstateprobs_g
// outputphyliptree_g
// outputmostlyuselessfiles_g
// enforcetermconditions
// genthreshfortopoterm
if (getValue('enforcetermconditions_')) {
if (getValue('genthreshfortopoterm_') < 0) {
alert('Generations without improving topology must be a positive integer');
return false;
}
}
// significanttopochange
if (getValue('enforcetermconditions_')) {
if (getValue('significanttopochange_') < 0) {
alert('lnL increase for significantly better topology must be a positive number');
return false;
}
}
// scorethreshforterm
if (getValue('enforcetermconditions_')) {
if (getValue('scorethreshforterm_') < 0) {
alert(':Score improvement threshold: must be a positive number.');
return false;
}
}
// stopgen
if (getValue('stopgen_') < 1) {
alert(':Limit generations to maximum of: must be a positive number');
return false;
}
// stoptime
if (getValue('stoptime_') < 1) {
alert(':Limit run time to maximum of: must be a positive number');
return false;
}
// resampleproportion
if (getValue('bootstrapreps_') > 0) {
if (getValue('resampleproportion_') < 0 || getValue('resampleproportion_') > 10) {
alert('Resample proportion must be a positive number less than 10');
return false;
}
}
return issueWarning();
}
function issueWarning() {
// is_partitioned
// linkmodels
// configure_partitions
// numparts
// subsetspecificrates
// datatype_value
// geneticcode_value
// d_ratematrix
// ACsubrates
// AGsubrates
// ATsubrates
// CGsubrates
// CTsubrates
// GTsubrates
// d_statefrequencies
// d_invariantsites
// d_ratehetmodel
// d_numratecats
// p_ratematrix
// p_statefrequencies
// p_invariantsites
// p_ratehetmodel
// p_numratecats
// c_ratematrix
// c_statefrequencies
// c_ratehetmodel
// c_numratecats
// datatype_value1
// geneticcode_value1
// d_ratematrix1
// ACsubrates1
// AGsubrates1
// ATsubrates1
// CGsubrates1
// CTsubrates1
// GTsubrates1
// d_statefrequencies1
// d_invariantsites1
// d_ratehetmodel1
// d_numratecats1
// p_ratematrix1
// p_statefrequencies1
// p_invariantsites1
// p_ratehetmodel1
// p_numratecats1
// c_ratematrix1
// c_statefrequencies1
// c_ratehetmodel1
// c_numratecats1
// datatype_value2
// geneticcode_value2
// d_ratematrix2
// ACsubrates2
// AGsubrates2
// ATsubrates2
// CGsubrates2
// CTsubrates2
// GTsubrates2
// d_statefrequencies2
// d_invariantsites2
// d_ratehetmodel2
// d_numratecats2
// p_ratematrix2
// p_statefrequencies2
// p_invariantsites2
// p_ratehetmodel2
// p_numratecats2
// c_ratematrix2
// c_statefrequencies2
// c_ratehetmodel2
// c_numratecats2
// datatype_value3
// geneticcode_value3
// d_ratematrix3
// ACsubrates3
// AGsubrates3
// ATsubrates3
// CGsubrates3
// CTsubrates3
// GTsubrates3
// d_statefrequencies3
// d_invariantsites3
// d_ratehetmodel3
// d_numratecats3
// p_ratematrix3
// p_statefrequencies3
// p_invariantsites3
// p_ratehetmodel3
// p_numratecats3
// c_ratematrix3
// c_statefrequencies3
// c_ratehetmodel3
// c_numratecats3
// datatype_value4
// geneticcode_value4
// d_ratematrix4
// ACsubrates4
// AGsubrates4
// ATsubrates4
// CGsubrates4
// CTsubrates4
// GTsubrates4
// d_statefrequencies4
// d_invariantsites4
// d_ratehetmodel4
// d_numratecats4
// p_ratematrix4
// p_statefrequencies4
// p_invariantsites4
// p_ratehetmodel4
// p_numratecats4
// c_ratematrix4
// c_statefrequencies4
// c_ratehetmodel4
// c_numratecats4
// datatype_value5
// geneticcode_value5
// d_ratematrix5
// ACsubrates5
// AGsubrates5
// ATsubrates5
// CGsubrates5
// CTsubrates5
// GTsubrates5
// d_statefrequencies5
// d_invariantsites5
// d_ratehetmodel5
// d_numratecats5
// p_ratematrix5
// p_statefrequencies5
// p_invariantsites5
// p_ratehetmodel5
// p_numratecats5
// c_ratematrix5
// c_statefrequencies5
// c_ratehetmodel5
// c_numratecats5
// streefname_choose
if (getValue('user_conffile_') && getValue('user_conffile_there_') && getValue('streefname_choose_')=="upload" )
{
if (!confirm(messageSplit("With this selection, you must upload a starting tree topology file when you use the garli.conf file produced here to configure the run using the Garli 2.0 on TG interface")))
{
return false;
}
}
// attachments_val
// searchreps_value
// bootstrapreps
// outgroup_tax
// collapsebranches_g
// constraintfile
if (getValue('constraintfile_'))
{
if (!confirm(messageSplit("With this selection, you must upload a constraint file to use the garli.conf file produced here to using the Garli 2.0 on TG interface")))
{
return false;
}
}
// refinestart
// randseed
// selectionintensity
// nindivs
// startoptprec
// minoptprec
// numberofprecreductions
// modweight
// brlenweight
// topoweight
// randnniweight
// randsprweight
// limsprweight
// limsprrange
// uniqueswapbias
// saveevery_g
// outputcurrentbesttopology
// logevery_g
// outputeachbettertopology_g
// inferinternalstateprobs_g
// outputphyliptree_g
// outputmostlyuselessfiles_g
// enforcetermconditions
// genthreshfortopoterm
// significanttopochange
// scorethreshforterm
// stopgen
// stoptime
// resampleproportion
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
var element = document.forms['garli_conf_creator'].elements[parameter];
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
var element = document.forms['garli_conf_creator'].elements[parameter];
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
var element = document.forms['garli_conf_creator'].elements[parameter];
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