callbacks
tryRegisterNewUser

	| failedPromise |
	failedPromise := BTPromise new rejectWith: nil.

	self passwordsAreEqual ifFalse: [self topLevel displayNotification: 'Passwords didn''t match'. ^ failedPromise].
	self allFieldsFilled ifFalse: [self topLevel displayNotification: 'All fields have to be filled in'. ^ failedPromise].
	self emailIsTaken ifTrue: [self topLevel displayNotification: 'An account already exists for this user'. ^ failedPromise].
	
	^ ((self topLevel registerUserWithName: usernameField text email: emailField text password: passwordField1 text)
		then: [:user | self topLevel openBookmark: self bookmark])
		catch: [self registrationBox add: (BTAlert text: 'Registration failed' type: #danger) at: 2]
		