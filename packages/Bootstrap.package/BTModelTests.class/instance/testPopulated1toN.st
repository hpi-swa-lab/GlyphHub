as yet unclassified
testPopulated1toN
	| penguin egg |
	penguin := (BTPenguinModel load: 1 from: backend) value.
	
	penguin eggs add: BTEggModel new.
	penguin saveTo: backend.
	
	egg := (BTEggModel loadAllFrom: backend) value onlyElement.
	(self expect: egg parent) to equal: penguin id