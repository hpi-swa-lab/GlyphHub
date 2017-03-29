accessing
tryLogin
	| promise |
	self
		remove: self loginBox;
		add: self loader.
	
	promise := (self topLevel backend login: self usernameField text password: self passwordField text)
		then: [:data |
			self loginBox remove: self loginFailedAlert.
			self topLevel openPage: BTApplicationPage new]
		ifRejected: [ :error | self loginBox add: self loginFailedAlert at: 2. error ].
	
	self
		remove: self loader;
		add: self loginBox.
		
	^promise