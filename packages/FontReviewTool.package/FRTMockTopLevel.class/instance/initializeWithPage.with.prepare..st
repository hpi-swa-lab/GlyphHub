initialize-release
initializeWithPage: aPage with: anObject prepare: aBlock

	entities := Dictionary new.
	id := 0.
	extraGlifs := #().
	fileUploads := Dictionary new.
	nextConfirmAnswer := true.
	
	user := FRTUser new
		username: 'Eva';
		email: 'eve@evil.com';
		password: 'evilness!';
		biography: 'A text about myself.';
		saveTo: self;
		yourself.
	
	aBlock cull: self.
	
	self initializeWithPage: aPage with: anObject