as yet unclassified
flipPoint: aPoint for: aWidget
	^aWidget vertical ifTrue: [aPoint y @ aPoint x] ifFalse: [aPoint]