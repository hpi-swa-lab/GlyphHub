text
updatePreviewTextFor: aString

	super updateText: aString, '<span color="#ccc">', ((self topHitFor: aString) allButFirst: aString size), '</span>'