text
updateText: aString

	self internalText: (aString ifEmpty: [ | secondaryColor |
		secondaryColor := (self colorScheme foreground) printHtmlString.
		'<span color="#', secondaryColor, '66">', self placeholder, '</span>']).
	
	^ self updateSuggestions then: [self updatePreviewTextFor: aString]