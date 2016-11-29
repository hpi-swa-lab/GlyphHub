as yet unclassified
testSegmentBuilding
	| segments stream contour |
	contour := KRNContour new
			lineTo: 0 @ 0;
			curveTo: 2000 @ 2000 via: 0 @ 1000 and: 1000 @ 2000;
			lineTo: 50 @ 30;
			qcurveTo: 400 @ 400 via: {100@100. 300@300. 350@350};
			qcurveTo: 200 @ 200 via: {300@300};
			yourself.
	
	segments := OrderedCollection new.
	
	stream := ReadStream on: {
		{#line. {200 @ 200. 0 @ 0}}.
		{#cubic. {0 @ 0. 0 @ 1000. 1000 @ 2000. 2000 @ 2000}}.
		{#line. {2000 @ 2000. 50 @ 30}}.
		{#conic. {50 @ 30. 100 @ 100. 300 @ 300. 350 @ 350. 400 @ 400}}.
		{#conic. {400 @ 400. 300 @ 300. 200 @ 200}}.
	}.
	
	contour segments do: [ :segment |
		self assert: stream next first equals: segment first.
		self assert: stream last second equalsContent: segment second ]