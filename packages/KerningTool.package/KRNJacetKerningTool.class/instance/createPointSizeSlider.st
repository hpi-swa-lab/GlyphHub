ui-creation
createPointSizeSlider
	self ptSizeSlider: (Slider new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		minimumValue: 1;
		maximumValue: 40;
		quantum: 1;
		setValue: 1;
		initializeSlider;
		yourself).
	^self ptSizeSlider