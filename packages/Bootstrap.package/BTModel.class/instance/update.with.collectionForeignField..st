fields
update: aField with: anObject collectionForeignField: aForeignField
	
	| current |
	current := self get: aField.
	current == anObject ifTrue: [^self].
	
	(anObject notNil and: [current notNil and: [current isBTModel]]) ifTrue: [
		(current get: aForeignField) remove: self ifAbsent: []].
	
	self instVarNamed: aField put: anObject.
	
	anObject isBTModel ifTrue: [ | collection |
		collection := anObject get: aForeignField.
		(collection includes: self) ifFalse: [collection add: self]].
	
	self flagFieldAsDirty: aField