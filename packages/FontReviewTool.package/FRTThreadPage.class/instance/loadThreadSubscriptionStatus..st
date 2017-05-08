loading
loadThreadSubscriptionStatus: aThread

	^ (self allThreadSubscriptionsFor: aThread)
		then: [:subscriptionList |
			self subscription: (subscriptionList
				ifNotEmpty: [:list | list anyOne]
				ifEmpty: [self newThreadSubscription: aThread]).
			self updateSubscriptionButtonState]