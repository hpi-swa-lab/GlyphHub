initialize-release
updateSubscriptionButtonState

	self subscription isCreated
		ifTrue: [
			self subscriptionButton
				colorType: #secondary;
				text: 'Unsubscribe']
		ifFalse: [
			self subscriptionButton
				colorType: #primary;
				text: 'Subscribe']