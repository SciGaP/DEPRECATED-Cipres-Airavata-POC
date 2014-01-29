#!/bin/bash

APPID=1
USER=scripts.test1
PASS=test
# URL=http://localhost:7070/cipresrest/v1/job/$USER

# URL=https://billiards1.sdsc.edu/cipresrest/v1/job/$USER
URL=http://billiards.sdsc.edu:9002/cipresrest/v1/job/$USER

# RES=../../sdk/src/main/resources
# DATA=$RES/examples/new_tooltest/
RES=$SDK_VERSIONS/testdata
DATA=$RES/tooltests


# List jobs
# curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL

# Missing parameter "actions_"
test1()
{
	echo "=========== TEST 1 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=CLUSTALW" \
		-F "metadata.clientJobId=100" \
		-F "input.infile_=@$DATA/CLUSTALW/CLUSTALW_in.txt" \
		-F "vparam.runtime_=.15" 
}

test2()
{
	# Missing input "infile_", missing parameter "actions_"
	echo "=========== TEST 2 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=CLUSTALW" \
		-F "metadata.clientJobId=100" \
		-F "vparam.runtime_=.15"  
}

test3()
{
	# Assign two values to align_ property.  Demonstrates that only latter value is used.
	echo "=========== TEST 3 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=CLUSTALW" \
		-F "input.infile_=@$DATA/CLUSTALW/CLUSTALW_in.txt" \
		-F "vparam.runtime_=0.15" \
		-F "vparam.actions_=-align" \
		-F "vparam.actions_=foo" 
}

test4()
{
	# Assign two values to align_ property.  Demonstrates that only latter value is used.
	echo "=========== TEST 4 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=CLUSTALW" \
		-F "input.infile_=@$DATA/CLUSTALW/CLUSTALW_in.txt" \
		-F "vparam.runtime_=0.15" \
		-F "vparam.actions_=-align" \
		-F "vparam.hgapresidues_=-A" \
		-F "vparam.hgapresidues_=-D" \
		-F "vparam.hgapresidues_=-Q" 
}

# At the moment params that violate precond are quietly ignored.
test5()
{
	# Violate a precondition, when action isn't -align you can't set matrix. 
	echo "=========== TEST 5 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=CLUSTALW" \
		-F "input.infile_=@$DATA/CLUSTALW/CLUSTALW_in.txt" \
		-F "vparam.runtime_=0.15" \
		-F "vparam.actions_=-profile" \
		-F "vparam.matrix_=-blosum" 
}

# At the moment nothing validates this. 
test6()
{
	# Set an invalid value for list selection (matrix)
	echo "=========== TEST 6 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=CLUSTALW" \
		-F "input.infile_=@$DATA/CLUSTALW/CLUSTALW_in.txt" \
		-F "vparam.runtime_=0.15" \
		-F "vparam.actions_=-align" \
		-F "vparam.matrix_=-foo" 
}

test7()
{
	# Violate runhours ctrl 
	echo "=========== TEST 7 ==========================="
	curl -k -u $USER:$PASS -H "cipres-appkey:$APPID" $URL \
		-F "tool=RAXMLHPC2BB" \
		-F "input.infile_=@$DATA/RAXMLHPC2BB/RAXMLHPC2BB_in.txt" \
		-F "vparam.runtime_=200" \
		-F "vparam.datatype_=dna" \
		-F "vparam.prot_matrix_spec_=JTT" \
		-F "vparam.mlsearch_=1" \
		-F "vparam.use_bootstopping_=1" \
		-F "vparam.printbrlength_=0" 
}

test7


