lifecycle
enteringWith: anObject

	self heading text: 'Welcome, ', self user username, '!'.
	self loadThreadSubscriptionsFor: self user.
	^ myProjectsArea updateList