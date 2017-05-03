as yet unclassified
testOpenContours

	| contour xml |
	xml := self contourXMLFrom: '<contour>
	<point x="0" y="0" type="move"/>
	<point x="100" y="100" type="line"/>
	</contour>'.

	contour := FRTContour new fromXMLElement: xml pointTransform: #yourself.

	(self expect: contour closed) to be: false.

	(self expect: (self xmlToString: (contour xmlElementPointTransform: #yourself))) to
		equal: (self xmlToString: xml)