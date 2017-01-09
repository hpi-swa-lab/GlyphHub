as yet unclassified
testToggleWindingCorrectHandleTypes
	| contour |
	contour := KRNContour new
		extent: 600 asPoint;
		addSmoothSegmentFrom: 100@50 to: 50@50;
		addSmoothSegmentFrom: 50@50 to: 0@50;
		yourself.
		
	contour submorphs first handleTypeStart: #auto.  
	contour submorphs first handleTypeEnd: #free.  
	contour submorphs second handleTypeEnd: #aligned.  		
	
	contour toggleWinding.
	"TODO: fix the handle types
	self assert: contour submorphs first startPointMorph handleType equals: #auto.
	self assert: contour submorphs first endPointMorph handleType equals: #free.
	self assert: contour submorphs second endPointMorph handleType equals: #aligned
	"