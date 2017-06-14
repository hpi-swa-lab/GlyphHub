actions
openCurveEditor

	| glyph |
	glyph := glyphsPreview asEditable
		pointSize: 512;
		yourself.
	
	(BTDialog title: 'Edit Curves to create diff')
		content: (BTPage column
			withPadding;
			add: (BTMorphContainer new add: glyph; align: #(center center));
			add: ((BTButton text: 'Create Diff') colorType: #primary; align: #(end start)));
		openCentered