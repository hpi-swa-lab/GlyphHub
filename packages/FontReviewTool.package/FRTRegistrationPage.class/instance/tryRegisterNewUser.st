callbacks
tryRegisterNewUser

	| failedPromise |
	failedPromise := BTPromise new rejectWith: nil.

	self passwordsAreEqual ifFalse: [self topLevel displayNotification: 'Passwords didn''t match'. ^ failedPromise].
	self allFieldsFilled ifFalse: [self topLevel displayNotification: 'All fields have to be filled in'. ^ failedPromise].
	
	self topLevel startLoadingOperation.
	^ ((self topLevel registerUserWithName: usernameField text email: emailField text password: passwordField1 text)
		then: [:user |
			self topLevel
				stopLoadingOperation;
				openBookmark: self bookmark])
		catch: [
			self topLevel
				stopLoadingOperation;
				displayNotification: 'Registration failed' type: #danger]