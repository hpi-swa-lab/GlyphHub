initialize-release
initialize

	super initialize.
	
	drawingContainer := BTWidget new expand: true.
	drawingArea := FRTDrawingArea new.
	
	colorButton := BTButton icon: #circle.
	self penColor: Color red.
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
					when: #clicked send: #painting: to: drawingArea with: true);
				add: ((BTButton icon: #crosshairs)
					when: #clicked send: #painting: to: drawingArea with: false);
				add: colorButton)
			oppositeTo: ((BTButton label: 'Save Picture')
				colorType: #primary;
				when: #clicked send: #triggerAccept to: self));
		add: (drawingContainer
			add: drawingArea)