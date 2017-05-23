ui
fileUploadArea

	uploadedFileLabel := BTLabel new ellipsize: #start.
	
	fileSelectButton := (BTButton label: ' Select your .glyphs or .ufo.zip to upload.' icon: #upload)
		colorType: #primary;
		align: #(center center);
		when: #clicked send: #chooseFile to: self;
		align: #(center center).
	
	^ BTPage column
		expand: true;
		add: fileSelectButton;
		add: uploadedFileLabel