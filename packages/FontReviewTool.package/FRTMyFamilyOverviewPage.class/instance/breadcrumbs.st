updating
breadcrumbs

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #file
			text: 'My Projects'
			bookmark: (BTPageBookmark pageClass: self class));
		yourself