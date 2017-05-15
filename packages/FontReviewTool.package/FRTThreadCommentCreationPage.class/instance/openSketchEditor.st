actions
openSketchEditor

	| dialog |
	editor ifNil: [ | font |
		font := self thread threadGlyphAssociations anyOne glyph font.
		editor := FRTDrawingEditor new
			font: font;
			importGlyphs: preview glyphNames font: font;
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