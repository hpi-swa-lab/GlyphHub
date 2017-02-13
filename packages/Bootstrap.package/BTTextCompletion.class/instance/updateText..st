as yet unclassified
updateText: aString
	self showSuggestions; updateSuggestions.
	
	topHit
		ifNil: [ super updateText: aString ]
		ifNotNil: [ super updateText: aString,
			'<span color="#ccc">', (topHit first allButFirst: aString size), '</span>']