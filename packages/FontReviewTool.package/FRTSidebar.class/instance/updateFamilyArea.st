accessing
updateFamilyArea

	| fontSelectionButton fontSelectionDropdown |
	fontSelectionButton := ((BTButton label: (BTIcon icon: #caret_down), '   ', self selectedFont fontName)
		align: #(fill start)).
	fontSelectionDropdown := BTDropdown new
		when: #selected evaluate: [:event :action :item | self selectFont: action];
		attachTo: fontSelectionButton.
		
	familyArea
		removeAllMorphs;
		add: (BTLabel text: 'Current family:');
		add: (BTLabel text: self selectedFamily familyName);
		add: fontSelectionButton.
		
	(FRTFamily load: self selectedFamily id populate: #('fonts') from: self topLevel backend)
		then: [:familyWithFonts | | orderedFonts |
			orderedFonts := familyWithFonts fonts sorted: [:font1 :font2 | font1 fontName <= font2 fontName].
			orderedFonts do: [:font | fontSelectionDropdown add: (BTDropdownItem label: font fontName action: font id)]]