as yet unclassified
previousCurveDo: aBlock

	self submorphBefore
		ifNotNilDo: aBlock
		ifNil: [
			self contour closed ifTrue: [aBlock value: self contour lastSubmorph]]