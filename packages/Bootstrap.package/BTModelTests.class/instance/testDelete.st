as yet unclassified
testDelete
	| model |
	model := (BTPenguinModel load: 1 populate: #() from: backend) value.
	
	(self expect: BTPenguinModel) to
		decreaseIts: [ :subject | (subject loadAllFrom: backend populate: #()) value size ]
		during: [ model deleteFrom: backend ].
	
	(self expect: model isDirty) to be: true.
	(self expect: model isCreated) to be: false.
	(self expect: model id) to be: 0