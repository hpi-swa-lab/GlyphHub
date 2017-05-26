as yet unclassified
testUntransformedExtent

	| rectangle |
	rectangle := renderer boundsOfGlifs: {XMLDOMParser parseDocumentFrom: self glifSingleClosedCurve readStream}.
	
	(self expect: rectangle origin) to equal: -30 asPoint.
	(self expect: rectangle corner) to equal: 120 asPoint