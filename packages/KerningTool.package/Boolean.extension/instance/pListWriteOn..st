*KerningTool-writing
pListWriteOn: anXMLWriter
	anXMLWriter
		startOpeningTag: self asString;
		endEmptyTag: self asString;
		outdent;
		newLine.