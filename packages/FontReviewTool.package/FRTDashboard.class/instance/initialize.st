as yet unclassified
initialize

	super initialize.
	
	subscriptionArea := BTPage column.
	heading := (BTLabel new) heading; align: #(center center).
	
	self
		add: heading;
		add: BTDivider new;
		add: (BTLabel subHeading: 'Subscription Feed');
		add: (BTScrollArea new
			add: subscriptionArea)