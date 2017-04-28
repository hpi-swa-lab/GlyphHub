callbacks
openSketchEditor: anEvent

	| dialog editor |
	editor := FRTDrawingEditor new
		importGlyphs: preview glyphNames
		font: self thread threadGlyphAssociations anyOne glyph font;
		yourself.
	
	dialog := (BTDialog title: 'Annotate Glyphs')
		content: (BTPage row
			expand: true;
			padding: BTWidget spacing;
			add: editor);
		minSize: 700;
		openCentered.
	
	self setProperty: #sketchDialog toValue: dialog.
	
	editor when: #accept send: #acceptSketch: to: self