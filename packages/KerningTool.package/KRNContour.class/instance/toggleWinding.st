initialize-release
toggleWinding
	self submorphsDo: [ :bezierCurve | bezierCurve toggleWinding].
	self deselectEndPointMorph.
	self submorphsDo: [ :bezierCurve | self addMorphFront: bezierCurve].
	self submorphsDo: [ :bezierCurve | bezierCurve syncAllConnections].
	self selectEndPointMorph