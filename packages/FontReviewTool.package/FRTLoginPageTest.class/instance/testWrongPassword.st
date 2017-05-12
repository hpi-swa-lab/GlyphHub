testing
testWrongPassword

	self login: 'peter' password: 'secret' expectSuccessfulLogIn: false