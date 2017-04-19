text
updateText: aString

	self updateSuggestions.
	
	self topHit
		ifNil: [super updateText: aString]
		ifNotNil: [super updateText: aString,
			'<span color="#ccc">', (self topHit first allButFirst: aString size), '</span>']