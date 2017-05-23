actions
registerUserWithName: aUserNameString email: anEmailString password: aPasswordString

	^ (self backend registerUserWithName: aUserNameString email: anEmailString password: aPasswordString)
		then: [self login: anEmailString password: aPasswordString]