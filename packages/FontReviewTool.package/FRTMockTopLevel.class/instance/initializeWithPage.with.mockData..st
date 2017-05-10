operations
initializeWithPage: aPage with: anObject mockData: aCollectionOfModels

	entities := Dictionary new.
	id := 0.
	
	user := FRTUser new
		username: 'Eva';
		password: 'evilness!';
		saveTo: self;
		yourself.
	
	aCollectionOfModels do: [:model | self addEntity: model].
	
	self initializeWithPage: aPage with: anObject