<%@ taglib prefix="s" uri="/struts-tags" %>
<title>EPrimer3</title>
<h2>EPrimer3: Picks PCR primers and hybridization oligos </h2>
<s:form action="eprimer3" theme="simple">
<!-- Begin Simple Parameters -->
<a href="javascript:simple.slideit()" class="panel">Simple Parameters</a>
<div id="simple" style="width: 100%; background-color: #FFF;">
<div style="padding: 0.75em 0 0 0">
Select Task (-<A HREF="javascript:help.slidedownandjump('#task')">task</A>)
<font color="red" size="3">*</font>
<s:radio name="task_"
list="#{ '1':'Pick forward & reverse primer' , '2':'Pick forward primer only' , '3':'Pick reverse primer only' }" onclick="resolveParameters()"/>
<br/>
Pick PCR primer(s)?
<s:checkbox name="noprimer_" onclick="resolveParameters()"/>
<br/>
Pick hybridization probe?
<s:checkbox name="hybridprobe_" onclick="resolveParameters()"/>
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
<A name=programsection><h2><A HREF="javascript:help.slidedownandjump('#programsection_comment')">Program options</A></H2>
Explain flag (-<A HREF="javascript:help.slidedownandjump('#explainflag')">explainflag</A>)
<s:checkbox name="explainflag_" onclick="resolveParameters()"/>
<br/>
Create results files for each sequence (-<A HREF="javascript:help.slidedownandjump('#fileflag')">fileflag</A>)
<s:checkbox name="fileflag_" onclick="resolveParameters()"/>
<br/>
Number of results to return (-<A HREF="javascript:help.slidedownandjump('#numreturn')">numreturn</A>)
<s:textfield name="numreturn_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
First base index (-<A HREF="javascript:help.slidedownandjump('#firstbaseindex')">firstbaseindex</A>)
<s:textfield name="firstbaseindex_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=seqoptsection><h2><A HREF="javascript:help.slidedownandjump('#seqoptsection_comment')">Sequence options</A></H2>
Included region(s) (-<A HREF="javascript:help.slidedownandjump('#includedregion')">includedregion</A>)
<s:textfield name="includedregion_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Target region(s) (-<A HREF="javascript:help.slidedownandjump('#target')">target</A>)
<s:textfield name="target_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Excluded region(s) (-<A HREF="javascript:help.slidedownandjump('#excludedregion')">excludedregion</A>)
<s:textfield name="excludedregion_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Forward input primer sequence to check (-<A HREF="javascript:help.slidedownandjump('#forwardinput')">forwardinput</A>)
<s:textfield name="forwardinput_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Reverse input primer sequence to check (-<A HREF="javascript:help.slidedownandjump('#reverseinput')">reverseinput</A>)
<s:textfield name="reverseinput_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=primersection><h2><A HREF="javascript:help.slidedownandjump('#primersection_comment')">Primer options</A></H2>
Pick anyway (-<A HREF="javascript:help.slidedownandjump('#pickanyway')">pickanyway</A>)
<s:checkbox name="pickanyway_" onclick="resolveParameters()"/>
<br/>
Mispriming library (-<A HREF="javascript:help.slidedownandjump('#mispriminglibrary')">mispriminglibrary</A>)
<s:select name="mispriminglibrary_" headerKey='' headerValue='' list="%{ getDataForParameter('mispriminglibrary_')}" onchange="resolveParameters()"/>
<br/>
Primer maximum mispriming (-<A HREF="javascript:help.slidedownandjump('#maxmispriming')">maxmispriming</A>)
<s:textfield name="maxmispriming_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer pair maximum mispriming (-<A HREF="javascript:help.slidedownandjump('#pairmaxmispriming')">pairmaxmispriming</A>)
<s:textfield name="pairmaxmispriming_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
GC clamp (-<A HREF="javascript:help.slidedownandjump('#gcclamp')">gcclamp</A>)
<s:textfield name="gcclamp_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer optimum size (-<A HREF="javascript:help.slidedownandjump('#osize')">osize</A>)
<s:textfield name="osize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer minimum size (-<A HREF="javascript:help.slidedownandjump('#minsize')">minsize</A>)
<s:textfield name="minsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer maximum size (-<A HREF="javascript:help.slidedownandjump('#maxsize')">maxsize</A>)
<s:textfield name="maxsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer optimum Tm (-<A HREF="javascript:help.slidedownandjump('#otm')">otm</A>)
<s:textfield name="otm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer minimum Tm (-<A HREF="javascript:help.slidedownandjump('#mintm')">mintm</A>)
<s:textfield name="mintm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer maximum Tm (-<A HREF="javascript:help.slidedownandjump('#maxtm')">maxtm</A>)
<s:textfield name="maxtm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum difference in Tm of primers (-<A HREF="javascript:help.slidedownandjump('#maxdifftm')">maxdifftm</A>)
<s:textfield name="maxdifftm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer optimum GC percent (-<A HREF="javascript:help.slidedownandjump('#ogcpercent')">ogcpercent</A>)
<s:textfield name="ogcpercent_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer minimum GC percent (-<A HREF="javascript:help.slidedownandjump('#mingc')">mingc</A>)
<s:textfield name="mingc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Primer maximum GC percent (-<A HREF="javascript:help.slidedownandjump('#maxgc')">maxgc</A>)
<s:textfield name="maxgc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Salt concentration (mM) (-<A HREF="javascript:help.slidedownandjump('#saltconc')">saltconc</A>)
<s:textfield name="saltconc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
DNA concentration (nM) (-<A HREF="javascript:help.slidedownandjump('#dnaconc')">dnaconc</A>)
<s:textfield name="dnaconc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum Ns accepted in a primer (-<A HREF="javascript:help.slidedownandjump('#numnsaccepted')">numnsaccepted</A>)
<s:textfield name="numnsaccepted_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum self complementarity (-<A HREF="javascript:help.slidedownandjump('#selfany')">selfany</A>)
<s:textfield name="selfany_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum 3' self complementarity (-<A HREF="javascript:help.slidedownandjump('#selfend')">selfend</A>)
<s:textfield name="selfend_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Maximum polynucleotide repeat (-<A HREF="javascript:help.slidedownandjump('#maxpolyx')">maxpolyx</A>)
<s:textfield name="maxpolyx_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=productsection><h2><A HREF="javascript:help.slidedownandjump('#productsection_comment')">Product options</A></H2>
Product optimum size (-<A HREF="javascript:help.slidedownandjump('#productosize')">productosize</A>)
<s:textfield name="productosize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Product size range (-<A HREF="javascript:help.slidedownandjump('#productsizerange')">productsizerange</A>)
<s:textfield name="productsizerange_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Product optimum Tm (-<A HREF="javascript:help.slidedownandjump('#productotm')">productotm</A>)
<s:textfield name="productotm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Product minimum Tm (-<A HREF="javascript:help.slidedownandjump('#productmintm')">productmintm</A>)
<s:textfield name="productmintm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Product maximum Tm (-<A HREF="javascript:help.slidedownandjump('#productmaxtm')">productmaxtm</A>)
<s:textfield name="productmaxtm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=primerweights><h2><A HREF="javascript:help.slidedownandjump('#primerweights_comment')">Primer penalty weights</A></H2>
Maximum 3' end stability (-<A HREF="javascript:help.slidedownandjump('#maxendstability')">maxendstability</A>)
<s:textfield name="maxendstability_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=oligosinput><h2><A HREF="javascript:help.slidedownandjump('#oligosinput_comment')">Internal oligo input</A></H2>
Internal oligo excluded region (-<A HREF="javascript:help.slidedownandjump('#oligoexcludedregion')">oligoexcludedregion</A>)
<s:textfield name="oligoexcludedregion_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo input sequence (if any) (-<A HREF="javascript:help.slidedownandjump('#oligoinput')">oligoinput</A>)
<s:textfield name="oligoinput_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
<hr/>
<A name=oligosection><h2><A HREF="javascript:help.slidedownandjump('#oligosection_comment')">Internal oligo options</A></H2>
Internal oligo optimum size (-<A HREF="javascript:help.slidedownandjump('#oligoosize')">oligoosize</A>)
<s:textfield name="oligoosize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo minimum size (-<A HREF="javascript:help.slidedownandjump('#oligominsize')">oligominsize</A>)
<s:textfield name="oligominsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum size (-<A HREF="javascript:help.slidedownandjump('#oligomaxsize')">oligomaxsize</A>)
<s:textfield name="oligomaxsize_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo optimum Tm (-<A HREF="javascript:help.slidedownandjump('#oligootm')">oligootm</A>)
<s:textfield name="oligootm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo minimum Tm (-<A HREF="javascript:help.slidedownandjump('#oligomintm')">oligomintm</A>)
<s:textfield name="oligomintm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum Tm (-<A HREF="javascript:help.slidedownandjump('#oligomaxtm')">oligomaxtm</A>)
<s:textfield name="oligomaxtm_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo optimum GC percent (-<A HREF="javascript:help.slidedownandjump('#oligoogcpercent')">oligoogcpercent</A>)
<s:textfield name="oligoogcpercent_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo minimum GC (-<A HREF="javascript:help.slidedownandjump('#oligomingc')">oligomingc</A>)
<s:textfield name="oligomingc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum GC (-<A HREF="javascript:help.slidedownandjump('#oligomaxgc')">oligomaxgc</A>)
<s:textfield name="oligomaxgc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo salt concentration (mM) (-<A HREF="javascript:help.slidedownandjump('#oligosaltconc')">oligosaltconc</A>)
<s:textfield name="oligosaltconc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo DNA concentration (nM) (-<A HREF="javascript:help.slidedownandjump('#oligodnaconc')">oligodnaconc</A>)
<s:textfield name="oligodnaconc_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum self complementarity (-<A HREF="javascript:help.slidedownandjump('#oligoselfany')">oligoselfany</A>)
<s:textfield name="oligoselfany_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum 3' self complementarity (-<A HREF="javascript:help.slidedownandjump('#oligoselfend')">oligoselfend</A>)
<s:textfield name="oligoselfend_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum polynucleotide repeat (-<A HREF="javascript:help.slidedownandjump('#oligomaxpolyx')">oligomaxpolyx</A>)
<s:textfield name="oligomaxpolyx_" size="10" maxlength="600" onchange="resolveParameters()"/>
<br/>
Internal oligo mishybridizing library (-<A HREF="javascript:help.slidedownandjump('#oligomishyblibrary')">oligomishyblibrary</A>)
<s:select name="oligomishyblibrary_" headerKey='' headerValue='' list="%{ getDataForParameter('oligomishyblibrary_')}" onchange="resolveParameters()"/>
<br/>
Internal oligo maximum mishybridization (-<A HREF="javascript:help.slidedownandjump('#oligomaxmishyb')">oligomaxmishyb</A>)
<s:textfield name="oligomaxmishyb_" size="10" maxlength="600" onchange="resolveParameters()"/>
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
<dt><a name=sequence><i>sequence -- dna [sequences] (-sequence)</i></a></dt>
<dd>The sequence from which to choose primers. The sequence must be presented 5' -> 3'</dd>
<br></br>
<dt><a name=programsection_comment><i><b>Program options</b></i></a></dt>
<dt><a name=explainflag><i>Explain flag (-explainflag)</i></a></dt>
<dd>If this flag is non-0, produce LEFT-EXPLAIN, RIGHT-EXPLAIN, and INTERNAL-OLIGO-EXPLAIN output tags, which are intended to provide information on the number of oligos and primer pairs that EPrimer3 examined, and statistics on the number discarded for various reasons.</dd>
<dt><a name=fileflag><i>Create results files for each sequence (-fileflag)</i></a></dt>
<dd>If the associated value is non-0, then EPrimer3 creates two output files for each input SEQUENCE. File (sequence-id).for lists all acceptable forward primers for (sequence-id), and (sequence-id).rev lists all acceptable reverse primers for (sequence-id), where (sequence-id) is the value of the SEQUENCE-ID tag (which must be supplied). In addition, if the input tag TASK is 1 or 4, EPrimer3 produces a file (sequence-id).int, which lists all acceptable internal oligos.</dd>
<dt><a name=task><i>Select Task (-task)</i></a></dt>
<dd>Tell EPrimer3 what task to perform. Legal values are 1:Pick forward & reverse primer, 2: 'Pick forward primer only', 3: 'Pick reverse primer only', The tasks should be self explanatory. <BR> Briefly, an 'internal oligo' is intended to be used as a hybridization probe (hyb probe) to detect the PCR product after amplification.</dd>
<dt><a name=numreturn><i>Number of results to return (-numreturn)</i></a></dt>
<dd>The maximum number of primer pairs to return. Primer pairs returned are sorted by their 'quality', in other words by the value of the objective function (where a lower number indicates a better primer pair). Caution: setting this parameter to a large value will increase running time.</dd>
<dt><a name=firstbaseindex><i>First base index (-firstbaseindex)</i></a></dt>
<dd>This parameter is the index of the first base in the input sequence. For input and output using 1-based indexing (such as that used in GenBank and to which many users are accustomed) set this parameter to 1. For input and output using 0-based indexing set this parameter to 0. (This parameter also affects the indexes in the contents of the files produced when the primer file flag is set.)</dd>
<br></br>
<dt><a name=seqoptsection_comment><i><b>Sequence options</b></i></a></dt>
<dt><a name=includedregion><i>Included region(s) (-includedregion)</i></a></dt>
<dd>A sub-region of the given sequence in which to pick primers. For example, often the first dozen or so bases of a sequence are vector, and should be excluded from consideration. The value for this parameter has the form <BR> (start),(end) <BR> where (start) is the index of the first base to consider, and (end) is the last in the primer-picking region.</dd>
<dt><a name=target><i>Target region(s) (-target)</i></a></dt>
<dd>If one or more Targets is specified then a legal primer pair must flank at least one of them.
A Target might be a simple sequence repeat site (for example a CA repeat) or a single-base-pair polymorphism.
The value should be a space-separated list of <BR> (start),(end) <BR> pairs where (start) is the
index of the first base of a Target, and (end) is the last <BR> E.g. 50,51 requires primers to surround
the 2 bases at positions 50 and 51.</dd>
<dt><a name=excludedregion><i>Excluded region(s) (-excludedregion)</i></a></dt>
<dd>Primer oligos may not overlap any region specified in this tag. The associated value must be a space-separated list of <BR> (start),(end) <BR> pairs where (start) is the index of the first base of the excluded region, and and (end) is the last. This tag is useful for tasks such as excluding regions of low sequence quality or for excluding regions containing repetitive elements such as ALUs or LINEs. <BR> E.g. 401,407 68,70 forbids selection of primers in the 7 bases starting at 401 and the 3 bases at 68.</dd>
<dt><a name=forwardinput><i>Forward input primer sequence to check (-forwardinput)</i></a></dt>
<dd>The sequence of a forward primer to check and around which to design reverse primers and optional internal oligos. Must be a substring of SEQUENCE.</dd>
<dt><a name=reverseinput><i>Reverse input primer sequence to check (-reverseinput)</i></a></dt>
<dd>The sequence of a reverse primer to check and around which to design forward primers and optional internal oligos. Must be a substring of the reverse strand of SEQUENCE.</dd>
<br></br>
<dt><a name=primersection_comment><i><b>Primer options</b></i></a></dt>
<dt><a name=pickanyway><i>Pick anyway (-pickanyway)</i></a></dt>
<dd>If true pick a primer pair even if LEFT-INPUT, RIGHT-INPUT, or INTERNAL-OLIGO-INPUT violates specific constraints.</dd>
<dt><a name=mispriminglibrary><i>Mispriming library (-mispriminglibrary)</i></a></dt>
<dd>The name of a file containing a nucleotide sequence library of sequences to avoid amplifying (for example repetitive sequences, or possibly the sequences of genes in a gene family that should not be amplified.) The file must be in (a slightly restricted) FASTA format (W. B. Pearson and D.J. Lipman, PNAS 85:8 pp 2444-2448 [1988]); we briefly discuss the organization of this file below. If this parameter is specified then EPrimer3 locally aligns each candidate primer against each library sequence and rejects those primers for which the local alignment score times a specified weight (see below) exceeds MAX-MISPRIMING. (The maximum value of the weight is arbitrarily set to 100.0.) <BR> Each sequence entry in the FASTA-format file must begin with an 'id line' that starts with '>'. The contents of the id line is 'slightly restricted' in that EPrimer3 parses everything after any optional asterisk ('*') as a floating point number to use as the weight mentioned above. If the id line contains no asterisk then the weight defaults to 1.0. The alignment scoring system used is the same as for calculating complementarity among oligos (e.g. SELF-ANY). The remainder of an entry contains the sequence as lines following the id line up until a line starting with '>' or the end of the file. Whitespace and newlines are ignored. Characters 'A', 'T', 'G', 'C', 'a', 't', 'g', 'c' are retained and any other character is converted to 'N' (with the consequence that any IUB / IUPAC codes for ambiguous bases are converted to 'N'). There are no restrictions on line length. <BR> An empty value for this parameter indicates that no repeat library should be used.</dd>
<dt><a name=maxmispriming><i>Primer maximum mispriming (-maxmispriming)</i></a></dt>
<dd>The maximum allowed weighted similarity with any sequence in MISPRIMING-LIBRARY.</dd>
<dt><a name=pairmaxmispriming><i>Primer pair maximum mispriming (-pairmaxmispriming)</i></a></dt>
<dd>The maximum allowed sum of weighted similarities of a primer pair (one similarity for each primer) with any single sequence in MISPRIMING-LIBRARY.</dd>
<dt><a name=gcclamp><i>GC clamp (-gcclamp)</i></a></dt>
<dd>Require the specified number of consecutive Gs and Cs at the 3' end of both the forward and reverse primer. (This parameter has no effect on the internal oligo if one is requested.)</dd>
<dt><a name=osize><i>Primer optimum size (-osize)</i></a></dt>
<dd>Optimum length (in bases) of a primer oligo. EPrimer3 will attempt to pick primers close to this length.</dd>
<dt><a name=minsize><i>Primer minimum size (-minsize)</i></a></dt>
<dd>Minimum acceptable length of a primer. Must be greater than 0 and less than or equal to MAX-SIZE.</dd>
<dt><a name=maxsize><i>Primer maximum size (-maxsize)</i></a></dt>
<dd>Maximum acceptable length (in bases) of a primer. Currently this parameter cannot be larger than 35. This limit is governed by the maximum oligo size for which EPrimer3's melting-temperature is valid.</dd>
<dt><a name=otm><i>Primer optimum Tm (-otm)</i></a></dt>
<dd>Optimum melting temperature(Celsius) for a primer oligo. EPrimer3 will try to pick primers with melting temperatures are close to this temperature. The oligo melting temperature formula in EPrimer3 is that given in Rychlik, Spencer and Rhoads, Nucleic Acids Research, vol 18, num 12, pp 6409-6412 and Breslauer, Frank, Bloeker and Marky, Proc. Natl. Acad. Sci. USA, vol 83, pp 3746-3750. Please refer to the former paper for background discussion.</dd>
<dt><a name=mintm><i>Primer minimum Tm (-mintm)</i></a></dt>
<dd>Minimum acceptable melting temperature(Celsius) for a primer oligo.</dd>
<dt><a name=maxtm><i>Primer maximum Tm (-maxtm)</i></a></dt>
<dd>Maximum acceptable melting temperature(Celsius) for a primer oligo.</dd>
<dt><a name=maxdifftm><i>Maximum difference in Tm of primers (-maxdifftm)</i></a></dt>
<dd>Maximum acceptable (unsigned) difference between the melting temperatures of the forward and reverse primers.</dd>
<dt><a name=ogcpercent><i>Primer optimum GC percent (-ogcpercent)</i></a></dt>
<dd>Primer optimum GC percent.</dd>
<dt><a name=mingc><i>Primer minimum GC percent (-mingc)</i></a></dt>
<dd>Minimum allowable percentage of Gs and Cs in any primer.</dd>
<dt><a name=maxgc><i>Primer maximum GC percent (-maxgc)</i></a></dt>
<dd>Maximum allowable percentage of Gs and Cs in any primer generated by Primer.</dd>
<dt><a name=saltconc><i>Salt concentration (mM) (-saltconc)</i></a></dt>
<dd>The millimolar concentration of salt (usually KCl) in the PCR. EPrimer3 uses this argument to calculate oligo melting temperatures.</dd>
<dt><a name=dnaconc><i>DNA concentration (nM) (-dnaconc)</i></a></dt>
<dd>The nanomolar concentration of annealing oligos in the PCR. EPrimer3 uses this argument to calculate oligo melting temperatures. The default (50nM) works well with the standard protocol used at the Whitehead/MIT Center for Genome Research--0.5 microliters of 20 micromolar concentration for each primer oligo in a 20 microliter reaction with 10 nanograms template, 0.025 units/microliter Taq polymerase in 0.1 mM each dNTP, 1.5mM MgCl2, 50mM KCl, 10mM Tris-HCL (pH 9.3) using 35 cycles with an annealing temperature of 56 degrees Celsius. This parameter corresponds to 'c' in Rychlik, Spencer and Rhoads' equation (ii) (Nucleic Acids Research, vol 18, num 12) where a suitable value (for a lower initial concentration of template) is 'empirically determined'. The value of this parameter is less than the actual concentration of oligos in the reaction because it is the concentration of annealing oligos, which in turn depends on the amount of template (including PCR product) in a given cycle. This concentration increases a great deal during a PCR; fortunately PCR seems quite robust for a variety of oligo melting temperatures. <BR> See ADVICE FOR PICKING PRIMERS.</dd>
<dt><a name=numnsaccepted><i>Maximum Ns accepted in a primer (-numnsaccepted)</i></a></dt>
<dd>Maximum number of unknown bases (N) allowable in any primer.</dd>
<dt><a name=selfany><i>Maximum self complementarity (-selfany)</i></a></dt>
<dd>The maximum allowable local alignment score when testing a single primer for (local) self-complementarity and the maximum allowable local alignment score when testing for complementarity between forward and reverse primers. Local self-complementarity is taken to predict the tendency of primers to anneal to each other without necessarily causing self-priming in the PCR. The scoring system gives 1.00 for complementary bases, -0.25 for a match of any base (or N) with an N, -1.00 for a mismatch, and -2.00 for a gap. Only single-base-pair gaps are allowed. For example, the alignment <BR> 5' ATCGNA 3' <BR> ...|| | | <BR> 3' TA-CGT 5' <BR> is allowed (and yields a score of 1.75), but the alignment <BR> 5' ATCCGNA 3' <BR> ...|| | | <BR> 3' TA--CGT 5' <BR> is not considered. Scores are non-negative, and a score of 0.00 indicates that there is no reasonable local alignment between two oligos.</dd>
<dt><a name=selfend><i>Maximum 3' self complementarity (-selfend)</i></a></dt>
<dd>The maximum allowable 3'-anchored global alignment score when testing a single primer for self-complementarity, and the maximum allowable 3'-anchored global alignment score when testing for complementarity between forward and reverse primers. The 3'-anchored global alignment score is taken to predict the likelihood of PCR-priming primer-dimers, for example <BR> 5' ATGCCCTAGCTTCCGGATG 3' <BR> .............||| ||||| <BR> ..........3' AAGTCCTACATTTAGCCTAGT 5' <BR> or <BR> 5' AGGCTATGGGCCTCGCGA 3' <BR> ...............|||||| <BR> ............3' AGCGCTCCGGGTATCGGA 5' <BR> The scoring system is as for the Maximum Complementarity argument. In the examples above the scores are 7.00 and 6.00 respectively. Scores are non-negative, and a score of 0.00 indicates that there is no reasonable 3'-anchored global alignment between two oligos. In order to estimate 3'-anchored global alignments for candidate primers and primer pairs, Primer assumes that the sequence from which to choose primers is presented 5' to 3'. It is nonsensical to provide a larger value for this parameter than for the Maximum (local) Complementarity parameter because the score of a local alignment will always be at least as great as the score of a global alignment.</dd>
<dt><a name=maxpolyx><i>Maximum polynucleotide repeat (-maxpolyx)</i></a></dt>
<dd>The maximum allowable length of a mononucleotide repeat in a primer, for example AAAAAA.</dd>
<br></br>
<dt><a name=productsection_comment><i><b>Product options</b></i></a></dt>
<dt><a name=productosize><i>Product optimum size (-productosize)</i></a></dt>
<dd>The optimum size for the PCR product. 0 indicates that there is no optimum product size.</dd>
<dt><a name=productsizerange><i>Product size range (-productsizerange)</i></a></dt>
<dd>The associated values specify the lengths of the product that the user wants the primers to create, and is a space separated list of elements of the form <BR> (x)-(y) <BR> where an (x)-(y) pair is a legal range of lengths for the product. For example, if one wants PCR products to be between 100 to 150 bases (inclusive) then one would set this parameter to 100-150. If one desires PCR products in either the range from 100 to 150 bases or in the range from 200 to 250 bases then one would set this parameter to 100-150 200-250. <BR> EPrimer3 favors ranges to the left side of the parameter string. EPrimer3 will return legal primers pairs in the first range regardless the value of the objective function for these pairs. Only if there are an insufficient number of primers in the first range will EPrimer3 return primers in a subsequent range.</dd>
<dt><a name=productotm><i>Product optimum Tm (-productotm)</i></a></dt>
<dd>The optimum melting temperature for the PCR product. 0 indicates that there is no optimum temperature.</dd>
<dt><a name=productmintm><i>Product minimum Tm (-productmintm)</i></a></dt>
<dd>The minimum allowed melting temperature of the amplicon. Please see the documentation on the maximum melting temperature of the product for details.</dd>
<dt><a name=productmaxtm><i>Product maximum Tm (-productmaxtm)</i></a></dt>
<dd>The maximum allowed melting temperature of the amplicon. Product Tm is calculated using the formula from Bolton and McCarthy, PNAS 84:1390 (1962) as presented in Sambrook, Fritsch and Maniatis, Molecular Cloning, p 11.46 (1989, CSHL Press). <BR> Tm = 81.5 + 16.6(log10([Na+])) + .41*(%GC) - 600/length <BR> Where [Na+} is the molar sodium concentration, (%GC) is the percent of Gs and Cs in the sequence, and length is the length of the sequence. <BR> A similar formula is used by the prime primer selection program in GCG http://www.gcg.com), which instead uses 675.0/length in the last term (after F. Baldino, Jr, M.-F. Chesselet, and M.E. Lewis, Methods in Enzymology 168:766 (1989) eqn (1) on page 766 without the mismatch and formamide terms). The formulas here and in Baldino et al. assume Na+ rather than K+. According to J.G. Wetmur, Critical Reviews in BioChem. and Mol. Bio. 26:227 (1991) 50 mM K+ should be equivalent in these formulae to .2 M Na+. EPrimer3 uses the same salt concentration value for calculating both the primer melting temperature and the oligo melting temperature. If you are planning to use the PCR product for hybridization later this behavior will not give you the Tm under hybridization conditions.</dd>
<br></br>
<dt><a name=primerweights_comment><i><b>Primer penalty weights</b></i></a></dt>
<dt><a name=maxendstability><i>Maximum 3' end stability (-maxendstability)</i></a></dt>
<dd>The maximum stability for the five 3' bases of a forward or reverse primer. Bigger numbers mean more stable 3' ends. The value is the maximum delta G for duplex disruption for the five 3' bases as calculated using the nearest neighbor parameters published in Breslauer, Frank, Bloeker and Marky, Proc. Natl. Acad. Sci. USA, vol 83, pp 3746-3750. EPrimer3 uses a completely permissive default value for backward compatibility (which we may change in the next release). Rychlik recommends a maximum value of 9 (Wojciech Rychlik, 'Selection of Primers for Polymerase Chain Reaction' in BA White, Ed., 'Methods in Molecular Biology, Vol. 15: PCR Protocols: Current Methods and Applications', 1993, pp 31-40, Humana Press, Totowa NJ).</dd>
<br></br>
<dt><a name=oligosinput_comment><i><b>Internal oligo input</b></i></a></dt>
<dt><a name=oligoexcludedregion><i>Internal oligo excluded region (-oligoexcludedregion)</i></a></dt>
<dd>Middle oligos may not overlap any region specified by this tag. The associated value must be a space-separated list of <BR> (start),(end) <BR> pairs, where (start) is the index of the first base of an excluded region, and (end) is the last. Often one would make Target regions excluded regions for internal oligos.</dd>
<dt><a name=oligoinput><i>Internal oligo input sequence (if any) (-oligoinput)</i></a></dt>
<dd>The sequence of an internal oligo to check and around which to design forward and reverse primers. Must be a substring of SEQUENCE.</dd>
<br></br>
<dt><a name=oligosection_comment><i><b>Internal oligo options</b></i></a></dt>
<dt><a name=oligoosize><i>Internal oligo optimum size (-oligoosize)</i></a></dt>
<dd>Optimum length (in bases) of an internal oligo. EPrimer3 will attempt to pick primers close to this length.</dd>
<dt><a name=oligominsize><i>Internal oligo minimum size (-oligominsize)</i></a></dt>
<dd>Minimum acceptable length of an internal oligo. Must be greater than 0 and less than or equal to INTERNAL-OLIGO-MAX-SIZE.</dd>
<dt><a name=oligomaxsize><i>Internal oligo maximum size (-oligomaxsize)</i></a></dt>
<dd>Maximum acceptable length (in bases) of an internal oligo. Currently this parameter cannot be larger than 35. This limit is governed by maximum oligo size for which EPrimer3's melting-temperature is valid.</dd>
<dt><a name=oligootm><i>Internal oligo optimum Tm (-oligootm)</i></a></dt>
<dd>Optimum melting temperature (Celsius) for an internal oligo. EPrimer3 will try to pick oligos with melting temperatures that are close to this temperature. The oligo melting temperature formula in EPrimer3 is that given in Rychlik, Spencer and Rhoads, Nucleic Acids Research, vol 18, num 12, pp 6409-6412 and Breslauer, Frank, Bloeker and Marky, Proc. Natl. Acad. Sci. USA, vol 83, pp 3746-3750. Please refer to the former paper for background discussion.</dd>
<dt><a name=oligomintm><i>Internal oligo minimum Tm (-oligomintm)</i></a></dt>
<dd>Minimum acceptable melting temperature(Celsius) for an internal oligo.</dd>
<dt><a name=oligomaxtm><i>Internal oligo maximum Tm (-oligomaxtm)</i></a></dt>
<dd>Maximum acceptable melting temperature (Celsius) for an internal oligo.</dd>
<dt><a name=oligoogcpercent><i>Internal oligo optimum GC percent (-oligoogcpercent)</i></a></dt>
<dd>Internal oligo optimum GC percent.</dd>
<dt><a name=oligomingc><i>Internal oligo minimum GC (-oligomingc)</i></a></dt>
<dd>Minimum allowable percentage of Gs and Cs in an internal oligo.</dd>
<dt><a name=oligomaxgc><i>Internal oligo maximum GC (-oligomaxgc)</i></a></dt>
<dd>Maximum allowable percentage of Gs and Cs in any internal oligo generated by Primer.</dd>
<dt><a name=oligosaltconc><i>Internal oligo salt concentration (mM) (-oligosaltconc)</i></a></dt>
<dd>The millimolar concentration of salt (usually KCl) in the hybridization. EPrimer3 uses this argument to calculate internal oligo melting temperatures.</dd>
<dt><a name=oligodnaconc><i>Internal oligo DNA concentration (nM) (-oligodnaconc)</i></a></dt>
<dd>The nanomolar concentration of annealing internal oligo in the hybridization.</dd>
<dt><a name=oligoselfany><i>Internal oligo maximum self complementarity (-oligoselfany)</i></a></dt>
<dd>The maximum allowable local alignment score when testing an internal oligo for (local) self-complementarity. Local self-complementarity is taken to predict the tendency of oligos to anneal to themselves The scoring system gives 1.00 for complementary bases, -0.25 for a match of any base (or N) with an N, -1.00 for a mismatch, and -2.00 for a gap. Only single-base-pair gaps are allowed. For example, the alignment <BR> 5' ATCGNA 3' <BR> || | | <BR> 3' TA-CGT 5' <BR> is allowed (and yields a score of 1.75), but the alignment <BR> 5' ATCCGNA 3' <BR> || | | <BR> 3' TA--CGT 5' <BR> is not considered. Scores are non-negative, and a score of 0.00 indicates that there is no reasonable local alignment between two oligos.</dd>
<dt><a name=oligoselfend><i>Internal oligo maximum 3' self complementarity (-oligoselfend)</i></a></dt>
<dd>The maximum allowable 3'-anchored global alignment score when testing a single oligo for self-complementarity. <BR> The scoring system is as for the Maximum Complementarity argument. In the examples above the scores are 7.00 and 6.00 respectively. Scores are non-negative, and a score of 0.00 indicates that there is no reasonable 3'-anchored global alignment between two oligos. In order to estimate 3'-anchored global alignments for candidate oligos, Primer assumes that the sequence from which to choose oligos is presented 5' to 3'. <BR> INTERNAL-OLIGO-SELF-END is meaningless when applied to internal oligos used for hybridization-based detection, since primer-dimer will not occur. We recommend that INTERNAL-OLIGO-SELF-END be set at least as high as INTERNAL-OLIGO-SELF-ANY.</dd>
<dt><a name=oligomaxpolyx><i>Internal oligo maximum polynucleotide repeat (-oligomaxpolyx)</i></a></dt>
<dd>The maximum allowable length of an internal oligo mononucleotide repeat, for example AAAAAA.</dd>
<dt><a name=oligomishyblibrary><i>Internal oligo mishybridizing library (-oligomishyblibrary)</i></a></dt>
<dd>Similar to MISPRIMING-LIBRARY, except that the event we seek to avoid is hybridization of the internal oligo to sequences in this library rather than priming from them. <BR> The file must be in (a slightly restricted) FASTA format (W. B. Pearson and D.J. Lipman, PNAS 85:8 pp 2444-2448 [1988]); we briefly discuss the organization of this file below. If this parameter is specified then EPrimer3 locally aligns each candidate oligo against each library sequence and rejects those primers for which the local alignment score times a specified weight (see below) exceeds INTERNAL-OLIGO-MAX-MISHYB. (The maximum value of the weight is arbitrarily set to 12.0.) <BR> Each sequence entry in the FASTA-format file must begin with an 'id line' that starts with '>'. The contents of the id line is 'slightly restricted' in that EPrimer3 parses everything after any optional asterisk ('*') as a floating point number to use as the weight mentioned above. If the id line contains no asterisk then the weight defaults to 1.0. The alignment scoring system used is the same as for calculating complementarity among oligos (e.g. SELF-ANY). The remainder of an entry contains the sequence as lines following the id line up until a line starting with '>' or the end of the file. Whitespace and newlines are ignored. Characters 'A', 'T', 'G', 'C', 'a', 't', 'g', 'c' are retained and any other character is converted to 'N' (with the consequence that any IUB / IUPAC codes for ambiguous bases are converted to 'N'). There are no restrictions on line length. <BR> An empty value for this parameter indicates that no library should be used.</dd>
<dt><a name=oligomaxmishyb><i>Internal oligo maximum mishybridization (-oligomaxmishyb)</i></a></dt>
<dd>Similar to MAX-MISPRIMING except that this parameter applies to the similarity of candidate internal oligos to the library specified in INTERNAL-OLIGO-MISHYB-LIBRARY.</dd>
</div>
</div>
<script type="text/javascript">
var help=new animatedcollapse("help", 800, true)
</script>
<!--End Advanced Help -->
</s:form>
<script type="text/javascript">
function resolveParameters() {
// explainflag
if (getValue('noprimer_'))
enable('explainflag_');
else disable('explainflag_');
// fileflag
if (getValue('noprimer_'))
enable('fileflag_');
else disable('fileflag_');
// task
if (getValue('noprimer_'))
enable('task_');
else disable('task_');
// noprimer
// hybridprobe
// numreturn
if (getValue('noprimer_'))
enable('numreturn_');
else disable('numreturn_');
// firstbaseindex
if (getValue('noprimer_'))
enable('firstbaseindex_');
else disable('firstbaseindex_');
// includedregion
if (getValue('noprimer_'))
enable('includedregion_');
else disable('includedregion_');
// target
if (getValue('noprimer_'))
enable('target_');
else disable('target_');
// excludedregion
if (getValue('noprimer_'))
enable('excludedregion_');
else disable('excludedregion_');
// forwardinput
if (getValue('noprimer_'))
enable('forwardinput_');
else disable('forwardinput_');
// reverseinput
if (getValue('noprimer_'))
enable('reverseinput_');
else disable('reverseinput_');
// pickanyway
if (getValue('noprimer_'))
enable('pickanyway_');
else disable('pickanyway_');
// mispriminglibrary
if (getValue('noprimer_'))
enable('mispriminglibrary_');
else disable('mispriminglibrary_');
// maxmispriming
if (getValue('noprimer_'))
enable('maxmispriming_');
else disable('maxmispriming_');
// pairmaxmispriming
if (getValue('noprimer_'))
enable('pairmaxmispriming_');
else disable('pairmaxmispriming_');
// gcclamp
if (getValue('noprimer_'))
enable('gcclamp_');
else disable('gcclamp_');
// osize
if (getValue('noprimer_'))
enable('osize_');
else disable('osize_');
// minsize
if (getValue('noprimer_'))
enable('minsize_');
else disable('minsize_');
// maxsize
if (getValue('noprimer_'))
enable('maxsize_');
else disable('maxsize_');
// otm
if (getValue('noprimer_'))
enable('otm_');
else disable('otm_');
// mintm
if (getValue('noprimer_'))
enable('mintm_');
else disable('mintm_');
// maxtm
if (getValue('noprimer_'))
enable('maxtm_');
else disable('maxtm_');
// maxdifftm
if (getValue('noprimer_'))
enable('maxdifftm_');
else disable('maxdifftm_');
// ogcpercent
if (getValue('noprimer_'))
enable('ogcpercent_');
else disable('ogcpercent_');
// mingc
if (getValue('noprimer_'))
enable('mingc_');
else disable('mingc_');
// maxgc
if (getValue('noprimer_'))
enable('maxgc_');
else disable('maxgc_');
// saltconc
if (getValue('noprimer_'))
enable('saltconc_');
else disable('saltconc_');
// dnaconc
if (getValue('noprimer_'))
enable('dnaconc_');
else disable('dnaconc_');
// numnsaccepted
if (getValue('noprimer_'))
enable('numnsaccepted_');
else disable('numnsaccepted_');
// selfany
if (getValue('noprimer_'))
enable('selfany_');
else disable('selfany_');
// selfend
if (getValue('noprimer_'))
enable('selfend_');
else disable('selfend_');
// maxpolyx
if (getValue('noprimer_'))
enable('maxpolyx_');
else disable('maxpolyx_');
// productosize
if (getValue('noprimer_'))
enable('productosize_');
else disable('productosize_');
// productsizerange
if (getValue('noprimer_'))
enable('productsizerange_');
else disable('productsizerange_');
// productotm
if (getValue('noprimer_'))
enable('productotm_');
else disable('productotm_');
// productmintm
if (getValue('noprimer_'))
enable('productmintm_');
else disable('productmintm_');
// productmaxtm
if (getValue('noprimer_'))
enable('productmaxtm_');
else disable('productmaxtm_');
// maxendstability
if (getValue('noprimer_'))
enable('maxendstability_');
else disable('maxendstability_');
// oligoexcludedregion
if (getValue('hybridprobe_'))
enable('oligoexcludedregion_');
else disable('oligoexcludedregion_');
// oligoinput
if (getValue('hybridprobe_'))
enable('oligoinput_');
else disable('oligoinput_');
// oligoosize
if (getValue('hybridprobe_'))
enable('oligoosize_');
else disable('oligoosize_');
// oligominsize
if (getValue('hybridprobe_'))
enable('oligominsize_');
else disable('oligominsize_');
// oligomaxsize
if (getValue('hybridprobe_'))
enable('oligomaxsize_');
else disable('oligomaxsize_');
// oligootm
if (getValue('hybridprobe_'))
enable('oligootm_');
else disable('oligootm_');
// oligomintm
if (getValue('hybridprobe_'))
enable('oligomintm_');
else disable('oligomintm_');
// oligomaxtm
if (getValue('hybridprobe_'))
enable('oligomaxtm_');
else disable('oligomaxtm_');
// oligoogcpercent
if (getValue('hybridprobe_'))
enable('oligoogcpercent_');
else disable('oligoogcpercent_');
// oligomingc
if (getValue('hybridprobe_'))
enable('oligomingc_');
else disable('oligomingc_');
// oligomaxgc
if (getValue('hybridprobe_'))
enable('oligomaxgc_');
else disable('oligomaxgc_');
// oligosaltconc
if (getValue('hybridprobe_'))
enable('oligosaltconc_');
else disable('oligosaltconc_');
// oligodnaconc
if (getValue('hybridprobe_'))
enable('oligodnaconc_');
else disable('oligodnaconc_');
// oligoselfany
if (getValue('hybridprobe_'))
enable('oligoselfany_');
else disable('oligoselfany_');
// oligoselfend
if (getValue('hybridprobe_'))
enable('oligoselfend_');
else disable('oligoselfend_');
// oligomaxpolyx
if (getValue('hybridprobe_'))
enable('oligomaxpolyx_');
else disable('oligomaxpolyx_');
// oligomishyblibrary
if (getValue('hybridprobe_'))
enable('oligomishyblibrary_');
else disable('oligomishyblibrary_');
// oligomaxmishyb
if (getValue('hybridprobe_'))
enable('oligomaxmishyb_');
else disable('oligomaxmishyb_');
}
function validateControl() {
// explainflag
// fileflag
// task
// noprimer
// hybridprobe
if ( ! getValue('hybridprobe_') && ! getValue('noprimer_')) {
alert('Please choose Pick PCR primer(s), Pick hybridization probe, or both ');
return false;
}
// numreturn
// firstbaseindex
// includedregion
// target
// excludedregion
// forwardinput
// reverseinput
// pickanyway
// mispriminglibrary
// maxmispriming
// pairmaxmispriming
// gcclamp
// osize
// minsize
// maxsize
// otm
// mintm
// maxtm
// maxdifftm
// ogcpercent
// mingc
// maxgc
// saltconc
// dnaconc
// numnsaccepted
// selfany
// selfend
// maxpolyx
// productosize
// productsizerange
// productotm
// productmintm
// productmaxtm
// maxendstability
// oligoexcludedregion
// oligoinput
// oligoosize
// oligominsize
// oligomaxsize
// oligootm
// oligomintm
// oligomaxtm
// oligoogcpercent
// oligomingc
// oligomaxgc
// oligosaltconc
// oligodnaconc
// oligoselfany
// oligoselfend
// oligomaxpolyx
// oligomishyblibrary
// oligomaxmishyb
return issueWarning();
}
function issueWarning() {
// explainflag
// fileflag
// task
// noprimer
// hybridprobe
// numreturn
// firstbaseindex
// includedregion
// target
// excludedregion
// forwardinput
// reverseinput
// pickanyway
// mispriminglibrary
// maxmispriming
// pairmaxmispriming
// gcclamp
// osize
// minsize
// maxsize
// otm
// mintm
// maxtm
// maxdifftm
// ogcpercent
// mingc
// maxgc
// saltconc
// dnaconc
// numnsaccepted
// selfany
// selfend
// maxpolyx
// productosize
// productsizerange
// productotm
// productmintm
// productmaxtm
// maxendstability
// oligoexcludedregion
// oligoinput
// oligoosize
// oligominsize
// oligomaxsize
// oligootm
// oligomintm
// oligomaxtm
// oligoogcpercent
// oligomingc
// oligomaxgc
// oligosaltconc
// oligodnaconc
// oligoselfany
// oligoselfend
// oligomaxpolyx
// oligomishyblibrary
// oligomaxmishyb
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
var element = document.forms['eprimer3'].elements[parameter];
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
var element = document.forms['eprimer3'].elements[parameter];
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
var element = document.forms['eprimer3'].elements[parameter];
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