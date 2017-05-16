initialize-release
initializeWithPage: aPage with: anObject prepare: aBlock

	entities := Dictionary new.
	id := 0.
	extraGlifs := #().
	fileUploads := Dictionary new.
	
	user := FRTUser new
		username: 'Eva';
		password: 'evilness!';
		saveTo: self;
		yourself.
	
	aBlock cull: self.
	
	self initializeWithPage: aPage with: anObject