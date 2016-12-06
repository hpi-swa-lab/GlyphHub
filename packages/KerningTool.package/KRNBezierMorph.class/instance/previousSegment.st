accessing
previousSegment
	^self submorphBefore ifNil: [
		self owner closed
			ifTrue: [ self owner lastSubmorph ]
			ifFalse: [ nil ]]