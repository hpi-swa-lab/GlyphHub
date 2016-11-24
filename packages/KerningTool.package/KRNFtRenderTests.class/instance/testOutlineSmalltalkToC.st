as yet unclassified
testOutlineSmalltalkToC
	| outline |
	outline := KRNOutline new
		addContour: (KRNContour new lineTo: 100 @ 100; lineTo: 400 @ 400; lineTo: 200 @ 200);
		addContour: (KRNContour new lineTo: 30 @ 40; lineTo: 10 @ 10);
		addContour: (KRNContour new lineTo: 70 @ 300; lineTo: 300 @ 500; lineTo: 60 @ 60; lineTo: 10 @ 10; lineTo: 4 @ 6);
		addContour: (KRNContour new lineTo: 1 @ 1; lineTo: 100 @ 1000);  
		yourself.
	
	self
		assert: {100. 100. 400. 400. 200. 200. 30. 40. 10. 10. 70. 300. 300. 500. 60. 60. 10. 10. 4. 6. 1. 1. 100. 1000} equalsContent: outline cachedPoints;
		assert: {2. 4. 9. 11} equalsContent: outline cachedContours;
		assert: {2. 2. 2. 2. 2. 2. 2. 2. 2. 2. 2. 2} equalsContent: outline cachedTags