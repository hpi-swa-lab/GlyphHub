fields
update: aField with: anObject foreignField: aForeignField

	anObject == (self instVarNamed: aField) ifTrue: [^ self].

	self instVarNamed: aField put: anObject.
	
	(anObject notNil and: [(anObject perform: aForeignField) ~~ self]) ifTrue: [
		anObject perform: (aForeignField numArgs: 1) with: self].
	
	self flagFieldAsDirty: aField