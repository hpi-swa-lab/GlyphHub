as yet unclassified
testSaveUpdate
	| model |
	model := (BTPenguinModel load: 1 populate: #() from: backend) value 
		name: 'Rico'.
	
	model := (self safePromise: (model saveTo: backend)) value.
	
	(self expect: model isDirty) to be: false