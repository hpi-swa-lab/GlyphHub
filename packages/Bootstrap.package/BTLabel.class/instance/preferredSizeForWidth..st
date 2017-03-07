as yet unclassified
preferredSizeForWidth: aNumber
	| min nat |
	nat := self sizeForWidth: -1.
	min := self sizeForWidth: ((wrap not and: [self ellipsize == #none]) ifTrue: [-1] ifFalse: [aNumber]).

	min := min max: self minSize.
	
	^{min. nat max: min} + self paddingAsPoint