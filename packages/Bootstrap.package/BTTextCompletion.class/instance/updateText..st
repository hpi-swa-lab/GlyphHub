text
updateText: aString

	^ self updateSuggestions then: [self updatePreviewTextFor: aString]