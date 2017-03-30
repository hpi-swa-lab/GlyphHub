navigation
openCurveEditor: anEvent
	| glyph |
	glyph := (KRNUfo3 openBaskerville createGlyphFor: $a ptSize: 350 * BTWidget scalingFactor) toggleEditGlyph.
	(BTDialog title: 'Edit Curves to create diff')
		content: (BTPage column
			withPadding;
			add: (BTMorphContainer new add: glyph; align: #(center center));
			add: ((BTButton text: 'Create Diff') colorType: #primary; align: #(end start)));
		openCentered