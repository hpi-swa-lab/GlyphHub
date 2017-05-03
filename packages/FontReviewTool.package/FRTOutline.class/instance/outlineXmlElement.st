as yet unclassified
outlineXmlElement

	| element |
	element := XMLElement named: 'outline'.

	self contours do: [:contour |
		element addElement: (contour xmlElementPointTransform: [:position | self transformPosition: position])].

	^ element