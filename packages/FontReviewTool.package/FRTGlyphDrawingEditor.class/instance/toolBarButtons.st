actions
toolBarButtons

	fontButton := BTButton icon: #font.
	glyphImport := FRTGlyphPicker new
		minSize: 300 @ 0;
		when: #confirmed send: #importGlyph: to: self.
	BTPopover new
		add: glyphImport;
		attachTo: fontButton.

	^ super toolBarButtons
		add: fontButton;
		yourself