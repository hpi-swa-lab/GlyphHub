ui
breadcrumbs

	| bookmark |
	bookmark := (BTPageBookmark page: FRTSampleTextPage input: self sampleText).

	^ FRTSampleTextOverviewPage new breadcrumbs
		add: (BTBreadcrumb
			icon: #file_text
			text: self sampleText title 
			bookmark: bookmark);
		yourself