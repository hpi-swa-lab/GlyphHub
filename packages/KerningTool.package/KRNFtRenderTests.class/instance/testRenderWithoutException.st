as yet unclassified
testRenderWithoutException
	| outline form |
	outline := KRNOutline new
		addContour: (KRNContour new lineTo: 100 @ 100; lineTo: 100 @ 1000; lineTo: 1000 @ 1000);
		addContour: (KRNContour new lineTo: 30 @ 40; lineTo: 10 @ 10);
		addContour: (KRNContour new lineTo: 70 @ 300; lineTo: 300 @ 500; lineTo: 60 @ 60; lineTo: 10 @ 10; lineTo: 4 @ 6);
		addContour: (KRNContour new lineTo: 1 @ 1; lineTo: 100 @ 1000);
		yourself.
	
	form := Form extent: 1000 @ 1000 depth: 32.
	
	KRNFtRender renderContours: outline on: form at:  80 @ 80