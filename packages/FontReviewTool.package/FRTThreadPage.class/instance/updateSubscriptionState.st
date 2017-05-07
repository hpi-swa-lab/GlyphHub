initialize-release
updateSubscriptionState

	self subscription isCreated
		ifTrue: [
			subscriptionButton
				colorType: #secondary;
				text: 'Unsubscribe']
		ifFalse: [
			subscriptionButton
				colorType: #primary;
				text: 'Subscribe']