*KerningTool-writing
pListWriteOn: anXMLWriter
	"anXMLWriter stream nextPutAll: '<string>', self, '</string>'."
	anXMLWriter startOpeningTag: 'string';
		endTag;
		pcData: self;
		startClosingTag: 'string';
		outdent;
		newLine