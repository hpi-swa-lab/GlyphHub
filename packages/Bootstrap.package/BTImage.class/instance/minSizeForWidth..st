as yet unclassified
minSizeForWidth: aNumber
	(self minSizeRequest isZero not or: [self form isNil])
		ifTrue: [ ^self minSizeRequest ].
	
	self scalingMode == #full
		ifTrue: [ ^self form extent ]
		ifFalse: [ ^aNumber @ (aNumber / self form width * self form height) ]