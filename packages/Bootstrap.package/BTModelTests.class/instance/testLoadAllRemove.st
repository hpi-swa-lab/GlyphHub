as yet unclassified
testLoadAllRemove
	| models |
	models := (BTPenguinModel loadAllFrom: backend) value.
	
	(self expect: [models remove: models anyOne]) to raise: Error