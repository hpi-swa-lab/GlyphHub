ui
updateFamilyArea

	| fontSelectionButton fontSelectionDropdown |
	self selectedFamily ifNil: [self resetFamilyArea. ^ self].
	fontSelectionButton := ((BTButton label: (BTIcon icon: #caret_down), '   ', self selectedFont fontName)
		align: #(fill start)).
	fontSelectionDropdown := BTDropdown new
		when: #selected evaluate: [:event :action :item | self selectFont: action];
		attachTo: fontSelectionButton.
		
	familyArea
		removeAllMorphs;
		add: (BTLabel text: 'Current family:');
		add: (BTLabel text: self selectedFamily familyName);
		add: fontSelectionButton;
		add: (BTPage row
			add: ((BTLabel text: 'Size') align: #(center center));
			add: ((BTTextArea placeholder: 12)
				when: #confirmed evaluate: [:text | self pointSizeChanged: (text asNumber)])).
		
	(FRTFamily load: self selectedFamily id populate: #('fonts') from: self topLevel backend)
		then: [:familyWithFonts | | orderedFonts |
			orderedFonts := familyWithFonts fonts sorted: [:font1 :font2 | font1 fontName <= font2 fontName].
			orderedFonts do: [:font | fontSelectionDropdown add: (BTDropdownItem label: font fontName action: font id)]]