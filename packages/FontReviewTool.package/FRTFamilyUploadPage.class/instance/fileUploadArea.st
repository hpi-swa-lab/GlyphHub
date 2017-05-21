ui
fileUploadArea

	uploadedFileLabel := BTLabel new.
	
	^ BTPage column
		expand: true;
		add: (((BTButton label: ' Select your .glyphs or .ufo.zip to upload.' icon: #upload)
			colorType: #primary;
			align: #(center center);
			when: #clicked send: #chooseFile to: self;
			yourself) align: #(left center));
		add: uploadedFileLabel