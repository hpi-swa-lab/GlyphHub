helper-drawing
shapeOfGlif: aGlif
	
	^ OrderedCollection streamContents: [:stream |
		aGlif tagsNamed: #contour do: [:contour |
			(self pointsForContour: contour)
				ifNotEmptyDo: [:shape | stream nextPut: shape asPointArray]]]