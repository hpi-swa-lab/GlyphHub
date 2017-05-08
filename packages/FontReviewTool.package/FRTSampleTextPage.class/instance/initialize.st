initialize-release
initialize

	| fontSelectButton resetFontButton |
	super initialize.
	
	titleLabel := BTLabel new subHeading.
	
	authorLabel := BTLabel new
		align: #(end center);
		secondary.
	
	sampleTextWidget := FRTRichTextEditor new
		saveButtonVisible: false;
		yourself.
	
	fontSelectCompletion :=  FRTFontPicker new
		placeholder: 'Select Font for all Paragraphs ...';
		when: #confirmed send: #applyName:font: to: self.
	
	fontSelectButton := ((BTButton label: 'Apply Font')
		colorType: #primary;
		when: #clicked send: #triggerConfirmed to: fontSelectCompletion).
	
	resetFontButton := ((BTButton label: 'Reset to System Font')
		colorType: #secondary;
		when: #clicked send: #resetFont to: self).
	
	commentSelectionButton := ((BTButton label: 'Comment on Selected Text' icon: #comment)
		colorType: #primary;
		visible: false;
		when: #clicked send: #openCreateCommentPage to: self).
	
	self
		add: (BTPage row
			add: titleLabel;
			add: authorLabel);
		add: (BTPage row
			add: fontSelectCompletion;
			add: fontSelectButton;
			add: resetFontButton);
		add: sampleTextWidget;
		add: commentSelectionButton