as yet unclassified
testSaveNew
	| model |
	model := (BTPenguinModel new
		name: 'Rico';
		saveTo: backend) value.
	
	(self expect: model isDirty) to be: false.
	(self expect: model id) to not equal: 0