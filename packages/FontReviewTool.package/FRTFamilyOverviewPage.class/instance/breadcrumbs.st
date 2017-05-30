navigation
breadcrumbs

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #folder_open
			text: 'Discover Projects'
			bookmark: (BTPageBookmark pageClass: self class));
		yourself