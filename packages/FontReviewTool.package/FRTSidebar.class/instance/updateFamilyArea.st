ui
updateFamilyArea
	
	self selectedFamily ifNil: [
		self resetFamilyArea.
		^ self].
	
	familyArea
		removeAllMorphs;
		add: self createSelectionButton;
		add: (BTPage row
			padding: BTWidget spacing @ 0;
			add: ((BTLabel bold: 'Size:') align: #(center center));
			add: ((BTTextArea placeholder: self standardPointSize asString)
				when: #confirmed send: #pointSizeChanged: to: self))