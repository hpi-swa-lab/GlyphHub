as yet unclassified
testLoadAllAdd
	| models |
	models := (BTPenguinModel loadAllFrom: backend) value.
	
	(self expect: BTPenguinModel) to
		increaseIts: [ :subject | (subject loadAllFrom: backend) value size ]
		during: [
			models add: BTPenguinModel new.
			(self expect: models isDirty) to be: true.
			models saveTo: backend ]