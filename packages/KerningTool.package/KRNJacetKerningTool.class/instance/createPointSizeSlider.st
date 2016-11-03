ui-creation
createPointSizeSlider
	self ptSizeSlider: (SimpleSliderMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		minimumValue: 1;
		maximumValue: 40;
		quantum: 1;
		setValue: 1;
		initializeSlider;
		target: self;
		actionSelector: #updateTargetPtSize:;
		yourself).
	^self ptSizeSlider