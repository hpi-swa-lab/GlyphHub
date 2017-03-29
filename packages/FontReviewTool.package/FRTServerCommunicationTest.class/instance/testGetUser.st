as yet unclassified
testGetUser
	| userPromise |
	userPromise := FRTUser load: 1 from: backend.
	(self expect: userPromise) to resolve.
	(self expect: userPromise value class) to be: FRTUser