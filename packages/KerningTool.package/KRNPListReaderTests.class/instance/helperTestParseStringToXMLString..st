helpers
helperTestParseStringToXMLString: aString
	
	^ (XMLDOMParser parseDocumentFrom: (ReadStream on: aString)) asExplorerString.
	