as yet unclassified
initialize

	super initialize.

	startPointMorph := FRTStartPointHandle forParent: self.
	controlPoint1Morph := FRTStartControlPointHandle forParent: self.
	controlPoint2Morph := FRTEndControlPointHandle forParent: self.
	endPointMorph := FRTEndPointHandle forParent: self.
	
	self pointMorphs do: [:morph | morph addDependent: self]