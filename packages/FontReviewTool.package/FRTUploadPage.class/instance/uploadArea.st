initialize-release
uploadArea

	^ BTPage row
		add: (BTPage column
			expand: true;
			add: (BTLabel bold: 'Upload from File');
			add: (BTLabel text: '.glyphs or .ufo.zip');
			add: (((BTButton icon: #upload)
				colorType: #primary;
				when: #clickedNoEvent send: #chooseFile to: self;
				yourself) align: #(left center)"#(center center)"));
		"add: (BTPage column
			spacing: BTWidget spacing / 2;
			expand: true;
			add: (BTTextAreaWithLabel text: 'or link a Github repository' placeholder: 'https://github.com/...'  );
			add: ((BTButton label: 'Connect to Github') colorType: #secondary));"
		yourself