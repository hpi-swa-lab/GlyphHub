as yet unclassified
selectPointFrom: aContour
	aContour ifNotNil: [
		aContour lastSubmorph endPointMorph selected: true.
		aContour color: Color orange ].