private
privateOpenPage: aPage
	self
		remove: openPage;
		add: aPage.
	
	openPage := aPage