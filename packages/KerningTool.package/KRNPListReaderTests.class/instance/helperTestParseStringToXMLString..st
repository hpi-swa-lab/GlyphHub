helpers
helperTestParseStringToXMLString: aString
	
	^ (XMLDOMParser parseDocumentFrom: (ReadStream on: aString)) asString.
	