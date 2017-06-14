as yet unclassified
initialize

	super initialize.
	
	outlineArea := BTPage column.
	
	saveButton := (BTButton text: 'Save')
		colorType: #primary;
		when: #clicked
		send: #saveOutlines
		to: self.
	
	self
		title: 'Edit Glyph';
		add: (BTPage column
			add: outlineArea;
			add: saveButton)