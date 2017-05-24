loading
loadThreadSubscriptionStatus: aThread

	^ (self allThreadSubscriptionsFor: aThread)
		then: [:subscriptionList |
			self subscription: (subscriptionList
				ifNotEmptyDo: #onlyElement
				ifEmpty: [self newThreadSubscription: aThread]).
			self updateSubscriptionButtonState]