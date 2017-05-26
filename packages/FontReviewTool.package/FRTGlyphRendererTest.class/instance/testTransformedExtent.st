as yet unclassified
testTransformedExtent

	| rectangle |
	rectangle := renderer boundsOfGlifs: {XMLDOMParser parseDocumentFrom: self glifSingleClosedCurve readStream} atPointSize: 500.
	
	(self expect: rectangle origin) to equal: -15 @ -10.
	(self expect: rectangle corner) to equal: 60 @ 65