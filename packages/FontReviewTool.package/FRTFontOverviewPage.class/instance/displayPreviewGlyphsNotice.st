initialize-release
displayPreviewGlyphsNotice

	missingPreviewGlyphsNotice := BTAlert new
		colorType: #info;
		vertical: false;
		spacing: BTWidget spacing;
		add: (BTLabel text: 'You haven''t selected preview glyphs for this font yet.');
		add: ((BTButton text: 'Do this now?')
			when: #clicked send: #openPreviewGlyphDialog to: self;
			small).
			
	self add: missingPreviewGlyphsNotice at: 2