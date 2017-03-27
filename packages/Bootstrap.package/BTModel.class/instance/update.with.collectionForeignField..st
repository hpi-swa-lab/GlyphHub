fields
update: aField with: anObject collectionForeignField: aForeignField
	| current collection |
	current := self instVarNamed: aField.  
	
	(anObject notNil and: [current notNil]) ifTrue: [
		(current perform: aForeignField) remove: self ifAbsent: []].
	
	self instVarNamed: aField put: anObject.
	collection := anObject perform: aForeignField.
	
	(collection includes: self) ifFalse: [ collection add: self ].
	
	self flagFieldAsDirty: aField