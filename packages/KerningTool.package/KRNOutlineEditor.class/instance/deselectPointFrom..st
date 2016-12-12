as yet unclassified
deselectPointFrom: aContour
	aContour ifNotNil: [
		aContour lastSubmorph endPointMorph selected: false.
		aContour color: Color black ]