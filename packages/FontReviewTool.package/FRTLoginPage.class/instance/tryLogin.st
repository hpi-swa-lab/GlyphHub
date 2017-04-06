callback
tryLogin

	| promise |
	self
		remove: self loginBox;
		add: self loader.
	
	promise := ((self topLevel login: self usernameField text password: self passwordField text)
		then: [:data |
			self loginBox remove: self loginFailedAlert.
			self topLevel openPage: FRTProjectOverviewPage new])
		catch: [:error | self loginBox add: self loginFailedAlert at: 2].
	
	self
		remove: self loader;
		add: self loginBox.
		
	^ promise