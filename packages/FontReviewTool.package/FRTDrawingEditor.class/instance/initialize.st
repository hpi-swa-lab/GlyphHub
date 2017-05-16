initialize-release
initialize

	super initialize.
	
	drawingContainer := BTWidget new expand: true.
	drawingArea := FRTDrawingArea new.
	
	self
		expand: true;
		vertical: true;
		withLayout;
		add: (BTPage row
			add: self editingButtonGroup
			oppositeTo: ((BTButton label: 'Save Picture')
				colorType: #primary;
				when: #clicked send: #triggerAccept to: self));
		add: (drawingContainer
			add: drawingArea)