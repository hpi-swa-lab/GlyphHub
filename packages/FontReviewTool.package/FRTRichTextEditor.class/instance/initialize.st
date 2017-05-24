initialize-release
initialize

	super initialize.
	
	canChangeFont := true.
	richText := FRTRichText new
		when: #selectedParagraph send: #updateControlsFor: to: self.
	saveButton := (BTButton icon: #floppy_o) colorType: #primary.
	toolbar := self createToolbar.

	self
		vertical: true;
		withLayout;
		spacing: BTWidget spacing;
		add: toolbar;
		add: (BTScrollArea new
			add: richText)