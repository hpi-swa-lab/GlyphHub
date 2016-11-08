*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter
		startOpeningTag: 'real';
		endTag;
		pcData: (self asString);
		endTag: 'real';
		
		outdent;
		newLine