callback
tryLogin

	| promise |
	self
		remove: self loginBox;
		add: self loader.
	
	promise := ((self topLevel login: self emailField text password: self passwordField text)
		then: [
			self loginBox remove: self loginFailedAlert.
			self topLevel openBookmark: self bookmark.
			self])
		catch: [self loginBox add: self loginFailedAlert at: 2].
	
	self
		remove: self loader;
		add: self loginBox.
	
	^ promise