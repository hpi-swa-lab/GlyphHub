callback
enteringWith: aUser

	self user: aUser.
	
	usernameLabel text: self user username.
	self updateUserAvatarImage