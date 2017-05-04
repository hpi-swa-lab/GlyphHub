as yet unclassified
testTransformedExtent

	rectangle := renderer boundsOfGlifs: {self glifSingleClosedCurve} atPointSize: 500.
	
	(self expect: rectangle origin) to equal: -15 @ -10.
	(self expect: rectangle corner) to equal: 60 @ 65