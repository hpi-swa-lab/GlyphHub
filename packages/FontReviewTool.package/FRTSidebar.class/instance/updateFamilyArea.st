ui
updateFamilyArea
	
	self selectedFamily ifNil: [
		self resetFamilyArea.
		^ self].
	
	familyArea
		removeAllMorphs;
		add: self createSelectionButton
		"at the moment, there is no page using this function. If there ever should be a need for it, just uncomment the lines below"
		"add: (BTPage row
			padding: BTWidget spacing @ 0;
			add: ((BTLabel bold: 'Size:') align: #(center center));
			add: ((BTTextArea placeholder: self standardPointSize asString)
				when: #confirmed send: #pointSizeChanged: to: self))"