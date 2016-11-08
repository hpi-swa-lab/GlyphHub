*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter 
		startOpeningTag: 'dict';
		endTag.
	self keysAndValuesDo: [ :pListKey :pListValue |
		anXMLWriter  startOpeningTag: 'key';
			endTag;
			pcData: (pListKey asString);
			startClosingTag: 'key';
			newLine.
		pListValue pListWriteOn: anXMLWriter ].
	anXMLWriter
		startClosingTag: 'dict';
		outdent;
		newLine