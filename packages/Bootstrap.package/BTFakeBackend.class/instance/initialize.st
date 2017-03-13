as yet unclassified
initialize
	super initialize.
	
	tables := Dictionary new.
	idCounter := 1.
	
	self initTestData