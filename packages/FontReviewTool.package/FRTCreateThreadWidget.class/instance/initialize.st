as yet unclassified
initialize
	| preview |
	super initialize.
	
	preview := (BTLabel text: '<span size="60000">', self text, '</span>')
		align: #(center center).
	
	self
		add: (BTPage row
			add: (BTLabel subHeading: 'Create Comment')
			oppositeTo: (BTButtonGroup new
				add: ((BTButton icon: #paint_brush)
					when: #clicked send: #openSketchEditor: to: self);
				add: ((BTButton icon: #object_ungroup)
					when: #clicked send: #openCurveEditor: to: self);
				add: ((BTButton icon: #camera)
					when: #clicked send: #openFilePicker: to: self)));
		add: preview;
		addAll: (self text asArray collect: [ :char | (BTCheckboxWithLabel label: 'Link comment with ', char asString) checked: true ]);
		add: (BTTextArea new
			multiLine: true;
			placeholder: 'Comment ...';
			minRows: 2);
		add: ((BTButton text: 'Save') colorType: #primary; align: #(end start))