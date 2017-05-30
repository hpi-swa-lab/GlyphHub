navigation
breadcrumbs

	| bookmark |
	bookmark := (BTPageBookmark pageClass: FRTSampleTextCreationPage).

	^ FRTSampleTextOverviewPage new breadcrumbs
		add: (BTBreadcrumb
			icon: #pencil
			text: 'Create Sample Text'
			bookmark: bookmark);
		yourself