ui
fileUploadArea

	| selectedFileArea |
	uploadedFileLabel := (BTLabel italic: 'none') align: #(center center).
	selectedFileArea := (BTPage row
		spacing: BTWidget spacing / 4;
		add: ((BTLabel text: 'Selected File:') align: #(center center));
		add: uploadedFileLabel).

	^ BTPage column
		expand: true;
		add: (BTLabel bold: 'Upload from File');
		add: (BTLabel text: '.glyphs or .ufo.zip');
		add: (BTPage row
			spacing: BTWidget spacing / 2;
			add: (((BTButton icon: #upload)
				colorType: #primary;
				when: #clickedNoEvent send: #chooseFile to: self;
				yourself) align: #(left center));
			add: selectedFileArea);
		yourself