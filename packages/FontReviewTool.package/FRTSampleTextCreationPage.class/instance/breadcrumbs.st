navigation
breadcrumbs

	| bookmark |
	bookmark := (BTPageBookmark page: FRTSampleTextCreationPage).

	^ FRTSampleTextOverviewPage new breadcrumbs
		add: (BTBreadcrumb
			icon: #pencil
			text: 'Create Sample Text'
			bookmark: bookmark);
		yourself