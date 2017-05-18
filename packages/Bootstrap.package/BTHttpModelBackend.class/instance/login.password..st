operations
login: anEmailString password: aPasswordString
	" returns a promise that fulfills on login and returns the userId of the authenticated user "
	
	^ (self
		request: '/login'
		method: 'POST'
		data: ({'email' -> anEmailString. 'password' -> aPasswordString} as: Dictionary))
		then: [:response |
			self apiToken: (response at: 'token').
			response at: 'user_id']