loading
loadThreadSubscriptionStatus: aThread

	^ (self allThreadSubscriptions: aThread)
		then: [:subscriptionList |
			self subscription: (subscriptionList
				ifNotEmpty: [:list | list anyOne]
				ifEmpty: [self newThreadSubscription: aThread]).
			self updateSubscriptionState]