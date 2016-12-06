accessing
nextSegment
	^self submorphAfter ifNil: [
		self owner closed
			ifTrue: [ self owner firstSubmorph ]
			ifFalse: [ nil ]]