initialize-release
subscribed: aBoolean

	subscribed := aBoolean.
	aBoolean
		ifTrue: [
			subscriptionButton
				colorType: #secondary;
				text: 'Unsubscribe']
		ifFalse: [
			subscriptionButton
				colorType: #primary;
				text: 'Subscribe']