initialize-release
createToolbar

	pointSizeInput := (BTTextArea placeholder: 'Point Size')
		minSize: 80 @ 0;
		when: #confirmed send: #selectedPointSize: to: richText.
	
	otFeaturesInput := (BTTextArea placeholder: 'e.g. smcp=on')
		minSize: 200 @ 0;
		when: #confirmed send: #selectedOpenTypeFeatures: to: richText.
	
	fontInput := FRTFontPicker new
		when: #confirmed send: #selectFontNamed:suggestion: to: self.
	
	^ BTPage row
		add: ((BTButton icon: #plus) when: #clicked send: #addEmptyParagraph to: richText);
		add: (BTButtonGroup new
			add: ((BTButton icon: #text_height)
				attach: (BTPopover new
					add: pointSizeInput));
			add: ((BTButton icon: #font)
				attach: (BTPopover new
					add: fontInput)));
		add: (BTButtonGroup new
			add: ((BTButton icon: #align_left) when: #clicked send: #selectedAlignment: to: richText with: #left);
			add: ((BTButton icon: #align_center) when: #clicked send: #selectedAlignment: to: richText with: #center);
			add: ((BTButton icon: #align_right) when: #clicked send: #selectedAlignment: to: richText with: #right);
			add: ((BTButton icon: #align_justify) when: #clicked send: #selectedAlignment: to: richText with: #justify));
		add: ((BTButton label: 'OT Features')
			attach: (BTPopover new
				add: otFeaturesInput));
		add: BTWidget spacer;
		add: ((BTButton icon: #floppy_o) colorType: #primary)