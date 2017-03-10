as yet unclassified
testAssignField
	| model |
	model := BTPenguinModel new.
	
	(self expect: model name) to be: nil.
	
	model name: 'Rico'.  
	(self expect: model name) to not be: nil.
	(self expect: model isDirty) to be: true