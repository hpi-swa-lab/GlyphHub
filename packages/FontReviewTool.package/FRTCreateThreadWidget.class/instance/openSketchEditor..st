navigation
openSketchEditor: anEvent
	| preview |
	preview := (BTLabel text: '<span size="100000">', self text, '</span>')
		align: #(center center);
		resizeToPreferred.
	
	(SketchMorph withForm: preview imageForm) center: self currentWorld center; openInWorld; editDrawing