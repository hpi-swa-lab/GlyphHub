as yet unclassified
updateForm

	form := Form extent: bounds extent depth: 32.
	
	pen := (Pen newOnForm: form)
		color: Color red;
		roundNib: 4 * BTWidget scalingFactor