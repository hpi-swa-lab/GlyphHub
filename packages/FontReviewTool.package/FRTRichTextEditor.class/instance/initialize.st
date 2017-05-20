initialize-release
initialize

	super initialize.
	
	canChangeFont := true.
	commentButtonVisible := false.
	richText := FRTRichText new
		when: #selectedParagraph send: #updateControlsFor: to: self.
	toolbar := self createToolbar.

	self
		vertical: true;
		withLayout;
		spacing: BTWidget spacing;
		add: toolbar;
		add: (BTScrollArea new
			add: richText)