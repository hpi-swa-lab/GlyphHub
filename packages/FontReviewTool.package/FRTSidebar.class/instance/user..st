accessing
user: aUser

	aUser
		ifNotNil: [
			usernameClickable text: aUser username, ' ', (BTIcon icon: #caret_down).
			self flag: #TODO "make pretty".	
			aUser downloadAvatar then: [userAvatarImage path: aUser avatarPath]]
		ifNil: [
			usernameClickable text: ''.
			userAvatarImage form: nil].
	self changed