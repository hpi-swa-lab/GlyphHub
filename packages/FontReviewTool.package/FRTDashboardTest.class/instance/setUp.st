running
setUp

	subscription := self mockSubscription.
	self
		setUpForPage: FRTDashboard new
		with: subscription
		prepare: [:topLevel | topLevel addEntity: (subscription user: topLevel user; yourself)]