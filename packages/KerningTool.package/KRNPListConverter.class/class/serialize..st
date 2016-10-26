as yet unclassified
serialize: aKRNPList
	
	| writer |
	writer := XMLWriter on: (WriteStream on: String new).
	writer stream nextPutAll: self pListStart.
	writer startTag: 'plist';
		attribute: 'version' value: '1.0';
		endTag.
	self turnElementIntoXML: aKRNPList content with: writer.
	writer endTag: 'plist'.
	^ writer stream contents