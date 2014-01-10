#!/bin/sh
if [ $# -lt  2 ]; then
	echo ""
	echo "release.sh <label> <command> <optional_tag_label>"
	echo "where command is maketag, makebranch, rmtag, rmbranch, gettag, or getbranch"
	echo ""
	echo "Remember, the release process is:"
	echo "1. Make a branch, check it out, test it, commit fixes. (mkbranch, getbranch)"
	echo "2. Copy branch to tag (makektag)"
	echo "3. Check out the tag (gettag).  Build and deploy."
	echo "4. Add the war to root of the tag dir and commit it."
	echo
	echo "5. If you need to make bug fixes after deployment, check out the branch,"
	echo "make, test and commit changes to branch. Then, make a new tag: "
	echo "    release.sh <name> maketag <name>.1"
	echo "and continue from step 3."
	exit 1
fi
label=$1
command=$2
optional_tag_label=$3

svnbase=https://svn.sdsc.edu/repo/NGBW

sdk_trunk=$svnbase/sdk/trunk/sdk
if [ -z "$optional_tag_label" ]; then
	sdk_tag=$svnbase/sdk/tags/$label
else
	sdk_tag=$svnbase/sdk/tags/$optional_tag_label
fi
sdk_branch=$svnbase/sdk/branches/$label

cipres_trunk=$svnbase/cipres-portal/trunk/cipres-portal
cipres_tag=$svnbase/cipres-portal/tags/$label
if [ -z "$optional_tag_label" ]; then
	cipres_tag=$svnbase/cipres-portal/tags/$label
else
	cipres_tag=$svnbase/cipres-portal/tags/$optional_tag_label
fi
cipres_branch=$svnbase/cipres-portal/branches/$label


# grep returns 0 when the text is found, so these *exists vars will be 0 
# if the tag or branch doesn't exist (and not a valid url is found).
svn info $sdk_tag 2>&1 |grep "Not a valid URL"  > /dev/null
sdk_tag_exists=$? 
svn info $sdk_branch 2>&1 |grep "Not a valid URL"  > /dev/null
sdk_branch_exists=$? 

svn info $cipres_tag 2>&1 |grep "Not a valid URL"  > /dev/null
cipres_tag_exists=$? 
svn info $cipres_branch 2>&1 |grep "Not a valid URL"  > /dev/null
cipres_branch_exists=$? 

case $command in
	maketag)
		if [ $sdk_tag_exists -eq 0 ] && [ $cipres_tag_exists -eq 0 ]; then 
			echo making tag $label
			svn copy $sdk_branch $sdk_tag
			svn copy $cipres_branch $cipres_tag
		else
			echo $label already exists on sdk or cipres-portal
		fi
		;;
	makebranch)
		if [ $sdk_branch_exists -eq 0 ] && [ $cipres_branch_exists -eq 0 ]; then 
			echo making branch $label
			svn copy $sdk_trunk $sdk_branch
			svn copy $cipres_trunk $cipres_branch
		else
			echo $label already exists on sdk or cipres-portal
		fi
		;;
	gettag)
		mkdir tag_$label
		if [ $? -ne 0 ] ; then
			echo unable to mkdir tag_$label
			exit 1
		fi
		cd tag_$label
		svn checkout $sdk_tag sdk
		svn checkout $cipres_tag cipres-portal
		;;
	getbranch)
		mkdir branch_$label
		if [ $? -ne 0 ] ; then
			echo unable to mkdir branch_$label
			exit 1
		fi
		cd branch_$label
		svn checkout $sdk_branch sdk
		svn checkout $cipres_branch cipres-portal
		;;
	rmtag)
		echo removing $sdk_tag and $cipres_tag
		svn rm $sdk_tag
		svn rm $cipres_tag
		;;
	rmbranch)
		echo removing $sdk_branch and $cipres_branch
		svn rm $sdk_branch
		svn rm $cipres_branch
		;;
	*)
		echo Not a valid command
		;;

esac

