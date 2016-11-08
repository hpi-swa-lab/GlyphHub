reading
deserialize: aPath
	| document pList pListElements |
	
	document := ( FileStream readOnlyFileNamed: aPath do: [ :file | 
		XMLDOMParser parseDocumentFrom: file ]).
	pListElements := ( document firstTagNamed: #plist ) elements.
	pList := KRNPList new.
	( pListElements isEmpty ) ifFalse: [
		pList content: ( self readElement: pListElements first )].
	^ pList