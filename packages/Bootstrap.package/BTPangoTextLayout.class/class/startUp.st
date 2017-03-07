as yet unclassified
startUp
	super startUp.
	self primRegisterCustomFontDirectory: (FileDirectory default / 'BP2016H1' / 'assets') fullName.
	self updateDpi.
	self allSubInstancesDo: [ :layout | layout restoreAfterLoad ]