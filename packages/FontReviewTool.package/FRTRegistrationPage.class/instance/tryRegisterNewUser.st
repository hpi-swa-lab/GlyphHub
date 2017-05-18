as yet unclassified
tryRegisterNewUser

	self flag: #TODO. "create new user, redirect to dashboard"
	self passwordsAreEqual ifFalse: [self topLevel displayNotification: 'Passwords didn''t match'. ^ self].
	self allFieldsFilled ifFalse: [self topLevel displayNotification: 'All fields have to be filled in'. ^ self].
	self emailIsTaken ifTrue: [self topLevel displayNotification: 'An account already exists for this user'. ^ self].
	
	((self backend registerUserWithName: usernameField text email: emailField text password: passwordField1 text)
		then: [:user | self topLevel openPage: FRTFamilyOverviewPage new with: user])
		catch: [self registrationBox add: (BTAlert text: 'Registration failed' type: #danger) at: 2]
		