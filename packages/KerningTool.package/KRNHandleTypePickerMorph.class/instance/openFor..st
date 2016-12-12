as yet unclassified
openFor: aMorph
	self
		openInWorld;
		position: aMorph position + (aMorph extent / 2) - (self extent / 2).
		
	self activeHand newMouseFocus: self; newKeyboardFocus: self