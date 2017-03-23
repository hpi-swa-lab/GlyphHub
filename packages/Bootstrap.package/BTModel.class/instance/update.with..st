fields
update: aField with: anObject
	self
		instVarNamed: aField put: anObject;
		fieldDirty: aField