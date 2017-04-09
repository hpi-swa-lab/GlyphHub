initialize-release
initialize

	| inputButton |
	super initialize.

	fontNameLabel := BTLabel new
		align: #(left center).
	fontAuthorLabel := BTLabel new
		align: #(left center).
	inputButton := BTButton new
		text: 'Try it here!';
		colorType: #primary;
		when: #clickedNoEvent send: #openGlyphInputPage to: self.
	
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
	"tabContainer navigationBar makeActive: allGlyphsPage."
	
	self add: (BTPage row
		add: fontNameLabel;
		add: fontAuthorLabel oppositeTo: inputButton);
		add: tabContainer
	