navigation
breadcrumbs

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #user
			text: 'Profile of ', self user username
			bookmark: (BTPageBookmark page: self class input: self user));
		yourself