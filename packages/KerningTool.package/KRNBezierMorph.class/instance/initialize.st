initialize-release
initialize
	super initialize.
	
	startPoint := KRNBezierControlPointMorph newOn: self.
	controlPoint1 := KRNBezierControlPointMorph newOn: self.
	controlPoint2 := KRNBezierControlPointMorph newOn: self.
	endPoint := KRNBezierControlPointMorph newOn: self.
	
	self pointMorphs do: [ :p | p addDependent: self ].
	
	"self borderColor: Color green; borderWidth: 3."
	
	self
		addMorph: self startPoint;
		addMorph: self controlPoint1;
		addMorph: self controlPoint2;
		addMorph: self endPoint;
		color: Color transparent.
	
	self startPoint center: 0@100.
	self controlPoint1 center: 0@0.
	self controlPoint2 center: 100@0.
	self endPoint center: 100@100.
	
	self updateExtent