instance creation
forField: aField owner: aModel

	^ self new
		field: aField;
		owner: aModel;
		yourself