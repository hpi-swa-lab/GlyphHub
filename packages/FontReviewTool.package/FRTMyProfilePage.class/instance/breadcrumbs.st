navigation
breadcrumbs

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #user
			text: 'My Profile'
			bookmark: (BTPageBookmark pageClass: self class input: self user));
		yourself