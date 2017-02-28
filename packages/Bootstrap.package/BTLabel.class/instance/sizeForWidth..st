as yet unclassified
sizeForWidth: aNumber
	| size |
	self layout width: (fillMode = #fixed ifTrue: [-1] ifFalse: [aNumber]).
	size := self layout extent.
	
	self layout width: layoutWidth.
	
	^size