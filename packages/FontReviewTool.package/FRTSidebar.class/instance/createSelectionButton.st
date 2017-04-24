ui
createSelectionButton

	| fontSelectionButton fontSelectionDropdown |
	fontSelectionButton := (BTButton new
		add: (BTLabel text: '<b>Species:</b> ', self selectedFont fontName)
		oppositeTo: ((BTIcon newFor: #caret_down) align: #(start center));
		align: #(fill start)).
	
	fontSelectionDropdown := BTDropdown new
		when: #selected evaluate: [:event :action :item | self selectFont: action];
		attachTo: fontSelectionButton.
	
	(FRTFamily load: self selectedFamily id populate: #('fonts') from: self topLevel backend)
		then: [:familyWithFonts |
			fontSelectionDropdown
				addAll: ((familyWithFonts fonts sortedBy: #fontName)
					collect: [:font | BTDropdownItem label: font fontName action: font id])].
	
	^ fontSelectionButton