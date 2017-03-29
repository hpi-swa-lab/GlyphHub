operations
login: aUserNameString password: aPasswordString
	^(self
		request: '/login'
		method: 'POST'
		data: ({'userName' -> aUserNameString. 'password' -> aPasswordString} as: Dictionary))
		then: [ :response | self apiToken: (response at: 'token') ]