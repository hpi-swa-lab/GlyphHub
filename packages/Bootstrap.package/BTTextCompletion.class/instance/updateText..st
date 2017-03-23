text
updateText: aString
	self updateSuggestions.
	
	topHit
		ifNil: [ super updateText: aString ]
		ifNotNil: [ super updateText: aString,
			'<span color="#ccc">', (topHit first allButFirst: aString size), '</span>']