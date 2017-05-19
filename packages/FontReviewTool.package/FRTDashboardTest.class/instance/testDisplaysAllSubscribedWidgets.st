testing
testDisplaysAllSubscribedWidgets

	(self expect: page) to haveText: ('Welcome, ', self mockUser username, '!').
	(self expect: page) to haveText: subscription thread title