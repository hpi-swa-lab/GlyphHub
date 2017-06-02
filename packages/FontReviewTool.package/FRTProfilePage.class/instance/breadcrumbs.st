navigation
breadcrumbs

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #user
			text: 'Profile of ', self user username
			bookmark: (BTPageBookmark pageClass: self class input: self user));
		yourself