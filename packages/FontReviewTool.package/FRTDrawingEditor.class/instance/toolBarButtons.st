initialize-release
toolBarButtons

	^ OrderedCollection new
		add: ((BTButton icon: #paint_brush)
			when: #clicked send: #paint to: drawingArea);
		add: ((BTButton icon: #eraser)
			when: #clicked send: #erase to: drawingArea);
		"add: ((BTButton icon: #crosshairs)
			when: #clicked send: #pick to: drawingArea);"
		add: colorButton;
		add: ((BTButton icon: #trash)
			when: #clicked send: #clear to: drawingArea);
		yourself