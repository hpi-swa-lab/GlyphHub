instance creation
ifRejected: aBlock
	^ Promise basicNew initializeWithIfRejected: aBlock.