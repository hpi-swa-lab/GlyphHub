as yet unclassified
startTag: aTagName

	self stream
		nextPut: $<;
		nextPutAll: aTagName asString.
	self pushTag: aTagName