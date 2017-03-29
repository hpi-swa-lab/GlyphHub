testing
testDeleteUser
	| userPromise count |
	userPromise := FRTUser loadAllFrom: backend.
	(self expect: userPromise) to resolve.
	
	userPromise then: [ :users |
		count := users size.
		(self expect: (users first deleteFrom: backend)) to resolve ].
	
	(self expect: count) to beGreaterThan: self countUsers