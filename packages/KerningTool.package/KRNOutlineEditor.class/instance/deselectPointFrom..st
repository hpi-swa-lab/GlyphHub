as yet unclassified
deselectPointFrom: aContour
	aContour ifNotNil: [ aContour lastSubmorph endPointMorph handleType: #free ]