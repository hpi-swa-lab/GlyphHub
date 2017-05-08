lifecycle
enteringWith: anObject

	^ self updateList then: [self layoutChanged]