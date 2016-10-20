as yet unclassified
newForXML: anXMLNode from: aFont
	^self basicNew
		glif: anXMLNode;
		font: aFont;
		initialize;
		yourself