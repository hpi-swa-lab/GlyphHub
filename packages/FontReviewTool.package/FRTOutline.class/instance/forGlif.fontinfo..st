as yet unclassified
forGlif: anXMLNode fontinfo: fontInfoXML

	self
		fontinfo: fontInfoXML;
		glif: anXMLNode veryDeepCopy;
		" pointSize: calls update "
		pointSize: (fontInfoXML at: 'unitsPerEm')