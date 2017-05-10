as yet unclassified
testDirtyInAssociation
	| penguin otherPenguin |
	penguin := (BTPenguinModel load: 1 populate: #() from: backend) value.
	(self expect: penguin isDirty) to be: false.
	
	otherPenguin := BTPenguinModel new.
	penguin significantOther: otherPenguin.

	(self expect: penguin isDirty) to be: true