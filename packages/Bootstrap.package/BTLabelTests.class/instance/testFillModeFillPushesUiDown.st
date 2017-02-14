as yet unclassified
testFillModeFillPushesUiDown
	| container label button |
	label := (BTLabel text: 'lorem ipsum dolor sit amet consecutor amed si drandum ran clericum sicum') fillMode: #fill.
	button := BTButton new.
	container := BTTopLevel new extent: 100 asPoint; padding: 0; add: label; add: button; fullBounds; yourself.
	
	
	self assert: button y >= label bottom