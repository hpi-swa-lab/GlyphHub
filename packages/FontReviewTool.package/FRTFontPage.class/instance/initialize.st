initialize-release
initialize

	| otfButton |
	super initialize.

	fontNameLabel := BTLabel new
		align: #(left center);
		heading.
	fontAuthorLabel := BTLabel new
		align: #(left center).
	updateButton := (BTButton label: 'Update' icon: #cloud_upload)
		colorType: #primary;
		visible: false.
	otfButton := (BTButton label: 'Download as OTF' icon: #cloud_download)
		colorType: #primary;
		when: #clicked send: #downloadOtf to: self.
		
	uploadPopover := FRTUploadPopover new
		attachTo: updateButton.
	
	renderer := FRTGlyphRenderer new.
	overviewTab := self initializeOverviewTab.
	allGlyphsTab := self initializeAllGlyphTab.
	discussionsTab := self initializeDiscussionsTab.
	recentChangesTab := self initializeRecentChangesTab.
	
	tabContainer := BTPageNavigation new
		addTab: 'Overview' content: overviewTab;
		addTab: 'All Glyphs' content: allGlyphsTab;
		addTab: 'Discussions' content: discussionsTab;
		addTab: 'Recent Changes' content: recentChangesTab;
		showPage: 1.
	
	self add: (BTPage row
			add: fontNameLabel;
			add: fontAuthorLabel;
			add: BTWidget spacer;
			add: updateButton;
			add: otfButton);
		add: tabContainer;
		createPreviewGlyphsNotice
	