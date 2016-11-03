change reporting
updateTargetPtSize: aNumber
	targetPtSize := aNumber.
	self cursor ptSize: aNumber.
	self updateText