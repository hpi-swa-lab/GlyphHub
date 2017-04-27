initialize-release
initialize

	| fontSelectButton resetFontButton |
	super initialize.
	
	titleLabel := BTLabel new heading.
	authorLabel := BTLabel new
		align: #(end center);
		subHeading.
	sampleTextWidget := BTTextEntry new
		editable: false.
	fontSelectCompletion :=  BTTextCompletion new
		expand: true;
		minSize: 200 @ 0.
	self initializeFontSelection.
	fontSelectButton := ((BTButton label: 'Apply Font')
		colorType: #primary;
		when: #clicked send: #applyFont to: self).
	resetFontButton := ((BTButton label: 'Reset to System Font')
		colorType: #secondary;
		when: #clicked send: #resetFont to: self).
	
	self
		add: (BTPage row
			add: ((BTLabel text: 'Select Font:') align: #(center center));
			add: fontSelectCompletion;
			add: fontSelectButton;
			add: resetFontButton);
		add: (BTPage row
			add: titleLabel;
			add: authorLabel);
		add: sampleTextWidget