callback
enteringWith: aUser

	self user: aUser.
	
	usernameLabel text: self user username.
	userAvatarImage path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png'