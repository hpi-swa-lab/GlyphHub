callbacks
openSketchEditor: anEvent

	(SketchMorph
		withForm: (preview renderer formForGlyphs: preview glyphNames size: 256 color: Color black)) center: self currentWorld center;
		openInWorld;
		editDrawing