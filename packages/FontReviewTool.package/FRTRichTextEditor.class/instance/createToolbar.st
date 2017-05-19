initialize-release
createToolbar

	| newToolbar |
	saveButton := ((BTButton icon: #floppy_o) colorType: #primary)
		when: #clicked send: #triggerSaved: to: self with: richText.
	newToolbar := BTPage row
		add: ((BTButton icon: #plus) when: #clicked send: #addEmptyParagraph to: richText);
		add: self createFontPropertiesGroup;
		add: self createAlignmentGroup;
		add: self createOpenTypeFeatureButton.
	self commentButtonShouldBeVisible ifTrue: [
		newToolbar add: ((BTButton label: 'Comment on Selected Text' icon: #comment)
			colorType: #primary;
			visible: true;
			when: #clicked send: #openCreateCommentPage to: self)].
	newToolbar
		add: BTWidget spacer;
		add: saveButton.
		
	^ newToolbar