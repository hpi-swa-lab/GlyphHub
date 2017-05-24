running
setUp

	thread := self mockBigThread.
	super setUpForPage: FRTThreadPage new with: {thread. nil} prepare: [:topLevel | | subscription |
		subscription := self mockSubscription
			thread: thread;
			user: topLevel user.
		
		thread threadSubscriptions add: subscription.
		subscription lastVisited: DateAndTime now.
		topLevel addEntity: thread].