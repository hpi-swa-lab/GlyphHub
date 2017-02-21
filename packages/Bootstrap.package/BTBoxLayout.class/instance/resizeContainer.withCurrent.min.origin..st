as yet unclassified
resizeContainer: aWidget withCurrent: currentSize min: minSize origin: aPoint
	| size |
	size := aWidget minSize max:
		(aWidget align first ~~ #fill ifTrue: [minSize x] ifFalse: [minSize x max: currentSize x]) @
		(aWidget align second ~~ #fill ifTrue: [minSize y] ifFalse: [minSize y max: currentSize y]).
	aWidget layoutBounds: (aPoint extent: size).
	^size