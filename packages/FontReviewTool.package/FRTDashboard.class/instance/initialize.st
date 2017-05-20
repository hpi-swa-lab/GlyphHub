initialize-release
initialize

	super initialize.
	
	subscriptionArea := BTPage column.
	myProjectsArea := FRTMyFamilyOverviewPage new.
	heading := (BTLabel new) heading; align: #(center center).
	
	self
		add: heading;
		add: BTDivider new;
		add: (BTPage row
			add: (BTPage column
				padding: BTWidget spacing;
				expand: true;
				add: (BTLabel subHeading: 'Subscription Feed');
				add: (BTScrollArea new
					add: subscriptionArea));
			add: (BTPage column
				padding: BTWidget spacing;
				expand: true;
				add: (BTLabel subHeading: 'My Projects');
				add: (BTScrollArea new
					add: myProjectsArea)))