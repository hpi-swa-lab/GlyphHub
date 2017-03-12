as yet unclassified
testLoadAllRemove
	| models |
	models := (BTPenguinModel loadAllFrom: backend) value.
	
	(self expect: BTPenguinModel) to
		decreaseIts: [ :subject | (subject loadAllFrom: backend) value size ]
		during: [
			models removeFirst.
			(self expect: models isDirty) to be: true.
			models saveTo: backend ]