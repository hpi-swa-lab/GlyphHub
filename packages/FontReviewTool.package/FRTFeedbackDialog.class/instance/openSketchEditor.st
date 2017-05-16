actions
openSketchEditor

	editor := FRTDrawingEditor new
		importForm: form;
		when: #accept send: #saveSketch: to: self;
		yourself.
		
	dialog := (BTDialog title: 'Annotate the Application Window')
		content: (BTPage row
			expand: true;
			padding: BTWidget spacing;
			add: editor);
		minSize: 200;
		openCentered;
		yourself