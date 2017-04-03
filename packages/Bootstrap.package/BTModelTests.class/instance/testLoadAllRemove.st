as yet unclassified
testLoadAllRemove
	"only allowed to remove by ID"
	
	| models |
	models := (BTPenguinModel loadAllFrom: backend) value.
	(self expect: [models remove: models anyOne]) to raise: Error