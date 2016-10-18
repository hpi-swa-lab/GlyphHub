initialization
initialize
	super initialize.
	FileDirectory default readOnlyFileNamed: self path do: [ :stream |
		glif := (XMLDOMParser parseDocumentFrom: stream) root ].

	self extent: self advance