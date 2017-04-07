initialize-release
openFamily: aFamily

	| fontOverviewPage |
	fontOverviewPage := FRTFontOverviewPage new.
	self topLevel openPage: fontOverviewPage.
	fontOverviewPage
		font: aFamily fonts anyOne;
		family: aFamily