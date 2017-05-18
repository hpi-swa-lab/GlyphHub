operations
registerUserWithName: aUserNameString email: anEmailString password: aPasswordString
	" returns a promise that fulfills on login and returns the userId of the authenticated user "
	
	^ (self
		request: '/register'
		method: 'POST'
		data: ({'username' -> aUserNameString. 'email' -> anEmailString. 'password' -> aPasswordString} as: Dictionary))
		then: [self login: aUserNameString password: aPasswordString]