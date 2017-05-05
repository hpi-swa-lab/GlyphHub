initialize-release
initialize

	super initialize.
	
	richText := FRTRichText new
		when: #selectedParagraph send: #updateControlsFor: to: self.
	
	self
		vertical: true;
		withLayout;
		spacing: BTWidget spacing;
		add: self createToolbar;
		add: (BTScrollArea new
			add: richText)