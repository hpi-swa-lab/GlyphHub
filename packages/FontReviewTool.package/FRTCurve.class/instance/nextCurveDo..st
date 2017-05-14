as yet unclassified
nextCurveDo: aBlock

	self submorphAfter
		ifNotNilDo: aBlock
		ifNil: [
			self contour closed ifTrue: [aBlock value: self contour firstSubmorph]]