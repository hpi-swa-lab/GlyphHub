as yet unclassified
testDeleteUser
	| userPromise count |
	userPromise := FRTUser loadAllFrom: backend.
	(self expect: userPromise) to resolve.
	
	userPromise then: [ :users |
		count := users size.
		(self expect: (users first deleteFrom: backend)) to resolve ].
	
	userPromise := FRTUser loadAllFrom: backend.
	(self expect: userPromise) to resolve.
	
	userPromise then: [ :users |
		(self expect: count) to beGreaterThan: users size ]