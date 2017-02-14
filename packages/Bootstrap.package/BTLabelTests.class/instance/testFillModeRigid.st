as yet unclassified
testFillModeRigid
	| container label fixedWidth |
	label := (BTLabel text: 'lorem ipsum dolor sit amet consecutor amed si drandum ran clericum sicum') fillMode: #rigid.

	container := BTTopLevel new extent: 100 asPoint; add: label; fullBounds; yourself.
	fixedWidth := label width.
	
	self assert: fixedWidth equals: label width.

	container width: 300; fullBounds.
	self assert: fixedWidth equals: label width.

	container width: 100; fullBounds.
	self assert: fixedWidth equals: label width