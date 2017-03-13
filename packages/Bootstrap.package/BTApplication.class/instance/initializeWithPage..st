initialize-release
initializeWithPage: aPage
	self initialize.
	
	openPage := aPage.
	navigationStack := BTNavigationStack new
		open: aPage;
		when: #opened send: #privateOpenPage: to: self;
		yourself.
	
	breadcrumbs := BTButtonGroup new.
	
	header := BTPage row
		add: ((BTIconButton icon: #arrow_left) when: #clickedNoEvent send: #goBack to: navigationStack);
		add: ((BTIconButton icon: #arrow_right) when: #clickedNoEvent send: #goForward to: navigationStack);
		add: breadcrumbs.
	
	self
		updateBreadcrumbs;
		add: header;
		add: aPage