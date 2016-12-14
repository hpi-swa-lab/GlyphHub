event handling
linkedPointsOf: aPoint
	| list |
	list := OrderedCollection with: aPoint.
	
	aPoint == startPoint ifTrue: [
		list := OrderedCollection with: startPoint with: controlPoint1.
		self previousSegment ifNotNilDo: [ :segment | list addAll: {segment endPointMorph. segment controlPoint2Morph} ]].
	
	aPoint == endPoint ifTrue: [
		list := OrderedCollection with: endPoint with: controlPoint2.
		self nextSegment ifNotNilDo: [ :segment | list addAll: {segment startPointMorph. segment controlPoint1Morph} ]].
	
	^list