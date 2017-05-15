initialize-release
initializeChangeAvatarArea

	uploadedFileLabel := (BTLabel italic: 'none') align: #(center center).	
	^ BTPage column
		withPadding;
		add: (BTPage row
			add: (((BTButton icon: #upload)
				colorType: #primary;
				when: #clicked send: #chooseFile to: self;
				yourself)  align: #(left center));
			add: ((BTLabel text: 'Selected File:') align: #(center center));
			add: uploadedFileLabel);
		add: ((BTButton label: 'Save')
			colorType: #primary;
			when: #clicked send: #trySavingAvatar to: self;
			align: #(end center);
			yourself);
		yourself