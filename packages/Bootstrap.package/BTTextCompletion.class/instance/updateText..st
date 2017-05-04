text
updateText: aString

	super updateText: aString.
	^ self updateSuggestions then: [self updatePreviewTextFor: aString]