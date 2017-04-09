accessing
user: aUser

	aUser
		ifNotNil: [
			usernameClickable text: aUser username, ' ', (BTIcon icon: #caret_down).
			userAvatarImage path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png']
		ifNil: [
			usernameClickable text: ''.
			userAvatarImage form: nil].
	self changed