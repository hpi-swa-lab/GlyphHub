fields
update: aField with: anObject

	anObject = (self instVarNamed: aField) ifTrue: [^ self].
	
	self
		instVarNamed: aField put: anObject;
		flagFieldAsDirty: aField