initialize-release
initialize

	super initialize.
	
	mouseIsDown := false.
	
	self
		updateForm;
		mode: #painting;
		penColor: (Color fromString: FRTColorPicker defaultColors first);
		expand: true