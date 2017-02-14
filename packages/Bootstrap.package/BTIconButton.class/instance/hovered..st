as yet unclassified
hovered: aBoolean
	super hovered: aBoolean.
	
	icon color: (BTColorScheme secondary foreground alpha: (aBoolean ifTrue: [ 0.75 ] ifFalse: [ 0.5 ]))