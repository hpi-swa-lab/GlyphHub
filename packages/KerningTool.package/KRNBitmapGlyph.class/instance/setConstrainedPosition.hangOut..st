as yet unclassified
setConstrainedPosition: aPoint hangOut: partiallyOutside
	" response to being dragged via halo "
	" FIXME currently moves faster than the mouse. no idea why. "
	transform := transform withOffset: aPoint - self outerBounds origin * self formScale.
	self persistTransformInFont.
	self changed