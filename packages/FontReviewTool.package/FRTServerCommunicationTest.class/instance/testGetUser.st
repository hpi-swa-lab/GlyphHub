testing
testGetUser
	| userPromise |
	userPromise := FRTUser load: 1 populate: #() from: backend.
	(self expect: userPromise) to resolve.
	(self expect: userPromise value class) to be: FRTUser