callback
enteringWith: aUser

	self user: aUser.
	
	usernameLabel heading: self user username.
	userAvatarImage path: FileDirectory default / 'BP2016H1' / 'assets' / 'penguin.png'