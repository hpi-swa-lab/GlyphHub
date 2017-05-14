as yet unclassified
initialize

	super initialize.

	startPointMorph := FRTPointHandle forParent: self.
	controlPoint1Morph := FRTPointHandle forParent: self.
	controlPoint2Morph := FRTPointHandle forParent: self.
	endPointMorph := FRTPointHandle forParent: self.
	
	self pointMorphs do: [:morph | morph addDependent: self]