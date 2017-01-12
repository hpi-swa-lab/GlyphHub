as yet unclassified
noteNewOwner: aMorph
	super noteNewOwner: aMorph.
	self flag: 'HACK D:'.
	self allMorphsDo: [ :s | s layoutChanged ]