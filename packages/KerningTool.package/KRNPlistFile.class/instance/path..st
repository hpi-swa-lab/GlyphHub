as yet unclassified
path: aString
	path := aString.
	
	FileDirectory default readOnlyFileNamed: aString do: [ :stream |
		data := self parseValue: { (XMLDOMParser parseDocumentFrom: stream) root firstTagNamed: #dict } ]