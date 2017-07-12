actions
openCurveEditor

	(BTDialog title: 'Edit Curves to create diff')
		content: (BTPage column
			withPadding;
			add: (BTMorphContainer new add: (glyphsPreview asEditable pointSize: 512; top: 0); align: #(center center));
			add: ((BTButton text: 'Create Diff') colorType: #primary; align: #(end start)));
		openCentered