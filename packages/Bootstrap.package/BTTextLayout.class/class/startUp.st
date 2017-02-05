as yet unclassified
startUp
	super startUp.
	self primRegisterCustomFontDirectory: FileDirectory default fullName.
	self allSubInstancesDo: [ :layout | layout restoreAfterLoad ]