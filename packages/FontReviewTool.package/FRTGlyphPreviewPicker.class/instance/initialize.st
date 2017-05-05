as yet unclassified
initialize

	super initialize.

	glyph1 := FRTGlyphPicker new
		when: #confirmed send: #updatePreview: to: self.
	glyph2 := FRTGlyphPicker new
		when: #confirmed send: #updatePreview: to: self.
	page := BTPage new.

	preview := FRTGlyphWidget new
		pointSize: 64.

	self
		title: 'Select Preview Glyphs';
		add: (page
			padding: BTWidget spacing;
			add: glyph1;
			add: glyph2;
			add: preview;
			add: ((BTButton label: 'Select' icon: #check)
				colorType: #primary;
				when: #clicked send: #setPreviewGlyphs to: self))