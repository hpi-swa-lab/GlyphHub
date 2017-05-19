removing
remove: aModel ifAbsent: aBlock

	super remove: aModel ifAbsent: aBlock.
	
	self field
		ifNotNil: [
			aModel class associations keysAndValuesDo: [:associationField :association |
				(association backPopulateKey == self field and: [association foreignClass == self owner class]) ifTrue: [aModel set: associationField to: nil]]]
		ifNil: [self error: 'Non meaningful remove operation on BTModelList (list not part of association)']