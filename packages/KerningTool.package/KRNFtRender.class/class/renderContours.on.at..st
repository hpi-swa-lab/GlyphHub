as yet unclassified
renderContours: anOutline on: aForm at: aPoint
	anOutline refreshCachedData.
	self primRenderContours: anOutline on: aForm at: aPoint