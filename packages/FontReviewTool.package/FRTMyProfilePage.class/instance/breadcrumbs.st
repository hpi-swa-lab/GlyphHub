navigation
breadcrumbs

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #user
			text: 'My Profile'
			bookmark: (BTPageBookmark page: self class input: self user));
		yourself