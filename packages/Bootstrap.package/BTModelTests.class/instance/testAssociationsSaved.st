as yet unclassified
testAssociationsSaved
	| penguin eggs |
	penguin := (BTPenguinModel load: 1 populate: #() from: backend) value.
	
	(self expect: penguin eggs) to beEmpty.
	
	penguin eggs
		add: BTEggModel new;
		add: BTEggModel new.
	self safePromise: (penguin saveTo: backend).
	
	eggs := (BTEggModel loadAllFrom: backend populate: #()) value.
	(self expect: eggs size) to be: 2