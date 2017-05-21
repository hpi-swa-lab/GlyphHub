as yet unclassified
enteringWith: anObject

	self user: self topLevel user.
	
	usernameLabel text: self user username.
	self updateUserAvatarImage