testing
testGetUsers
	| promise |
	promise := FRTUser loadAllFrom: backend populate: #().
	(self expect: promise) to resolve.
	
	promise then: [ :users |
		users do: [ :user | (self expect: user class) to be: FRTUser ].
		(self expect: users size) to equal: 2 ]