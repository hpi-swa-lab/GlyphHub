as yet unclassified
minSizeForWidth: aNumber
	(self minSize isZero not or: [self form isNil])
		ifTrue: [ ^self minSize ].
	
	self scalingMode == #full
		ifTrue: [ ^self form extent ]
		ifFalse: [ ^aNumber @ (aNumber / self form width * self form height) ]