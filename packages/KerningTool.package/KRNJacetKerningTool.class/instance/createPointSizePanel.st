ui-creation
createPointSizePanel
	^(Morph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		addMorph: self createStandardPointSizeButton;
		addMorph: self createPointSizeButton;
		addMorph: self createPointSizeSlider;
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		yourself)