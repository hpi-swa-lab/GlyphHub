testing
testAllowsChangingPassword

	| password |
	password := '123456'.

	(page findInputWithPlaceholder: 'New Password') text: password.
	(page findInputWithPlaceholder: 'New Password Confirmation') text: password.
	
	(self expect: page trySavingPassword) to resolve.
	
	(self expect: self topLevel user password) to be: password