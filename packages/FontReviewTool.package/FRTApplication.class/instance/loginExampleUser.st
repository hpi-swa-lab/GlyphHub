actions
loginExampleUser

	^ (self login: 'eve@evil.com' password: 'eveisevil')
		catch: [self topLevel displayNotification: 'Login failed' type: #danger]