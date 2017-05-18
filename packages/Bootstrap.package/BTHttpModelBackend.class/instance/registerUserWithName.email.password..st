operations
registerUserWithName: aUserNameString email: anEmailString password: aPasswordString
	
	^ self
		request: '/register'
		method: 'POST'
		data: ({'username' -> aUserNameString. 'email' -> anEmailString. 'password' -> aPasswordString} as: Dictionary)