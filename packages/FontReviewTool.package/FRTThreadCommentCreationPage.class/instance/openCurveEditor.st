callbacks
openCurveEditor

	| glyph |
	glyph := FRTGlyphEditor new edit: preview glyphNames anyOne atPtSize: 512 fromRenderer: preview renderer.
	
	(BTDialog title: 'Edit Curves to create diff')
		content: (BTPage column
			withPadding;
			add: (BTMorphContainer new add: glyph; align: #(center center));
			add: ((BTButton text: 'Create Diff') colorType: #primary; align: #(end start)));
		openCentered