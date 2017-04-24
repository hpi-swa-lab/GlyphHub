text
updatePreviewTextFor: aString

	super updateText: aString, 
		((self topHitFor: aString)
			ifNotEmptyDo: [:hit |'<span color="#ccc">', (hit allButFirst: aString size), '</span>']
			ifEmpty: [''])