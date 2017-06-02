as yet unclassified
setUp

	subscription := self mockSubscription. 
	thread := subscription thread.
	self setUpWithoutPagePrepare: [:topLevel |
		topLevel 
			addEntity: (subscription user: topLevel user; yourself)]