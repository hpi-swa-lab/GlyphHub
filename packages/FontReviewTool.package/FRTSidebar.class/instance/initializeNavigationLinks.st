initialize-release
initializeNavigationLinks

	navigationLinks := BTPage column
		add: ((BTClickableWithText text: (BTIcon icon: #home), ' Dashboard')
			when: #clicked send: #openDashboard to: self);
		add: ((BTClickableWithText text: (BTIcon icon: #folder_open), ' Discover Projects')
			when: #clicked send: #openProjectDiscovery to: self);
		add: ((BTClickableWithText text: (BTIcon icon: #file_text), ' Sample Texts')
			when: #clicked send: #openSampleTexts to: self);
		add: ((BTClickableWithText text: (BTIcon icon: #pencil), ' Glyph Editing')
			when: #clicked send: #openGlyphEditing to: self)