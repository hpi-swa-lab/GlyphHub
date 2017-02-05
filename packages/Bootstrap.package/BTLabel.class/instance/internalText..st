as yet unclassified
internalText: aString
	self layout text: aString squeakToUtf8.
	self extent: self extent.
	self layoutChanged