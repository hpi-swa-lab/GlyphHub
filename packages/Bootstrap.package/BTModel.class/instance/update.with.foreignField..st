as yet unclassified
update: aField with: anObject foreignField: aForeignField
	self instVarNamed: aField put: anObject.
	
	(anObject notNil and: [(anObject perform: aForeignField) ~~ self]) ifTrue: [
		anObject perform: (aForeignField numArgs: 1) with: self ].
	
	self fieldDirty: aField