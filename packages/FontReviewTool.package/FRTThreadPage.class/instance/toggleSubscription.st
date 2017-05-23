callbacks
toggleSubscription

	self subscriptionButton disabled: true.
	
	^ ((self subscription isCreated
		ifFalse: [subscription saveTo: self backend]
		ifTrue: [subscription delete])
		then: [
			self subscriptionButton disabled: false.
			self updateSubscriptionButtonState])
		catch: [
			self subscriptionButton disabled: false.
			self topLevel displayNotification: 'Subscribing failed' type: #danger]