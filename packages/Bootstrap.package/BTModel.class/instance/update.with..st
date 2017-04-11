fields
update: aField with: anObject

	(self class associations includesKey: aField)
		ifTrue: [((self class associations at: aField) cardinality = #single)
			ifTrue: [self update: aField with: anObject foreignField: (self associations at: aField) backPopulateKey]
			ifFalse: [self update: aField with: anObject collectionForeignField: (self associations at: aField) backPopulateKey]]
		ifFalse: [
			anObject = (self instVarNamed: aField) ifTrue: [^ self].
			self
				instVarNamed: aField put: anObject;
				flagFieldAsDirty: aField]