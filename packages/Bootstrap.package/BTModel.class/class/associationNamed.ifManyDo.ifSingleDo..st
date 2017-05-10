load-by
associationNamed: aNameSymbol ifManyDo: aBlock ifSingleDo: anotherBlock

	^ self associations at: aNameSymbol ifPresent: [:association |
		association cardinality == #many
			ifTrue: [aBlock value: association]
			ifFalse: [anotherBlock value: association]] ifAbsent: []