geometry
boundsOfGlifs: aGlifXMLCollection atPointSize: aNumber

	| rectangle corner origin |
	aGlifXMLCollection ifEmpty: [^ 0 @ 0 extent: 0 @ 0].
	
	rectangle := self boundsOfGlifs: aGlifXMLCollection.
	
	origin := (self transformPoint: rectangle origin pointSize: aNumber).
	corner := (self transformPoint: rectangle corner pointSize: aNumber).
	
	^ Rectangle
		origin: origin x @ corner y
		corner: corner x @ origin y