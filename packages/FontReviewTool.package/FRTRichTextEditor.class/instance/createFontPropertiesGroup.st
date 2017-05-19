initialize-release
createFontPropertiesGroup

	| buttonGroup |
	fontInput := FRTFontPicker new
		when: #confirmed send: #selectFontNamed:suggestion: to: self.
	
	pointSizeInput := (BTTextArea placeholder: 'Point Size')
		minSize: 80 @ 0;
		when: #confirmed send: #selectedPointSize: to: richText.
	
	buttonGroup := BTButtonGroup new
		add: ((BTButton icon: #text_height)
			attach: (BTPopover new
				add: pointSizeInput)).
	
	self canChangeFont ifTrue: [
		buttonGroup add:
			((BTButton icon: #font)
				attach: (BTPopover new
					add: fontInput))].
	
	^ buttonGroup
		