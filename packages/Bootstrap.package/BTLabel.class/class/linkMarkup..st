instance creation
linkMarkup: aString
	^'<span color="#', BTColorScheme linkColor printHtmlString, '">', aString, '</span>'