as yet unclassified
compileToOtf
	" https://github.com/HPI-SWA-Lab/BP2016H1/wiki/Setting-up-Fontmake "
	| proc |
	proc := OSProcess waitForCommand: 'fontmake', ' -u ', self path fullName, ' -o otf'.
	proc succeeded
		ifFalse: [ self inform: 'Compiling font failed. Error code: ', proc exitStatus asString ]
		ifTrue: [ self inform: 'Compiling successfull! Look for master_otf in your Squeak directory.', (FileDirectory default / 'master_otf') fullName ]