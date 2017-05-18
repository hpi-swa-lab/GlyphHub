as yet unclassified
registerUserWithName: aUserNameString email: anEmailString password: aPasswordString

	^ (self backend registerUserWithName: aUserNameString email: anEmailString password: aPasswordString)
		then: [self login: aUserNameString password: aPasswordString]