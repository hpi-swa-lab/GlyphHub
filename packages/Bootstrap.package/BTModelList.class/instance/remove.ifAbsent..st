removing
remove: aModel ifAbsent: aBlock
	super remove: aModel ifAbsent: aBlock.
	
	self field
		ifNotNil: [
			aModel class associations keysAndValuesDo: [ :associationField :association |
				association second == self field ifTrue: [ aModel perform: (associationField numArgs: 1) with: nil ]]]
		ifNil: [ self error: 'Non meaningful remove operation on BTModelList (list not part of association)' ]