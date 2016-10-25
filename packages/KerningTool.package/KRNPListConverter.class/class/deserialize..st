as yet unclassified
deserialize: aPath
	| document |
	document := (FileStream readOnlyFileNamed: aPath do: [ :file | 
		XMLDOMParser parseDocumentFrom: file ]).
	
	^KRNPList new
		content: (self readElement: (document firstTagNamed: #plist) elements first);
		yourself