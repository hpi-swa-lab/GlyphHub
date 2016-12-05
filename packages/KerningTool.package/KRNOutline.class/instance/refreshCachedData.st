as yet unclassified
refreshCachedData
	| totalOfPoints pointIndex tagMappings |
	totalOfPoints := self contours inject: 0 into: [ :sum :contour | sum + contour points size ].
	
	cachedPoints := IntegerArray new: totalOfPoints * 2.
	cachedContours := ShortIntegerArray new: self contours size.
	cachedTags := ByteArray new: totalOfPoints.
	cachedNumContours := self contours size.
	
	pointIndex := 0.
	
	" bit 0 is off/on curve, bit 1 is conic/cubic "
	tagMappings := {
		#onCurve -> 2r00000001.
		#conicOffCurve -> 2r00000000.
		#cubicOffCurve -> 2r00000010
	} as: Dictionary.
	
	self contours withIndexDo: [ :contour :contourIndex |
		contour points do: [ :point |
			cachedPoints
				at: pointIndex * 2 + 1 put: point first x;
				at: pointIndex * 2 + 2 put: point first y.
			cachedTags at: pointIndex + 1 put: (tagMappings at: point second).
			pointIndex := pointIndex + 1 ].
		cachedContours at: contourIndex put: pointIndex - 1 ]