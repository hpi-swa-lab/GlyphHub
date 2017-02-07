as yet unclassified
extent: aPoint
	| size |
	animating ifTrue: [ ^super extent: aPoint ].
	
	size := (aPoint x) @ (container hasSubmorphs
		ifFalse: [ aPoint y ]
		ifTrue: [ collapsed ifTrue: [0] ifFalse: [container firstSubmorph extent y]]).
	
	super extent: size.
	
	container extent: size