event handling
smoothControlPoint: myControl anchor: myAnchor otherControl: otherControl handleType: handleType
	handleType == #auto ifTrue: [
		^myAnchor + myAnchor - otherControl ].
	
	handleType == #aligned ifTrue: [ | length angle |
		length := myAnchor dist: myControl.
		angle := (myAnchor - otherControl) theta radiansToDegrees.
		^myAnchor + (Point r: length degrees: angle) ].
	
	^myControl