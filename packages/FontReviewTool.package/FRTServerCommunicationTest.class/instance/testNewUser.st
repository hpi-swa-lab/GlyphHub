testing
testNewUser
	| count userPromise |
	count := self countUsers.
	userPromise := self safePromise: (FRTUser new
		username: 'ME';
		password: 'BLALALA';
		saveTo: backend).
	
	(self expect: userPromise) to resolve.
	
	(self expect: userPromise value id) to not equal: 0.
	(self expect: count) to beLessThan: self countUsers