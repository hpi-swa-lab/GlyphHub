actions
openSketchEditor

	| dialog |
	editor ifNil: [ | font |
		font := self thread threadGlyphAssociations anyOne glyph font.
		editor := FRTGlyphDrawingEditor new
			font: font;
			importGlyphs: glyphsPreview glyphNames font: font;
			when: #accept send: #acceptSketch: to: self;
			yourself].
	
	dialog := (BTDialog title: 'Annotate Glyphs')
		content: (BTPage row
			expand: true;
			padding: BTWidget spacing;
			add: editor);
		minSize: 700;
		openCentered;
		yourself.
	
	editor ensureContentsFit.
	
	self setProperty: #sketchDialog toValue: dialog