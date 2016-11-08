*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter
		startOpeningTag: 'array';
		endTag;
		newLine.
	self do: [ :pListElement | pListElement pListWriteOn: anXMLWriter].
	anXMLWriter
		startClosingTag: 'array';
		outdent;
		newLine