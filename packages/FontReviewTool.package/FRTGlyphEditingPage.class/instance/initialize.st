as yet unclassified
initialize

	super initialize.
	
	textEntry :=  ((BTTextEntry placeholder: 'Write text here')
			when: #confirmed
			send: #updateGlyphWidget
			to: self;
			pointSize: 25;
			visible: false).
			
	glyphWidgetArea := BTPage row.
	
	self
		add: (BTLabel heading: 'Glyph Editing');
		add: textEntry;
		add: glyphWidgetArea