as yet unclassified
scaleToMatch: aPoint
	transform := transform withScale: originalForm extent / aPoint.
	self updateForm.
	self changed