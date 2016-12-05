initialize-release
initialize
	super initialize.
	
	startPoint := KRNBezierControlPointMorph newOn: self.
	controlPoint1 := KRNBezierControlPointMorph newOn: self.
	controlPoint2 := KRNBezierControlPointMorph newOn: self.
	endPoint := KRNBezierControlPointMorph newOn: self.
	closed := false.
	
	self pointMorphs do: [ :p | p addDependent: self ].
	
	"self borderColor: Color green; borderWidth: 3."
	
	self
		addMorph: startPoint;
		addMorph: controlPoint1;
		addMorph: controlPoint2;
		addMorph: endPoint;
		color: Color transparent.
	
	self startPoint: 0@100.
	self controlPoint1: 0@0.
	self controlPoint2: 100@0.
	self endPoint: 100@100.
	
	self updateExtent