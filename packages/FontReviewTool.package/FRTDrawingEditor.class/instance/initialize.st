initialize-release
initialize

	| fontButton |
	super initialize.
	
	drawingContainer := BTWidget new expand: true.
	drawingArea := FRTDrawingArea new.
	
	fontButton := BTButton icon: #font.
	glyphImport := FRTGlyphPicker new
		minSize: 300 @ 0;
		when: #confirmed send: #importGlyph: to: self.
	BTPopover new
		add: glyphImport;
		attachTo: fontButton.
	
	colorButton := BTButton icon: #circle.
	self penColor: (Color fromString: FRTColorPicker defaultColors first).
	FRTColorPicker new
		attachTo: colorButton;
		when: #colorSelected send: #penColor: to: self.
	
	self
		expand: true;
		vertical: true;
		withLayout;
		add: (BTPage row
			add: (BTButtonGroup new
				add: ((BTButton icon: #paint_brush)
					when: #clicked send: #paint to: drawingArea);
				add: ((BTButton icon: #eraser)
					when: #clicked send: #erase to: drawingArea);
				"add: ((BTButton icon: #crosshairs)
					when: #clicked send: #pick to: drawingArea);"
				add: colorButton;
				"add: fontButton"
				add: ((BTButton icon: #trash)
					when: #clicked send: #clear to: drawingArea))
			oppositeTo: ((BTButton label: 'Save Picture')
				colorType: #primary;
				when: #clicked send: #triggerAccept to: self));
		add: (drawingContainer
			add: drawingArea)