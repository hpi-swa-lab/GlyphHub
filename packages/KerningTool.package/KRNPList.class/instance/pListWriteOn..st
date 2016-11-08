as yet unclassified
pListWriteOn: anXMLWriter
	anXMLWriter
		startOpeningTag: 'plist';
		attribute: 'version' value: '1.0';
		endTag;
		newLine.
	self content pListWriteOn: anXMLWriter.
	anXMLWriter
		startClosingTag: 'plist';
		outdent;
		newLine