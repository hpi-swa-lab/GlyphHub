initialize-release
createToolbar

	saveButton := ((BTButton icon: #floppy_o) colorType: #primary)
		when: #clicked send: #triggerSaved: to: self with: richText.
	
	^ BTPage row
		add: ((BTButton icon: #plus) when: #clicked send: #addEmptyParagraph to: richText);
		add: self createFontPropertiesGroup;
		add: self createAlignmentGroup;
		add: self createOpenTypeFeatureButton;
		add: BTWidget spacer;
		add: saveButton