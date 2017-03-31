testing
testDeleteUser
	| userPromise count users |
	userPromise := FRTUser loadAllFrom: backend.
	(self expect: userPromise) to resolve.
	
	users := userPromise value.
	count := users size.
	(self expect: (users anyOne deleteFrom: backend)) to resolve.
	
	(self expect: count) to beGreaterThan: self countUsers