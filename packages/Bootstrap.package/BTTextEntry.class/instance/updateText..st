as yet unclassified
updateText: aString
	super updateText: (aString ifEmpty: [ | secondaryColor |
		secondaryColor := (self colorScheme foreground muchLighter) printHtmlString.
		'<span color="#', secondaryColor, '">', self placeholder, '</span>' ])