as yet unclassified
testSmoothHandle

	| contour xml |
	xml := self contourXMLFrom: '<contour>
	<point x="0" y="0" type="move"/>
	<point x="100" y="100"/>
	<point x="100" y="400"/>
	<point x="100" y="0" type="curve" smooth="yes"/>
	</contour>'.

	contour := FRTContour new fromXMLElement: xml pointTransform: #yourself.

	(self expect: (contour elements first endSmooth)) to be: true.
	(self expect: (contour elements first startSmooth)) to be: false