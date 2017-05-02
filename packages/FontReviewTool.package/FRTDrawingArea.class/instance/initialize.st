as yet unclassified
initialize

	super initialize.
	
	mouseIsDown := false.
	
	self
		updateForm;
		mode: #painting;
		penColor: Color red;
		expand: true