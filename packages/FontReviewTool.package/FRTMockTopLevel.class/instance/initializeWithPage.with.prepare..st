operations
initializeWithPage: aPage with: anObject prepare: aBlock

	entities := Dictionary new.
	id := 0.
	
	user := FRTUser new
		username: 'Eva';
		password: 'evilness!';
		saveTo: self;
		yourself.
	
	aBlock value: self.
	
	self initializeWithPage: aPage with: anObject