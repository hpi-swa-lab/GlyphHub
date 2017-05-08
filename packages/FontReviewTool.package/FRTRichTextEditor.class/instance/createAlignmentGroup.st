initialize-release
createAlignmentGroup

	^ BTButtonGroup new
		add: ((BTButton icon: #align_left) when: #clicked send: #selectedAlignment: to: richText with: #left);
		add: ((BTButton icon: #align_center) when: #clicked send: #selectedAlignment: to: richText with: #center);
		add: ((BTButton icon: #align_right) when: #clicked send: #selectedAlignment: to: richText with: #right);
		add: ((BTButton icon: #align_justify) when: #clicked send: #selectedAlignment: to: richText with: #justify)