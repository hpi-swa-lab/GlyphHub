lifecycle
enteringWith: anObject

	self heading text: 'Welcome, ', self topLevel user username, '!'.
	self loadThreadSubscriptionsFor: self topLevel user