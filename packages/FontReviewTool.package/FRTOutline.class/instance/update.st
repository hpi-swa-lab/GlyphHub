as yet unclassified
update

	self
		removeAllMorphs;
		buildTransform.
	
	self glif tagsNamed: #contour do: [:contourNode |
		(FRTContour forParent: self) fromXMLElement: contourNode].
	
	self resizeToFitSubmorphs