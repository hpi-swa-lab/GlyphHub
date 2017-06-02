initialize-release
initialize

	super initialize.
	
	subscriptionArea := BTPage column.
	myProjectsArea := FRTMyFamilyOverviewPage new.
	heading := BTLabel new
		heading;
		align: #(center center).
	
	self
		add: heading;
		add: BTDivider new;
		add: (BTPage row
			add: self initializeSubscriptionPage;
			add: self initializeMyProjectsPage)