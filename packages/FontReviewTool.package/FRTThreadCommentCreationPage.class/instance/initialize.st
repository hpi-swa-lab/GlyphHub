initialize-release
initialize

	super initialize.
	
	previewArea := BTPage column.
	glyphsPreview := (FRTGlyphWidget new
		pointSize: 128;
		centered: true).
	self previewArea add: glyphsPreview.
		
	titleContainer := BTPage new expand: true.
	glyphLinkContainer := BTPage column.
	commentText := BTTextArea new
		multiLine: true;
		placeholder: 'Comment ...';
		minRows: 2.
	
	imageAttachments := BTPage row.
	
	self
		add: (BTPage row
			add: titleContainer;
			add: self commentAttachmentButtonGroup);
		add: self previewArea;
		add: glyphLinkContainer;
		add: commentText;
		add: ((BTButton text: 'Save')
			colorType: #primary;
			align: #(end start);
			when: #clicked send: #saveComment to: self);
		add: imageAttachments