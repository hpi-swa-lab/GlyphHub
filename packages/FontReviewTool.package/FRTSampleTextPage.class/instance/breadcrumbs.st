ui
breadcrumbs

	| bookmark |
	bookmark := (BTPageBookmark page: FRTSampleTextOverviewPage).

	^ FRTSampleTextOverviewPage new breadcrumbs
		add: (BTBreadcrumb
			icon: #file_text
			text: 'Sample Texts'
			bookmark: bookmark);
		yourself