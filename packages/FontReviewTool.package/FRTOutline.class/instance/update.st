as yet unclassified
update

	| scale |
	self removeAllMorphs.

	scale := self pointSize / self unitsPerEm.

	self extent: self advanceWidth @ self height * scale.

	self glif tagsNamed: #contour do: [:contourNode | | contour |
		contour := FRTContour new.
		self addMorphBack: contour.

	contour fromXMLElement: contourNode pointTransform: [:point | self transformPoint: point]]