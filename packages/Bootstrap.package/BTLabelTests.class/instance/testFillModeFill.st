as yet unclassified
testFillModeFill
	| container label |
	label := (BTLabel text: 'lorem ipsum dolor sit amet consecutor amed si drandum ran clericum sicum') fillMode: #fill.

	container := BTTopLevel new extent: 100 asPoint; padding: 0; add: label; fullBounds; yourself.
	self assert: 100 equals: label width.

	container width: 300; fullBounds.
	self assert: 300 equals: label width.

	container width: 100; fullBounds.
	self assert: 100 equals: label width