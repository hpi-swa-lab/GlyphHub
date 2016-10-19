initialization
initialize
	super initialize.
	
	FileDirectory default readOnlyFileNamed: self path do: [ :stream |
		glif := (XMLDOMParser parseDocumentFrom: stream) root.
		
		unicodeCodePoints := OrderedCollection new.
		glif tagsNamed: #unicode do: [ :c | unicodeCodePoints add: ('16r', (c attributeAt: #hex)) asNumber ]].
	
	self
		color: Color white;
		ptSize: 11