initialize-release
initialize

	| fontButton |
	super initialize.
	
	drawingContainer := BTWidget new expand: true.
	drawingArea := FRTDrawingArea new.
	
	fontButton := BTButton icon: #font.
	glyphImport := (BTTextCompletion placeholder: 'Enter a glyphname ...')
		minSize: 300 @ 0;
		when: #confirmed send: #importGlyph: to: self.
	BTPopover new
		add: glyphImport;
		attachTo: fontButton.
	
	colorButton := BTButton icon: #circle.
	self penColor: (Color fromString: FRTColorPicker defaultColors first).
	FRTColorPicker new
		attachTo: colorButton;
		when: #selectedColor send: #penColor: to: self.
	
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
				add: fontButton)
			oppositeTo: ((BTButton label: 'Save Picture')
				colorType: #primary;
				when: #clicked send: #triggerAccept to: self));
		add: (drawingContainer
			add: drawingArea)