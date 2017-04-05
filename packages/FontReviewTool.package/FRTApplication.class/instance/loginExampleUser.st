initialize-release
loginExampleUser
	^((self login: 'Eva' password: 'eveisevil')
		catch: [ :error | self topLevel displayNotification: 'Login failed' type: #danger ])