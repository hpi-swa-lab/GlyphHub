testing
testWrongPassword

	self login: 'peter@example.com' password: 'secret' expectSuccessfulLogIn: false