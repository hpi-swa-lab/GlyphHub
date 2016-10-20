as yet unclassified
deserialize: aPath
	| pList document |
	pList := KRNPList new.
	
	document := (FileStream readOnlyFileNamed: ( aPath ) do: [ :file |
XMLDOMParser parseDocumentFrom: file]).
	
	pList add: (self readElement: (document firstTagNamed: #plist) elements first).
	
	^ pList