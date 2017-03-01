as yet unclassified
minSizeForWidth: aNumber
	| desired padding |
	padding := self paddingAsPoint.
	
	self layout width: (fillMode = #fixed ifTrue: [-1] ifFalse: [aNumber - padding x]).
	
	desired := self layout extent.
	
	^(fillMode == #fill ifTrue: [aNumber - padding x] ifFalse: [desired x]) @ desired y + padding