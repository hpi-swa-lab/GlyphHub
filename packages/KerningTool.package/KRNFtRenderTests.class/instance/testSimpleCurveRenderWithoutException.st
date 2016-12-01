as yet unclassified
testSimpleCurveRenderWithoutException
	| outline form |
	outline := KRNOutline new
		addContour: (KRNContour new lineTo: 0 @ 0; curveTo: 2000 @ 2000 via: 0 @ 1000 and: 1000 @ 2000);  
		yourself.
	
	form := Form extent: 1000 @ 1000 depth: 32.
	
	outline drawOn: (FormCanvas on: form) at:  80 @ 80 color: Color red