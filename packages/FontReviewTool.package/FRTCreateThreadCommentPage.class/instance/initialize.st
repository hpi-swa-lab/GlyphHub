initialize-release
initialize

	super initialize.
	
	preview := FRTThreadCodepointsPreviewLabel new
		align: #(center center);
		styleAttributes: {'size' -> '60000'}.
	titleContainer := BTPage new expand: true.
	glyphLinkContainer := BTPage column.
	commentText := BTTextArea new
		multiLine: true;
		placeholder: 'Comment ...';
		minRows: 2.

	self
		add: (BTPage row
			add: titleContainer;
			add: self commentAttachmentButtonGroup);
		add: preview;
		add: glyphLinkContainer;
		add: commentText;
		add: ((BTButton text: 'Save')
			colorType: #primary;
			align: #(end start);
			when: #clickedNoEvent send: #saveComment to: self)