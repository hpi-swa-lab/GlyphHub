as yet unclassified
rotationDegrees: aNumber
	transform := transform withAngle: aNumber.
	self updateForm.
	self changed