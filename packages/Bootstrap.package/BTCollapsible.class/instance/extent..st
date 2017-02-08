as yet unclassified
extent: aPoint
	| size |
	self haltOnce.
	animating ifTrue: [ ^super extent: aPoint ].
	
	size := container hasSubmorphs
		ifFalse: [ aPoint ]
		ifTrue: [ container firstSubmorph extent x @ (collapsed
			ifTrue: [0]
			ifFalse: [container firstSubmorph extent y]) ].
	
	super extent: size.
	Transcript show: 'size: '; show: size; cr.
	
	container extent: size.
	owner ifNotNil: [ owner layoutChanged ]