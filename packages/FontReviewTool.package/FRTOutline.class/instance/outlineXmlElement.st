as yet unclassified
outlineXmlElement

	| element |
	element := XMLElement named: 'outline'.

	self contours do: [:contour |
		element addElement: contour xmlElement].

	^ element