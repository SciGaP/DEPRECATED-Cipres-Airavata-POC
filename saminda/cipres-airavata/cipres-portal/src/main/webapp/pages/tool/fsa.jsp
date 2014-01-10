<%@ taglib prefix="s" uri="/struts-tags" %>
<title>FSA</title>
<h2>FSA: Distance-based alignment of DNA, RNA and proteins. (<a href="#REFERENCE">Robert K. Bradley, Adam Roberts, Michael Smoot, Sudeep Jukevar, Jaeyoung Do, Colin Dewey, Ian Holmes, Lior Pachter</a>)</h2>
<s:form action="fsa" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
<A HREF="javascript:help.slidedownandjump('#runtime')">Maximum Hours to Run (click here for help setting this correctly)</A>
<font color="red" size="3">*</font>
<s:textfield name="runtime_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Data Type
<font color="red" size="3">*</font>
<s:radio name="data_type_"
list="#{ 'protein':'Protein' , 'na':'Nucleic Acid' }" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_anchors')">Use Anchoring (--anchored) </A>
<s:checkbox name="use_anchors_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_anchors')">DIsable Anchoring (--noanchored) </A>
<s:checkbox name="no_anchors_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#align_in_protspace')">Align input nucleotide sequences (must all be nucleotide) in protein space (--nucprot)</A>
<s:checkbox name="align_in_protspace_" onclick="resolveParameters()"/>
<br/>
Perform Anchoring in Protein Space (--translated)
<s:checkbox name="prot_anchor_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#sensitivity_max')">Maximize sensitivity instead of accuracy (--maxsn)</A>
<s:checkbox name="sensitivity_max_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#fast_alignment')">Run Fast Alignment (--fast) (recommended for aligning >50 sequences)</A>
<s:checkbox name="fast_alignment_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#call_exonerate')">Run exonerate (--exonerate)</A>
<s:checkbox name="call_exonerate_" onclick="resolveParameters()"/>
<br/>
Softmask input sequences (--softmasked)
<s:checkbox name="make_softmasked_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#output_stockholm')">Output Stockholm Alignments (--stockholm)</A>
<s:checkbox name="output_stockholm_" onclick="resolveParameters()"/>
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
<A name=HMM_opts><h2><A HREF="javascript:help.slidedownandjump('#HMM_opts_comment')">Pair HMM model options (click and read this)</A></H2>
<A HREF="javascript:help.slidedownandjump('#subst_model')">Initial substitution model (--model)</A>
<font color="red" size="3">+</font>
<s:radio name="subst_model_"
list="#{ '1':'Tamura-Nei' , '0':'Jukes-Cantor' }" onclick="resolveParameters()"/>
<br/>
Evolutionary time parameter (--time)
<s:textfield name="evtime_param_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#num_indel_states')">How many indel states in Pair HMM? (--noindel2)</A>
<font color="red" size="3">+</font>
<s:radio name="num_indel_states_"
list="#{ 'indel2':'2' , 'noindel2':'1' }" onclick="resolveParameters()"/>
<br/>
Tamura-Nei rate alpha_R (transition: purine; --alphar)
<s:textfield name="alpha_R_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Tamura-Nei rate alpha_Y (transition: pyrimidine; --alphay)
<s:textfield name="alpha_Y_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Tamura-Nei rate beta (transversion; --beta)
<s:textfield name="TN_beta_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#open_set1_of_indelstates')">Initial gap-open probability for set 1 of indel states ( --gapopen1)</A>
<s:textfield name="open_set1_of_indelstates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gap_set1_of_indelstates')">Initial gap-extend probability for set 1 of indel states ( --gapextend1)</A>
<s:textfield name="gap_set1_of_indelstates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#open_set2_of_indelstates')">Initial gap-open probability for set 2 of indel states (--gapopen2)</A>
<s:textfield name="open_set2_of_indelstates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#gap_set2_of_indelstates')">Initial gap-extend probability for set 2 of indel states (--gapextend2)</A>
<s:textfield name="gap_set2_of_indelstates_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Upload a posterior probabilities file?
<s:checkbox name="upload_probfile_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#posterior_probfile')">Upload pairwise posterior probabilities file (--load-probs)</A>
<s:select name="posterior_probfile_" headerKey='' headerValue='' list="%{ getDataForParameter('posterior_probfile_')}" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=paramest_opts><h2><A HREF="javascript:help.slidedownandjump('#paramest_opts_comment')">Parameter estimation options</A></H2>
<A HREF="javascript:help.slidedownandjump('#learn_gap')">Estimate indel probabilities for each pair of sequences (--learngap)</A>
<s:checkbox name="learn_gap_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#nolearn_gap')">Disable estimation of indel probabilities for each pair of sequences (--nolearngap)</A>
<s:checkbox name="nolearn_gap_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#learnemit_all')">Estimate emission probabilities over all nuceleic acid sequences (--learnemit-all)</A>
<s:checkbox name="learnemit_all_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#not_learnemitbypair')">Disable estimation of emission probabilities by pairs of nuceleic acid sequences ( --nolearnemit-bypair)</A>
<s:checkbox name="not_learnemitbypair_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#learnemit_pair')">Estimate emission probabilities for each pair of amino acid sequences (--learnemit-bypair)</A>
<s:checkbox name="learnemit_pair_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#not_learnemitall')">Disable estimation of a single emission probability for all amino acid sequences (--nolearnemit-all)</A>
<s:checkbox name="not_learnemitall_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_learn')">Disable ALL parameter learning (--nolearn)</A>
<s:checkbox name="no_learn_" onclick="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#no_regularize')">Disable regularizing of learned emission and gap probabilities with Dirichlet prior (--noregularize)</A>
<s:checkbox name="no_regularize_" onclick="resolveParameters()"/>
<br/>
Scaling factor for transition prior (--regularization-gapscale)
<s:textfield name="reg_gapscale_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Scaling factor for emission Dirichlet prior ( --regularization-emitscale)
<s:textfield name="reg_emitscale_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Minimum fractional increase in log-likelihood per round of expectation maximization EM (--mininc)
<s:textfield name="min_increase_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum number of iterations of expectation maximization (EM) (--maxrounds)
<s:textfield name="max_rounds_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#min_gapdata')">Minimum number of aligned pairs of characters required for training gap probs (--mingapdata)</A>
<s:textfield name="min_gapdata_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#min_emitdata')">Minimum number of aligned pairs of characters for training emission probs (--minemitdata) 60 (dna) or 1596 (aa)</A>
<s:textfield name="min_emitdata_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=mult_opts><h2><A HREF="javascript:help.slidedownandjump('#mult_opts_comment')">Multiple alignment: Sequence annealing options</A></H2>
<A HREF="javascript:help.slidedownandjump('#gap_factor')">Gap factor (-gapfactor)</A>
<s:textfield name="gap_factor_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#num_iterations')">Limit the number of iterative refinement steps (no entry here means unlimited steps) (--refinement)</A>
<s:textfield name="num_iterations_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Disable dynamic edge re-weighting. NOT GENERALLY RECOMMENDED (--nodynamicweights)
<s:checkbox name="no_dynweight_" onclick="resolveParameters()"/>
<br/>
Require detectable homology between all input sequences (--require-homology)
<s:checkbox name="require_homology_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=speedup_many_opts><h2><A HREF="javascript:help.slidedownandjump('#speedup_many_opts_comment')">Speedup options for alignments with many sequences</A></H2>
<A HREF="javascript:help.slidedownandjump('#ref_alignment')">Use First Sequence as Reference for the Alignment (--refalign) </A>
<s:checkbox name="ref_alignment_" onclick="resolveParameters()"/>
<br/>
Specify how many minimum spanning trees on input sequences for pairwise comparisons, default 3 (--mst-min)
<s:textfield name="min_spantree_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Specify how many maximum spanning trees on input sequences for pairwise comparisons, default 0 (--mst-max)
<s:textfield name="max_spantree_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Specify how many minimum spanning palm trees on input sequences for pairwise comparisons, default 0 (--mst-palm)
<s:textfield name="max_palmtree_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Specify how many pairwise comparisons between closest sequences default 0 (--degree)
<s:textfield name="number_degree_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Length of k-mers to use when determining sequence similarity (--kmer)
<s:textfield name="kmer_length_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#alignment_fraction')">Randomized fraction of all pairs of sequences to consider during alignment inference (--alignment-fraction)</A>
<s:textfield name="alignment_fraction_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#alignment_number')">Total number of (randomized) pairs of sequences to consider during alignment inference (--alignment-number)</A>
<s:textfield name="alignment_number_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=speedup_long_opts><h2><A HREF="javascript:help.slidedownandjump('#speedup_long_opts_comment')">Speedup options for alignments with long sequences (MUMmer)</A></H2>
<A HREF="javascript:help.slidedownandjump('#min_anchorlen')">Minimum length of exact matches for anchoring (--minlen) </A>
<s:textfield name="min_anchorlen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#max_joinlen')">Maximum ungapped separation of parallel adjacent anchors to join (--maxjoinlen) </A>
<s:textfield name="max_joinlen_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#use_hardmask')">Leave hardmasked sequences greater than 10 nt unaligned instead of randomizing (--hardmasked)</A>
<s:checkbox name="use_hardmask_" onclick="resolveParameters()"/>
<br/>
<hr/>
<A name=speedup_long_opts2><h2><A HREF="javascript:help.slidedownandjump('#speedup_long_opts2_comment')">Speedup options for alignments with long sequences</A></H2>
Minimum score of alignments found by exonerate (--minscore)
<s:textfield name="exon_minscore_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<A HREF="javascript:help.slidedownandjump('#provide_mercator')">Provide a file with constraint maps produced by the Mercator (--mercator)</A>
<s:select name="provide_mercator_" headerKey='' headerValue='' list="%{ getDataForParameter('provide_mercator_')}" onchange="resolveParameters()"/>
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
<dt><a name=use_anchors><i>Use Anchoring (--anchored) </i></a></dt>
<dd>Anchoring is turned on when nucleotide sequences are longer than 200 nucleotides. This option forces it to turn on when the sequence length is less than 200. To use translated anchoring in protein space, use the option --translated. The minimum length of anchors, controlled with --minlen, is 10 for nucleotide sequence and 7 for amino acid sequence (for anchoring protein sequences or translated anchoringof nu­cleotide sequence).</dd>
<dt><a name=no_anchors><i>DIsable Anchoring (--noanchored) </i></a></dt>
<dd>Long sequence alignment speedup options: Anchoring can be turned off with --noanchored. Anchoring is turned on when nucleotide sequences are longer than 200 nucleotides. Translated anchoring in protein space is invoked with --translated. The minimum length of anchors, controlled with --minlen, is 10 for nucleotide sequence and 7 for amino acid sequence (for anchoring protein sequences or translated anchoringof nu­cleotide sequence).</dd>
<dt><a name=align_in_protspace><i>Align input nucleotide sequences (must all be nucleotide) in protein space (--nucprot)</i></a></dt>
<dd>Using this option, FSA aligns coding nucleotide sequences by first translating the sequences, aligning the resulting protein sequences, and then displaying the corresponding nucleotide-level alignment. All sequences must be nucleotide.</dd>
<dt><a name=sensitivity_max><i>Maximize sensitivity instead of accuracy (--maxsn)</i></a></dt>
<dd>FSA can be run in maximum-sensitivity mode with --maxsn. For users wanting finer-grained control over the sensitivity/specificity trade-off, the gap factor can be specified with --gapfactor (the gap factor is explained in the main text).The default is --gapfactor1, which corresponds to the case where sequence annealing stops aligning characters when the probability that a character is aligned is equal to the probability that it is unaligned (aligned to a gap). The maximum-sensitivity mode is equivalent to using --gapfactor 0; values > 1 give higher specificity. Dynamic weighting can be disabled with --nodynamicweights, although this is generally not recommended (see the main text for a description of weighting).</dd>
<dt><a name=fast_alignment><i>Run Fast Alignment (--fast) (recommended for aligning >50 sequences)</i></a></dt>
<dd>The --fast option is recommended for aligning >50 sequences. It uses presets which are appropriate for aligning many sequences. It sets --alignment-fraction to the Erdenyi threshold probability scaled by a factor of 5 and sets --learning-fraction to the threshold scaled by a factor of 2. As suggested by the results in the main text, the heuristics invoked by --fast are effective for difficult alignment problems.</dd>
<dt><a name=call_exonerate><i>Run exonerate (--exonerate)</i></a></dt>
<dd>FSA can call the exonerate program to obtain anchors between distant species, where there are few exact matches. Use --exonerate to trigger anchor-finding with exonerate as well as MUMmer. By default FSA only uses candidate alignments with scores _ 100; change this with --minscore. Use --softmasked to tell exonerate that the input sequences are softmasked. </dd>
<dt><a name=output_stockholm><i>Output Stockholm Alignments (--stockholm)</i></a></dt>
<dd>Use this option to produce Stockholm-format alignments. FSA_s Stockholm-format alignments are annotated with per-column accuracy information as well as a single accuracy estimate for the entire alignment. </dd>
<br></br>
<dt><a name=HMM_opts_comment><i><b>Pair HMM model options (click and read this)</b></i></a></dt>
<dd>
</dd><dd>FSA has a significant amount of data-handling "intelligence." Many settings are chosen automatically based on the data set provided. The advanced paramters section allows users to override default settings with a command-line option. This interface is designed to make it possible to take advantage of this feature. Users can supply a value to be passed to FSA in place of its default behavior. If no values are entered, FSA uses its own logic to make an appropriate choice automatically.</dd><dd>
</dd>
<dt><a name=subst_model><i>Initial substitution model (--model)</i></a></dt>
<dd>The substitution model for nucleotide or amino acid sequence can be chosen with the --model option. For DNA or RNA, the model can be either the Jukes-Cantor orTamura-Nei. These models are further parameterized with the --time, --alphar, --alphay and --beta options. Protein sequences use the BLOSUM 62 substitution matrix, which is transformed such that the equilibrium distribution is equal to the empirical distribution over amino acids in the input sequences.</dd>
<dt><a name=num_indel_states><i>How many indel states in Pair HMM? (--noindel2)</i></a></dt>
<dd>The option of one indel state replaces the default 5-statePair HMM with a three-state HMM, which has only one set of Insert (I) and Delete (D) states.</dd>
<dt><a name=open_set1_of_indelstates><i>Initial gap-open probability for set 1 of indel states ( --gapopen1)</i></a></dt>
<dd>
For protein and DNA, gap_open1 default = 0.02 for three state model (if --noindel2 is requested); default = 0.012 for five state model</dd>
<dt><a name=gap_set1_of_indelstates><i>Initial gap-extend probability for set 1 of indel states ( --gapextend1)</i></a></dt>
<dd>For DNA, gap_extend1, defalt value = 0.4 for five state model (default condition). For a three state DNA/RNA model ( if --noindel2 is requested) default = 0.3. For protein gap_extend1 default = 0.397 for a five state model (default condition); for a three state model ( if --noindel2 is requested) default = 0.794. </dd>
<dt><a name=open_set2_of_indelstates><i>Initial gap-open probability for set 2 of indel states (--gapopen2)</i></a></dt>
<dd>This parameter is only relevant for five state models. For DNA and protein, gap_open2 has a default value = 0.008. </dd>
<dt><a name=gap_set2_of_indelstates><i>Initial gap-extend probability for set 2 of indel states (--gapextend2)</i></a></dt>
<dd>This parameter is only relevant for five state models. For DNA, default gap_extend2 = 0.9; for protein, default gap_extend2 = 0.899;
</dd>
<dt><a name=posterior_probfile><i>Upload pairwise posterior probabilities file (--load-probs)</i></a></dt>
<dd>This option allows you to upload pairwise posterior probabilities from a file rather than performing inference with Pair HMM. Selecting this option disables
the other options in this section irrelevant. A sample posterior probabilities files can be found at http://www.phylo.org/tools/tool_tests/fsa_postprobs.txt</dd>
<br></br>
<dt><a name=paramest_opts_comment><i><b>Parameter estimation options</b></i></a></dt>
<dt><a name=learn_gap><i>Estimate indel probabilities for each pair of sequences (--learngap)</i></a></dt>
<dd>FSA query-specific learning uses unsupervised EM to learn appropriate parameters for each pair of input sequences. The --learngap, --learnemit-bypair and --learnemit-all options control whether FSA estimates pairwise transition and emission probabilities.</dd>
<dt><a name=nolearn_gap><i>Disable estimation of indel probabilities for each pair of sequences (--nolearngap)</i></a></dt>
<dd>FSA query-specific learning uses unsupervised EM to learn appropriate parameters for each pair of input sequences. The --learngap, --learnemit-bypair and --learnemit-all options control whether FSA estimates pairwise transition and emission probabilities. This option allows the user to prevent calculation of a separate gap distribution for each pair of sequences.</dd>
<dt><a name=learnemit_all><i>Estimate emission probabilities over all nuceleic acid sequences (--learnemit-all)</i></a></dt>
<dd>The learnemit-all option estimates emission probabilities over all sequences, instead of by pairs. This option is active by default for proteins. If you select this for DNA/RNA, it will override the default, which is to estimate emission probabilities for each pair of sequences.</dd>
<dt><a name=not_learnemitbypair><i>Disable estimation of emission probabilities by pairs of nuceleic acid sequences ( --nolearnemit-bypair)</i></a></dt>
<dd>Use this switch to disable estimation of emission probabilities for each pair of DNA/RNA sequences.</dd>
<dt><a name=learnemit_pair><i>Estimate emission probabilities for each pair of amino acid sequences (--learnemit-bypair)</i></a></dt>
<dd>The learnemit-bypair option estimates emission probabilities for each pair of sequences, instead of over all sequences. This option is active by default for DNA and RNA. If you select this for proteins, it will override the default, which is to estimate emission probabilities over all sequences.</dd>
<dt><a name=not_learnemitall><i>Disable estimation of a single emission probability for all amino acid sequences (--nolearnemit-all)</i></a></dt>
<dd>-Use this switch to disable learning a single emission distribution for all amino acid sequences</dd>
<dt><a name=no_learn><i>Disable ALL parameter learning (--nolearn)</i></a></dt>
<dd>The --nolearn options disables all learning, and default ProbCons parameters are used</dd>
<dt><a name=no_regularize><i>Disable regularizing of learned emission and gap probabilities with Dirichlet prior (--noregularize)</i></a></dt>
<dd>The Dirichlet transition and emission regularization scales can be adjusted with --regularization-gapscale and --regularization-emitscale; regularization can be turned off entirely with --noregularize. The emission regularization scales correspond to the total number of pseudocount emissions, because the seed distribution for pseudocount calculation (taken to be the seed emission parameters) is normalized to 1. The emission regularization scales are equal to the number of free parameters in a symmetric pair emission matrix, 4 · (4 _ 1)/2+4 = 10 for nucleotides and 20 · (20 _ 1)/2+20 = 210 for amino acids. We have observed that FSA learning is insensitive to the transition regularization scale (qualitatively because there are many transition counts for typical pairs of sequences, thereby dwarfing the effects of the weak regularizer), which is set to 3 by default.</dd>
<dt><a name=min_gapdata><i>Minimum number of aligned pairs of characters required for training gap probs (--mingapdata)</i></a></dt>
<dd>The minimum amount of sequence data for learning transition and emission probabilities can be controlled with --mingapdata and --minemitdata. By default the minimum data for learning gap probabilities corresponds approximately to 60 characters.</dd>
<dt><a name=min_emitdata><i>Minimum number of aligned pairs of characters for training emission probs (--minemitdata) 60 (dna) or 1596 (aa)</i></a></dt>
<dd>The minimum amount of sequence data for learning transition and emission probabilities can be controlled with --mingapdata and --minemitdata. By default the minimum data for learning emission probabilities corresponds approximately to two DNA or RNA sequences of length 60 nucleotides (minemitdata = 60) or four protein sequences of length 266 amino acids (minemitdata = 1596), which corresponds to observing each of independent parameter of a substitution matrix four times.</dd>
<br></br>
<dt><a name=mult_opts_comment><i><b>Multiple alignment: Sequence annealing options</b></i></a></dt>
<dt><a name=gap_factor><i>Gap factor (-gapfactor)</i></a></dt>
<dd>For the gap factor: Use 0 for highest sensitivity (the internal effective minimum is 0.01); use values greater than 1 for higher specificity (default is 1) </dd>
<dt><a name=num_iterations><i>Limit the number of iterative refinement steps (no entry here means unlimited steps) (--refinement)</i></a></dt>
<dd> The number of rounds of iterative refinement is controlled with --refinement. </dd>
<br></br>
<dt><a name=speedup_many_opts_comment><i><b>Speedup options for alignments with many sequences</b></i></a></dt>
<dt><a name=ref_alignment><i>Use First Sequence as Reference for the Alignment (--refalign) </i></a></dt>
<dd>The refalign option uses the first sequence in the input file as a reference alignment. No other pairwise comparisons are performed, so a total of (N _ 1) comparisons are made.
</dd>
<dt><a name=alignment_fraction><i>Randomized fraction of all pairs of sequences to consider during alignment inference (--alignment-fraction)</i></a></dt>
<dd>Alignment speedup options: many sequences. The user can control the fraction or total number of pairwise comparisons made when building a multiple alignment with the --alignment-fraction and --alignment-number options. The number of comparisons used when aligning N sequences can lie be­tween (N _ 1) and N · (N _ 1)/2;as discussed in the main text, we observe good performance even when only a subset of pairs are used. The number of pairwise comparisons used for parameter learning when --learnemit-all (the default for proteins) is enabled can be similarly controlled with--learning-fraction and --learning-number. Gen­erally fewer pairwise comparisons are necessary for effective parameter learning than for constructing a multiple alignment. </dd>
<dt><a name=alignment_number><i>Total number of (randomized) pairs of sequences to consider during alignment inference (--alignment-number)</i></a></dt>
<dd>Alignment speedup options: many sequences. The user can control the fraction or total number of pairwise comparisons made when building a multiple alignment with the -alignment-fraction and -alignment-number options. The number of comparisons used when aligning N sequences can lie be­tween (N _ 1) and N · (N _ 1)/2; as discussed in the main text, we observe good performance even when only a subset of pairs are used. The number of pairwise comparisons used for parameter learning when -learnemit-all (the default for proteins) is enabled can be similarly controlled with--learning-fraction and -learning-number. Generally fewer pairwise comparisons are necessary for effective parameter learning than for constructing a multiple alignment. </dd>
<br></br>
<dt><a name=speedup_long_opts_comment><i><b>Speedup options for alignments with long sequences (MUMmer)</b></i></a></dt>
<dt><a name=min_anchorlen><i>Minimum length of exact matches for anchoring (--minlen) </i></a></dt>
<dd> By default, the minimum length of anchors is 10 for nucleotide sequence and 7 for amino acid sequence (for anchoring protein sequences or translated anchoring of nucleotide sequence).</dd>
<dt><a name=max_joinlen><i>Maximum ungapped separation of parallel adjacent anchors to join (--maxjoinlen) </i></a></dt>
<dd> Because MUMmer reports only exact matches, by default FSA concatenates adjacent parallel anchors which are separated by at most 2 mismatches; this can be controlled with --maxjoinlen
</dd>
<dt><a name=use_hardmask><i>Leave hardmasked sequences greater than 10 nt unaligned instead of randomizing (--hardmasked)</i></a></dt>
<dd>The --hardmasked option is the default for long DNA sequences</dd>
<br></br>
<dt><a name=speedup_long_opts2_comment><i><b>Speedup options for alignments with long sequences</b></i></a></dt>
<dt><a name=provide_mercator><i>Provide a file with constraint maps produced by the Mercator (--mercator)</i></a></dt>
<dd>The Mercator option is used for aligning long sequences. FSA can use the constraint maps produced by the homology-mapping program Mercator to constrain the multiple alignment.
Mercator is found here: Dewey CN (2006) Whole-Genome Alignments and Polytopes for Comparative Genomics. Ph.D. Thesis, EECS Department, University of California, Berkeley. URL http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-104.html</dd>
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
// data_type
// use_anchors
if (!getValue('no_anchors_'))
enable('use_anchors_');
else disable('use_anchors_');
// no_anchors
if (!getValue('use_anchors_'))
enable('no_anchors_');
else disable('no_anchors_');
// align_in_protspace
if (getValue('data_type_')=="na")
enable('align_in_protspace_');
else disable('align_in_protspace_');
// prot_anchor
if (getValue('data_type_')=="na" & !getValue('no_anchors_'))
enable('prot_anchor_');
else disable('prot_anchor_');
// sensitivity_max
// fast_alignment
// call_exonerate
if (!getValue('no_anchors_') & !getValue('align_in_protspace_'))
enable('call_exonerate_');
else disable('call_exonerate_');
// make_softmasked
if (!getValue('no_anchors_'))
enable('make_softmasked_');
else disable('make_softmasked_');
// output_stockholm
// subst_model
if (getValue('data_type_')=="na")
enable('subst_model_');
else disable('subst_model_');
// evtime_param
if (!getValue('upload_probfile_'))
enable('evtime_param_');
else disable('evtime_param_');
// num_indel_states
if (!getValue('upload_probfile_'))
enable('num_indel_states_');
else disable('num_indel_states_');
// alpha_R
if (getValue('data_type_')=="na" & getValue('subst_model_')=="1" & !getValue('align_in_protspace_') & !getValue('upload_probfile_'))
enable('alpha_R_');
else disable('alpha_R_');
// alpha_Y
if (getValue('data_type_')=="na" & getValue('subst_model_')=="1" & !getValue('align_in_protspace_') & !getValue('upload_probfile_'))
enable('alpha_Y_');
else disable('alpha_Y_');
// TN_beta
if (getValue('data_type_')=="na" & getValue('subst_model_')=="1" & !getValue('align_in_protspace_') & !getValue('upload_probfile_'))
enable('TN_beta_');
else disable('TN_beta_');
// open_set1_of_indelstates
if (!getValue('upload_probfile_'))
enable('open_set1_of_indelstates_');
else disable('open_set1_of_indelstates_');
// gap_set1_of_indelstates
if (!getValue('upload_probfile_'))
enable('gap_set1_of_indelstates_');
else disable('gap_set1_of_indelstates_');
// open_set2_of_indelstates
if (getValue('num_indel_states_')=="indel2" & !getValue('upload_probfile_'))
enable('open_set2_of_indelstates_');
else disable('open_set2_of_indelstates_');
// gap_set2_of_indelstates
if (getValue('num_indel_states_')=="indel2" & !getValue('upload_probfile_'))
enable('gap_set2_of_indelstates_');
else disable('gap_set2_of_indelstates_');
// upload_probfile
// posterior_probfile
if (getValue('upload_probfile_'))
enable('posterior_probfile_');
else disable('posterior_probfile_');
// learn_gap
if (!getValue('no_learn_') & !getValue('nolearn_gap_'))
enable('learn_gap_');
else disable('learn_gap_');
// nolearn_gap
if (!getValue('no_learn_') & !getValue('learn_gap_'))
enable('nolearn_gap_');
else disable('nolearn_gap_');
// learnemit_all
if (!getValue('no_learn_') & getValue('data_type_')=="na" & !getValue('not_learnemitbypair_'))
enable('learnemit_all_');
else disable('learnemit_all_');
// not_learnemitbypair
if (!getValue('no_learn_') & getValue('data_type_')=="na" & !getValue('learnemit_all_'))
enable('not_learnemitbypair_');
else disable('not_learnemitbypair_');
// learnemit_pair
if (!getValue('no_learn_') & getValue('data_type_')=="protein" & !getValue('not_learnemitall_'))
enable('learnemit_pair_');
else disable('learnemit_pair_');
// not_learnemitall
if (!getValue('no_learn_') & getValue('data_type_')=="protein" & !getValue('learnemit_pair_'))
enable('not_learnemitall_');
else disable('not_learnemitall_');
// no_learn
// no_regularize
// reg_gapscale
if (!getValue('no_regularize_'))
enable('reg_gapscale_');
else disable('reg_gapscale_');
// reg_emitscale
if (!getValue('no_regularize_'))
enable('reg_emitscale_');
else disable('reg_emitscale_');
// min_increase
// max_rounds
// min_gapdata
// min_emitdata
// gap_factor
// num_iterations
// no_dynweight
// require_homology
// ref_alignment
// min_spantree
// max_spantree
// max_palmtree
// number_degree
// kmer_length
// alignment_fraction
if (! getValue('alignment_number_'))
enable('alignment_fraction_');
else disable('alignment_fraction_');
// alignment_number
if (!getValue('alignment_fraction_'))
enable('alignment_number_');
else disable('alignment_number_');
// min_anchorlen
if (!getValue('no_anchors_'))
enable('min_anchorlen_');
else disable('min_anchorlen_');
// max_joinlen
if (!getValue('no_anchors_'))
enable('max_joinlen_');
else disable('max_joinlen_');
// use_hardmask
if (!getValue('no_anchors_') & !getValue('align_in_protspace_'))
enable('use_hardmask_');
else disable('use_hardmask_');
// exon_minscore
if (!getValue('no_anchors_') & !getValue('align_in_protspace_'))
enable('exon_minscore_');
else disable('exon_minscore_');
// provide_mercator
}
function validateControl() {
// runtime
if (getValue('runtime_') < 0.1 || getValue('runtime_') > 72.0) {
alert('Maximum Hours to Run must be between 0.1 - 72.0.');
return false;
}
// data_type
// use_anchors
// no_anchors
// align_in_protspace
// prot_anchor
// sensitivity_max
// fast_alignment
// call_exonerate
// make_softmasked
// output_stockholm
// subst_model
// evtime_param
// num_indel_states
// alpha_R
// alpha_Y
// TN_beta
// open_set1_of_indelstates
// gap_set1_of_indelstates
// open_set2_of_indelstates
// gap_set2_of_indelstates
// upload_probfile
// posterior_probfile
// learn_gap
// nolearn_gap
// learnemit_all
// not_learnemitbypair
// learnemit_pair
// not_learnemitall
// no_learn
// no_regularize
// reg_gapscale
// reg_emitscale
// min_increase
// max_rounds
// min_gapdata
// min_emitdata
// gap_factor
// num_iterations
// no_dynweight
// require_homology
// ref_alignment
// min_spantree
// max_spantree
// max_palmtree
// number_degree
// kmer_length
// alignment_fraction
// alignment_number
// min_anchorlen
// max_joinlen
// use_hardmask
// exon_minscore
// provide_mercator
return issueWarning();
}
function issueWarning() {
// runtime
// data_type
// use_anchors
// no_anchors
// align_in_protspace
// prot_anchor
// sensitivity_max
// fast_alignment
// call_exonerate
// make_softmasked
// output_stockholm
// subst_model
// evtime_param
// num_indel_states
// alpha_R
// alpha_Y
// TN_beta
// open_set1_of_indelstates
// gap_set1_of_indelstates
// open_set2_of_indelstates
// gap_set2_of_indelstates
// upload_probfile
// posterior_probfile
// learn_gap
// nolearn_gap
// learnemit_all
// not_learnemitbypair
// learnemit_pair
// not_learnemitall
// no_learn
// no_regularize
// reg_gapscale
// reg_emitscale
// min_increase
// max_rounds
// min_gapdata
// min_emitdata
// gap_factor
// num_iterations
// no_dynweight
// require_homology
// ref_alignment
// min_spantree
// max_spantree
// max_palmtree
// number_degree
// kmer_length
// alignment_fraction
// alignment_number
// min_anchorlen
// max_joinlen
// use_hardmask
// exon_minscore
// provide_mercator
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
var element = document.forms['fsa'].elements[parameter];
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
var element = document.forms['fsa'].elements[parameter];
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
var element = document.forms['fsa'].elements[parameter];
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