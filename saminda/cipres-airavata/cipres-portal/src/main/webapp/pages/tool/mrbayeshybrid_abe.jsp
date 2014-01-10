<%@ taglib prefix="s" uri="/struts-tags" %>
<title>MrBayes on Abe</title>
<h2>MrBayes on Abe: Tree Inference Using Bayesian Analysis - run on teragrid (<a href="#REFERENCE">John P. Huelsenbeck and Fred Ronquist</a>)</h2>
<s:form action="mrbayeshybrid_abe" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#mrbayesblockquery')">My Data Contains a MrBayes Data Block (CHECK THIS OR MrBayes BLOCK ENTRIES WILL BE OVERWRITTEN!!!)</A>
<font color="red" size="3">*</font>
<s:checkbox name="mrbayesblockquery_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#set_autoclose_confirm')">I confirm that there is not an "autoclose = no" statement in my MrBayes block</A>
<font color="red" size="3">*</font>
<s:checkbox name="set_autoclose_confirm_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nruns_specified')">My MrBayes Block specifies nruns=</A>
<s:textfield name="nruns_specified_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nchains_specified')">My MrBayes Block specifies nchains=</A>
<s:textfield name="nchains_specified_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nchar_specified')">How many characters in your matrix</A>
<s:textfield name="nchar_specified_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#is_partitioned')">My data set has a partition</A>
<font color="red" size="3">*</font>
<s:checkbox name="is_partitioned_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#is_partitioned_notproteindna')">My partition uses mixed datatypes other than protein or dna</A>
<font color="red" size="3">*</font>
<s:checkbox name="is_partitioned_notproteindna_" onclick="resolveParameters()"/>
<br/>
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
<A name=treeopts><h2><A HREF="javascript:help.slidedownandjump('#treeopts_comment')">Tree Options</A></H2>
<A HREF="javascript:help.slidedownandjump('#usertreesel')">Provide a User Tree? (must be binary, and in Newick format)</A>
<s:checkbox name="usertreesel_" onclick="resolveParameters()"/>
<br/>
<s:select name="Usertreeopt_" headerKey='' headerValue='' list="%{ getDataForParameter('Usertreeopt_')}" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#deroottreeopt')">Deroot the User Tree</A>
<s:checkbox name="deroottreeopt_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#roottreeopts')">Root the Tree (Outgroup must be specified)</A>
<s:checkbox name="roottreeopts_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#outgroupopts')">Set the Outgroup (enter the name or number of the root taxon)</A>
<s:textfield name="outgroupopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#applyconstraints')">Apply constraints to the inferred tree?</A>
<s:checkbox name="applyconstraints_" onclick="resolveParameters()"/>
<br/>
How Many Constraints? (up to 4 may be defined)
<s:textfield name="constraintoptions_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Enter taxa names or numbers for Constraint1, separated by spaces
<s:textfield name="taxonidconstraint1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Enter taxa names or numbers for Constraint2, separated by spaces
<s:textfield name="taxonidconstraint2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Enter taxa names or numbers for Constraint3, separated by spaces
<s:textfield name="taxonidconstraint3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Enter taxa names or numbers for Constraint1, separated by spaces
<s:textfield name="taxonidconstraint4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=lsetopts><h2><A HREF="javascript:help.slidedownandjump('#lsetopts_comment')">Likelihood Model Parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#nstopts')">Set the number of substitution types (Nst=)</A>
<font color="red" size="3">+</font>
<s:radio name="nstopts_"
list="#{ '1':'1' , '2':'2' , '6':'6' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nucmodelopts')">Set the nucleotide substitution model (Nucmodel=)</A>
<font color="red" size="3">+</font>
<s:radio name="nucmodelopts_"
list="#{ '4by4':'4 X 4' , 'doublet':'doublet' , 'codon':'codon' }" onclick="resolveParameters()"/>
<br/>
Set the Codon translation table (Codon=)
<font color="red" size="3">+</font>
<s:select name="codonopts_" list="#{ 'Universal':'Universal' , 'Vertmt':'Vertebrate Mitochondria' , 'Mycoplasma':'Mycoplasma' , 'Ciliates':'Ciliates' , 'Metmt':'Non-vertebrate Metazoan Mitochondria' , 'Yeast':'Yeast' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#omegavaropts')">Allow the nonsynonymous/synonymous rate ratio (omega) (Omegavar=)</A>
<font color="red" size="3">+</font>
<s:radio name="omegavaropts_"
list="#{ 'equal':'equal' , 'Ny98':'Ny98' , 'M3':'M3' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#rateopts')">Set the model for among-site rate variation (Rates=)</A>
<font color="red" size="3">+</font>
<s:select name="rateopts_" list="#{ 'equal':'equal' , 'gamma':'gamma' , 'adgamma':'adgamma' , 'propinv':'propinv' , 'invgamma':'invgamma' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Ngammacatopts')">Set number of rate categories for gamma distribution (Ngammacat=)</A>
<s:textfield name="Ngammacatopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Nbetacatopts')">Set number of rate categories for beta distribution (Nbetacat=)</A>
<s:textfield name="Nbetacatopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Covarionopts')">Force the use of covarion-like model (4X4 dna model, or protein) (Covarion=)</A>
<s:checkbox name="Covarionopts_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#codingopts')">Specify how characters were sampled (Coding=)</A>
<font color="red" size="3">+</font>
<s:select name="codingopts_" list="#{ 'all':'All' , 'variable':'Variable' , 'noabsence':'No absence' , 'nopresence':'No presence' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#Parsmodelopts')">Force calculation under a Parsimony model (Parmodel=)</A>
<s:checkbox name="Parsmodelopts_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=prsetparams><h2><A HREF="javascript:help.slidedownandjump('#prsetparams_comment')">Configure Priors</A></H2>
<A HREF="javascript:help.slidedownandjump('#tratioopts')">Transition/Transversion Ration; DNA only (Tratiopr=)</A>
<font color="red" size="3">+</font>
<s:radio name="tratioopts_"
list="#{ 'beta':'beta' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Beta mean x
<s:textfield name="betameanx_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Beta variance y
<s:textfield name="betavary_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Fixed Transition/Transversion Ratio
<s:textfield name="tratiofixed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#revmatpropts')">Substitution Rates of the GTR Model; Nucleic Data only (Revmatpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="revmatpropts_"
list="#{ 'dirichlet':'dirichlet' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
A/C rate
<s:textfield name="atocrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
A/G rate
<s:textfield name="atograte_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
A/T rate
<s:textfield name="atotrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
C/G rate
<s:textfield name="ctograte_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
C/T rate
<s:textfield name="ctotrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
G/T Rate
<s:textfield name="gtotrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
A/C rate
<s:textfield name="fixedatocrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
A/G rate
<s:textfield name="fixedatograte_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
A/T rate
<s:textfield name="fixedatotrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
C/G rate
<s:textfield name="fixedctograte_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
C/T rate
<s:textfield name="fixedctotrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
G/T Rate
<s:textfield name="fixedgtotrate_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#aamodelpropts')">Set the Rate Matrix for Amino Acids (Aamodelpr=)</A>
<font color="red" size="3">+</font>
<s:select name="aamodelpropts_" list="#{ 'fixed(blosum)':'Blosum' , 'fixed(cprev)':'Cprev' , 'fixed(dayhoff)':'Dayhoff' , 'fixed(equalin)':'Equalin' , 'fixed(gtr)':'GTR' , 'fixed(jones)':'Jones' , 'mixed':'MIxed' , 'fixed(mtmam)':'Mtmam' , 'fixed(mtrev)':'Mtrev' , 'fixed(poisson)':'Poisson' , 'fixed(rtrev)':'Rtrev' , 'fixed(vt)':'Vt' , 'fixed(wag)':'Wag' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#omegapropts')">Nonsynonymous/Synonymous Rate Ratio (Omegapr=)</A>
<font color="red" size="3">+</font>
<s:radio name="omegapropts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Uniform Omega Rate1
<s:textfield name="omegaprdir1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Uniform Omega Rate2
<s:textfield name="omegaprdir2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Exponential Omega Rate
<s:textfield name="omegaprexponential_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Fixed Omega Rate
<s:textfield name="omegafixed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ny98omega1propts')">Nonsynonymous/Synonymous Rate Ratio for sites under purifying selection (Ny98omega1pr=)</A>
<font color="red" size="3">+</font>
<s:radio name="ny98omega1propts_"
list="#{ 'beta':'beta' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Ny98omega1 Beta Rate 1
<s:textfield name="ny98omega1prbeta1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ny98omega1 Beta Rate 2
<s:textfield name="ny98omega1prbeta2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Fixed Ny98Omega1 Rate
<s:textfield name="ny98omega1prfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ny98omega3propts')">Nonsynonymous/Synonymous Rate Ratio for sites under purifying selection (Ny98omega1pr=)</A>
<font color="red" size="3">+</font>
<s:radio name="ny98omega3propts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Ny98 Uniform Omega Rate 1 for Positive Selection
<s:textfield name="ny98omega3pruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ny98 Uniform Omega Rate 2 for Positive Selection
<s:textfield name="ny98omega3pruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ny98 Exponential Omega Rate for Positive Selection
<s:textfield name="ny98omega3prexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Ny98 Fixed Omega Rate for Positive Selection
<s:textfield name="ny98omega3prfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#codoncatfreqsopts')">Frequencies of sites under Purifying, Neutral, and Positive Selection (Codoncatfreqs=)</A>
<font color="red" size="3">+</font>
<s:radio name="codoncatfreqsopts_"
list="#{ 'dirichlet':'dirichlet' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Codoncatfreqs Dirichlet Parameter 1
<s:textfield name="codoncatfreqsdir1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Codoncatfreqs Dirichlet Parameter 2
<s:textfield name="codoncatfreqsdir2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Codoncatfreqs Dirichlet Parameter 3
<s:textfield name="codoncatfreqsdir3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Codoncatfreqs Fixed Parameter 1
<s:textfield name="codoncatfreqsfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Codoncatfreqs Fixed Parameter 2
<s:textfield name="codoncatfreqsfix2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Codoncatfreqs Fixed Parameter 3
<s:textfield name="codoncatfreqsfix3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#statewfreqpropts')">State Frequencies (Statefreqpr=); Assigning frequencies to each state is not supported</A>
<font color="red" size="3">+</font>
<s:radio name="statewfreqpropts_"
list="#{ 'dirichlet':'dirichlet' , 'fixed(equal)':'fixed (equal)' , 'fixed(empirical)':'fixed (empirical)' }" onclick="resolveParameters()"/>
<br/>
Statefreqs Dirichlet Parameter (A single number)
<s:textfield name="statewfreqprdir1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#shapepropts')">Gamma Shape Parameter (Shapepr=)</A>
<font color="red" size="3">+</font>
<s:radio name="shapepropts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Gamma Shape Uniform Parameter 1
<s:textfield name="shapepruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gamma Shape Dirichlet Parameter 2
<s:textfield name="shapeprdir2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gamma Shape Exponential Parameter
<s:textfield name="shapeprexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Gamma Shape Fixed Parameter
<s:textfield name="shapeprfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pinvarpropts')">Proportion of Invariable Sites (Pinvarpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="pinvarpropts_"
list="#{ 'uniform':'uniform' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Invariable Sites, Uniform Parameter 1
<s:textfield name="pinvarpruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Invariable Sites, Uniform Parameter 2
<s:textfield name="pinvarpruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Invariable Sites, Fixed Parameter
<s:textfield name="pinvarprfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ratecorrpropts')">Autocorrelation Parameter for Gamma Distribution for Among SIte Variation (Ratecorrpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="ratecorrpropts_"
list="#{ 'uniform':'uniform' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Autocorrelation Uniform Parameter 1
<s:textfield name="ratecorrpruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Autocorrelation Uniform Parameter 2
<s:textfield name="ratecorrpruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Autocorrelation Fixed Parameter
<s:textfield name="ratecorrprfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#covswitchpropts')">Covrion Switching Rates (Covswitchpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="covswitchpropts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Covarion Model Off to On Rate (Uniform)
<s:textfield name="covswitchuni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Covarion Model On to Off Rate (Uniform)
<s:textfield name="covswitchuni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Covarion Model Exponential Parameter
<s:textfield name="covswitchexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Covarion Model Off to On Rate (Fixed)
<s:textfield name="covswitchfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Covarion Model On to Off Rate (Fixed)
<s:textfield name="covswitchfix2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#symdirihyperpropts')">Stationary frequencies for states in standard data sets (Symdirihyperpr=)</A>
<font color="red" size="3">+</font>
<s:select name="symdirihyperpropts_" list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' , 'fixed(infinity)':'fixed (infinity)' }" onchange="resolveParameters()"/>
<br/>
<br/>
Stationary Frequency Uniform Param 1
<s:textfield name="symdiruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Stationary Frequency Uniform Param 2
<s:textfield name="symdiruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Stationary Frequency Exponential Param 1
<s:textfield name="symdirexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Stationary Frequency Fixed Param 1
<s:textfield name="symdirfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#topologypropts')">Specify Topological Constraint Types (Topologypr=)</A>
<font color="red" size="3">+</font>
<s:radio name="topologypropts_"
list="#{ 'uniform':'uniform' , 'constraints':'constraints' }" onclick="resolveParameters()"/>
<br/>
Enter the names or numbers of the constraints to be used, separated by commas
<s:textfield name="constraintnames1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#brlenspropts')">Probability distribution on branch lengths (Brlenspr=)</A>
<font color="red" size="3">+</font>
<s:select name="brlenspropts_" list="#{ 'unconstrained:uniform':'unconstrained:uniform' , 'unconstrained:exponential':'unconstrained:exponential' , 'clock:uniform':'clock:uniform' , 'clock:birthdeath':'clock:birthdeath' , 'clock:coalescence':'clock:coalescence' }" onchange="resolveParameters()"/>
<br/>
<br/>
Unconstrained Uniform Param 2
<s:textfield name="brlenspruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Unconstrained Exponential Param
<s:textfield name="brlensprexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#treeheightpropts')">Distribution on Tree Height (for Clock Models) (Treeheightpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="treeheightpropts_"
list="#{ 'gamma':'gamma' , 'exponential':'exponential' }" onclick="resolveParameters()"/>
<br/>
Gamma Param 1
<s:textfield name="treeheightsprgamma1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Unconstrained Uniform Param 2
<s:textfield name="treeheightsprgamma2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Unconstrained Exponential Param
<s:textfield name="treeheightsprexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ratepropts')">Site Specific Rates Models (Ratespr=)</A>
<font color="red" size="3">+</font>
<s:radio name="ratepropts_"
list="#{ 'fixed':'fixed' , 'variable':'variable' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#speciationpropts')">Speciation Rate (for Birth:Death Clock Models) (Speciationpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="speciationpropts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Speciationpr Uniform Param 1
<s:textfield name="speciationpruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Speciationpr Uniform Param 2
<s:textfield name="speciationpruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Speciationpr Exponential Param
<s:textfield name="speciationprexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Speciationpr Fixed Param
<s:textfield name="speciationprfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#extinctionpropts')">Extinction Rate (for Birth:Death Clock Models) (Extinctionpr=)</A>
<font color="red" size="3">+</font>
<s:radio name="extinctionpropts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Extinctionpr Uniform Param 1
<s:textfield name="extinctionpruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Extinctionpr Uniform Param 2
<s:textfield name="extinctionpruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Extinctionpr Exponential Param
<s:textfield name="extinctionprexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Extinctionpr Fixed Param
<s:textfield name="extinctionprfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sampleprobopts')">Fraction of Species Samples in Birth Death Analysis (SampleprobExtinctionpr=)</A>
<s:textfield name="sampleprobopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#thetapropts')">Prior on the coalescence parameter (nucleic acid data) (Thetapr=)</A>
<font color="red" size="3">+</font>
<s:radio name="thetapropts_"
list="#{ 'uniform':'uniform' , 'exponential':'exponential' , 'fixed':'fixed' }" onclick="resolveParameters()"/>
<br/>
Thetapr Uniform Param 1
<s:textfield name="thetapruni1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Thetapr Uniform Param 2
<s:textfield name="thetapruni2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Thetapr Exponential Param
<s:textfield name="thetaprexp1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Thetapr Fixed Param
<s:textfield name="thetaprfix1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=datamodifications><h2><A HREF="javascript:help.slidedownandjump('#datamodifications_comment')">Data Specifications</A></H2>
<A HREF="javascript:help.slidedownandjump('#databreaksopts')">Specify Breaks in Sequence Data (Protein and Nucleic Acid Data only)</A>
<s:textfield name="databreaksopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#pairsopts')">Specify nucleotide pairs involved in Watson-Crick pairing (pairs nucmodel=doublet only)</A>
<s:textfield name="pairsopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=Charset><h2><A HREF="javascript:help.slidedownandjump('#Charset_comment')">Character Sets</A></H2>
<A HREF="javascript:help.slidedownandjump('#nocharsets')">How many character sets would you like to define? See the note below.</A>
<s:select name="nocharsets_" headerKey='' headerValue='' list="#{ '0':'0' , '1':'1' , '2':'2' , '3':'3' , '4':'4' , '5':'5' , '6':'6' , '7':'7' , '8':'8' }" onchange="resolveParameters()"/>
<br/>
<br/>
<A HREF="javascript:help.slidedownandjump('#charset1')">Name for character set 1</A>
<s:textfield name="charset1_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 1 range
<s:textfield name="charset1range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 2
<s:textfield name="charset2_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 2 range
<s:textfield name="charset2range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 3
<s:textfield name="charset3_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 3 range
<s:textfield name="charset3range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 4
<s:textfield name="charset4_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 4 range
<s:textfield name="charset4range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 5
<s:textfield name="charset5_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 5 range
<s:textfield name="charset5range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 6
<s:textfield name="charset6_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 6 range
<s:textfield name="charset6range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 7
<s:textfield name="charset7_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 7 range
<s:textfield name="charset7range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Name for character set 8
<s:textfield name="charset8_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Character set 8 range
<s:textfield name="charset8range_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#excludeopts')">Exclude these characters from the analysis </A>
<s:textfield name="excludeopts_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=mcmcparams><h2><A HREF="javascript:help.slidedownandjump('#mcmcparams_comment')">Parameters for MCMC</A></H2>
<A HREF="javascript:help.slidedownandjump('#ngenval')">Number of Generations (Ngen=)</A>
<s:textfield name="ngenval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#seed')">Seed=</A>
<s:textfield name="seed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#swapseed')">Swapseed=</A>
<s:textfield name="swapseed_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nrunsval')">Number of Runs (nruns=)</A>
<s:textfield name="nrunsval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nchainsval')">Number of Chains to Run (nchains=)</A>
<s:textfield name="nchainsval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#tempval')">Temperature parameter (temp=)</A>
<s:textfield name="tempval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#swapfreqval')">How often should swap of states be attempted</A>
<s:textfield name="swapfreqval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nswapsval')">How many swaps should be tried per generation</A>
<s:textfield name="nswapsval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#samplefreqval')">How often should the Markov chain be sampled?</A>
<s:textfield name="samplefreqval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#mcmcdiagnval')">Write acceptance ratios of moves and swaps to file?</A>
<font color="red" size="3">+</font>
<s:radio name="mcmcdiagnval_"
list="#{ 'mcmcdiagn=Yes':'Yes' , 'mcmcdiagn=No':'No' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#minpartfreqval')">Minimum frequency for a partition to be included (minpartfreq)</A>
<s:textfield name="minpartfreqval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#allchainsval')">Record acceptance ratios for all chains?</A>
<font color="red" size="3">+</font>
<s:radio name="allchainsval_"
list="#{ 'allchains=Yes':'Yes' , 'allchains=No':'No' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#relburninval')">Discard a proportion of the sampled values as burnin when calculating the convergence diagnostic?</A>
<font color="red" size="3">+</font>
<s:radio name="relburninval_"
list="#{ 'relburnin=Yes':'Yes' , 'relburnin=No':'No' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#burninfracval')">Specify the fraction of the sampled values discarded as burnin</A>
<s:textfield name="burninfracval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#burninval')">Specify the number of sampled values discarded as burnin</A>
<s:textfield name="burninval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stopruleval')">Stop early if the convergence diagnostic falls below the stop value?</A>
<font color="red" size="3">+</font>
<s:radio name="stopruleval_"
list="#{ 'stoprule=Yes':'Yes' , 'stoprule=No':'No' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#stopval')">Stop early if the convergence diagnostic falls below the stop value?</A>
<s:textfield name="stopval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#npertsval')">Number of random perturbations to apply to user starting tree.</A>
<s:textfield name="npertsval_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Save branch length information?
<font color="red" size="3">+</font>
<s:radio name="sbrlensval_"
list="#{ 'Savebrlens=Yes':'Yes' , 'Savebrlens=No':'No' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#ordertaxaval')">Should taxa be ordered before trees are printed to file?</A>
<font color="red" size="3">+</font>
<s:radio name="ordertaxaval_"
list="#{ 'Ordertaxa=Yes':'Yes' , 'Ordertaxa=No':'No' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=outputopts><h2><A HREF="javascript:help.slidedownandjump('#outputopts_comment')">Output/Reporting Options</A></H2>
<hr/>
<A name=sumtintro><h2><A HREF="javascript:help.slidedownandjump('#sumtintro_comment')">Report parameters</A></H2>
Report format for the transition and transversion rates of a nucleotide substitution model with nst=2
<font color="red" size="3">+</font>
<s:radio name="tratioval_"
list="#{ 'ratio':'ratio' , 'dirichlet':'dirichlet' }" onclick="resolveParameters()"/>
<br/>
Report format for substitution rates of a GTR substitution model for nucleotide or amino acid data
<font color="red" size="3">+</font>
<s:radio name="revmatopts_"
list="#{ 'ratio':'ratio' , 'dirichlet':'dirichlet' }" onclick="resolveParameters()"/>
<br/>
Report the probability of ancestral states at all constrained nodes
<s:checkbox name="reportancstateopts_" onclick="resolveParameters()"/>
<br/>
Report mean site rate in the posterior
<s:checkbox name="reportsiterateopts_" onclick="resolveParameters()"/>
<br/>
Write Mean Omega Values
<s:checkbox name="reportposselopts_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=sumtintro><h2><A HREF="javascript:help.slidedownandjump('#sumtintro_comment')">Set Sumt parameters</A></H2>
Sumt Burnin Value
<s:textfield name="sumtburnin_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sumtnruns')">How many .t files should be summarized (Sumt nruns=)</A>
<s:textfield name="sumtnruns_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sumtntrees')">How many trees should be in the Sumt model</A>
<s:textfield name="sumtntrees_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum probability of partitions to display in Sumt (0.05 = 95%)
<s:textfield name="sumtdisplaygeq_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sumtcontype')">Type of consensus tree</A>
<font color="red" size="3">+</font>
<s:radio name="sumtcontype_"
list="#{ 'contype=Halfcompat':'50% Majority Rule' , 'contype=Allcompat':'All Compatible Groups' }" onclick="resolveParameters()"/>
<br/>
Show Tree Probabilities
<font color="red" size="3">+</font>
<s:radio name="sumtshowtreeprobs_"
list="#{ 'showtreeprobs=Yes':'Yes' , 'showtreeprobs=No':'No' }" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=sumpintro><h2><A HREF="javascript:help.slidedownandjump('#sumpintro_comment')">Set Sump parameters</A></H2>
<A HREF="javascript:help.slidedownandjump('#sumpburnin')">Sump Burnin Value</A>
<s:textfield name="sumpburnin_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sumpnruns')">How many '.p' files from independent analyses will be summarized (sump Nruns=)</A>
<s:textfield name="sumpnruns_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Prepare a likelihood plot
<font color="red" size="3">+</font>
<s:radio name="sumpplot_"
list="#{ 'plot=Yes':'Yes' , 'plot=No':'No' }" onclick="resolveParameters()"/>
<br/>
Calculate estimates of marginal model likelihoods
<font color="red" size="3">+</font>
<s:radio name="sumpmarglike_"
list="#{ 'marglike=Yes':'Yes' , 'marglike=No':'No' }" onclick="resolveParameters()"/>
<br/>
Prepare a table summarizing the parameter value samples
<font color="red" size="3">+</font>
<s:radio name="sumptable_"
list="#{ 'table=Yes':'Yes' , 'table=No':'No' }" onclick="resolveParameters()"/>
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
<dt><a name=mrbayesblockquery><i>My Data Contains a MrBayes Data Block (CHECK THIS OR MrBayes BLOCK ENTRIES WILL BE OVERWRITTEN!!!)</i></a></dt>
<dd>This interface allows you to configure MrBayes from the command line, or from a MrBayes block in your data file.
However, you must choose one or the other. So, if you have a MrBayes Block in your data, you should configure the entire
run in that block (see the MrBayes manual for help on how to do this). It is our belief that MrBayes is sufficiently complex
in its command structure and use that if you want to analyse multiple partitions and multiple datatypes you should do it in
the Nexus file structure. The current interface supports multiple data partitions ONLY in the Nexus file. If you need more
options than we provide, please let us know: http://www.ngbw.org/ngbugz. Other options are not included in this interface
because they (and any complex MrBayes runs) are much better handled in the MrBayes block of your data file, are more useful
for interactive running, or are not appropriate for batch runs. These include: Ctype, Link, Unlink, Delete, Include,
Restore, Props, Plot, and Comparetree, the prset option Aarevmatpropts is not supported; the lset Ploidy option does not
seem to be working in MrBayes 3.1.2. Any parameters requiring printing to the screen are not supported for obvious reasons.
Importantly, unlike the command line version, it is not possible to upload a MrBayes block file that calls a separate data
file with your matrix.
</dd>
<dt><a name=set_autoclose_confirm><i>I confirm that there is not an "autoclose = no" statement in my MrBayes block</i></a></dt>
<dd>Putting an "autoclose = no" statement in your MrBayes block will cause catastorphic failure of the job, and may impact others. Please be careful.
</dd>
<dt><a name=nruns_specified><i>My MrBayes Block specifies nruns=</i></a></dt>
<dd>The values entered for nruns and nchains influence the number of cpu's that can be used in parallel. Please enter the value you specified for
nruns in the MrBayes block of the Nexus file. If you didn't specify a value for nruns, please leave this field at its default value of 2.
</dd>
<dt><a name=nchains_specified><i>My MrBayes Block specifies nchains=</i></a></dt>
<dd>The value entered for nruns and nchains influences the number of cpu's that can be used in parallel. Enter the value you specified
for nchains in the MrBayes block of the nexus file. If you didn't specify a value for nchains, please leave this field at its default value of 4.
</dd>
<dt><a name=nchar_specified><i>How many characters in your matrix</i></a></dt>
<dd>The size of the matrix influences how the job is run. Please enter the number of characters in a row of your uploaded matrix.
</dd>
<dt><a name=is_partitioned><i>My data set has a partition</i></a></dt>
<dd>This option will help the application determine how to run the job</dd>
<dt><a name=is_partitioned_notproteindna><i>My partition uses mixed datatypes other than protein or dna</i></a></dt>
<dd>This option will help the application determine how to run the job</dd>
<dt><a name=runtime><i>Maximum Hours to Run (click here for help setting this correctly)</i></a></dt>
<dd>Estimate the maximum time your job will need to run (between 1 - 168hrs, or < 0.5hr for a test run). Your job will be killed if it doesn't finish within
the time you specify, however jobs with shorter maximum run times often run sooner than longer jobs.
</dd>
<br></br>
<dt><a name=treeopts_comment><i><b>Tree Options</b></i></a></dt>
<dt><a name=usertreesel><i>Provide a User Tree? (must be binary, and in Newick format)</i></a></dt>
<dd>Usertree allows you to provide a user tree for use as a starting tree for a MCMC analysis. For example,
usertree = (A,B,(C,D)) specifies an unrooted tree of four species. Note that the program requires that trees are binary (i.e., strictly bifurcating). Hence, there can be only one three-way split, as shown in the example. If the tree is not binary, the program will return an error.
</dd>
<dt><a name=deroottreeopt><i>Deroot the User Tree</i></a></dt>
<dd>Deroots the user tree. If the tree is already unrooted, no change will occur.</dd>
<dt><a name=roottreeopts><i>Root the Tree (Outgroup must be specified)</i></a></dt>
<dd>Roots the tree. If the tree is already rooted, a warning is issued. The tree is rooted at the outgroup species.
</dd>
<dt><a name=outgroupopts><i>Set the Outgroup (enter the name or number of the root taxon)</i></a></dt>
<dd>Outgroup assigns a taxon to the outgroup. For example, "outgroup 3" assigns the third taxon in the matrix to be the outgroup. Similarly, "outgroup Homo_sapiens" assings the taxon "Homo_sapiens" to be the outgroup (assuming that there is a taxon named "Homo_sapiens" in the matrix). Only a single taxon can be assigned to be the outgroup.
</dd>
<dt><a name=applyconstraints><i>Apply constraints to the inferred tree?</i></a></dt>
<dd>The constraint command defines a tree constraint. The constraint includes a constraint name, and a list of taxa over which that constraint can be applied (Command Line MrBayes requires a probablility value, but ignores it at present, effectively enforcing the constraint over all trees for both prior and posterior). The list of taxa can be specified taxon names, or taxon numbers, separated by commas (the taxset command is not supported here). If you are interested in inferring ancestral states for a particular node, constrain that node first using the 'constraint' command. For more information on how to infer ancestral states, see the help for the 'report' command. It is important to note that simply defining a constraint using this command is not sufficient for the program to actually implement the constraint in an analysis. You must also specify the constraints using 'prset topologypr = constraints (name of constraint)'. For more information, see the help on the 'prset' command.
</dd>
<br></br>
<dt><a name=lsetopts_comment><i><b>Likelihood Model Parameters</b></i></a></dt>
<dt><a name=nstopts><i>Set the number of substitution types (Nst=)</i></a></dt>
<dd>Sets the number of substitution types: "1" constrains all of the rates to be the same (e.g., a JC69 or F81 model); "2" allows transitions and transversions to have potentially different rates (e.g., a K80 or HKY85 model); "6" allows all rates to be different, subject to the constraint of time-reversibility (e.g., a GTR model).
</dd>
<dt><a name=nucmodelopts><i>Set the nucleotide substitution model (Nucmodel=)</i></a></dt>
<dd>This parameter specifies the general form of the nucleotide substitution model. The options are "4by4" [the standard model of DNA substitution in which there are only four states (A,C,G,T/U)], "doublet" (a model appropriate for modelling the stem regions of ribosomal genes where the state space is the 16 doublets of nucleotides), and "codon" (the substitution model is expanded around triplets of nucleotides--a codon).</dd>
<dt><a name=omegavaropts><i>Allow the nonsynonymous/synonymous rate ratio (omega) (Omegavar=)</i></a></dt>
<dd>Allows the nonsynonymous/synonymous rate ratio (omega) to vary across codons. Ny98 assumes that there are three classes, with potentially different omega values (omega1, omega2, omega3): omega2 = 1; omega1 is less than 1 but greater than 0; and omega3 is greater than 1. Like the Ny98 model, the M3 model has three omega classes. However, their values are less constrained, with omega1 less than omega2, which is less than omega3. The default (omegavar = equal) has no variation on omega across sites.</dd>
<dt><a name=rateopts><i>Set the model for among-site rate variation (Rates=)</i></a></dt>
<dd>In general, the rate at a site is considered to be an unknown random variable. Valid options are: equal:No rate variation across sites; gamma: The rate at a site is drawn from a gamma distribution. The gamma distribution has a single parameter that describes how much rates vary; adgamma: Autocorrelated rates across sites. The marginal rate distribution is gamma, but adjacent sites have correlated rates; propinv -- A proportion of the sites are invariable; invgamma -- A proportion of the sites are invariable while the rate for the remaining sites are drawn from a gamma distribution.Note that MrBayes versions 2.0 and earlier supported options that allowed site specific rates (e.g., ssgamma). In versions 3.0 and later, site specific rates are allowed, but set using the 'prset ratepr' command for each partition.
</dd>
<dt><a name=Ngammacatopts><i>Set number of rate categories for gamma distribution (Ngammacat=)</i></a></dt>
<dd>The Ngammacat parameter sets the number of rate categories for the gamma distribution. The gamma distribution is continuous. However, it is virtually impossible to calculate likelihoods under the continuous gamma distribution. Hence, an approximation to the continuous gamma is used; the gamma distribution is broken into ncat categories of equal weight (1/ncat). The mean rate for each category represents the rate for the entire cateogry. This option allows you to specify how many rate categories to use when approximating the gamma. The approximation is better as ncat is increased. In practice, "ncat=4" does a reasonable job of approximating the continuous gamma.
</dd>
<dt><a name=Nbetacatopts><i>Set number of rate categories for beta distribution (Nbetacat=)</i></a></dt>
<dd>A symmetric beta distribution is used to model the stationary frequencies when morphological data are used. This option specifies how well the beta distribution will be approximated.</dd>
<dt><a name=Covarionopts><i>Force the use of covarion-like model (4X4 dna model, or protein) (Covarion=)</i></a></dt>
<dd>This forces the use of a covarion-like model of substitution for nucleotide or amino acid data (it is not used for other data types).The valid options are "yes" and "no". The covarion model allows the rate at a site to change over its evolutionary history. Specifically, the site is either on or off. When it is off, no substitutions are possible. When the process is on, substitutions occur according to a specified substitution model (specified using the other lset options).
</dd>
<dt><a name=codingopts><i>Specify how characters were sampled (Coding=)</i></a></dt>
<dd>The Coding parameter specifies how characters were sampled. If all site patterns had the possibility of being sampled, then "all" should be specified (the default). Otherwise "variable" (only var iable characters had the possibility of being sampled), "noabsence" (characters for which all taxa were coded as absent were not sampled), and "nopresence" (characters for which all taxa were coded as present were not sampled. "All" works for all data types. However, the others only work for morphological (all/variable) or restriction site (all/variable/noabsence/nopresence) data. </dd>
<dt><a name=Parsmodelopts><i>Force calculation under a Parsimony model (Parmodel=)</i></a></dt>
<dd>This forces calculation under the so-called parsimony model described by Tuffley and Steel (1998). The options are "yes" or "no". Note that the biological assumptions of this model are anything but parsimonious. In fact, this model assumes many more parameters than the next most complicated model implemented in this program. If you really believe that the parsimony model makes the biological assumptions described by Tuffley and Steel, then the parsimony method is miss-named.</dd>
<br></br>
<dt><a name=prsetparams_comment><i><b>Configure Priors</b></i></a></dt>
<dt><a name=tratioopts><i>Transition/Transversion Ration; DNA only (Tratiopr=)</i></a></dt>
<dd>Tratiopr changes the prior probability of the transition/transversion ratio. It can be fixed (fixed), or set to a beta distribution with mean x and variance y (beta(x,y)).The program assumes that the transition and transversion rates are independent gamma-distributed random variables with the same scale parameter when beta is selected. If you want a diffuse prior that puts equal emphasis on transition/transversion rate ratios above 1.0 and below 1.0, then use a flat Beta, beta(1,1), which is the default. If you wish to concentrate this distribution more in the equal-rates region, then use a prior of the type beta(x,x), where the magnitude of x determines how much the prior is concentrated in the equal rates region. For instance, a beta(20,20) puts more probability on rate ratios close to 1.0 than a beta(1,1). If you think it is likely that the transition/transversion rate ratio is 2.0, you can use a prior of the type beta(2x,x), where x determines how strongly the prior is concentrated on tratio values near 2.0. For instance, a beta(2,1) is much more diffuse than a beta(80,40) but both have the expected tratio 2.0 in the absence of data. The parameters of the Beta can be interpreted as counts: if you have observed x transitions and y transversions, then a beta(x+1,y+1) is a good representation of this information. The fixed option allows you to fix the tratio to a particular value.</dd>
<dt><a name=revmatpropts><i>Substitution Rates of the GTR Model; Nucleic Data only (Revmatpr=)</i></a></dt>
<dd>
Revmatpr sets the prior for the substitution rates of the GTR model for nucleotide data. For Revmatpr=dirichlet, MrBayes assumes that the six substitution rates are independent gamma-distributed random variables with the same scale parameter. The six numbers in brackets each corresponds to a particular substitution type. Together, they determine the shape of the prior. The six rates are in the order A / C, A / G, A / T, C / G, C / T, and G / T. By default, dirichlet(1,1,1,1,1,1) is used, also referred to as a 'flat' Dirichlet. For a prior where the C / T rate is 5 times and the A / G rate 2 times higher, on average, than the transversion rates, which are all the same, then you should use a prior of the form dirichlet(x,2x,x,x,5x,x), where x determines how much the prior is focused on these particular rates. For more information, see Tratiopr. The fixed option allows you to fix the substitution rates to particular values.
</dd>
<dt><a name=aamodelpropts><i>Set the Rate Matrix for Amino Acids (Aamodelpr=)</i></a></dt>
<dd>Aamodelpr sets the rate matrix for amino acid data.You choose a single fixed model, or choose mixed to average over the ten models by specifying "mixed".
In the latter case, the Markov chain will sample each model according to its probability. The sampled model is reported as an index: poisson(0), jones(1), dayhoff(2), mtrev(3), mtmam(4), wag(5), rtrev(6), cprev(7), vt(8), or blosum(9). The 'Sump' command summarizes the MCMC samples and calculates the posterior probability estimate for each of these models.
</dd>
<dt><a name=omegapropts><i>Nonsynonymous/Synonymous Rate Ratio (Omegapr=)</i></a></dt>
<dd>This parameter specifies the prior on the nonsynonymous/synonymous rate ratio. The options are:uniform, exponential, and fixed.
This parameter is used only when the nucleotide substitution model is set to codon, and there is no variation in omega across sites (i.e. omegavar=equal").
</dd>
<dt><a name=ny98omega1propts><i>Nonsynonymous/Synonymous Rate Ratio for sites under purifying selection (Ny98omega1pr=)</i></a></dt>
<dd>This parameter is only in effect if the nucleotide substitution model is set to "codon" and where omega varies across sites using the model of Nielsen and Yang (1998) (i.e., Ny98). If fixing the parameter, you must specify a number between 0 and 1.
</dd>
<dt><a name=ny98omega3propts><i>Nonsynonymous/Synonymous Rate Ratio for sites under purifying selection (Ny98omega1pr=)</i></a></dt>
<dd>This parameter specifies the prior on the nonsynonymous/synonymous rate ratio for positively selected sites. The options are:uniform, exponential, and fixed. This parameter is only in effect if the nucleotide substitution model is set to codon and where omega varies across sites according to the NY98 model.
</dd>
<dt><a name=codoncatfreqsopts><i>Frequencies of sites under Purifying, Neutral, and Positive Selection (Codoncatfreqs=)</i></a></dt>
<dd>Codoncatfreqs specifies the prior on frequencies of sites under purifying, neutral, and positive selection. The options are dirichlet and fixed. This parameter is relevant if the nucleotide substitution model is set to "codon" and where omega varies across sites using the models of Nielsen and Yang (1998), or Yang et al. (2000) i.e. Omegavar=Ny98 or M3. Note that the sum of the three frequencies must be 1.
</dd>
<dt><a name=statewfreqpropts><i>State Frequencies (Statefreqpr=); Assigning frequencies to each state is not supported</i></a></dt>
<dd>This parameter specifies the prior on the state frequencies. The options are dirichlet, fixed, with equal frequencies, and fixed with empirically determined frequencies.
If you specify a single number, then the prior has all states equally probable with a variance related to the single parameter passed.
</dd>
<dt><a name=shapepropts><i>Gamma Shape Parameter (Shapepr=)</i></a></dt>
<dd>This parameter specifies the prior on the state frequencies. The options are dirichlet, fixed, with equal frequencies, and fixed with emirically determined frequencies.
The dirichlet prior has all states equally probable with a variance related to the single parameter passed in.
</dd>
<dt><a name=pinvarpropts><i>Proportion of Invariable Sites (Pinvarpr=)</i></a></dt>
<dd>This parameter specifies the prior for the proportion of invariable sites. The options are uniform and fixed. The valid range for the parameters is between 0 and 1.
</dd>
<dt><a name=ratecorrpropts><i>Autocorrelation Parameter for Gamma Distribution for Among SIte Variation (Ratecorrpr=)</i></a></dt>
<dd>This parameter specifies the prior for the autocorrelation parameter of the autocorrelated gamma distribution for among-site rate variation. The options are uniform and fixed
The parameter for uniform is between -1 and 1. The default setting is uniform, (-1, 1).
</dd>
<dt><a name=covswitchpropts><i>Covrion Switching Rates (Covswitchpr=)</i></a></dt>
<dd>This option sets the prior for the covarion switching rates. The options are uniform, exponential, and fixed, The covarion model has two rates: a rate from on to off
and a rate from off to on. The rates are assumed to have independent priors that individually are either uniformly or exponentially distributed. The other option is to fix the switching rates, in which case you must specify both rates. (The first number is off to on and the second is on to off; the first should always be less than the second).
</dd>
<dt><a name=symdirihyperpropts><i>Stationary frequencies for states in standard data sets (Symdirihyperpr=)</i></a></dt>
<dd>Symdirihyperpr sets the prior for the stationary frequencies of the states for morphological (standard) data. There can be as many as 10 states for standard data. However, the labelling of the states is somewhat arbitrary. For example, the state "1" for different characters does not have the same meaning. This is not true for DNA characters, for example, where a "G" has the same meaning across characters. The fact that the labelling of morphological characters is arbitrary makes it difficult to allow unequal character state frequencies. MrBayes gets around this problem by assuming that the states have a dirichlet prior, with all states having equal frequency. The variation in the dirichlet can be controlled by this parameter--symdirihyperpr.Symdirihyperpr specifies the distribution on the variance parameter of the dirichlet. Valid options are uniform, exponential, fixed with an explicit rate value, and fixed(infinity). "Fixed(infinity)" fixes the dirichlet prior such that all character states have equal frequency.
</dd>
<dt><a name=topologypropts><i>Specify Topological Constraint Types (Topologypr=)</i></a></dt>
<dd>This parameter specifies the prior probabilities of phylogenies. The options are uniform constraints If the prior is selected to be "uniform" all possible trees are considered a priori equally probable. The constraints option allows you to specify complicated prior probabilities on trees (constraints are discussed more fully in "help constraint"). Note that you must specify a list of constraints that you wish to be obeyed. The list can be either the constraint's number or its name. Also, note that the constraints simply tell you how much more (or less) probable individual trees are that possess the constraint than trees not possessing the constraint.
</dd>
<dt><a name=brlenspropts><i>Probability distribution on branch lengths (Brlenspr=)</i></a></dt>
<dd>Brlenspr specifies the prior probability distribution on branch lengths. The options are unconstrained:uniform, unconstrained:exponential, clock:uniform, clock:birthdeath, clock:coalescence. Trees with unconstrained branch lengths are unrooted whereas clock-constrained trees are rooted. The option after the colon specifies the details of the probability density of branch lengths. If you choose a birth-death or coalescence prior, you may want to modify the details of the parameters of those processes.
</dd>
<dt><a name=treeheightpropts><i>Distribution on Tree Height (for Clock Models) (Treeheightpr=)</i></a></dt>
<dd>Treeheightpr specifies the prior probability distribution on the tree height, when a clock model is specified. The options are gamma and exponential. (And, yes, we know the exponential is a special case of the gamma distribution.) The tree height is the expected number of substitutions on a single branch that extends from the root of the tree to the tips. This parameter does not come into play for the coalescence prior. It insures that the prior probability distribution for unconstrained and birth-death models is proper.
</dd>
<dt><a name=ratepropts><i>Site Specific Rates Models (Ratespr=)</i></a></dt>
<dd>Ratepr specifies the site specific rates model. First, you must have defined a partition of the characters. For example, you may define a partition that divides the characters by codon position, if you have DNA data. Second, you must make that partition the active one using the set command. For example, if your partition is called "by_codon", then you make that the active partition using "set partition=by_codon". Now that you have defined and activated a partition, you can specify the rate multipliers for the various partitions. The options are fixed, variable, and dirichlet. For "fixed" the rate multiplier for that partition is set to 1 (i.e., the rate is fixed to the average rate across partitions). On the other hand, for "variable", the rate is allowed to vary across partitions subject to the constraint that the average rate of substitution across the partitions is 1. You must specify a variable rate prior for at least twopartitions, otherwise the option is not activated when calculating likelihoods. The variable option automatically associates the partition rates with a dirichlet(1,...,1) prior. The dirichlet option is an alternative way of setting a partition rate to be variable, and also gives accurate control of the shape of the prior. The parameters of the Dirichlet are listed in the order of the partitions that the ratepr is applied to. For instance, "prset applyto=(1,3,4)ratepr = dirichlet(10,40,15)" would set the Dirichlet parameter 10 to partition 1, 40 to partition 3, and 15 to partition 4.
</dd>
<dt><a name=speciationpropts><i>Speciation Rate (for Birth:Death Clock Models) (Speciationpr=)</i></a></dt>
<dd>Speciationpr sets the prior on the speciation rate. The options are uniform, exponential, and fixed. This parameter is only relevant if the birth-death process is selected as the prior on branch lengths.
</dd>
<dt><a name=extinctionpropts><i>Extinction Rate (for Birth:Death Clock Models) (Extinctionpr=)</i></a></dt>
<dd>Extinctionpr sets the prior on the extinction rate. Valid options are uniform, exponential, and fixed.This parameter is only relevant if the birth-death process is selected as the prior on branch lengths.
</dd>
<dt><a name=sampleprobopts><i>Fraction of Species Samples in Birth Death Analysis (SampleprobExtinctionpr=)</i></a></dt>
<dd>Sampleprob sets the fraction of species that are sampled in the analysis. This is used with the birth death prior on trees (see Yang and Rannala, 1997).
</dd>
<dt><a name=thetapropts><i>Prior on the coalescence parameter (nucleic acid data) (Thetapr=)</i></a></dt>
<dd>Thetapr sets the prior on the coalescence parameter. This parameter is only relevant if the coalescence process is selected as the prior on branch lengths.
</dd>
<br></br>
<dt><a name=datamodifications_comment><i><b>Data Specifications</b></i></a></dt>
<dt><a name=databreaksopts><i>Specify Breaks in Sequence Data (Protein and Nucleic Acid Data only)</i></a></dt>
<dd>The Databreaks command is used to specify breaks in the input data matrix. Some of the models (e.g. autocorrelated gamma model) implemented by MrBayes account for nonindependence at adjacent characters. Databreaks option specifies that two sites that are adjacent in the matrix, are actually separated by many kilobases or megabases in the genome. For example, say you have a data matrix of 3204 characters that include nucleotide data from three genes that are physically unlinked. The first gene covers characters 1 to 970, the second gene covers characters 971 to 2567, and the third gene covers characters 2568 to 3204. Just enter the last number of the contiuous sequnce, in this case, 970 and 2567, separated by spaces.
</dd>
<dt><a name=pairsopts><i>Specify nucleotide pairs involved in Watson-Crick pairing (pairs nucmodel=doublet only)</i></a></dt>
<dd>The Pairs command is used to specify pairs of nucleotides. For example, RNA sequences with a known secondary structure of stems and loops. Substitutions in nucleotides involved in a Watson-Crick pairing in stems are not strictly independent; a change in one changes the probability of a change in the partner. A solution to this problem is to expand the model around the pair of nucleotides in the stem. Pairs allows you to do this. The correct usage is to enter the numbers of a base-pairforming nucleotide pair, separated by a semicolon: for example:30:56. To include multiplepairs, separate the enteredvalues by commas: 31:55, 32:54, 33:53, 34:52, 35:51, 36:50. This specifies pairings between nucleotides 30 and 56, 31 and 55, etc. Onlynucleotide data (DNA or RNA) may be paired using this command. Note that in order for the program to actually implement a "doublet" model involving a 16 X 16 rate matrix, you must specify that the structure of
the model is 16 X 16 using "lset nucmodel=doublet".
</dd>
<br></br>
<dt><a name=Charset_comment><i><b>Character Sets</b></i></a></dt>
<dt><a name=nocharsets><i>How many character sets would you like to define? See the note below.</i></a></dt>
<dd>You can specify up to 8 character sets here. You can experiment here, but if you get serious, you should really do this in the MrBayes Command block of a Nexus file. For more information see the help section below.</dd>
<dt><a name=charset1><i>Name for character set 1</i></a></dt>
<dd>Charset defines a character set. You must specify the name of the charset you wish to create, and the first and last positions of that set. Both parameters are entered into the forms
provided, for up to 8 charsets. The character set name is entered in the frst box; it cannot have any spaces in it. The character range is entered second, you enter the first character position, and last charcer position, separated by a hyphen. You can use "." to indicate the last character. In addition, the forward slash (\) can be used to tell the program to assign every third (or second, or fifth, or whatever) character to the character set. For example, "charset first_pos = 1-720\3" defines a character set called "first_pos" that includes every third site from 1 to 720.
</dd>
<dt><a name=excludeopts><i>Exclude these characters from the analysis </i></a></dt>
<dd>Exclude removes specific character positions from the analysis. Enter one of the following into the form provided : a set of individual character position numbers separated by spaces (2, 3, 10, 11, 12, 13, 14, and 22); a range of numbers, by giving the starting and finishing position, separated by a hyphen ( 1-100 ). Note the backslah can be used to exclude every nth character (1-100\3), the name of a character set, or "all". A mixture is also allowed (2 3 10-14 22).
</dd>
<br></br>
<dt><a name=mcmcparams_comment><i><b>Parameters for MCMC</b></i></a></dt>
<dt><a name=ngenval><i>Number of Generations (Ngen=)</i></a></dt>
<dd>Ngen sets the number of cycles for the MCMC algorithm. This should be a big number as you want the chain to first reach stasis, and then remain there for enough time to take lots of samples.
</dd>
<dt><a name=seed><i>Seed=</i></a></dt>
<dd>Sets the seed number for the random number generator. The random number seed is initialized haphazardly at the beginning of each MrBayes session. This option allows you to set the seed to some specific value, thereby allowing you to exactly repeat an analysis. If the analysis uses swapping between cold and heated chains, you must also set the swap seed (see below) to exactly repeat the analysis.
</dd>
<dt><a name=swapseed><i>Swapseed=</i></a></dt>
<dd>Sets the seed used for generating the swapping sequence when Metropolis-coupled heated chains are used. By deafult, this seed is generated at the beginning of each MrBayes session. This option allows you to set the seed to some specific value, thereby allowing you to exactly repeat a swap sequence.
</dd>
<dt><a name=nrunsval><i>Number of Runs (nruns=)</i></a></dt>
<dd>Nruns sets the number of independent analyses started simultaneously. Only values of 2 and 4 are permitted.
</dd>
<dt><a name=nchainsval><i>Number of Chains to Run (nchains=)</i></a></dt>
<dd> Nchains specifies how many chains are run for each analysis for the MCMCMC variant. The default is 4: 1 cold chain and 3 heated chains. If Nchains is set to 1, MrBayes will use regular MCMC sampling, without heating.
</dd>
<dt><a name=tempval><i>Temperature parameter (temp=)</i></a></dt>
<dd>Temp is the temperature parameter for heating the chains. The higher the temperature, the more likely the heated chains are tomove between isolated peaks in the posterior distribution. However, excessive heating may lead to very low acceptance rates for swaps between different chains. Before changing the default setting, however, note that the acceptance rates of swaps tend to fluctuate during the burn-in phase of the run.
</dd>
<dt><a name=swapfreqval><i>How often should swap of states be attempted</i></a></dt>
<dd>Swapfreq specifies how often swaps of states between chains are attempted. You must be running at least two chains for this option to be relevant. The default is Swapfreq=1, resulting in Nswaps (see below) swaps being tried each generation of the run. If Swapfreq is set to 10, then Nswaps swaps will be tried every tenth generation of the run.
</dd>
<dt><a name=nswapsval><i>How many swaps should be tried per generation</i></a></dt>
<dd>Nswaps sets the number of swaps tried for each swapping generation of the chain (see also Swapfreq).
</dd>
<dt><a name=samplefreqval><i>How often should the Markov chain be sampled?</i></a></dt>
<dd>Samplefreq specifies how often the Markov chain is sampled. You can sample the chain every cycle, but this results in very large output files. Thinning the chain is a way of making these files smaller and making the samples more independent.
</dd>
<dt><a name=mcmcdiagnval><i>Write acceptance ratios of moves and swaps to file?</i></a></dt>
<dd>Mcmcdiagn determines whether acceptance ratios of moves and swaps will be printed to file. The file will be named similarly to the .p' and '.t' files, but will have the ending '.mcmc'. If more than one independent analysis is run simultaneously (see Nruns below), convergence diagnostics for tree topology will also be printed to this file. The convergence diagnostic used is the average standard deviation in partition frequency values across independent analyses. The Burnin setting (see below) determines how many samples will be discarded as burnin before calculating the partition frequencies. The Minpartfreq setting (see below) determines the minimum partition frequency required for a partition to be included in the calculation. As the independent analyses approach stationarity (converge), the value of the diagnostic is expected to approach zero.
</dd>
<dt><a name=minpartfreqval><i>Minimum frequency for a partition to be included (minpartfreq)</i></a></dt>
<dd>Minpartfreq sets the minimum frequency required for a partition to be included in the calculation of the topology convergence diagnostic. The partition is included if the minimum frequency is reached in at least one of the independent tree samples that are compared.
</dd>
<dt><a name=allchainsval><i>Record acceptance ratios for all chains?</i></a></dt>
<dd>Allchains: when set to YES, acceptance ratios for moves are recorded for all chains, cold or heated. By default, only the acceptance ratios for the cold chain are recorded.
</dd>
<dt><a name=relburninval><i>Discard a proportion of the sampled values as burnin when calculating the convergence diagnostic?</i></a></dt>
<dd> Relburnin: If set to YES, a proportion of the sampled values will be discarded as burnin when calculating the convergence diagnostic. The proportion to be discarded is set with Burninfrac. By default, the Relburnin option is set to NO, resulting in a specific number of samples being discarded instead. This number is set by Burnin (see below).
</dd>
<dt><a name=burninfracval><i>Specify the fraction of the sampled values discarded as burnin</i></a></dt>
<dd>BurninFrac specifies fraction of samples that will be discarded when convergence diagnostics are calculated. The value of this option is only relevant when Relburnin is set to YES. Example: A value for this option of 0.25 means that 25 percent of the samples will be discarded.
</dd>
<dt><a name=burninval><i>Specify the number of sampled values discarded as burnin</i></a></dt>
<dd>Burnin specifies the number of samples (not generations) that will be discarded when convergence diagnostics are calculated. The value of this option is only relevant when Relburnin is set to NO.
</dd>
<dt><a name=stopruleval><i>Stop early if the convergence diagnostic falls below the stop value?</i></a></dt>
<dd>Stoprule: if set to NO, then the chain is run the number of generations determined by Ngen. If it is set to YES, and topological convergence diagnostics are calculated (Mcmcdiagn is set to YES), then the chain will be stopped before the pre-determined number of generations if the convergence diagnostic falls below the stop value.
</dd>
<dt><a name=stopval><i>Stop early if the convergence diagnostic falls below the stop value?</i></a></dt>
<dd>Stopval: the critical value for the topological convergence diagnostic. Only used when Stoprule and Mcmcdiagn are set to yes, and more than one analysis is run simultaneously (Nruns greater than 1).
</dd>
<dt><a name=npertsval><i>Number of random perturbations to apply to user starting tree.</i></a></dt>
<dd>Nperts is the number of random perturbations to apply to the user starting tree. This allows you to have something between completely random and user-defined trees start the chain.
</dd>
<dt><a name=ordertaxaval><i>Should taxa be ordered before trees are printed to file?</i></a></dt>
<dd>Ordertaxa determines whether taxa should be ordered before trees are printed to file. If set to 'Yes', terminals in the sampled trees will be reordered to match the order of the taxa in thedata matrix as closely as possible. By default, trees will be printed without reordering of taxa.
</dd>
<br></br>
<dt><a name=outputopts_comment><i><b>Output/Reporting Options</b></i></a></dt>
<br></br>
<dt><a name=sumtintro_comment><i><b>Report parameters</b></i></a></dt>
<dd>
</dd><dd> Report allows you to control how the posterior distribution is reported. For rate parameters, it allows you to choose among several popular parameterizations. The report command also allows you to request printing of some model aspects that are usually not reported. For instance, if a node is constrained in the analysis, MrBayes can print the probabilities of the ancestral states at that node. Similarly, if there is rate variation in the model, MrBayes can print the inferred site rates, and if there is omega variation, MrBayes can print the inferred omega (positive selection) values foreach codon. In a complex model with several partitions, each partition is controlled separately using the same 'Applyto' mechanism as in the 'Lset' and 'Prset' commands.
Options:
Applyto allows you to apply the report commands to specific partitions. This command should be the first in the list of commands specified in 'report'.
For example, report applyto=(1,2) tratio=ratio
report applyto=(3) tratio=dirichlet
would result in the transition and transversion rates of the first and second partitions in the model being reported as a ratio and the transition and transversion rates of the third partition being reported as proportions of the rate sum (the Dirichlet parameterization).
Tratio -- This specifies the report format for the transition and transversion rates of a nucleotide substitution model with nst=2. If 'ratio' is selected, the rates will be reported as a ratio (transition rate/transversion rate). If 'dirichlet' is selected, the transition and transversion rates will instead be reported as proportions of the rate sum. For example, if the transition rate is three times the transversion rate and 'ratio' is selected, this will reported as a single value, '3.0'. If 'dirichlet' is selected instead, the same rates will be reported using two values, '0.75 0.25'. The sum of the Dirichlet values is always 1. Although the Dirichlet format may be unfamiliar to some users, it is more convenient for specifying priors than the ratio format.
Revmat -- This specifies the report format for the substitution rates of a GTR substitution model for nucleotide or amino acid data. If 'ratio' is selected, the rates will be reported scaled to the G-T rate (for nucleotides) or the Y-V rate (for amino acids). If 'dirichlet' is specified instead, the rates are reported as proportions of the rate sum. For instance, assume that the C-T rate is twice the A-G rate and four times the transversion rates, which are equal. If the report format is set to 'ratio', this would be reported as '1.0 2.0 1.0 1.0 4.0 1.0' since the rates are reported in the order rAC, rAG, rAT, rCG, rCT, rGT and scaled relative to the last rate, the G-T rate. If 'dirichlet' is selected instead, the same rates would have been reported as '0.1 0.2 0.1 0.1 0.4 0.1' since the rates are now scaled so that they sumto 1.0. The Dirichlet format is the parameterization used for formulating priors on the rates.
Ratemult -- This specifies the report format used for the rate multiplier of different model partitions. Three formats are available. If 'scaled' is selected, then rates are scaled such that the mean rate per site across partitions is 1.0. If 'ratio' is chosen, the rates are scaled relative to the rate of the first partition. Finally, if 'dirichlet' is chosen, the rates are given as proportions of the rate sum. The latter is the format used when formulating priors on the rate multiplier.
Ancstates -- If this option is set to 'yes', MrBayes will print the probability of the ancestral states at all constrained nodes. Typically, you are interested in the ancestral states of only a few characters and only at one node in the tree. To perform such an analysis, first define and enforce a topology constraint using 'constraint' and 'prset topologypr = constraints (...)'.Then put the character(s) of interest in a separate partition and set MrBayes to report the ancestral states for that partition. For instance, if the characters of interest are in partition 2, use 'report applyto=(2) ancstates=yes' to force MrBayes to print the probability of the ancestral states of those characters at the constrained node to the '.p' file.
Siterates If this option is set to 'yes' and the relevant model has rate variation across sites, the mean site rate in the posterior will be reported for each site to the '.p' file.
Possel If this option is set to 'yes' and the relevant model has omega variation across sites, the mean omega value for each model site (codon in this case) will be written to the '.p' file.
</dd><dd>
</dd>
<br></br>
<dt><a name=sumtintro_comment><i><b>Set Sumt parameters</b></i></a></dt>
<dd>
</dd><dd> Sumt command is used to produce summary statistics for trees sampled during a Bayesian MCMC analysis. You can either summarize trees from one individual analysis, or trees coming from several independent analyses. In either case, all the sampled trees are read in and the proportion of the time any single taxon bipartition is found is counted. The proportion of the time that the bipartition is found is an approximation of the posterior probability of the bipartition. (A taxon bipartition is defined by removing a branch on the tree, dividing the tree into those taxa to the left and right of the removed branch.) The branchlength of the bipartition is also recorded, if branch lengths have been saved to file. The result is a list of taxon bipartitions, the frequency with which they were found, the posterior probability of the bipartition and the mean and variance of the lengthof the branch (if bl's were recorded).
The partition information is output to a file with the suffix ".parts" and a consensus tree is also printed to a file with the suffix ".con". The consensus tree is either a 50 percent majority rule tree or a majority rule tree showing all compatible partitions. If branch lengths have been recorded during the run, the ".con" file will contain a consensus tree with branch lengths and interior nodes labelled with support values. This tree can be viewed in a program such as TreeView. Finally, MrBayes produces a file with the ending ".trprobs" that contains a list of all the trees that were found during the MCMC analysis, sorted by their probabilities. This list of trees can be used to construct a credible set of trees. For example, if you want to construct a 95 percent credible set of trees, you include all of those trees whose cumulated probability is less than or equal to 0.95. If you are analyzing a large set of taxa, you may actually want to skip the calculation of tree probabilities entirely by setting "Calctreeprobs" to NO.
When calculating summary statistics you probably want to skip those trees that were sampled in the initial part of the run, the so-called burn-in period. The number of skipped samples is controlled by the "burnin" setting. The default is 0 but you typically want to override this setting. If you are summarizing the trees sampled in several independent analyses, such as those resulting from setting the "Nruns" option of the "Mcmc" command to a value larger than 1, MrBayes will also calculate convergence diagnostics for the sampled topologies and branch lengths. These values can help you determine whether it is likely that your chains have converged.
The "Sumt" command expands the "Filename" according to the current values of the "Nruns" and "Ntrees" options. For instance, if both "Nruns" and "Ntrees" are set to 1, "Sumt" will try to open a file named "Filename.t". If "Nruns" is set to 2 and "Ntrees" to 1, then "Sumt" will open two files, Filename.run1.t and Filename.run2.t, etc. By default, the "Filename" option will be set such that "Sumt" automatically summarizes all the results from your immediately preceding "Mcmc" command. You can also use the "Sumt" command to summarize tree samples inolder analyses. If you want to do that, remember to first read in a matrix so that MrBayes knows what taxon names to expect in the trees. Then set the "Nruns", "Ntrees" and "Filename" options appropriately.
Options:
Burnin -- Determines the number of samples that will be discarded from the input file before calculating summary statistics. If there are several input files, the same number of sampleswill be discarded from each. Note that the burnin is set separately for the 'sumt', 'sump', and 'mcmc' commands.
Ntrees -- Determines how many trees there are in the sampled model. If 'Ntrees' is greater then 1 then the names of the files are derived from 'Filename' by adding '.tree1.t', '.tree2.t', etc. If Nruns=1 and Ntrees=1 (see below), then only '.t' is added to 'Filename'.
Displaygeq -- The minimum probability of partitions to display.
Contype -- Type of consensus tree. 'Halfcompat' results in a 50 majority rule tree, 'Allcompat' adds all compatible groups to such a tree.
Calctreeprobs -- Determines whether tree probabilities should be calculated.
</dd><dd>
</dd>
<dt><a name=sumtnruns><i>How many .t files should be summarized (Sumt nruns=)</i></a></dt>
<dd>Sumt Nruns Determines how many '.t' files from independent analyses will be summarized. If Nruns > 1 then the names of the files are derived from 'Filename' by adding '.run1.t', '.run2.t', etc. If Nruns=1 and Ntrees=1 (see below), then only '.t' is added to 'Filename'.
</dd>
<dt><a name=sumtntrees><i>How many trees should be in the Sumt model</i></a></dt>
<dd>Sumt Ntrees determines how many trees there are in the sampled model. If 'Ntrees' > 1 then the names of the files are derived from 'Filename' by adding '.tree1.t', '.tree2.t', etc. If there are both multiple trees and multiple runs, the filenames will be 'Filename.tree1.run1.t', 'Filename.tree1.run2.t', etc.</dd>
<dt><a name=sumtcontype><i>Type of consensus tree</i></a></dt>
<dd>Contype sets the type of consensus tree. The choices are 50 per cent majority rule tree, and one where all compatible groups are added to the tree.</dd>
<br></br>
<dt><a name=sumpintro_comment><i><b>Set Sump parameters</b></i></a></dt>
<dd>
</dd><dd>Sump specifies how information is summarized, and written to a parameter file. During MCMC analysis, MrBayes prints the sampled parameter values to a tab delimited text file. By default, the name of the parameter file is assumed to be the name of the last matrix-containing nexus file, but with a '.p' extension. You can set 'Sump' to summarize the information in any other parameter file by setting the 'filename' option to the appropriate file name. The 'Sump' command does not require a matrix to be read in first. When you invoke the 'Sump' command, three items are output (1) a generation plot of the likelihood values; (2) estimates of the marginal likelihood of the model; and (3) a table with the mean, variance, and 95 percent credible interval for the sampled parameters. Each of these items can be switched on or off using the options 'Plot', 'Marglike', and 'Table'. By default, all three items are output but only to the screen. If output to a file is also desired, set 'Printtofile' to 'Yes'. The name of the output file is specified by setting the 'Outputname' option. When a new matrix is read in or when the 'Mcmc' output filename or 'Sump' input filename is changed, the 'Sump' outputname is changed as well. If you want to output to another file than the default, make sure you specify the outputname every time you invoke 'Sump'. If the specified outputfile already exists, you will
be prompted about whether you like to overwrite it or append to it. When you run several independent analyses simultaneously in MrBayes, the 'Nruns' and 'Filename' options are automatically set such that 'Sump' will summarize all the resulting output files.
Default settings: Burnin:0; Nruns:1; Filename:temp.p.p; Printtofile:No; Outputname:temp.p.stat; Plot:Yes; Marglike:Yes; Table:Yes
</dd><dd>
</dd>
<dt><a name=sumpburnin><i>Sump Burnin Value</i></a></dt>
<dd>Burnin determines the number of samples that will be discarded from the input file before calculating summary statistics. If there are several input files, the same number of samples will be discarded from each.</dd>
<dt><a name=sumpnruns><i>How many '.p' files from independent analyses will be summarized (sump Nruns=)</i></a></dt>
<dd>Sump nruns determines how many '.p' files from independent analyses that will be summarized. If Nruns > 1 then the names of the files are derived from 'Filename' by adding '.run1.p', '.run2.p', etc. If Nruns=1, then the single file name is obtained by adding '.p' to 'Filename'.
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
// mrbayesblockquery
// set_autoclose_confirm
if (getValue('mrbayesblockquery_'))
enable('set_autoclose_confirm_');
else disable('set_autoclose_confirm_');
// nruns_specified
if (getValue('mrbayesblockquery_'))
enable('nruns_specified_');
else disable('nruns_specified_');
// nchains_specified
if (getValue('mrbayesblockquery_'))
enable('nchains_specified_');
else disable('nchains_specified_');
// nchar_specified
// is_partitioned
if (getValue('mrbayesblockquery_'))
enable('is_partitioned_');
else disable('is_partitioned_');
// is_partitioned_notproteindna
if (getValue('is_partitioned_'))
enable('is_partitioned_notproteindna_');
else disable('is_partitioned_notproteindna_');
// runtime
// usertreesel
if (!getValue('mrbayesblockquery_'))
enable('usertreesel_');
else disable('usertreesel_');
// Usertreeopt
if (!getValue('mrbayesblockquery_') && getValue('usertreesel_') )
enable('Usertreeopt_');
else disable('Usertreeopt_');
// deroottreeopt
if (!getValue('mrbayesblockquery_') && !getValue('roottreeopts_'))
enable('deroottreeopt_');
else disable('deroottreeopt_');
// roottreeopts
// outgroupopts
if (!getValue('mrbayesblockquery_'))
enable('outgroupopts_');
else disable('outgroupopts_');
// applyconstraints
if (!getValue('mrbayesblockquery_'))
enable('applyconstraints_');
else disable('applyconstraints_');
// constraintoptions
if (!getValue('mrbayesblockquery_') && getValue('applyconstraints_'))
enable('constraintoptions_');
else disable('constraintoptions_');
// taxonidconstraint1
if (!getValue('mrbayesblockquery_') && getValue('constraintoptions_') >= 1)
enable('taxonidconstraint1_');
else disable('taxonidconstraint1_');
// taxonidconstraint2
if (!getValue('mrbayesblockquery_') && getValue('constraintoptions_') >= 2)
enable('taxonidconstraint2_');
else disable('taxonidconstraint2_');
// taxonidconstraint3
if (!getValue('mrbayesblockquery_') && getValue('constraintoptions_') >= 3)
enable('taxonidconstraint3_');
else disable('taxonidconstraint3_');
// taxonidconstraint4
if (!getValue('mrbayesblockquery_') && getValue('constraintoptions_') >= 4)
enable('taxonidconstraint4_');
else disable('taxonidconstraint4_');
// nstopts
if (!getValue('mrbayesblockquery_'))
enable('nstopts_');
else disable('nstopts_');
// nucmodelopts
if (!getValue('mrbayesblockquery_'))
enable('nucmodelopts_');
else disable('nucmodelopts_');
// codonopts
if (getValue('nucmodelopts_')=="codon" && !getValue('mrbayesblockquery_'))
enable('codonopts_');
else disable('codonopts_');
// omegavaropts
if (!getValue('mrbayesblockquery_') && getValue('nucmodelopts_')=="codon")
enable('omegavaropts_');
else disable('omegavaropts_');
// rateopts
if (!getValue('mrbayesblockquery_'))
enable('rateopts_');
else disable('rateopts_');
// Ngammacatopts
if (!getValue('mrbayesblockquery_') && getValue('rateopts_')=="gamma")
enable('Ngammacatopts_');
else disable('Ngammacatopts_');
// Nbetacatopts
if (!getValue('mrbayesblockquery_'))
enable('Nbetacatopts_');
else disable('Nbetacatopts_');
// Covarionopts
if (!getValue('mrbayesblockquery_'))
enable('Covarionopts_');
else disable('Covarionopts_');
// codingopts
if (!getValue('mrbayesblockquery_'))
enable('codingopts_');
else disable('codingopts_');
// Parsmodelopts
if (!getValue('mrbayesblockquery_'))
enable('Parsmodelopts_');
else disable('Parsmodelopts_');
// tratioopts
if (!getValue('mrbayesblockquery_'))
enable('tratioopts_');
else disable('tratioopts_');
// betameanx
if (!getValue('mrbayesblockquery_') && getValue('tratioopts_')=="beta")
enable('betameanx_');
else disable('betameanx_');
// betavary
if (!getValue('mrbayesblockquery_') && getValue('tratioopts_')=="beta")
enable('betavary_');
else disable('betavary_');
// tratiofixed
if (!getValue('mrbayesblockquery_') && getValue('tratioopts_')=="fixed")
enable('tratiofixed_');
else disable('tratiofixed_');
// revmatpropts
if (!getValue('mrbayesblockquery_'))
enable('revmatpropts_');
else disable('revmatpropts_');
// atocrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="dirichlet")
enable('atocrate_');
else disable('atocrate_');
// atograte
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="dirichlet")
enable('atograte_');
else disable('atograte_');
// atotrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="dirichlet")
enable('atotrate_');
else disable('atotrate_');
// ctograte
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="dirichlet")
enable('ctograte_');
else disable('ctograte_');
// ctotrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="dirichlet")
enable('ctotrate_');
else disable('ctotrate_');
// gtotrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="dirichlet")
enable('gtotrate_');
else disable('gtotrate_');
// fixedatocrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="fixed")
enable('fixedatocrate_');
else disable('fixedatocrate_');
// fixedatograte
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="fixed")
enable('fixedatograte_');
else disable('fixedatograte_');
// fixedatotrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="fixed")
enable('fixedatotrate_');
else disable('fixedatotrate_');
// fixedctograte
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="fixed")
enable('fixedctograte_');
else disable('fixedctograte_');
// fixedctotrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="fixed")
enable('fixedctotrate_');
else disable('fixedctotrate_');
// fixedgtotrate
if (!getValue('mrbayesblockquery_') && getValue('revmatpropts_')=="fixed")
enable('fixedgtotrate_');
else disable('fixedgtotrate_');
// aamodelpropts
if (!getValue('mrbayesblockquery_'))
enable('aamodelpropts_');
else disable('aamodelpropts_');
// omegapropts
if (!getValue('mrbayesblockquery_') && getValue('omegavaropts_')=="equal" && getValue('nucmodelopts_')=="codon" )
enable('omegapropts_');
else disable('omegapropts_');
// omegaprdir1
if (!getValue('mrbayesblockquery_') && getValue('omegapropts_')=="uniform")
enable('omegaprdir1_');
else disable('omegaprdir1_');
// omegaprdir2
if (!getValue('mrbayesblockquery_') && getValue('omegapropts_')=="uniform")
enable('omegaprdir2_');
else disable('omegaprdir2_');
// omegaprexponential
if (!getValue('mrbayesblockquery_') && getValue('omegapropts_')=="exponential")
enable('omegaprexponential_');
else disable('omegaprexponential_');
// omegafixed
if (!getValue('mrbayesblockquery_') && getValue('omegapropts_')=="fixed")
enable('omegafixed_');
else disable('omegafixed_');
// ny98omega1propts
if (!getValue('mrbayesblockquery_') && getValue('omegavaropts_')=="Ny98")
enable('ny98omega1propts_');
else disable('ny98omega1propts_');
// ny98omega1prbeta1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega1propts_')=="beta")
enable('ny98omega1prbeta1_');
else disable('ny98omega1prbeta1_');
// ny98omega1prbeta2
if (!getValue('mrbayesblockquery_') && getValue('ny98omega1propts_')=="beta")
enable('ny98omega1prbeta2_');
else disable('ny98omega1prbeta2_');
// ny98omega1prfix1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega1propts_')=="fixed")
enable('ny98omega1prfix1_');
else disable('ny98omega1prfix1_');
// ny98omega3propts
if (!getValue('mrbayesblockquery_') && getValue('omegavaropts_')=="Ny98")
enable('ny98omega3propts_');
else disable('ny98omega3propts_');
// ny98omega3pruni1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3propts_')=="uniform")
enable('ny98omega3pruni1_');
else disable('ny98omega3pruni1_');
// ny98omega3pruni2
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3propts_')=="uniform")
enable('ny98omega3pruni2_');
else disable('ny98omega3pruni2_');
// ny98omega3prexp1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3propts_')=="exponential")
enable('ny98omega3prexp1_');
else disable('ny98omega3prexp1_');
// ny98omega3prfix1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3pr_')=="fixed")
enable('ny98omega3prfix1_');
else disable('ny98omega3prfix1_');
// codoncatfreqsopts
if (getValue('omegavaropts_')=="Ny98" || getValue('omegavaropts_')=="M3")
enable('codoncatfreqsopts_');
else disable('codoncatfreqsopts_');
// codoncatfreqsdir1
if (!getValue('mrbayesblockquery_') && getValue('codoncatfreqsopts_')=="dirichlet")
enable('codoncatfreqsdir1_');
else disable('codoncatfreqsdir1_');
// codoncatfreqsdir2
if (!getValue('mrbayesblockquery_') && getValue('codoncatfreqsopts_')=="dirichlet")
enable('codoncatfreqsdir2_');
else disable('codoncatfreqsdir2_');
// codoncatfreqsdir3
if (!getValue('mrbayesblockquery_') && getValue('codoncatfreqsopts_')=="dirichlet")
enable('codoncatfreqsdir3_');
else disable('codoncatfreqsdir3_');
// codoncatfreqsfix1
if (!getValue('mrbayesblockquery_') && getValue('codoncatfreqsopts_')=="fixed")
enable('codoncatfreqsfix1_');
else disable('codoncatfreqsfix1_');
// codoncatfreqsfix2
if (!getValue('mrbayesblockquery_') && getValue('codoncatfreqsopts_')=="fixed")
enable('codoncatfreqsfix2_');
else disable('codoncatfreqsfix2_');
// codoncatfreqsfix3
if (!getValue('mrbayesblockquery_') && getValue('codoncatfreqsopts_')=="fixed")
enable('codoncatfreqsfix3_');
else disable('codoncatfreqsfix3_');
// statewfreqpropts
if (!getValue('mrbayesblockquery_'))
enable('statewfreqpropts_');
else disable('statewfreqpropts_');
// statewfreqprdir1
if (!getValue('mrbayesblockquery_') && getValue('statewfreqpropts_')=="dirichlet")
enable('statewfreqprdir1_');
else disable('statewfreqprdir1_');
// shapepropts
if (!getValue('mrbayesblockquery_'))
enable('shapepropts_');
else disable('shapepropts_');
// shapepruni1
if (!getValue('mrbayesblockquery_') && getValue('shapepropts_')=="uniform")
enable('shapepruni1_');
else disable('shapepruni1_');
// shapeprdir2
if (!getValue('mrbayesblockquery_') && getValue('shapepropts_')=="uniform")
enable('shapeprdir2_');
else disable('shapeprdir2_');
// shapeprexp1
if (!getValue('mrbayesblockquery_') && getValue('shapepropts_')=="exponential")
enable('shapeprexp1_');
else disable('shapeprexp1_');
// shapeprfix1
if (!getValue('mrbayesblockquery_') && getValue('shapepropts_')=="fixed")
enable('shapeprfix1_');
else disable('shapeprfix1_');
// pinvarpropts
if (!getValue('mrbayesblockquery_'))
enable('pinvarpropts_');
else disable('pinvarpropts_');
// pinvarpruni1
if (!getValue('mrbayesblockquery_') && getValue('pinvarpropts_')=="uniform")
enable('pinvarpruni1_');
else disable('pinvarpruni1_');
// pinvarpruni2
if (!getValue('mrbayesblockquery_') && getValue('pinvarpropts_')=="uniform")
enable('pinvarpruni2_');
else disable('pinvarpruni2_');
// pinvarprfix1
if (!getValue('mrbayesblockquery_') && getValue('pinvarpropts_')=="fixed")
enable('pinvarprfix1_');
else disable('pinvarprfix1_');
// ratecorrpropts
if (!getValue('mrbayesblockquery_'))
enable('ratecorrpropts_');
else disable('ratecorrpropts_');
// ratecorrpruni1
if (!getValue('mrbayesblockquery_') && getValue('ratecorrpropts_')=="uniform")
enable('ratecorrpruni1_');
else disable('ratecorrpruni1_');
// ratecorrpruni2
if (!getValue('mrbayesblockquery_') && getValue('ratecorrpropts_')=="uniform")
enable('ratecorrpruni2_');
else disable('ratecorrpruni2_');
// ratecorrprfix1
if (!getValue('mrbayesblockquery_') && getValue('ratecorrpropts_')=="fixed")
enable('ratecorrprfix1_');
else disable('ratecorrprfix1_');
// covswitchpropts
if (!getValue('mrbayesblockquery_'))
enable('covswitchpropts_');
else disable('covswitchpropts_');
// covswitchuni1
if (!getValue('mrbayesblockquery_') && getValue('covswitchpropts_')=="uniform")
enable('covswitchuni1_');
else disable('covswitchuni1_');
// covswitchuni2
if (!getValue('mrbayesblockquery_') && getValue('covswitchpropts_')=="uniform")
enable('covswitchuni2_');
else disable('covswitchuni2_');
// covswitchexp1
if (!getValue('mrbayesblockquery_') && getValue('covswitchpropts_')=="exponential")
enable('covswitchexp1_');
else disable('covswitchexp1_');
// covswitchfix1
if (!getValue('mrbayesblockquery_') && getValue('covswitchpropts_')=="fixed")
enable('covswitchfix1_');
else disable('covswitchfix1_');
// covswitchfix2
if (!getValue('mrbayesblockquery_') && getValue('covswitchpropts_')=="fixed")
enable('covswitchfix2_');
else disable('covswitchfix2_');
// symdirihyperpropts
if (!getValue('mrbayesblockquery_'))
enable('symdirihyperpropts_');
else disable('symdirihyperpropts_');
// symdiruni1
if (!getValue('mrbayesblockquery_') && getValue('symdirihyperpropts_')=="uniform")
enable('symdiruni1_');
else disable('symdiruni1_');
// symdiruni2
if (!getValue('mrbayesblockquery_') && getValue('symdirihyperpropts_')=="uniform")
enable('symdiruni2_');
else disable('symdiruni2_');
// symdirexp1
if (!getValue('mrbayesblockquery_') && getValue('symdirihyperpropts_')=="exponential")
enable('symdirexp1_');
else disable('symdirexp1_');
// symdirfix1
if (!getValue('mrbayesblockquery_') && getValue('symdirihyperpropts_')=="fixed")
enable('symdirfix1_');
else disable('symdirfix1_');
// topologypropts
if (!getValue('mrbayesblockquery_') && getValue('noconstraints_') >= 1)
enable('topologypropts_');
else disable('topologypropts_');
// constraintnames1
if (!getValue('mrbayesblockquery_') && getValue('topologypropts_')=="constraints")
enable('constraintnames1_');
else disable('constraintnames1_');
// brlenspropts
if (!getValue('mrbayesblockquery_'))
enable('brlenspropts_');
else disable('brlenspropts_');
// brlenspruni2
if (!getValue('mrbayesblockquery_') && getValue('brlenspropts_')=="uniform")
enable('brlenspruni2_');
else disable('brlenspruni2_');
// brlensprexp1
if (!getValue('mrbayesblockquery_') && getValue('brlenspropts_')=="unconstrained:exponential")
enable('brlensprexp1_');
else disable('brlensprexp1_');
// treeheightpropts
if (!getValue('mrbayesblockquery_'))
enable('treeheightpropts_');
else disable('treeheightpropts_');
// treeheightsprgamma1
if (!getValue('mrbayesblockquery_') && getValue('treeheightpropts_')=="gamma")
enable('treeheightsprgamma1_');
else disable('treeheightsprgamma1_');
// treeheightsprgamma2
if (!getValue('mrbayesblockquery_') && getValue('treeheightpropts_')=="gamma")
enable('treeheightsprgamma2_');
else disable('treeheightsprgamma2_');
// treeheightsprexp1
if (!getValue('mrbayesblockquery_') && getValue('treeheightpropts_')=="exponential")
enable('treeheightsprexp1_');
else disable('treeheightsprexp1_');
// ratepropts
if (!getValue('mrbayesblockquery_'))
enable('ratepropts_');
else disable('ratepropts_');
// speciationpropts
if (!getValue('mrbayesblockquery_') && getValue('brlenspropts_')=="clock:birthdeath")
enable('speciationpropts_');
else disable('speciationpropts_');
// speciationpruni1
if (!getValue('mrbayesblockquery_') && getValue('speciationpropts_')=="uniform")
enable('speciationpruni1_');
else disable('speciationpruni1_');
// speciationpruni2
if (!getValue('mrbayesblockquery_') && getValue('speciationpropts_')=="uniform")
enable('speciationpruni2_');
else disable('speciationpruni2_');
// speciationprexp1
if (!getValue('mrbayesblockquery_') && getValue('speciationpropts_')=="exponential")
enable('speciationprexp1_');
else disable('speciationprexp1_');
// speciationprfix1
if (!getValue('mrbayesblockquery_') && getValue('speciationpropts_')=="fixed")
enable('speciationprfix1_');
else disable('speciationprfix1_');
// extinctionpropts
if (!getValue('mrbayesblockquery_') && getValue('brlenspropts_')=="clock:birthdeath")
enable('extinctionpropts_');
else disable('extinctionpropts_');
// extinctionpruni1
if ( !getValue('mrbayesblockquery_') && getValue('extinctionpropts_')=="uniform")
enable('extinctionpruni1_');
else disable('extinctionpruni1_');
// extinctionpruni2
if (!getValue('mrbayesblockquery_') && getValue('extinctionpropts_')=="uniform")
enable('extinctionpruni2_');
else disable('extinctionpruni2_');
// extinctionprexp1
if (!getValue('mrbayesblockquery_') && getValue('extinctionpropts_')=="exponential")
enable('extinctionprexp1_');
else disable('extinctionprexp1_');
// extinctionprfix1
if (!getValue('mrbayesblockquery_') && getValue('extinctionpropts_')=="fixed")
enable('extinctionprfix1_');
else disable('extinctionprfix1_');
// sampleprobopts
if (!getValue('mrbayesblockquery_') && getValue('brlenspropts_')=="clock:birthdeath")
enable('sampleprobopts_');
else disable('sampleprobopts_');
// thetapropts
if (!getValue('mrbayesblockquery_') && getValue('brlenspropts_')=="clock:coalescence")
enable('thetapropts_');
else disable('thetapropts_');
// thetapruni1
if (!getValue('mrbayesblockquery_') && getValue('extinctionpropts_')=="uniform")
enable('thetapruni1_');
else disable('thetapruni1_');
// thetapruni2
if (!getValue('mrbayesblockquery_') && getValue('extinctionpropts_')=="uniform")
enable('thetapruni2_');
else disable('thetapruni2_');
// thetaprexp1
if (!getValue('mrbayesblockquery_') && getValue('thetapropts_')=="exponential")
enable('thetaprexp1_');
else disable('thetaprexp1_');
// thetaprfix1
if (!getValue('mrbayesblockquery_') && getValue('thetapropts_')=="fixed")
enable('thetaprfix1_');
else disable('thetaprfix1_');
// databreaksopts
if (!getValue('mrbayesblockquery_'))
enable('databreaksopts_');
else disable('databreaksopts_');
// pairsopts
if (!getValue('mrbayesblockquery_') && getValue('nucmodelopts_')=="doublet")
enable('pairsopts_');
else disable('pairsopts_');
// nocharsets
if (!getValue('mrbayesblockquery_'))
enable('nocharsets_');
else disable('nocharsets_');
// charset1
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 1)
enable('charset1_');
else disable('charset1_');
// charset1range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 1)
enable('charset1range_');
else disable('charset1range_');
// charset2
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 2)
enable('charset2_');
else disable('charset2_');
// charset2range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 2)
enable('charset2range_');
else disable('charset2range_');
// charset3
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 3)
enable('charset3_');
else disable('charset3_');
// charset3range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 3)
enable('charset3range_');
else disable('charset3range_');
// charset4
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 4)
enable('charset4_');
else disable('charset4_');
// charset4range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 4)
enable('charset4range_');
else disable('charset4range_');
// charset5
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 5)
enable('charset5_');
else disable('charset5_');
// charset5range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 5)
enable('charset5range_');
else disable('charset5range_');
// charset6
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 6)
enable('charset6_');
else disable('charset6_');
// charset6range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 6)
enable('charset6range_');
else disable('charset6range_');
// charset7
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 7)
enable('charset7_');
else disable('charset7_');
// charset7range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 7)
enable('charset7range_');
else disable('charset7range_');
// charset8
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 8)
enable('charset8_');
else disable('charset8_');
// charset8range
if (!getValue('mrbayesblockquery_') && getValue('nocharsets_') >= 8)
enable('charset8range_');
else disable('charset8range_');
// excludeopts
if (!getValue('mrbayesblockquery_'))
enable('excludeopts_');
else disable('excludeopts_');
// ngenval
if (!getValue('mrbayesblockquery_'))
enable('ngenval_');
else disable('ngenval_');
// seed
if (!getValue('mrbayesblockquery_'))
enable('seed_');
else disable('seed_');
// swapseed
if (!getValue('mrbayesblockquery_'))
enable('swapseed_');
else disable('swapseed_');
// nrunsval
if (!getValue('mrbayesblockquery_'))
enable('nrunsval_');
else disable('nrunsval_');
// nchainsval
if (!getValue('mrbayesblockquery_'))
enable('nchainsval_');
else disable('nchainsval_');
// tempval
if (!getValue('mrbayesblockquery_'))
enable('tempval_');
else disable('tempval_');
// swapfreqval
if (!getValue('mrbayesblockquery_'))
enable('swapfreqval_');
else disable('swapfreqval_');
// nswapsval
if (!getValue('mrbayesblockquery_'))
enable('nswapsval_');
else disable('nswapsval_');
// samplefreqval
if (!getValue('mrbayesblockquery_'))
enable('samplefreqval_');
else disable('samplefreqval_');
// mcmcdiagnval
if (!getValue('mrbayesblockquery_'))
enable('mcmcdiagnval_');
else disable('mcmcdiagnval_');
// minpartfreqval
if (!getValue('mrbayesblockquery_'))
enable('minpartfreqval_');
else disable('minpartfreqval_');
// allchainsval
if (!getValue('mrbayesblockquery_'))
enable('allchainsval_');
else disable('allchainsval_');
// relburninval
if (!getValue('mrbayesblockquery_'))
enable('relburninval_');
else disable('relburninval_');
// burninfracval
if (!getValue('mrbayesblockquery_') && getValue('relburninval_')=="relburnin=Yes")
enable('burninfracval_');
else disable('burninfracval_');
// burninval
if (!getValue('mrbayesblockquery_') && getValue('relburninval_')=="relburnin=No")
enable('burninval_');
else disable('burninval_');
// stopruleval
if (!getValue('mrbayesblockquery_') && getValue('mcmcdiagnval_')=="mcmcdiagn=Yes")
enable('stopruleval_');
else disable('stopruleval_');
// stopval
if (!getValue('mrbayesblockquery_') && getValue('mcmcdiagnval_')=="Yes" && getValue('nrun_') > "1")
enable('stopval_');
else disable('stopval_');
// npertsval
if (!getValue('mrbayesblockquery_') && getValue('startingtreeval_')=="startingtree=user")
enable('npertsval_');
else disable('npertsval_');
// sbrlensval
if (!getValue('mrbayesblockquery_'))
enable('sbrlensval_');
else disable('sbrlensval_');
// ordertaxaval
if (!getValue('mrbayesblockquery_'))
enable('ordertaxaval_');
else disable('ordertaxaval_');
// tratioval
if (!getValue('mrbayesblockquery_') && getValue('nstopts_')==2)
enable('tratioval_');
else disable('tratioval_');
// revmatopts
if (!getValue('mrbayesblockquery_'))
enable('revmatopts_');
else disable('revmatopts_');
// reportancstateopts
if (!getValue('mrbayesblockquery_') && getValue('topologypropts_')=="constraint")
enable('reportancstateopts_');
else disable('reportancstateopts_');
// reportsiterateopts
if (!getValue('mrbayesblockquery_'))
enable('reportsiterateopts_');
else disable('reportsiterateopts_');
// reportposselopts
if (!getValue('mrbayesblockquery_') && getValue('nucmodelopts_')=="codon")
enable('reportposselopts_');
else disable('reportposselopts_');
// sumtburnin
if (!getValue('mrbayesblockquery_'))
enable('sumtburnin_');
else disable('sumtburnin_');
// sumtnruns
if (!getValue('mrbayesblockquery_'))
enable('sumtnruns_');
else disable('sumtnruns_');
// sumtntrees
if (!getValue('mrbayesblockquery_'))
enable('sumtntrees_');
else disable('sumtntrees_');
// sumtdisplaygeq
if (!getValue('mrbayesblockquery_'))
enable('sumtdisplaygeq_');
else disable('sumtdisplaygeq_');
// sumtcontype
if (!getValue('mrbayesblockquery_') && getValue('sumtcalctreeprobs_'))
enable('sumtcontype_');
else disable('sumtcontype_');
// sumtshowtreeprobs
if (!getValue('mrbayesblockquery_'))
enable('sumtshowtreeprobs_');
else disable('sumtshowtreeprobs_');
// sumpburnin
if (!getValue('mrbayesblockquery_'))
enable('sumpburnin_');
else disable('sumpburnin_');
// sumpnruns
if (!getValue('mrbayesblockquery_'))
enable('sumpnruns_');
else disable('sumpnruns_');
// sumpplot
if (!getValue('mrbayesblockquery_'))
enable('sumpplot_');
else disable('sumpplot_');
// sumpmarglike
if (!getValue('mrbayesblockquery_'))
enable('sumpmarglike_');
else disable('sumpmarglike_');
// sumptable
if (!getValue('mrbayesblockquery_'))
enable('sumptable_');
else disable('sumptable_');
}
function validateControl() {
// mrbayesblockquery
// set_autoclose_confirm
if (getValue('mrbayesblockquery_')) {
if (getValue('mrbayesblockquery_') && !getValue('set_autoclose_confirm_')) {
alert('Please acknowledge that there is not a "set autoclose = no" statement in the MrBayes block of your Nexus file');
return false;
}
}
// nruns_specified
if (getValue('mrbayesblockquery_')) {
if (getValue('nruns_specified_')!=2 && getValue('nruns_specified_')!=4) {
alert('The value for nruns must be either 2 or 4');
return false;
}
}
if (getValue('mrbayesblockquery_')) {
if ((((getValue('nruns_specified_') * getValue('nchains_specified_')) % 4) != 0) || (getValue('nruns_specified_') * getValue('nchains_specified_') > 17) ) {
alert('nruns x nchains must be a multiple of 4 and must be <= 16.');
return false;
}
}
// nchains_specified
if (getValue('mrbayesblockquery_')) {
if (getValue('nchains_specified_') < 1) {
alert('The value for nchains must be 1 or greater. The recommended value is at least 4.');
return false;
}
}
if (getValue('mrbayesblockquery_')) {
if ((((getValue('nruns_specified_') * getValue('nchains_specified_')) % 4) != 0) || (getValue('nruns_specified_') * getValue('nchains_specified_') > 17) ) {
alert('nruns x nchains must be a multiple of 4 and must be <= 16.');
return false;
}
}
// nchar_specified
if (getValue('nchar_specified_') < 1) {
alert('The number of characters in the matrix must 1 or greater.');
return false;
}
// is_partitioned
// is_partitioned_notproteindna
// runtime
if (getValue('runtime_') > 168.0) {
alert('The maximum hours to run must be less than 168');
return false;
}
// usertreesel
// Usertreeopt
// deroottreeopt
// roottreeopts
// outgroupopts
// applyconstraints
// constraintoptions
// taxonidconstraint1
// taxonidconstraint2
// taxonidconstraint3
// taxonidconstraint4
// nstopts
// nucmodelopts
// codonopts
// omegavaropts
// rateopts
// Ngammacatopts
// Nbetacatopts
// Covarionopts
// codingopts
// Parsmodelopts
// tratioopts
// betameanx
// betavary
// tratiofixed
// revmatpropts
// atocrate
// atograte
// atotrate
// ctograte
// ctotrate
// gtotrate
// fixedatocrate
// fixedatograte
// fixedatotrate
// fixedctograte
// fixedctotrate
// fixedgtotrate
// aamodelpropts
// omegapropts
// omegaprdir1
// omegaprdir2
// omegaprexponential
// omegafixed
// ny98omega1propts
// ny98omega1prbeta1
// ny98omega1prbeta2
// ny98omega1prfix1
// ny98omega3propts
// ny98omega3pruni1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3propts_')=="uniform") {
if (getValue('ny98omega3pruni1_') < 1) {
alert('The value entered must be greater than or equal to 1');
return false;
}
}
// ny98omega3pruni2
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3propts_')=="uniform") {
if (getValue('ny98omega3pruni2_') < 1) {
alert('The value entered must be greater than or equal to 1');
return false;
}
}
// ny98omega3prexp1
if (!getValue('mrbayesblockquery_') && getValue('ny98omega3propts_')=="exponential") {
if (getValue('ny98omega3prexp1_') < 1) {
alert('The value entered must be greater than or equal to 1');
return false;
}
}
// ny98omega3prfix1
// codoncatfreqsopts
// codoncatfreqsdir1
// codoncatfreqsdir2
// codoncatfreqsdir3
// codoncatfreqsfix1
// codoncatfreqsfix2
// codoncatfreqsfix3
// statewfreqpropts
// statewfreqprdir1
// shapepropts
// shapepruni1
// shapeprdir2
// shapeprexp1
// shapeprfix1
// pinvarpropts
// pinvarpruni1
// pinvarpruni2
// pinvarprfix1
// ratecorrpropts
// ratecorrpruni1
// ratecorrpruni2
// ratecorrprfix1
// covswitchpropts
// covswitchuni1
// covswitchuni2
// covswitchexp1
// covswitchfix1
// covswitchfix2
// symdirihyperpropts
// symdiruni1
// symdiruni2
// symdirexp1
// symdirfix1
// topologypropts
// constraintnames1
// brlenspropts
// brlenspruni2
// brlensprexp1
// treeheightpropts
// treeheightsprgamma1
// treeheightsprgamma2
// treeheightsprexp1
// ratepropts
// speciationpropts
// speciationpruni1
// speciationpruni2
// speciationprexp1
// speciationprfix1
// extinctionpropts
// extinctionpruni1
// extinctionpruni2
// extinctionprexp1
// extinctionprfix1
// sampleprobopts
// thetapropts
// thetapruni1
// thetapruni2
// thetaprexp1
// thetaprfix1
// databreaksopts
// pairsopts
// nocharsets
// charset1
// charset1range
// charset2
// charset2range
// charset3
// charset3range
// charset4
// charset4range
// charset5
// charset5range
// charset6
// charset6range
// charset7
// charset7range
// charset8
// charset8range
// excludeopts
// ngenval
if (!getValue('mrbayesblockquery_')) {
if (getValue('ngenval_') < 5000) {
alert('Please enter a value for ngen of at least 5000 generations');
return false;
}
}
// seed
// swapseed
// nrunsval
if (!getValue('mrbayesblockquery_')) {
if (getValue('nrunsval_')!=2 &&getValue('nrunsval_')!=4 ) {
alert('Nruns must be either 2 or 4');
return false;
}
}
if (!getValue('mrbayesblockquery_')) {
if ((((getValue('nrunsval_') * getValue('nchainsval_')) % 4) != 0) || (getValue('nrunsval_') * getValue('nchainsval_') > 17) ) {
alert('nruns x nchains must be a multiple of 4 and must be less than or equal to 16.');
return false;
}
}
// nchainsval
if (!getValue('mrbayesblockquery_')) {
if (getValue('nchainsval_') < 1) {
alert('Nchains must 1 or greater. Default is 4.');
return false;
}
}
if (!getValue('mrbayesblockquery_')) {
if ((((getValue('nrunsval_') * getValue('nchainsval_')) % 4) != 0) || (getValue('nrunsval_') * getValue('nchainsval_') > 17) ) {
alert('nruns x nchains must be a multiple of 4 and must be less than or equal to 16.');
return false;
}
}
// tempval
// swapfreqval
// nswapsval
// samplefreqval
// mcmcdiagnval
// minpartfreqval
// allchainsval
// relburninval
// burninfracval
// burninval
// stopruleval
// stopval
// npertsval
// sbrlensval
// ordertaxaval
// tratioval
// revmatopts
// reportancstateopts
// reportsiterateopts
// reportposselopts
// sumtburnin
// sumtnruns
// sumtntrees
// sumtdisplaygeq
// sumtcontype
// sumtshowtreeprobs
// sumpburnin
// sumpnruns
// sumpplot
// sumpmarglike
// sumptable
return issueWarning();
}
function issueWarning() {
// mrbayesblockquery
// set_autoclose_confirm
// nruns_specified
// nchains_specified
// nchar_specified
// is_partitioned
// is_partitioned_notproteindna
// runtime
// usertreesel
// Usertreeopt
// deroottreeopt
// roottreeopts
// outgroupopts
// applyconstraints
// constraintoptions
// taxonidconstraint1
// taxonidconstraint2
// taxonidconstraint3
// taxonidconstraint4
// nstopts
// nucmodelopts
// codonopts
// omegavaropts
// rateopts
// Ngammacatopts
// Nbetacatopts
// Covarionopts
// codingopts
// Parsmodelopts
// tratioopts
// betameanx
// betavary
// tratiofixed
// revmatpropts
// atocrate
// atograte
// atotrate
// ctograte
// ctotrate
// gtotrate
// fixedatocrate
// fixedatograte
// fixedatotrate
// fixedctograte
// fixedctotrate
// fixedgtotrate
// aamodelpropts
// omegapropts
// omegaprdir1
// omegaprdir2
// omegaprexponential
// omegafixed
// ny98omega1propts
// ny98omega1prbeta1
// ny98omega1prbeta2
// ny98omega1prfix1
// ny98omega3propts
// ny98omega3pruni1
// ny98omega3pruni2
// ny98omega3prexp1
// ny98omega3prfix1
// codoncatfreqsopts
// codoncatfreqsdir1
// codoncatfreqsdir2
// codoncatfreqsdir3
// codoncatfreqsfix1
// codoncatfreqsfix2
// codoncatfreqsfix3
// statewfreqpropts
// statewfreqprdir1
// shapepropts
// shapepruni1
// shapeprdir2
// shapeprexp1
// shapeprfix1
// pinvarpropts
// pinvarpruni1
// pinvarpruni2
// pinvarprfix1
// ratecorrpropts
// ratecorrpruni1
// ratecorrpruni2
// ratecorrprfix1
// covswitchpropts
// covswitchuni1
// covswitchuni2
// covswitchexp1
// covswitchfix1
// covswitchfix2
// symdirihyperpropts
// symdiruni1
// symdiruni2
// symdirexp1
// symdirfix1
// topologypropts
// constraintnames1
// brlenspropts
// brlenspruni2
// brlensprexp1
// treeheightpropts
// treeheightsprgamma1
// treeheightsprgamma2
// treeheightsprexp1
// ratepropts
// speciationpropts
// speciationpruni1
// speciationpruni2
// speciationprexp1
// speciationprfix1
// extinctionpropts
// extinctionpruni1
// extinctionpruni2
// extinctionprexp1
// extinctionprfix1
// sampleprobopts
// thetapropts
// thetapruni1
// thetapruni2
// thetaprexp1
// thetaprfix1
// databreaksopts
// pairsopts
// nocharsets
// charset1
// charset1range
// charset2
// charset2range
// charset3
// charset3range
// charset4
// charset4range
// charset5
// charset5range
// charset6
// charset6range
// charset7
// charset7range
// charset8
// charset8range
// excludeopts
// ngenval
// seed
// swapseed
// nrunsval
// nchainsval
// tempval
// swapfreqval
// nswapsval
// samplefreqval
// mcmcdiagnval
// minpartfreqval
// allchainsval
// relburninval
// burninfracval
// burninval
// stopruleval
// stopval
// npertsval
// sbrlensval
// ordertaxaval
// tratioval
// revmatopts
// reportancstateopts
// reportsiterateopts
// reportposselopts
// sumtburnin
// sumtnruns
// sumtntrees
// sumtdisplaygeq
// sumtcontype
// sumtshowtreeprobs
// sumpburnin
// sumpnruns
// sumpplot
// sumpmarglike
// sumptable
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
var element = document.forms['mrbayeshybrid_abe'].elements[parameter];
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
var element = document.forms['mrbayeshybrid_abe'].elements[parameter];
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
var element = document.forms['mrbayeshybrid_abe'].elements[parameter];
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