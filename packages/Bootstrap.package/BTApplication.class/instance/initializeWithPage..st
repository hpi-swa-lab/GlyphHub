initialize-release
initializeWithPage: aPage

	loadingOperationCounter := 0.
	openPage := aPage.
	navigationStack := BTNavigationStack new
		application: self;
		yourself.
	breadcrumbs := BTButtonGroup new.
	
	loadingWidget := BTClickable new
		withLayout;
		color: (Color white alpha: 0.9);
		add: (BTLoader new
			align: #(center center);
			expand: true);
		ignoreLayout: true.
	
	header := BTPage row
		withPadding;
		add: ((BTIconButton icon: #arrow_left) when: #clickedNoEvent send: #goBack to: self);
		add: ((BTIconButton icon: #arrow_right) when: #clickedNoEvent send: #goForward to: self);
		add: breadcrumbs;
		add: BTWidget spacer;
		add: ((BTTextArea placeholder: 'Search ...') minSize: self searchbarWidth @ 0).
	
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
	
	navigationStack
		open: aPage with: nil;
		when: #opened send: #privateOpenPage: to: self;
		yourself