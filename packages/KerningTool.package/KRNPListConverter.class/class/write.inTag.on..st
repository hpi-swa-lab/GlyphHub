as yet unclassified
write: aValue inTag: aString on: anXMLWriter
	anXMLWriter
		startTag: aString;
		endTag.
	anXMLWriter stream nextPutAll: aValue asString.
	anXMLWriter endTag: aString.