PYTHON and BASH CODE FOR TESTING the REST SERVICE

PREQUISITES:
	1. Before you can run this code you need to build and install everything from cipres-build 
	directory.  Use the script (currently called "tl.sh").

	2. Specific User and application accounts must exist in the db for certain tests.  
	See sdk/database/scripts/ngbwalpha.sql, which can initialize the db and create
	the expected accounts, or if you're using an existing db, you'll need to create
	the accounts and set the properties associated with them in cipres-build/pom.xml,
	such as pycipres_appkey, pycipres_appname.


Yes, it's weird to use a pom file with python code, but the pom file in pycipres just does 
resource filtering on conf/pycipres.conf and copies it to $SDK_VERSIONS/testdata.  
Pycipres.conf gives the url for the rest service, location of test data, etc can can easily
be read from bash or python code.

You can either install this code or run out of the source directory.  
A. To install:

	1. make sure the cipres virtualenv is activated (which `python` should show
	that you're running python from ~/local/virtualenv/cipres)

	2. 'python setup.py install' or 'python setup.y develop' 
		develop installs with symlinks so changes to source immediately show up in the installation

B. To run from the source directory, pycipres/bin:
	- set PYTHONPATH.  cd to root of source tree (ie. top level pycipres directory)
	export PYTHONPATH=`pwd` or export PYTHONPATH=`pwd`;$PYTHONPATH

	- export PATH=$PATH:.  (if . isn't already on PATH.  Otherwise, eg. batchtest won't
	find runtemplate in the current directory)

	- cd pycipres/bin to run scripts in that are in bin.

