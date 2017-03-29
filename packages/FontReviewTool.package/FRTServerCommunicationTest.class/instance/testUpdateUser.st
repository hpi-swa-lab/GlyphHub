as yet unclassified
testUpdateUser
	| userPromise user |
	userPromise := self safePromise: (FRTUser load: 1 from: backend).
	
	(self expect: userPromise) to resolve.
	
	user := userPromise value.
	user userName: 'NOT MY NAME'.
	
	(self expect: (self safePromise: (user saveTo: backend))) to resolve