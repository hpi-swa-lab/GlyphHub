fields
update: aField with: anObject foreignField: aForeignField

	anObject == (self get: aField) ifTrue: [^ self].

	self instVarNamed: aField put: anObject.
	
	(anObject notNil and: [(anObject get: aForeignField) ~~ self]) ifTrue: [
		anObject set: aForeignField to: self].
	
	self flagFieldAsDirty: aField