initialize-release
initializeSubscriptionPage

	^ BTPage column
		withPadding;
		expand: true;
		add: (BTLabel subHeading: 'Subscription Feed');
		add: (BTScrollArea new
			add: subscriptionArea)