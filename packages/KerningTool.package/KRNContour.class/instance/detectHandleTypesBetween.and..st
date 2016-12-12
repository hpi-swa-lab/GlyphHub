initialize-release
detectHandleTypesBetween: first and: second
	| v1 v2 |
	(first isLine or: [second isLine]) ifTrue: [ ^#free ].
	
	v1 := first controlPoint2 - first endPoint.
	v2 := second controlPoint1 - first endPoint.
	
	(v1 crossProduct: v2) = 0 ifTrue: [
		v1 r = v2 r
			ifTrue: [ ^#auto ]
			ifFalse: [ ^#aligned ]].
		
	^#free