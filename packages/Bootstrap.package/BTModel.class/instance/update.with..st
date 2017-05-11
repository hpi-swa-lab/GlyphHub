fields
update: aField with: anObject

	self class associations
		at: aField
		ifPresent: [:association |
			association oppositeAssociation cardinality == #single
				ifTrue: [self update: aField with: anObject foreignField: association backPopulateKey]
				ifFalse: [self update: aField with: anObject collectionForeignField: association backPopulateKey]]
		ifAbsent: [
			anObject = (self get: aField) ifFalse: [
				self
					instVarNamed: aField put: anObject;
					flagFieldAsDirty: aField]]