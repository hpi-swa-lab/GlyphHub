helpers
helperTestParsePListToXMLString: aPList
	^ (XMLDOMParser parseDocumentFrom: (ReadStream on: (KRNPListConverter serialize: aPList))) asString.
	