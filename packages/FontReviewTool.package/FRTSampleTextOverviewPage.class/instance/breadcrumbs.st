navigation
breadcrumbs

	| bookmark |
	bookmark := (BTPageBookmark pageClass: FRTSampleTextOverviewPage).

	^ FRTDashboard new breadcrumbs
		add: (BTBreadcrumb
			icon: #file_text
			text: 'Sample Texts'
			bookmark: bookmark);
		yourself