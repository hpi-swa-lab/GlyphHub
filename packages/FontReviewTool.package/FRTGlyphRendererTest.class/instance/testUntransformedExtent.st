as yet unclassified
testUntransformedExtent

	rectangle := renderer boundsOfGlifs: {self glifSingleClosedCurve}.
	
	(self expect: rectangle origin) to equal: -30 asPoint.
	(self expect: rectangle corner) to equal: 120 asPoint