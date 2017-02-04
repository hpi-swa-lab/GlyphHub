as yet unclassified
text: aString
	text := aString.

	self primLayout: layout text: text squeakToUtf8.
	self extent: Display extent x @ 1