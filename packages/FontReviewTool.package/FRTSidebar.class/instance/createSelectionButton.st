ui
createSelectionButton

	| fontSelectionButton fontSelectionDropdown |
	fontSelectionButton := ((BTButton new
		add: (BTLabel text: '<b>Species:</b> ', self selectedFont fontName)
		oppositeTo: ((BTIcon newFor: #caret_down) align: #(start center));
		align: #(fill start))).
	fontSelectionDropdown := BTDropdown new
		attachTo: fontSelectionButton.

	(FRTFamily load: self selectedFamily id populate: #('fonts') from: self topLevel backend)
		then: [:familyWithFonts | | orderedFonts |
			orderedFonts := familyWithFonts fonts sorted: [:font1 :font2 | font1 fontName <= font2 fontName].
			orderedFonts do: [:font |
				fontSelectionDropdown add: ((BTDropdownItem label: font fontName)
					when: #clicked
					send: #selectFont:
					to: self
					with: font id)]].

	^ fontSelectionButton