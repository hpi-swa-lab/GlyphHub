initialize-release
initialize

	super initialize.
	
	preview := BTLabel new
		align: #(center center);
		styleAttributes: {'size' -> '60000'}.
	titleContainer := BTPage new.
	glyphLinkContainer := BTPage column.
	commentText := BTTextArea new
		multiLine: true;
		placeholder: 'Comment ...';
		minRows: 2.

	self
		add: (BTPage row
			add: titleContainer
			oppositeTo: (BTButtonGroup new
				add: ((BTButton icon: #paint_brush)
					when: #clicked send: #openSketchEditor: to: self);
				add: ((BTButton icon: #object_ungroup)
					when: #clicked send: #openCurveEditor: to: self);
				add: ((BTButton icon: #camera)
					when: #clicked send: #openFilePicker: to: self)));
		add: preview;
		add: glyphLinkContainer;
		add: commentText;
		add: ((BTButton text: 'Save') colorType: #primary; align: #(end start))