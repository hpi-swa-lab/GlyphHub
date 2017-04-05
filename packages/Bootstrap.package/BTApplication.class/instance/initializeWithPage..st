initialize-release
initializeWithPage: aPage

	openPage := aPage.
	
	breadcrumbs := BTButtonGroup new.
	
	header := BTPage row
		withPadding;
		add: ((BTIconButton icon: #arrow_left) when: #clickedNoEvent send: #goBack to: navigationStack);
		add: ((BTIconButton icon: #arrow_right) when: #clickedNoEvent send: #goForward to: navigationStack);
		add: breadcrumbs;
		add: BTWidget spacer;
		add: ((BTTextArea placeholder: 'search') minSize: self searchbarWidth @ 0).
	
	contentContainer := BTPage row
		expand: true;
		spacing: 0;
		add: aPage.
	
	self initialize.
	
	self
		spacing: 0;
		padding: 0;
		updateBreadcrumbs;
		add: header;
		add: BTDivider new;
		add: contentContainer.
	
	navigationStack := BTNavigationStack new
		open: aPage;
		when: #opened send: #privateOpenPage: to: self;
		yourself