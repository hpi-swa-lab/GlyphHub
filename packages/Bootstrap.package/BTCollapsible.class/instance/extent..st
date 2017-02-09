as yet unclassified
extent: aPoint
	| size fullSize |
	fullSize := animating or: [collapsed not].
	
	size := container hasSubmorphs
		ifFalse: [ aPoint x @ (fullSize ifTrue: [aPoint y] ifFalse: [0])]
		ifTrue: [ container firstSubmorph extent x @ (fullSize
			ifFalse: [0]
			ifTrue: [container firstSubmorph extent y]) ].
	
	super extent: size.
	
	container extent: size.
	owner ifNotNil: [ owner layoutChanged ]