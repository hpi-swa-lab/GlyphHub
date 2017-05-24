text
updateText: aString

	super updateText: (aString asHtml ifEmpty: [ | secondaryColor |
		secondaryColor := (self colorScheme foreground) printHtmlString.
		'<span color="#', secondaryColor, '66">', self placeholder, '</span>'])