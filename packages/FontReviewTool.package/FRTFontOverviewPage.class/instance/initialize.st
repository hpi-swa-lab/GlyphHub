initialize-release
initialize

	| inputButton updateButton |
	super initialize.

	fontNameLabel := BTLabel new
		align: #(left center).
	fontAuthorLabel := BTLabel new
		align: #(left center).
	inputButton := (BTButton label: 'Try it here!' icon: #pencil_square_o)
		colorType: #primary;
		when: #clicked send: #openGlyphInputPage to: self.
	updateButton := (BTButton label: 'Update' icon: #cloud_upload)
		colorType: #primary.
	
	uploadPopover := FRTUploadPopover new
		attachTo: updateButton.
	
	renderer := FRTGlyphRenderer new.
	allGlyphsPage := self initializeAllGlyphPage.
	openDicsussionsPage := self initializeDiscussionsPage.
	recentChangesPage := self initializeRecentChangesPage.	
	
	tabContainer := (BTPageNavigation contents: (OrderedCollection new
		add: {'All Glyphs'. allGlyphsPage};
		add: {'Open Discussions'. openDicsussionsPage};
		add: {'Recent Changes'. recentChangesPage};
		yourself))
		showPage: 1.
	
	self add: (BTPage row
			add: fontNameLabel;
			add: fontAuthorLabel;
			add: BTWidget spacer;
			add: updateButton;
			add: inputButton);
		add: tabContainer
	