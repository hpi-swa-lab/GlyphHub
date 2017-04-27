instance creation
linkMarkup: aString
	"This is usually used for parts of texts, please do not change this to use style attributes"

	^ '<span color="#', BTColorScheme linkColor printHtmlString, '">', aString, '</span>'