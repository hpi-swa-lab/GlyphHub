initialize-release
toggleSubscription

	subscriptionButton disabled: true.
	((self subscription isCreated
		ifFalse: [subscription saveTo: self backend]
		ifTrue: [subscription delete])
		then: [
			subscriptionButton disabled: false.
			self updateSubscriptionButtonState])
		catch: [
			subscriptionButton disabled: false.
			self topLevel displayNotification: 'Subscribing failed' type: #danger]