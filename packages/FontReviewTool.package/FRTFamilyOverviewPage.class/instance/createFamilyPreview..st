updating
createFamilyPreview: aFamily

	| preview |
	preview := aFamily fonts
		ifNotEmpty: [
			FRTGlyphWidget new
				font: aFamily defaultFont;
				withPreviewLetters;
				pointSize: 64]
		ifEmpty: [BTWidget new].
		
	preview minSize: 100 @ 60.

	^ BTClickable new
		withLayout;
		when: #clicked send: #openFamily: to: self with: aFamily;
		add: preview;
		add: ((BTLabel text:
			'<span size="larger" weight="bold">', aFamily familyName, '</span>    ',
			'<span size="smaller">', aFamily fonts size, ' ', ('Font' asPluralBasedOn: aFamily fonts),
			', by ', aFamily authorsString, '</span>') align: #(start center))