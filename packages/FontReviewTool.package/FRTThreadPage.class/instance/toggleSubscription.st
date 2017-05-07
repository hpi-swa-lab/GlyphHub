initialize-release
toggleSubscription

	(self subscription isCreated ifFalse: [subscription saveTo: self backend] ifTrue: [subscription delete]) then: [self updateSubscriptionState]