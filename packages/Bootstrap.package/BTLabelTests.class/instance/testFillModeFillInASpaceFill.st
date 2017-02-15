as yet unclassified
testFillModeFillInASpaceFill
	| container label |
	label := (BTLabel text: 'lorem ipsum dolor sit amet consecutor amed si drandum ran clericum sicum') fillMode: #fill.
Transcript clear.
	container := BTTopLevel new
		extent: 100 asPoint;
		padding: 0;
		add: ((BTPage new align: #(expand expand); vertical: false) add: label);
		fullBounds;
		yourself.
	
	self assert: 100 equals: label width.

	Transcript show: 'MAKING IT LARGE'; cr.
	container width: 300.
	Transcript show: 'REAL: '; show: container bounds extent; show: ' '; show: container layoutBounds extent; show: ' '; show: container innerBounds extent; cr.
	container fullBounds.
	self assert: 300 equals: label width.

	Transcript show: 'MAKING IT SMALL'; cr.
	container width: 100.
	Transcript show: 'REAL: '; show: container bounds extent; show: ' '; show: container layoutBounds extent; show: ' '; show: container innerBounds extent; cr.
	container fullBounds.
	self assert: 100 equals: label width