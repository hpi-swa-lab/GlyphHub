accessing
targetPtSize: aNumber
	self cursor ptSize: aNumber.
	self ptSizeSlider setValue: aNumber.
	targetPtSize := aNumber