as yet unclassified
testHeaderIntact

	| result source |
	source := self glifSingleClosedCurve.
	result := FRTOutline new
		forGlif: source fontinfo: self simpleFontinfo;
		pointSize: 12;
		xmlElement.

	" remove the outline element because this part is allowed to change "
	(source firstTagNamed: #glyph) removeElement: (source firstTagNamed: #outline).
	(result firstTagNamed: #glyph) removeElement: (result firstTagNamed: #outline).

	(self expect: (self xmlToString: source)) to equal: (self xmlToString: result)