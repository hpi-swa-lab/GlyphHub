as yet unclassified
path: aString
	path := aString.
	
	FileDirectory default readOnlyFileNamed: aString do: [ :stream |
		self
			parseValueDict: ((XMLDOMParser parseDocumentFrom: stream) root firstTagNamed: #dict)
			into: self ]