as yet unclassified
testDirtyInAssociation
	| penguin beak |
	penguin := (BTPenguinModel load: 1 from: backend) value.
	(self expect: penguin isDirty) to be: false.
	
	beak := BTBeakModel new.
	penguin beak: beak.

	(self expect: penguin isDirty) to be: true