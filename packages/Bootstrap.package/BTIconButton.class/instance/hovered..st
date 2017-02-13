as yet unclassified
hovered: aBoolean
	super hovered: aBoolean.
	
	icon color: (BTWidget foregroundColor alpha: (aBoolean ifTrue: [ 0.75 ] ifFalse: [ 0.5 ]))