testing
testUpdateUser
	| userPromise user |
	userPromise := self safePromise: (FRTUser load: 1 populate: #() from: backend).
	
	(self expect: userPromise) to resolve.
	
	user := userPromise value.
	user username: 'NOT MY NAME'.
	
	(self expect: (self safePromise: (user saveTo: backend))) to resolve