as yet unclassified
initialize

	super initialize.
	
	mouseIsDown := false.
	
	self
		updateForm;
		expand: true;
		painting: true