as yet unclassified
shutDown
	super shutDown.
	self allSubInstancesDo: [ :layout | layout prepareForSave ]