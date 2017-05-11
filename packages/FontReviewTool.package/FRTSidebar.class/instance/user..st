accessing
user: aUser

	aUser
		ifNotNil: [
			usernameClickable text: aUser username, ' ', (BTIcon icon: #caret_down).
			self updateUserAvatarImage: aUser]
		ifNil: [
			usernameClickable text: ''.
			userAvatarImage form: nil].
	self changed