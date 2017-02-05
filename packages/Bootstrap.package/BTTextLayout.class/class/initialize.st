as yet unclassified
initialize
	super initialize.
	Smalltalk addToStartUpList: self.
	Smalltalk addToShutDownList: self