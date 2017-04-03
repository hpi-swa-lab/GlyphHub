initialize-release
initialize
	super initialize.
	
	tables := Dictionary new.
	idCounter := 2.
	
	self initTestData