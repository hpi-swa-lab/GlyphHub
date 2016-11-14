as yet unclassified
scaleToMatch: aPoint
	| scale |
	" FIXME doesn't allow scaling on both x and y axis and is broken somehow when getting too small "
	scale := (aPoint - self referencePosition) r / (self bounds bottomRight - self referencePosition) r.
	transform := transform withScale: scale.
	
	self updateForm.
	self changed