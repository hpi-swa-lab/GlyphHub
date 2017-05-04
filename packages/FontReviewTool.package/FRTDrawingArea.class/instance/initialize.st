initialize-release
initialize

	super initialize.
	
	mouseIsDown := false.
	
	self
		mode: #paint;
		updateForm;
		penColor: (Color fromString: FRTColorPicker defaultColors first);
		expand: true