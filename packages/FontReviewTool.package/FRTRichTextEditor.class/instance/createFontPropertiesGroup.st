initialize-release
createFontPropertiesGroup

	fontInput := FRTFontPicker new
		when: #confirmed send: #selectFontNamed:suggestion: to: self.
	
	pointSizeInput := (BTTextArea placeholder: 'Point Size')
		minSize: 80 @ 0;
		when: #confirmed send: #selectedPointSize: to: richText.
	
	^ BTButtonGroup new
		add: ((BTButton icon: #text_height)
			attach: (BTPopover new
				add: pointSizeInput));
		add: ((BTButton icon: #font)
			attach: (BTPopover new
				add: fontInput))