accessing
user: aUser

	aUser
		ifNotNil: [
			usernameClickable text: aUser username, ' ', (BTIcon icon: #caret_down).
			self flag: #TODO "change this back".	
			"userAvatarImage path: aUser avatarPath"]
		ifNil: [
			usernameClickable text: ''.
			userAvatarImage form: nil].
	self changed