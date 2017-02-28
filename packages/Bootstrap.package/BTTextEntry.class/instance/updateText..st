as yet unclassified
updateText: aString
	super updateText: (aString ifEmpty: [ | secondaryColor |
		secondaryColor := (self colorScheme foreground) printHtmlString.
		'<span color="#', secondaryColor, '66">', self placeholder, '</span>' ])