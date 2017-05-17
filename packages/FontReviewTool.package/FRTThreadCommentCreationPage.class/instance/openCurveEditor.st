actions
openCurveEditor

	| glyph |
	glyph := FRTGlyphEditor new edit: glyphsPreview glyphNames anyOne atPtSize: 512 fromRenderer: glyphsPreview renderer.
	
	(BTDialog title: 'Edit Curves to create diff')
		content: (BTPage column
			withPadding;
			add: (BTMorphContainer new add: glyph; align: #(center center));
			add: ((BTButton text: 'Create Diff') colorType: #primary; align: #(end start)));
		openCentered