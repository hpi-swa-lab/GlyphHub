as yet unclassified
testLoadAllAdd
	| models |
	models := (BTPenguinModel loadAllFrom: backend populate: #()) value.
	
	(self expect: BTPenguinModel) to
		increaseIts: [ :subject | (subject loadAllFrom: backend populate: #()) value size ]
		during: [
			models add: BTPenguinModel new.
			(self expect: models isDirty) to be: true.
			models saveTo: backend ]