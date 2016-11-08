*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter
		startOpeningTag: 'integer';
		endTag;
		pcData: (self asString);
		startClosingTag: 'integer';
		outdent;
		newLine